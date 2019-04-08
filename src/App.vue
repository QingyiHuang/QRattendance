<template>
  <div id="app">
    <headbar/>
    
    <router-view/>
    
    <footerbar/>
  </div>
</template>

<script>
import headbar from '@/base/HeadBar'
import footerbar from '@/base/FooterBar'
export default {
  name: 'App',
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


</style>
