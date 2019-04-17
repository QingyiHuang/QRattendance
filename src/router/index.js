import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Teacher from '@/components/teacher'
import Student from '@/components/student'
import Leader from '@/components/leader'
import notFound from '@/components/notFound'
import userCenter from '@/components/userCenter'
import attandanceList from '@/components/attandanceList' //Echart view
import index from '@/components/index'
import qingjia from '@/components/qingjia'

Vue.use(Router)

export default new Router({//设置权限路由
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/index',
      name: 'index',
      component: index
    },
    {
      path: '/attandanceList',
      name: 'AttandanceList',
      component: attandanceList
    },
    {
      path:'/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/teacher',
      name: 'Teacher',
      component: Teacher
    },
    { 
      path: '/student', 
      name: 'Student',
      component: Student, 
      props: (route) => ({ did: route.query.did,time: route.query.time})
    },
    // {
    //   path: '/student',
    //   name: 'Student',
    //   component: Student
    // },
    {
      path: '/userCenter',
      name: 'UserCenter',
      component: userCenter
    },
    {
      path: '/qingjia',
      name: 'qingjia',
      component: qingjia
    },
    {
      path: '*',
      component: notFound
    }
  ]
})
