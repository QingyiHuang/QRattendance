<template>
  <div class="video-container">

      <div class="filter" :style="fixStyle">
      </div>
    
      <!-- 背景组 -->
      <video :style="fixStyle" autoplay loop v-on:canplay="canplay">
      <source src="@/assets/movie/Feeling-the-Air.mp4" type="video/mp4"/>
      浏览器不支持 video 标签，建议升级浏览器。
      <source src="@/assets/movie/Feeling-the-Air.mp4" type="video/webm"/>
      浏览器不支持 video 标签，建议升级浏览器。
      </video>
      <!-- <div class="poster hidden" v-if="!vedioCanPlay">
        <img :style="fixStyle" src="@/assets/movie/Sunset-Couple.jpg" alt="">
      </div> -->
      <div class="loginForm">
        <img src="@/assets/img/quicktime.png" class="qtp">
        <el-row class="login" >
          <el-col :md="{span: 10, offset: 7}" :sm="{span: 12,offset: 6}" :lg="{span: 8,offset: 8}" :xs="{span: 20,offset: 2}">
          <!-- 将待提交的表单注册一个DOM对象 ref=form -->
          <el-form :model="form" :label-position="labelPosition" ref="form" :rules="rules" label-width="100px">
            <!-- 手机号码输入框 验证规则phoneNum -->
            <el-form-item id="phone" label="手机号码：" @focus="scrollPhone" prop='phoneNum'>
              <el-input v-model.number="form.phoneNum" type="text" placeholder="手机号码">
              </el-input>
            </el-form-item>
            <!-- 密码输入框 验证规则passWord-->
            <el-form-item  style="color: #ffffff" label="用户密码：" @focus="scrollPhone" prop='passWord'>
              <el-input v-model="form.passWord" type="password" placeholder="用户密码">
              </el-input>
            </el-form-item>
            <!-- 用户身份，这里分教师，领导学生，采用radio-group，但需要包裹在form-item里面 identity验证规则 -->
            <el-form-item label="用户身份：" prop="identity">
              <el-radio-group v-model="form.identity" :size="small" class="radio-group">
                <!-- <el-radio class="radio" label="领导"></el-radio> -->
                <el-radio class="radio" label="教师"></el-radio>
                <el-radio class="radio" label="学生"></el-radio>
              </el-radio-group>
            </el-form-item>
          </el-form>
          <!-- 两个按钮作为提交和重置使用 分别触发Login和reset方法，样式是primary -->
          <el-button type="primary" @click="Login('form')" size="large" style="width:1.5em">登录</el-button>
          <el-button type="primary" @click="reset('form')" size="large" style="width:1.5em">取消</el-button>
        </el-col>
        </el-row>
      </div>
  </div>
</template>

<script>
import { GetQueryString } from '@/util/getUrlParam.js'
export default {
  name: 'Login',
  data() {
    //一个箭头函数，elementUi的自定义验证规则，获取手机号，对手机号进行验证
    //在下面的rules中的validator 中调用checkPhoneNum函数，使用该验证规则
    var checkPhoneNum = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('手机号码不能为空'))
      }
      setTimeout(() => {
        if (!Number.isInteger(value)) {
          callback(new Error('请输入数字类型值'))
        } else {
          if (value.toString().length !== 11) {
            callback(new Error('手机号码长度错误'))
          } else {
            callback()
          }
        }
      }, 1000)
    }
    return {
      labelPosition: 'right',
      form: {
        phoneNum: '',
        passWord: '',
        identity: '',
        //背景样式和遮罩层
        vedioCanPlay: false,
        fixStyle: ''
      },
      rules: {
        phoneNum: [
          {
            validator: checkPhoneNum,
            trigger: 'blur'
          }
        ],
        passWord: [
          {
            required: true,
            message: '请输入密码',
            trigger: 'blur'
          }
        ],
        identity: [
          {
            required: true,
            message: '请选择登录身份',
            trigger: 'change'
          }
        ]
      }
    }
  },
  methods: {
    Login(form) {
      var identity = this.form.identity
      let data = {
        'num': this.form.phoneNum,
        'pass': this.form.passWord
      }
      //从节点对象中取出form表单，然后经过validate后返回一个布尔值，是则继续，
      this.$refs[form].validate((valid) => {
        if (valid) {
          //console.log(this.form.identity +'   '+identity )
          if (identity === '领导') {
            this.$axios.post('/api/user/leaderLogin', data).then((response) => {
              if (response.data.length === 1) {
                localStorage.setItem('leaderInfo', response.data[0])
                localStorage.setItem('isLogin','1')
                localStorage.setItem('userName',response.data[0].sphone)
                this.$store.dispatch('changeUserName',response.data[0].sphone)
                this.$store.dispatch('changeLogin',true)
                setTimeout(function() {
                  this.$router.push({
                    path: `/leader`
                  })
                }.bind(this), 500)
              } else {
                this.err()
              }
            })
          } else if (identity === '教师') {
            this.$axios.post('/api/user/teacherLogin', data).then((response) => {
              console.log(response)
              if(response.data){
                //webStorage存储老师信息和登陆状态
                window.localStorage.setItem('teacherInfo',JSON.stringify(response.data[0]))//通过转换字符串存JSON对象
                window.localStorage.setItem('isLogin','1')
                localStorage.setItem('userName',response.data[0].tname)
                this.$store.dispatch('changeUserName',response.data[0].tname)
                this.$store.dispatch('changeLogin',true)
                setTimeout(function(){
                  this.$router.push({
                    path:'/teacher'
                  })
                }.bind(this), 500)
              }else{
                console.log(err)
              }
            })
          } else if (identity === '学生') {
            let qstarttime = GetQueryString('time')

            this.$axios.post('/api/user/studentLogin', data).then((response) => {
              if (response.data) {
                console.log(response.data[0])
                //webStorage存储学生信息和登陆状态
                window.localStorage.setItem('studentInfo',JSON.stringify(response.data[0]))
                window.localStorage.setItem('isLogin','1')
                localStorage.setItem('userName',response.data[0].sname)
                this.$store.dispatch('changeUserName',response.data[0].sname)
                this.$store.dispatch('changeLogin',true)
                let did = JSON.parse(window.localStorage.getItem('studentInfo')).sno
                setTimeout(function() {
                  this.$router.push({
                    path: `/student?did=`+did+`&time=`+qstarttime
                  })
                }.bind(this), 500)
              } else {
                this.err()//需要改进
              }
            })
          }
          // console.log('submit!')
        } else {
          // console.log('error submit!!')
          return false
        }
      })
    },
    reset(form) {
      this.$refs[form].resetFields()
    },
    err() {
      this.$message('用户名不存在或密码错误')
    },
    scrollPhone(){
      this.$router.push({
        path: `/student/#phone/?did=`+did+`&time=`+qstarttime
      })
    },
    canplay() {
      this.vedioCanPlay = true
    }
  },
  components: {
  },
  mounted(){
    //抓取路由中的数据，存到sessionStorage里面

    if(window.localStorage.getItem('isLogin')){
      if(window.localStorage.getItem('teacherInfo')){
        this.$router.push("/teacher")
      }
      else if(window.localStorage.getItem('studentInfo')){
        let qstarttime = GetQueryString('time')
        let did = JSON.parse(window.localStorage.getItem('studentInfo')).sno
        this.$router.push({
          path: `/student?did=`+did+`&time=`+qstarttime
        })
      }
      else if(window.localStorage.getItem('leaderInfo')){
        this.$router.push("/leader")
      }
    }

    //背景操作
      window.onresize = () => {
          //获取到window的body内宽高
        const windowWidth = document.body.clientWidth
        const windowHeight = document.body.clientHeight
        //屏幕高宽比：定义视频宽高比
        const windowAspectRatio = windowHeight / windowWidth
        //定义视频宽高
        let videoWidth
        let videoHeight
        //0.5625:1  =>9/16 初始化视频宽高
        if (windowAspectRatio < 0.5625) {  
          videoWidth = windowWidth
          videoHeight = videoWidth * 0.5625
          //定义遮罩层的样式，高度为body内宽高 按比率
          this.fixStyle = {
            height: windowWidth * 0.5625 + 'px',
            width: windowWidth + 'px',

            'margin-bottom': (windowHeight - videoHeight) / 2 + 'px',
            'margin-left': 'initial'
          }
        } else {
          videoHeight = windowHeight
          videoWidth = videoHeight / 0.5625
          this.fixStyle = {
            height: windowHeight + 'px',
            width: windowHeight / 0.5625 + 'px',
            'margin-left': (windowWidth - videoWidth) / 2 + 'px',
            'margin-bottom': 'initial'
          }
        }
      }
      window.onresize()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.login{
  margin-top: 30px;
}
.qtp{
  width: 200px;
  height: 200px;
}
/* 解决输入框抖动问题 */
.el-select__input {
    vertical-align: baseline;
}
/* .radio-group{

} */

/* 添加背景 */
  .video-container {
    position: relative;
    width: 100%;
    height: 100vh;
    overflow: hidden;
  }
  .video-container .filter {
    position: absolute;
    z-index: 2;
    background: rgba(0, 0, 0, 0.4);
    color: aliceblue;
    width: 100%;
    height: 100vh;
    
  }
  .video-container .poster img,
  .video-container video {
    position: absolute; 
    left: 0;
    margin-left: 0;
    z-index: 0;
  }
  .loginForm{
    position: relative;
    z-index: 3;
    background: rgba(0, 0, 0, 0);
    color: #fff;
    top: 30px;
    width: 100%;
    margin: 0 auto;
  }
label.el-form-item__label{
  color: #fff;
}
.el-radio__label{
 color: #fff;
}
</style>
