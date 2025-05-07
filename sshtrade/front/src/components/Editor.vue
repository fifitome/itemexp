<script setup>
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
/*Vue组件 Editor.vue 是一个文本编辑器，
使用了 @wangeditor/editor-for-vue
 这个库来实现富文本编辑功能。
 */
import {onBeforeUnmount, onMounted, ref, shallowRef} from "vue";
/*
从 vue 导入了 onBeforeUnmount, onMounted, ref, shallowRef
这些生命周期钩子和响应式引用函数。
 */
import config from "../../config";
const valueHtml = ref('<p>hello</p>')
/*内容 HTML,使用 ref 创建了一个响应式变量，
用来存储编辑器的内容。初始值为 <p>hello</p>。
 */

//生命周期钩子，模拟 ajax 异步获取内容
onMounted(() => {
  setTimeout(() => {
    valueHtml.value = '设置内容'
  }, 1000)
})
/*onMounted: 组件挂载后，模拟异步获取内容，
并在1秒后更新 valueHtml 的值。
 */


const editorRef = shallowRef()
/*
编辑器实例，必须用 shallowRef
editorRef: 使用 shallowRef 创建了一个浅层响应式引用，
用来存储编辑器实例。
 */

const toolbarConfig = {}
//toolbarConfig 在这个组件中没有被使用，预留的配置项
const editorConfig = {
  placeholder: '请输入内容...',
}
//toolbarConfig 和 editorConfig: 定义了工具栏和编辑器的配置对象
editorConfig.MENU_CONF['uploadImage'] = {
  server: `http://${config.serverUrl}/file/uploadImg`
}
/*
editorConfig 包含了编辑器的配置，
如占位符 placeholder 和上传图片的服务器地址 uploadImage。
 */



const handleCreated = (editor) => {
  //handleCreated: 当编辑器创建时，将编辑器实例赋值给 editorRef。
  editorRef.value = editor // 记录 editor 实例，重要！
}

onBeforeUnmount(() => {
  // 组件销毁时，也及时销毁编辑器
  const editor = editorRef.value
  if (editor == null) return
  editor.destroy()
})
</script>

<template>
<!--结构
外层 <div> 包裹了整个编辑器组件。
内层 <div> 设置了边框样式，包含 Toolbar 和 Editor 组件。-->
  <div>
    <div style="border: 1px solid #ccc">
      <Toolbar
          style="border-bottom: 1px solid #ccc"
          :editor="editorRef"
          :defaultConfig="toolbarConfig"
          :mode="'simple'"
      />
      <Editor
          style="height: 500px; overflow-y: hidden;"
          v-model="valueHtml"
          :defaultConfig="editorConfig"
          :mode="'simple'"
          @onCreated="handleCreated"
      />
    </div>
  </div>
  <!--工具栏 (Toolbar)
Toolbar 组件设置了边框底部样式，
并绑定了 editorRef, toolbarConfig 和模式 'simple'。-->


  <!--编辑器 (Editor)
Editor 组件设置了高度和溢出样式，绑定了 valueHtml 作为v-model，editorConfig 和模式 'simple'。
@onCreated 事件绑定了 handleCreated 函数，用于处理编辑器创建时的逻辑。-->

  <!--这个组件实现了一个简单的富文本编辑器，】
  具有基本的文本编辑功能和图片上传功能。通过 @wangeditor/editor-for-vue 提供的 Editor 和 Toolbar 组件，用户可以在Vue应用中方便地集成富文本编辑功能。
  组件的生命周期钩子确保了编辑器的正确创建和销毁，避免了内存泄漏。-->
</template>