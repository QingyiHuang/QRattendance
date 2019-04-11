<template>
<div>
  <el-row class="navbar">
  <el-button class="backButton" @click="goBack">&lt; 返回管理页面</el-button>
  </el-row>
  <!--为echarts准备一个具备大小的容器dom-->
  <div id="main" style="width: 320px;height: 500px;"></div>
</div>

</template>
<script>
  import echarts from 'echarts'
  import { GetQueryString } from '@/util/getUrlParam.js'
    export default {
        name: '',
        data () {
            return {
                charts: '',
                //opinion:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎'],
                // opinionData:[
                //   {value:335, name:'直接访问'},
                //   {value:310, name:'邮件营销'},
                //   {value:234, name:'联盟广告'},
                //   {value:135, name:'视频广告'},
                //   {value:1548, name:'搜索引擎'}
                // ]
                opinion: ['正常签到','迟到'],
                opinionData: [{name:'正常签到'},{name:'迟到'}],
            }
        },
        methods:{
            goBack(){
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
          },
            drawPie(id){
               this.charts = echarts.init(document.getElementById(id))
               
                var that = this
                this.$axios.post('/api/echart/echartPeople').then((res) => {
                    console.log(res.data)
                    for(let key in res.data){
                    that.opinionData[key].value = res.data[key].nn
                    }
                    that.charts.setOption({
                      tooltip: {
                        trigger: 'item',
                        formatter: '{a}<br/>{b}:{c} ({d}%)'
                      },
                      legend: {
                        orient: 'vertical',
                        x: 'left',
                        data:that.opinion
                      },
                      series: [
                        {
                          name:'签到',
                          type:'pie',
                          radius:['50%','70%'],
                          avoidLabelOverlap: false,
                          label: {
                            normal: {
                              show: false,
                              position: 'center'
                            },
                            emphasis: {
                              show: true,
                              textStyle: {
                                fontSize: '30',
                                fontWeight: 'blod'
                              }
                            }
                          },
                          labelLine: {
                            normal: {
                              show: false
                            }
                          },
                          data:that.opinionData
                        }
                      ]
                    })
            
                }).catch((err) => {
                    console.log(err)
                });
                
          },
        },

      //调用
        mounted(){
            this.$nextTick(function() {
                this.drawPie('main')
            })
        }
    }
</script>
<style scoped>
    #main{
        margin: 0 auto;
        margin-top: 40px;
    }
.navbar{
    border-bottom: 1px solid #000;
}
.backButton{
    float: left;
}
</style>
