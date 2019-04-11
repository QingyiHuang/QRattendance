<template>
  <!--为echarts准备一个具备大小的容器dom-->
  <div id="main" style="width: 320px;height: 500px;"></div>
</template>
<script>
  import echarts from 'echarts'
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
                opinion: [],
                opinionData: [],
            }
        },
        created(){//axios 请求 访问 迟到和正常签到人数
            this.$axios.post('/api/echart/echartPeopl').then((res) => {
                console.log(res.data)
            }).catch((err) => {
                console.log(err)
            });
        },
        methods:{
            drawPie(id){
               this.charts = echarts.init(document.getElementById(id))
               this.charts.setOption({
                 tooltip: {
                   trigger: 'item',
                   formatter: '{a}<br/>{b}:{c} ({d}%)'
                 },
                 legend: {
                   orient: 'vertical',
                   x: 'left',
                   data:this.opinion
                 },
                 series: [
                   {
                     name:'访问来源',
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
                     data:this.opinionData
                   }
                 ]
               })
            }
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
</style>
