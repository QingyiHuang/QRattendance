// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import HUI from 'hui'
import 'hui/lib/hui.css'//引入样式
import Axios from 'axios'//引入axios

Vue.prototype.$axios = Axios
// Axios.defaults.baseURL='http://localhost:3000'

Vue.use(HUI)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
