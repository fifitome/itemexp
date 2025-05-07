<script setup>
import router from "@/router";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {onMounted, reactive, ref} from "vue";
import {useUserStore} from "@/stores/user";
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'

const userStore = useUserStore()
const user = userStore.getUser


const id = router.currentRoute.value.query.id // 参数id
const state = reactive({
  data: {},
})

const load = () => {
  request.get('/front/product/' + id).then(res => {
    state.data = res.data
  })

}
onMounted(() => {
  load()
})

//轮播图
request.get('/front/banner/list').then(res => {
  state.rotationList = res.data
  state.rotationList = state.rotationList.filter((item) => item.indexRadio === '否');
})

//购物车
state.num = 1;
//添加购物车
const addCart = () =>{
  //判断用户是否登录
  if(user.id==null){
    router.push('/login')
    return
  }

  if(state.data.userId!=null && state.data.userId==user.id){
    ElMessage.error('请勿添加自己的商品')
    return
  }

  //加入购物车
  request.request({
    url: '/front/cart/update',
    method: 'post',
    data: {
      userId:user.id,
      name:state.data.name,
      img:state.data.img,
      num:state.num,
      price:state.data.price,
      bizUserId:state.data.userId,
      goodid:state.data.id,
    }
  }).then(res => {
    if (res.code === '200') {
      ElMessage.success('添加成功')
      router.push('/front/cart')
    } else {
      ElMessage.error(res.msg)
    }
  })

}

state.activeTab = 'content'


state.userOptions = []
request.get('/front/user/list').then(res => state.userOptions = res.data)
state.categoryOptions = []
request.get('/front/category/list').then(res => state.categoryOptions = res.data)


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


    <div class="mc detail-container">
      <el-card>
        <div class="detail-content">
          <div class="detail-left">
            <img :src="state.data.img" style="height: 380px;width: 100%;"/>
          </div>
          <div class="detail-right">
            <div class="big-name"> {{ state.data.name }}</div>
            <div class="detail-info-list">
              <div>
                <span>卖家：</span>{{ state.userOptions.find(v => v.id === state.data.userId) ? state.userOptions.find(v => v.id === state.data.userId).name : '' }}
                <span style="float: right">
                  <el-button style="margin-bottom: 3px" @click="router.push('/front/pm?fid=' + state.data.userId)" v-if="state.data.userId!=user.id">私信</el-button>
                </span>
              </div>


              <div>
                <span>商品分类：</span>{{ state.categoryOptions.find(v => v.id === state.data.categoryId) ? state.categoryOptions.find(v => v.id === state.data.categoryId).name : '' }}
              </div>

              <div>
                <span>商品价格：</span><span style="font-size: 24px;color: red;">￥{{ state.data.price }}</span>
              </div>
              <div>
                <span>发布时间：</span>{{ state.data.createTime }}
              </div>
            </div>
            <div style="margin-top: 20px;">
              <span>购买数量：</span>
              <el-input-number
                  v-model="state.num"
                  :min="1"
                  :max="100"
                  label="数量"/>
            </div>
            <div class="detail-btn" style="margin-top: 20px">
              <div @click="addCart"><i class="el-icon-date"></i>立即下单</div>
            </div>
          </div>
        </div>


        <el-tabs v-model="state.activeTab" style="margin-top: 20px;min-height: 500px;">
          <el-tab-pane label="简介详情" name="content">
            <span class="markdown-body" v-html="state.data.content"></span>
          </el-tab-pane>
        </el-tabs>

      </el-card>
    </div>

  </div>
</template>

<style scoped>
.detail-container {
  padding: 20px 0;

}

.big-name {
  display: flex;
  align-items: center;
  margin-bottom: 5px;
  font-size: 28px;
  font-weight: 700;
  line-height: 40px;
  color: #101d37;
}


.detail-content {
  display: flex;
}

.detail-left {
  width: 48%;
  margin-right: 2%;

}

.detail-right {
  width: 50%;
  border: 1px solid #e4e6f0;
  padding: 17px 30px 0;
  background-color: #fff;
  box-sizing: border-box;
  height: 380px;
}

.detail-tag div {
  background-color: rgba(132, 154, 174, .1);
  border-radius: 2px;
  display: inline-block;
  padding: 2px 10px;
  height: 23px;
  line-height: 23px;
  text-align: center;
  font-size: 12px;
  color: #849aae;
  margin-right: 5px;
  margin-bottom: 5px;
}

.detail-info-list {
  padding: 10px 0;
  border-bottom: 1px solid #e4e6f0;
}

.detail-info-list div {
  margin-bottom: 5px;
  font-size: 14px;
}

.detail-info-list div span {
  color: #9399a5;

}

.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

.detail-btn {
  display: flex;

}

.detail-btn div {
  width: 160px;
  height: 50px;
  line-height: 14px;
  padding: 18px 0;
  font-size: 16px;
  box-sizing: border-box;
  background: #f18e4c;
  color: #fff;
  text-align: center;
  margin-right: 15px;
  cursor: pointer;
}


/* el-tabs */
::v-deep .el-tabs__nav {
  margin: 0 20px;
  /* 使用rpx没有效果 */
}
::v-deep .el-tabs--top .el-tabs__item.is-top:nth-child(2) {
  padding-left: 20px;
}
::v-deep .el-tabs--top .el-tabs__item.is-top:last-child {
  padding-right: 20px;
}
/*悬浮样式*/
::v-deep .el-tabs__item:hover {
  color: #e1251b;
}
/*选中样式*/
::v-deep .el-tabs__item.is-active {
  color: #fff;
  font-weight: bold;
  background-color: #f18e4c;
}
/*隐藏tab下面的一横*/
::v-deep .el-tabs__active-bar {
  display: none;
}

</style>