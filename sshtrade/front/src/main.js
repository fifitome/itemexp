/*这段代码初始化了一个Vue 3应用，
配置了状态管理、路由、UI库、图标库、样式和视频播放组件，
并最终将应用挂载到页面上。
 */

import { createApp } from 'vue'
//从vue库中导入createApp函数，用于创建vue应用实例
import { createPinia } from 'pinia'
//从Pinia库中导入 createPinia函数，Pinia是VUE3的官方状态管理库
import ElementPlus from 'element-plus'
//导入ElementPlusUI库，这是基于VUE3的组件库
import 'element-plus/dist/index.css'
//导入Element Plus的CSS样式文件，以便使用Element Plus组件的样式。
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
//导入Element Plus的中文语言包，用于设置Element Plus组件的中文显示。
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
//导入Element Plus图标库的所有图标组件
import vue3videoPlay from 'vue3-video-play' // 引入组件
//从vue3-video-play库中导入视频播放组件，这是一个为Vue 3设计的组件。
import 'vue3-video-play/dist/style.css' // 引入css
//导入vue3-video-play组件的样式文件
import App from './App.vue'
//导入根组件App.vue，这是Vue应用的入口组件。
import router from './router'
//导入Vue Router的配置，用于设置页面路由。
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
//导入Pinia插件pinia-plugin-persistedstate，用于持久化状态。
import './styles/main.css'
import './styles/btncolor.css'
//导入自定义的CSS样式文件。
const app = createApp(App)
//使用createApp函数创建Vue应用实例，并传入根组件App。
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
/* 循环遍历Element Plus图标库的所有组件，并注册到Vue应用中：
- 这一步将Element Plus图标库中的所有图标组件注册到Vue应用中，
以便在模板中直接使用。
 */
const pinia = createPinia()
//创建Pinia实例。
pinia.use(piniaPluginPersistedstate)
//将持久化状态插件应用到Pinia实例上。
app.use(pinia)
//将Pinia实例注册到Vue应用中。
app.use(router)
//将Vue Router配置注册到Vue应用中。
app.use(ElementPlus, {locale: zhCn})
//将Element Plus UI库注册到Vue应用中，并设置中文语言。
app.use(vue3videoPlay)
//将vue3-video-play视频播放组件注册到Vue应用中。
app.mount('#app')
//将Vue应用挂载到DOM中，选择的挂载点是ID为app的元素。
