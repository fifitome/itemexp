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
  request.get('/front/address/list').then(res => {
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

//删除收货地址
const deleteAddress =(id) =>{
  request.delete('/front/address/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}


const name = ref('')
const dialogFormVisible = ref(false)
const rules = reactive({
  name: [
    { required: true, message: '请输入名称', trigger: 'blur' },
  ]
})
const ruleFormRef = ref()
// 编辑
const handleEdit = (raw) => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = JSON.parse(JSON.stringify(raw))
  })
}

// 新增
const handleAdd = () => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = {}
  })
}

// 保存
const save = () => {
  ruleFormRef.value.validate(valid => {   // valid就是校验的结果
    if (valid) {
      state.form.userId = user.id
      state.form.defaultRadio='否'
      request.request({
        url: '/front/address/update',
        method: 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('保存成功')
          dialogFormVisible.value = false
          load()  // 刷新表格数据
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}

//设置默认收货地址
const updateDefault =(id) =>{
  request.put('/front/address/setDefault/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}
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
          <span style="font-weight: bold; font-size: 24px;">收货地址管理</span>
        </div>

        <div style="margin-top: 10px;text-align: right;">
          <el-button type="text" @click="handleAdd">添加收货地址</el-button>
        </div>

        <el-table :data="state.tableData" style="width: 100%;margin-top: 20px;">
          <el-table-column prop="id" label="序号">
            <template #default="scope">
              {{ scope.$index + 1 }}
            </template>
          </el-table-column>
          <el-table-column prop="name" label="姓名"></el-table-column>
          <el-table-column prop="phone" label="手机"></el-table-column>
          <el-table-column prop="address" label="详细地址"></el-table-column>
          <el-table-column prop="postcode" label="邮编"></el-table-column>
          <el-table-column prop="defaultRadio" label="是否默认"></el-table-column>
          <el-table-column label="操作">
            <template #default="scope">
              <a href="javascript:void(0)" @click="updateDefault(scope.row.id)" class="delete-link" style="margin-right: 10px;" v-if="scope.row.defaultRadio=='否'">设为默认</a>
              <a href="javascript:void(0)" @click="handleEdit(scope.row)" class="delete-link" style="margin-right: 10px;">编辑</a>
              <a href="javascript:void(0)" @click="deleteAddress(scope.row.id)" class="delete-link">删除</a>
            </template>
          </el-table-column>
        </el-table>

      </el-card>
    </div>

    <!-- 编辑收货地址 -->
    <el-dialog v-model="dialogFormVisible" title="收货地址信息" width="40%">
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="80px" style="padding: 0 20px" status-icon>
        <el-form-item prop="name" label="姓名">
          <el-input v-model="state.form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="phone" label="手机">
          <el-input v-model="state.form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="address" label="详细地址">
          <el-input v-model="state.form.address" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="postcode" label="邮编">
          <el-input v-model="state.form.postcode" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="save">
          保存
        </el-button>
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