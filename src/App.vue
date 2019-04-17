<template>
  <div id="app">
    <headbar v-if="hackReset"/>
    <!-- 过渡 -->
    <transition mode="out-in" enter-active-class="animated fadeIn" leave-active-class="animated bounceOut">
      <router-view/>
    </transition>
    
    <footerbar/>
  </div>
</template>

<script>
import headbar from '@/base/HeadBar'
import footerbar from '@/base/FooterBar'
export default {
  name: 'App',
  data(){
    return {
      hackReset: true
    }
  },
  components:{
    headbar,
    footerbar
  }
}
</script>

<style>
@import './assets/font/font.css';
#app {
  /* font-family: 'Avenir', Helvetica, Arial, sans-serif; */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  font-family: 'ShaoNv Font'
}
/* 可以设置不同的进入和离开动画 */
/* 设置持续时间和动画函数 */
.slide-fade-enter-active {
  transition: all .1s ease;
}
.slide-fade-leave-active {

  transition: all .1s ease;
}
.slide-fade-enter, .slide-fade-leave-to
 {
  transform: translateX(10px);
  opacity: 0;
}
body {
margin-bottom: 40px;
}
</style>
