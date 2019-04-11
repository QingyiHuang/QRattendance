<template>
    <div>
        <el-row class="menubar">
            
            <el-menu theme="dark" router :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
                    <el-col :span="10" :offset="6" >
                        <el-menu-item index="/index" >首页</el-menu-item>
                        <el-menu-item index="/attandanceList">签到展示</el-menu-item>
                    </el-col>

                    <el-col :span="2">
                    <div class="user-info">
                        <el-dropdown trigger="click" @command="handleCommand">
                            <span class="el-dropdown-link">
                                <img class="user-logo" src="../../static/img/cctv.png">
                            </span>
                            <el-dropdown-menu class="dropdown" slot="dropdown" >
                                
                                <el-dropdown-item command="userCenter">{{username}}</el-dropdown-item>
                                <el-dropdown-item command="loginout">退出</el-dropdown-item>
                            </el-dropdown-menu>
                        </el-dropdown>
                    </div>

                        <!-- <el-submenu index="3" title="您好请登录">
                            <el-menu-item index="2-1">个人中心</el-menu-item>
                            <el-menu-item index="2-2">注销登陆</el-menu-item>
                            <el-menu-item index="2-3">关于</el-menu-item>
                        </el-submenu> -->
                    </el-col>
            </el-menu>
                    
        </el-row>

    </div>
</template>
<script>
export default {
    data(){
        return{
            activeIndex: '1',
            username:''
        }
    },
    methods: {
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
      },
      handleCommand(command) {
          if(command == 'loginout'){
              //清理storage，同时改动vuex里面的islogin状态可以响应改变
              localStorage.removeItem('leaderInfo')
              localStorage.removeItem('teacherInfo')
              localStorage.removeItem('studentInfo')
              localStorage.removeItem('isLogin')
              localStorage.removeItem('userName')
              this.$store.dispatch('changeLogin',false)
              this.username=''
              this.$router.push('/login');
          } else if (command == 'userCenter') {
              this.$router.push('/userCenter');
          }
      },
    },
    computed:{
        username(){
            if(window.localStorage.getItem('userName')){
                this.username =  JSON.parse(localStorage.getItem('userName'))
                
            }
            else if(window.localStorage.getItem('userName')){
                this.username =  JSON.parse(localStorage.getItem('userName'))
                
            }
            else if(window.localStorage.getItem('userName')){
                this.username =  JSON.parse(localStorage.getItem('userName'))
                
            }
            else{
                this.username =  this.$store.getters['getUserName']
            }
        }
    }
    // watch:{
    //     username(){
    //         if(window.localStorage.getItem('leaderInfo')){
    //             this.username = JSON.parse(localStorage.getItem('leaderInfo')).sphone
    //             
    //         }
    //         else if(window.localStorage.getItem('teacherInfo')){
    //             this.username = JSON.parse(localStorage.getItem('teacherInfo')).tname
    //             // return username ? username : this.name;
    //         }
    //         else if(window.localStorage.getItem('studentInfo')){
    //             this.username = JSON.parse(localStorage.getItem('studentInfo')).sname
    //             // return username ? username : this.name;
    //         }
    //         else{
    //             // return username ? username : this.name;
    //         }
    //         // let username = localStorage.getItem('ms_username');
    //         // return username ? username : this.name;
    //     }
    // },
}
</script>
<style scoped>
.menubar{
    position: fixed;
    width: 100%;
    height: auto;
    top: 0px;
    overflow:visible;
    z-index: 1;
}
    .user-info .user-logo{
        
        position: relative;
        top: 10px;
        width:40px;
        height:40px;
        border-radius: 50%;
        cursor: pointer;
    }
</style>
