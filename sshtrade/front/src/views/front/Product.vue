<script setup>
import {nextTick, onBeforeUnmount, reactive, ref, shallowRef} from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";
import router from "@/router"
import config from "../../../config";

const userStore = useUserStore()
const user = userStore.getUser


const pageNum = ref(1)
const pageSize = ref(8)
const total = ref(0)

let name = router.currentRoute.value.query.name
const state = reactive({
  tableData: [],
})

state.searchKey = ''
const load = (key) => {
  if(state.searchKey!=null && state.searchKey!=''){
    name = state.searchKey
  }
  request.get('/front/product/page', {
    params: {
      name: name,
      pageNum: pageNum.value,
      pageSize: pageSize.value,
      category_id:state.category_id,
    }
  }).then(res => {
    state.tableData = res.data.records
    total.value = res.data.total
  })
}
load()

//轮播图
request.get('/front/banner/list').then(res => {
  state.rotationList = res.data
  state.rotationList = state.rotationList.filter((item) => item.indexRadio === '否');
})

state.categoryOptions = []
request.get('/front/category/list').then(res => state.categoryOptions = res.data)
state.userOptions = []
request.get('/front/user/list').then(res => state.userOptions = res.data)

state.category_id = ''
const getCategory = (category_id) =>{
  state.category_id = category_id
  if(category_id=='all'){
    state.category_id = ''
  }
  load()
}

//搜索
state.searchKey = ''
const search = () =>{
  load()
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
          <span style="font-weight: bold; font-size: 24px;">商品列表</span>
        </div>

        <div style="margin-top: 10px;">
          <el-input style="width: 200px" placeholder="输入关键词" v-model="state.searchKey" clearable></el-input>
          <el-button style="margin-left: 5px" @click="search" size="large">搜索</el-button>
        </div>

        <div style="padding-bottom: 15px ;margin-top: 20px;text-align: left;line-height: 40px;">
          <span style="font-weight: bold;margin-left: 10px;">商品分类：</span>
          <span style="margin-right: 10px;" class="navbar">
            <a href="javascript:void(0)" @click="getCategory('all')">全部</a>
          </span>
          <span v-for="item in state.categoryOptions" :key="item.id" style="margin-right: 10px;" class="navbar">
            <a href="javascript:void(0)" @click="getCategory(item.id)">{{item.name}}</a>
          </span>
        </div>

        <div style="margin-top: 20px;">
          <el-row :gutter="10">
            <el-col :span="6" v-for="item in state.tableData" :key="item.id" style="margin-top: 20px;">
              <el-card style="color: #666" >
                <div ><img @click="router.push('/front/product-detail?id=' + item.id)" :src="item.img" alt="" style="width: 100%; height: 200px;cursor: pointer"></div>
                <div><span style="font-weight: bold">{{ item.name}}</span></div>
                <div style="float: left;">
                  <span style="font-size: 18px;color: red;">￥{{ item.price }}</span>
                </div>
                <div style="margin: 5px 0; text-align: right">
                  <el-button type="primary" size="small" @click="router.push('/front/product-detail?id=' + item.id)">查看</el-button>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </div>

        <div style="margin: 20px 0;">
          <el-pagination
              @current-change="load"
              @size-change="load"
              v-model:current-page="pageNum"
              v-model:page-size="pageSize"
              background
              :page-sizes="[4, 8, 12, 16]"
              layout="total, prev, pager, next"
              :total="total"
          />
        </div>

      </el-card>

    </div>

  </div>
</template>
<style scoped>
.navbar {
  background-color: #eeeeee;
  padding: 10px;
  justify-content: center;
}

.navbar a {
  font-size: 16px;
  color: #333;
  text-decoration: none;
  margin: 0 15px;
  padding: 5px;
  transition: color 0.3s;
}

.navbar a:hover {
  color: #ff6700;
}
</style>