<script setup>
import {reactive, ref} from "vue";
import request from "@/utils/request";
import router from "@/router"


const name = ref('')
const state = reactive({
  noticeList:[],
  rotationList:[],
})


state.userOptions = []
request.get('/user').then(res => state.userOptions = res.data)

const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)
const load = () => {

  //请求前面10条的公告
  request.get('/notice/findTop10').then(res => {
    state.noticeList = res.data
  })
}
load()  // 调用 load方法拿到后台数据

//轮播图
request.get('/front/banner/list').then(res => {
  state.rotationList = res.data
  state.rotationList = state.rotationList.filter((item) => item.indexRadio === '是');
})

//加载首页数据列表
request.get('/front/product/page', {
  params: {
    pageNum: 1,
    pageSize: 1000,
  }
}).then(res => {
  state.productData = res.data.records
  state.productData = state.productData.filter((item) => item.recomRadio === '是');
})
const truncatedContent = (content) => {
  const maxLength = 100;
  if (content.length > maxLength) {
    return content.substring(0, maxLength) + '...';
  }
  return content;
}

</script>

<template>
  <div>
    <!-- 轮播图 -->
    <div>
      <el-card>
        <div style="width: 100%">
          <el-carousel :interval="5000" arrow="always" height="400px">
            <el-carousel-item v-for="item in state.rotationList" :key="item" v-show="item.indexRadio=='是'">
              <a :href="item.url" target="_blank"><img :src="item.img" alt="" style="width: 100%; height: 100%"></a>
            </el-carousel-item>
          </el-carousel>
        </div>
      </el-card>
    </div>



    <div style="margin-top: 20px;">
      <el-card>
        <div style="padding-bottom: 15px ;border-bottom: 1px solid #ddd; margin-top: 20px;text-align: center;">
          <span style="font-weight: bold; font-size: 24px;">推荐商品</span>
        </div>
        <div style="margin-top: 20px;">
          <el-row :gutter="10">
            <el-col :span="6" v-for="item in state.productData" :key="item.id" style="margin-top: 20px;">
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
      </el-card>
    </div>


  </div>
</template>

<style scoped>
.refresh:hover {
  cursor: pointer;
}
:deep(.el-card__body) {
  padding: 10px !important;
}


/* 标题样式 */
.title {
  font-size: 18px;
  font-weight: bold;
  color: #333;  /* 标题默认颜色 */
  text-decoration: none;  /* 移除下划线 */
  /* 悬停效果 */
  transition: color 0.3s ease;
}

.title:hover {
  color: orangered !important;  /* 鼠标悬停时的颜色 */
}


.item {
  padding: 20px 0;
  display: flex;
  border-radius: 10px;
}

.item img {
  width: 160px;
  height: 120px;
}

.right-container {
  position: relative;
  margin-left: 20px;
  width: 100%;

}

.right-container div {
  margin-bottom: 7px;
}

.top {
  display: flex;
  color: #101d37;
  font-size: 20px;
  font-weight: bold;
}

.time {
  position: absolute;
  left: 0;
  bottom: 0;
  margin-bottom: 0 !important;
  color: rgba(16, 29, 55, .3);
  font-size: 14px;
}
</style>
