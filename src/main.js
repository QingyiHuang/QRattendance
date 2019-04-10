// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import HUI from 'hui'//引入HUI
import 'hui/lib/hui.css'//引入HUI样式
import Axios from 'axios'//引入axios
import Vuex from 'vuex'//引入vuex 管理状态
import userStore from './store/userStore.js'//引入vuex仓库
import animated from 'animate.css' //引入animate.css
import 'babel-polyfill'

Vue.use(Vuex)
let store = new Vuex.Store({
  modules:{
    userStore
  }
})

Vue.prototype.$axios = Axios
Axios.defaults.baseURL='http://192.168.191.1:3000'


Vue.use(HUI)
Vue.use(animated)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
