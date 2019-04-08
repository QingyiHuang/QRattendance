<template>
  <div>
    <img src="@/assets/img/quicktime.png" class="qtp">
    <el-row class="login">
      <el-col :md="{span: 10, offset: 7}" :sm="{span: 12,offset: 6}" :lg="{span: 8,offset: 8}" :xs="{span: 18,offset: 3}">
      <!-- 将待提交的表单注册一个DOM对象 ref=form -->
      <el-form :model="form" :label-position="labelPosition" ref="form" :rules="rules" label-width="100px">
        <!-- 手机号码输入框 验证规则phoneNum -->
        <el-form-item label="手机号码：" prop='phoneNum'>
          <el-input v-model.number="form.phoneNum" type="text" placeholder="手机号码">
          </el-input>
        </el-form-item>
        <!-- 密码输入框 验证规则passWord-->
        <el-form-item label="用户密码：" prop='passWord'>
          <el-input v-model="form.passWord" type="password" placeholder="用户密码">
          </el-input>
        </el-form-item>
        <!-- 用户身份，这里分教师，领导学生，采用radio-group，但需要包裹在form-item里面 identity验证规则 -->
        <el-form-item label="用户身份：" prop="identity">
          <el-radio-group v-model="form.identity">
            <el-radio class="radio" label="领导"></el-radio>
            <el-radio class="radio" label="教师"></el-radio>
            <el-radio class="radio" label="学生"></el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <!-- 两个按钮作为提交和重置使用 分别触发Login和reset方法，样式是primary -->
      <el-button type="primary" @click="Login('form')" size="large" style="width:160px">登录</el-button>
      <el-button type="primary" @click="reset('form')" size="large" style="width:160px">取消</el-button>
    </el-col>
    </el-row>
  </div>
</template>

<script>
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
        identity: ''
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
                //localStorage.setItem('teacher_info', response.data[0].tid)
                // setCookie('leader', this.form.phoneNum, 1000 * 60)  改localStorage 或者 sessionStorage
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
              if (response.data.length === 1) {
                localStorage.setItem('teacher_info', response.data[0].tid)
                // setCookie('teacher', this.form.phoneNum, 1000 * 60)
                setTimeout(function() {
                  this.$router.push({
                    path: `/teacher`
                  })
                }.bind(this), 500)
              } else {
                this.err()
              }
            })
          } else if (identity === '学生') {
            this.$axios.post('/api/user/studentLogin', data).then((response) => {
              if (response.data.length === 1) {
                console.log(response.data)
                // setCookie('studentno', response.data[0].sno, 1000 * 60)
                // setCookie('student', this.form.phoneNum, 1000 * 60)
                setTimeout(function() {
                  this.$router.push({
                    path: `/student`
                  })
                }.bind(this), 500)
              } else {
                this.err()
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
    }
  },
  components: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.login{
  margin-top: 30px;
}
.qtp{
  width: 200px;
  height: 200px;
}
</style>
