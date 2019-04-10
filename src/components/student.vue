<template>
    <div>
        <el-row>
            <el-col :sm="{span:16,offset:4}" :xs="{span:24}">
                <el-carousel :interval="4000" type="card" height="150px">
                    <el-carousel-item v-for="item in images" :key="item" :label="item.alt">
                        <a :href="item.href">
                            <img :src="item.src" class="carousel_img" :alt="item.alt" width="150px" height="150px">
                        </a>
                    </el-carousel-item>
                </el-carousel>
            </el-col>
        </el-row>

        <el-row class="student_btns">
            <h4>欢迎你，{{ sname }}同学，现在是</h4>
        </el-row>
        
        <el-row class="student_btns">
            <el-button class="diybtn" type="success" size="large" @click="qd">点击签到</el-button>
            <el-button class="diybtn" type="primary" size="large">请假</el-button>
            <el-button class="diybtn" type="primary" size="large" @click="toUserCenter">个人中心</el-button>
            <el-button class="diybtn" type="primary" size="large" @click="toUserCenter">查看考勤</el-button>
            <el-button class="diybtn" type="primary" size="large" @click="logout">用户注销</el-button>
        </el-row>

        
    </div>
</template>
<script>
import { GetQueryString } from '@/util/getUrlParam.js'//hash
import { toDateTime } from '@/util/toDateTime.js'//转换时间格式

export default {
    data() {
        return{
            sname: '',
            images: [],
            studentno: ''
        }
    },
    methods:{
    //签到功能，相当于一次，获取扫描二维码后传参地址里面的关键值cid ，存储的时候要记录当前时间，
    //麻烦点在于时间格式的转化，要做对比，这里可以后台做对比也可以前台做对比，主要是签到状态
    //mysql 里的datetime不能存JavaScript的默认时间值，
    //两种方法，把datetime 改为text 缺点不太知道，还有就是做拼接，拼成datetime的样子
    qd() {
      let data = {
        'studentno': '',//学生编号
        'qdate': '',//签到的年月日
        'qtime': '',// 签到时分秒
        'qstarttime': '',//最迟签到时间
        'qteachermsg': '',//是否迟到--------------》前端实现和后端实现
      }
      var nowDate = new Date()//获取现在时间
      let sno = JSON.parse(window.localStorage.getItem('studentInfo')).sno //获取webStorage中的学生id
      let qstarttime = GetQueryString('time')// 获取hash中的time值 这个time值就是教师设定的签到时间，在这之前为正常，之后为迟到

      if (qstarttime != null && qstarttime.toString().length > 1) {
        //赋值
        data.studentno = sno
        data.qdate = toDateTime(nowDate) // 转换现在时间--------------------------------------需要处理时间toDateTime
        data.qstarttime = qstarttime
        data.qtime = nowDate.getHours() + ':' + nowDate.getMinutes() + ':' + nowDate.getSeconds()
        //data.qteachermsg 需要解析时间
        let qstartHour = qstarttime.substr(0,2)
        let qstartMinutes = qstarttime.substr(3,2)
        if(nowDate.getHours() < qstartHour){
            data.qteachermsg='正常'
        }
        else if(nowDate.getHours() >= qstartHour)
        {
            if(nowDate.getMinutes()> qstartMinutes){
                let lateTime = nowDate.getMinutes() - qstartMinutes
                data.qteachermsg = '迟到'+lateTime+'分钟'
            }else{
                data.qteachermsg = '掐点到'
            }
        }
        console.log(data)

        this.$axios.post('/api/record/recordQd', data).then((response) => {
          console.log(response)
          if (response.statusText === 'OK') {
            this.$message({
              type: 'success',
              message: '签到成功'
            })
          } else {
            this.$message.error('签到失败')
            this.err()
          }
        })
      }
    },
        toUserCenter(){
            this.$router.push("/userCenter")
        },
        logout(){
            window.localStorage.removeItem('studentInfo')
            window.localStorage.removeItem('isLogin')
            localStorage.removeItem('userName')
            this.$router.push('/login')
        }
    },
    created(){
        this.$axios.get('http://192.168.191.1:8080/static/partmock/carouse.json')
        .then((result) => {
            for(let i of result.data.images)
            this.images.push(i)
        }).catch((err) => {
            console.log(err)
        });
        this.sname = JSON.parse(window.localStorage.getItem("studentInfo")).sname
    }
}
</script>
<style scoped>
.carousel_student{
    margin: 0 auto;
    margin-top: 120px;
    width: 60%;
}
.student_btns{
    margin-top: 30px;
}
.diybtn{
    margin-top: 0.5em;
    border-radius: 2%;
}
</style>