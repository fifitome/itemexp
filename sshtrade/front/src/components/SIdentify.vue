<template>
  <div class="s-canvas">
    <canvas id="s-canvas" :width="props.contentWidth" :height="props.contentHeight"></canvas>
  </div>
  <!--包含一个 <div> 元素，类名为 s-canvas，内部有一个 <canvas> 元素，其 id 为 s-canvas。
<canvas> 元素的 width 和 height 属性被绑定到 props.contentWidth 和 props.contentHeight，
这意味着验证码图片的尺寸可以通过props传入。-->
</template>

<script setup>
import { onMounted, watch } from 'vue';
//从 vue 导入了 onMounted 和 watch 这两个生命周期钩子和响应性API
const props = defineProps({
  /*
  使用 defineProps 定义了一系列的props，
  包括验证码的代码、字体大小、背景色、颜色、线条颜色、点的颜色、画布的宽度和高度等，
  每个prop都有默认值
   */
  identifyCode: {
    type: String,
    default: '1234'
  },
  fontSizeMin: {
    type: Number,
    default: 35
  },
  fontSizeMax: {
    type: Number,
    default: 35
  },
  backgroundColorMin: {
    type: Number,
    default: 180
  },
  backgroundColorMax: {
    type: Number,
    default: 240
  },
  colorMin: {
    type: Number,
    default: 50
  },
  colorMax: {
    type: Number,
    default: 160
  },
  lineColorMin: {
    type: Number,
    default: 100
  },
  lineColorMax: {
    type: Number,
    default: 200
  },
  dotColorMin: {
    type: Number,
    default: 0
  },
  dotColorMax: {
    type: Number,
    default: 255
  },
  contentWidth: {
    type: Number,
    default: 120
  },
  contentHeight: {
    type: Number,
    default: 40
  }
})

// 生成一个指定范围内的随机整数
const randomNum = (min, max) => {
  return Math.floor(Math.random() * (max - min) + min)
}
// 生成一个随机颜色字符串，格式为 rgb(r, g, b)。
const randomColor = (min, max) => {
  let r = randomNum(min, max)
  let g = randomNum(min, max)
  let b = randomNum(min, max)
  return 'rgb(' + r + ',' + g + ',' + b + ')'
}

// 绘制干扰线
const drawLine = (ctx) => {
  //在画布上绘制3条干扰线，颜色和位置随机。
  for (let i = 0; i < 3; i++) {
    ctx.strokeStyle = randomColor(props.lineColorMin, props.lineColorMax)
    ctx.beginPath()
    ctx.moveTo(randomNum(0, props.contentWidth), randomNum(0, props.contentHeight))
    ctx.lineTo(randomNum(0, props.contentWidth), randomNum(0, props.contentHeight))
    ctx.stroke()
  }
}

const drawText = (ctx, txt, i) => {
  //在画布上绘制验证码文本，字体颜色、大小和位置随机，并且文本会旋转一定角度。
  ctx.fillStyle = randomColor(props.colorMin, props.colorMax)
  ctx.font = randomNum(props.fontSizeMin, props.fontSizeMax) + 'px SimHei'
  let x = (i + 1) * (props.contentWidth / (props.identifyCode.length + 1))
  let y = randomNum(props.fontSizeMax, props.contentHeight - 5)
  var deg = randomNum(-10, 10)
  // 修改坐标原点和旋转角度
  ctx.translate(x, y)
  ctx.rotate(deg * Math.PI / 100)
  ctx.fillText(txt, 0, 0)
  // 恢复坐标原点和旋转角度
  ctx.rotate(-deg * Math.PI / 100)
  ctx.translate(-x, -y)
}

const drawDot = (ctx) => {
  // 在画布上绘制干扰点，位置随机
  for (let i = 0; i < 30; i++) {
    ctx.fillStyle = randomColor(0, 255)
    ctx.beginPath()
    ctx.arc(randomNum(0, props.contentWidth), randomNum(0, props.contentHeight), 1, 0, 2 * Math.PI)
    ctx.fill()
  }
}

const drawPic = () => {
  //: 绘制验证码图片的主要函数，包括背景、文本、干扰线和干扰点。
  let canvas = document.getElementById('s-canvas')
  let ctx = canvas.getContext('2d')
  ctx.textBaseline = 'bottom'
  // 绘制背景
  ctx.fillStyle = randomColor(props.backgroundColorMin, props.backgroundColorMax)
  ctx.fillRect(0, 0, props.contentWidth, props.contentHeight)
  // 绘制文字
  for (let i = 0; i < props.identifyCode.length; i++) {
    drawText(ctx, props.identifyCode[i], i)
  }
  drawLine(ctx)
  drawDot(ctx)
}
/*
响应性处理
使用 watch 监听 props.identifyCode 的变化，一旦变化就重新绘制验证码图片。
使用 onMounted 生命周期钩子在组件挂载后立即绘制验证码图片。
 */
watch(() => props.identifyCode, (newValue, oldValue) => {
  drawPic()
})

onMounted(() => {
  drawPic()
})
</script>
<!--为 .s-canvas 类添加了 cursor: pointer; 样式，
使得鼠标悬停在画布上时显示为手型光标。-->
<style scoped lang='css'>
.s-canvas {
  cursor: pointer;
}
</style>
<!--这个组件通过 <canvas> 元素和JavaScript绘制了一个包含随机文本、
干扰线和干扰点的验证码图片。
用户可以通过props传入验证码的代码和其他样式参数来自定义验证码的外观。
组件在挂载时绘制验证码，并在验证码代码变化时更新验证码图片。
这个组件可以用于需要验证码功能的Web应用中，例如表单提交验证。-->