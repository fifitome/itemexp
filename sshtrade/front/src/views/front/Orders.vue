<script setup>
import router from "@/router";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {onMounted, reactive, ref, nextTick} from "vue";
import {useUserStore} from "@/stores/user";
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'

const userStore = useUserStore()
const user = userStore.getUser
const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)

//判断用户是否登录
if(user.id==null){
  router.push('/login')
}

const content = ref('')
const viewShow = ref(false)
const view = (value) => {
  viewShow.value = true
  content.value = value
}

const state = reactive({
  tableData:[],
  form:{},
})

const load = () => {
  request.get('/front/orders/list').then(res => {
    state.tableData = res.data
    state.tableData = state.tableData.filter((item) => item.userId === user.id);
  })
}
load()  // 调用 load方法拿到后台数据

//轮播图
request.get('/front/banner/list').then(res => {
  state.rotationList = res.data
  state.rotationList = state.rotationList.filter((item) => item.indexRadio === '否');
})

//删除订单
const deleteOrders =(id) =>{
  request.delete('/front/orders/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

//取消订单
const cancelOrders =(id) =>{
  request.put('/front/orders/cancel/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

state.userOptions = []
request.get('/front/user/list').then(res => state.userOptions = res.data)

</script>

<template>
  <div>

    <!-- 轮播图 -->
    <div>
      <el-card>
        <div style="width: 100%">
          <el-carousel :interval="5000" arrow="always" height="200px">
            <el-carousel-item v-for="item in state.rotationList" :key="item">
              <a :href="item.url" target="_blank"><img :src="item.img" alt="" style="width: 100%; height: 100%"></a>
            </el-carousel-item>
          </el-carousel>
        </div>
      </el-card>
    </div>


    <div style="margin-top: 20px;">
      <el-card>
        <div style="padding-bottom: 15px ;border-bottom: 1px solid #ddd; margin-top: 20px;text-align: center;">
          <span style="font-weight: bold; font-size: 24px;">我的订单管理</span>
        </div>

        <el-table :data="state.tableData" style="width: 100%;margin-top: 20px;">
          <el-table-column prop="id" label="序号">
            <template #default="scope">
              {{ scope.$index + 1 }}
            </template>
          </el-table-column>
          <el-table-column prop="name" label="订单号"></el-table-column>
          <el-table-column label="商户" width="250px;">
            <template #default="scope">
              <span v-if="scope.row.bizUserId">{{ state.userOptions.find(v => v.id === scope.row.bizUserId) ? state.userOptions.find(v => v.id === scope.row.bizUserId).name : '' }}</span>
            </template>
          </el-table-column>
          <el-table-column label="订单明细"><template #default="scope"><el-button @click="view(scope.row.content)">查看</el-button></template></el-table-column>
          <el-table-column prop="amount" label="订单总金额"></el-table-column>
          <el-table-column prop="createTime" label="下单时间"></el-table-column>
          <el-table-column prop="stateRadio" label="订单状态"></el-table-column>
          <el-table-column label="操作" width="150px;">
            <template #default="scope">
              <a href="javascript:void(0)" @click="deleteOrders(scope.row.id)" class="delete-link" style="margin-right: 15px;">删除</a>
              <a href="javascript:void(0)" @click="cancelOrders(scope.row.id)" class="delete-link" v-if="scope.row.stateRadio!='已取消'">取消</a>
            </template>
          </el-table-column>
        </el-table>

      </el-card>
    </div>

    <el-dialog v-model="viewShow" title="预览" width="40%">
      <div  id="editor-content-view" class="editor-content-view" v-html="content" style="padding: 0 20px"></div>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="viewShow = false">关闭</el-button>
      </span>
      </template>
    </el-dialog>

  </div>
</template>

<style scoped>

.total-container {
  margin-top: 20px;
  text-align: right;
}

.total-label {
  font-weight: bold;
}

.total-price {
  color: red;
  font-weight: bold;
}

a.delete-link {
  color: #ff0000;
  text-decoration: none;
}

a.delete-link:hover {
  text-decoration: underline;
}
</style>