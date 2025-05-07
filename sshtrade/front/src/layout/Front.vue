<script setup>
import { RouterView } from 'vue-router'
//从vue-router导入，用于渲染匹配到的路由组件。
import router from "@/router";
//从@/router导入，用于控制路由。
import {useUserStore} from "@/stores/user";
//从@/stores/user导入，用于状态管理。
import request from "@/utils/request";
//从@/utils/request导入，用于发送HTTP请求。
import {ElMessage} from "element-plus";
//从element-plus导入，用于显示消息提示。
import {nextTick, ref} from "vue";
//从vue导入，用于Vue的响应式操作。
import config from "../../config";
//从../../config导入，用于获取项目配置。

const userStore = useUserStore()
//实例化用户状态管理。
let user = userStore.getUser
//从userStore获取当前用户信息。
const activePath = router.currentRoute.value.path
//获取当前路由的路径。
const name = ref('')
//定义一个响应式变量，用于存储搜索框的值。
name.value = router.currentRoute.value.query.name || ''
const childRef = ref()
//义一个响应式引用，用于访问子组件。
const menus = ref([])
//定义一个响应式数组，用于存储菜单项。

const logout = () => {
  //发送请求到服务器进行登出操作，成功后清除用户状态并跳转到首页。
  request.get('/logout/' + user.uid).then(res => {
    if (res.code === '200') {
      userStore.logout()
      window.location.href="/front"
    } else {
      ElMessage.error(res.msg)
    }
  })
}


const getAvatarHandler = (avatar) => {
  //：更新用户的头像
  user.avatar = avatar
}

const search = () => {
  //根据输入的商品名称进行搜索，并跳转到商品列表页面。
  router.push('/front/product-list?name=' + name.value)
}

</script>

<template>

  <div>
<!--顶部导航栏：

包含项目名称、导航菜单和用户操作区域。
使用el-menu组件创建水平导航菜单，包括首页、网站公告、商品列表、购物车等。
如果用户未登录，显示登录和注册按钮；
如果已登录，显示用户名、头像和下拉菜单（包括访问后台、个人信息、修改密码和退出登录选项）。
-->
    <div style="display: flex; height: 60px; line-height: 60px; border-bottom: 1px solid #eee;background-color: #f18e4c;">
      <div style="width: 280px; display: flex; padding-left: 30px">
        <div style="flex: 1; font-size: 20px; color: #FFFFFF; font-weight: bold">{{config.projectName}}</div>
      </div>
      <div style="flex: 1; display: flex">
        <el-menu :default-active="activePath" mode="horizontal" router style="border: none; height: 100%; width: 100%;background-color: #f18e4c">
          <el-menu-item index="/front/home">首页</el-menu-item>
          <el-menu-item index="/front/notice">网站公告</el-menu-item>
          <el-menu-item index="/front/product-list">商品列表</el-menu-item>
          <el-menu-item index="/front/cart">购物车</el-menu-item>
          <el-dropdown>
            <el-menu-item>个人中心</el-menu-item>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item><div @click="router.push('/front/address')">我的收货地址</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/product')">我的店铺商品</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/front/orders')">我的购买订单</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/orders')">我的卖出订单</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/front/pm-list')">我的私聊</div></el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </el-menu>
      </div>
      <div style="width: 300px; text-align: right; padding-right: 10px">
        <div v-if="!user.id" style="text-align: right; padding-right: 30px">
          <el-button @click="router.push('/login')">登录</el-button>
          <el-button @click="router.push('/register-consumer')">用户注册</el-button>
        </div>
        <div v-else>
          <span style="margin-right: 5px; color: #FFFFFF;">用户：{{ user.name }}</span>
          <el-dropdown>
            <el-avatar :size="40" :src="user.avatar" style="margin-top: 10px" />
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item><div @click="router.push('/home')">访问后台</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/person')">个人信息</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/password')">修改密码</div></el-dropdown-item>
                <el-dropdown-item><div @click="logout">退出登录</div></el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </div>
    </div>

    <!-- 搜索条 -->
    <!-- 搜索 -->
    <div style="width: 80%; margin: 10px auto;min-height: 80px;">
      <el-card>
        <div class="content">
          <el-input style="width: 500px" placeholder="请输入商品" v-model="name" clearable size="large"></el-input>
          <el-button style="margin-left: 5px;background-color: #f18e4c;color: #FFFFFF;" @click="search" size="large">搜索</el-button>
        </div>
      </el-card>
    </div>

    <div style="width: 80%; margin: 10px auto;min-height: 600px;">
      <router-view v-slot="{ Component }">
        <component @getAvatar="getAvatarHandler" @getUnread="getUnRead" ref="childRef" :is="Component" />
      </router-view>
    </div>


    <div style="height: 60px; line-height: 60px; border-top: 1px solid rgba(208,208,208,0.08);text-align: center;background-color: #f18e4c;color: #FFFFFF;">
      <span>版权所有@{{config.projectName}}</span>
    </div>
  </div>
</template>

<style scoped>
.badge {
  margin-top: 10px;
  margin-right: 40px;
}
:deep(.el-badge__content.is-fixed) {
  top: 10px !important;
}

.content {
  text-align: center;
}

.el-menu-item{
  background-color: #f18e4c;
  color: #FFFFFF;
}

.el-menu--horizontal>.el-menu-item.is-active{
  color: #ffffff !important;
  border-bottom: 2px solid #ffffff !important;
}
</style>
<!--
这个Vue组件是一个典型的前端页面布局，包括顶部导航、搜索功能、内容展示区和底部版权信息。
它使用了Vue 3的新特性，如<script setup>，
以及Element Plus UI库来构建用户界面。代码结构清晰，功能模块化，易于维护和扩展。-->