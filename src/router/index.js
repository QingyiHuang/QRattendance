import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Teacher from '@/components/teacher'
import notFound from '@/components/notFound'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/teacher',
      name: 'Teacher',
      component: Teacher
    },
    {
      path:'*',
      component: notFound
    }
  ]
})
