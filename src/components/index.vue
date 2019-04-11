
<template>
<div>
    <el-row class="navbar">
    <el-button class="backButton" @click="goBack">&lt; 返回管理页面</el-button>
    </el-row>

    <div class="about">
        <h1>看看有多少人签到了呀</h1>
    <!-- 两个表 -->
        <el-row>
            <el-col :span="24">
                <div id="pie"></div>
            </el-col>
        </el-row>
        <!-- <el-row>
            <el-col :span="24">
                <div id="pie2"></div>
            </el-col>
        </el-row> -->
    </div>
</div>

</template>
 
<script>
// 引入 ECharts 模块
import echarts from 'echarts'
 
export default {
    name: "about",
    data() {
        return {
            // clientHeight: '600px',
            screenWidth: document.body.clientWidth,//这里是获取body的端宽度，会随着浏览器窗口大小改变
            myChart: null,
            myChart2:null,
        }
    },
    mounted() {
        // 基于准备好的dom，初始化echarts实例
        console.log(this.screenWidth)

        const that = this
        window.onresize = () => {
            return (() => {
                window.screenWidth = document.body.clientWidth
                that.screenWidth = window.screenWidth
            })()
        }
 
        that.drawPie();
        // that.drawPie2();
    },
    watch: {
        screenWidth(val) {
            this.screenWidth = val
            console.log(this.screenWidth)
            console.log(screenWidth);
            // this.drawPie();
            // this.drawPie2();
 
            this.myChart.resize();
            this.myChart2.resize();
        }
    },
    created(){

    },
    methods: {
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
        //按日期，签到人数
        drawPie: function () {
            this.myChart = echarts.init(document.getElementById('pie'));

            let data={
                day1:'%04-08%',
                day2:'%04-09%',
                day3:'%04-10%',
                day4:'%04-11%',
                day5:'%04-12%',
            }
            var tempArr = []
            this.$axios.post('/api/echart/echartTimes',data)
            .then((res) => {
                for(let i=0; i< res.data.length ; i++){
                    tempArr.push(res.data[i].times)
                }
                let str = JSON.stringify(tempArr)
                tempArr = JSON.parse(str)
                // 绘制图表 异步编程的重要性，小心数据获取不到-----------------------------------------------
                var option = {
                title: {
                    text: '过去一周签到情况'
                },
                tooltip: {},
                xAxis: {
                    data: ['星期一', '星期二', '星期三', '星期四', '星期五']
                },
                yAxis: {},
                series: [{
                    name: '签到人数',
                    type: 'bar',
                    data: tempArr
                }]
            }
            console.log(option.series[0].data)
            this.myChart.setOption(option);
            }).catch((err) => {
                console.log(err)
            });

        }
        //按人名签到次数
        // ,drawPie2: function () {
        //     this.myChart2 = echarts.init(document.getElementById('pie2'));
        //     this.$axios
        //     // 绘制图表
        //     var option = {
        //         title: {
        //             text: '每个人签到次数'
        //         },
        //         tooltip: {},
        //         xAxis: {
        //             data: ['衬衫', '羊毛衫', '雪纺衫', '裤子', '高跟鞋', '袜子']
        //         },
        //         yAxis: {},
        //         series: [{
        //             name: '销量',
        //             type: 'bar',
        //             data: [5, 20, 36, 10, 10, 20]
        //         }]
        //     }
        //     this.myChart2.setOption(option);
            // setTimeout(() => {
            //     window.onresize = this.myChart2.resize
            // }, 200)
 
        // }
 
 
    }
 
}
</script>
 
<style scoped>
#pie,#pie2 {
    width: 100%;
    height: 400px;
}
.backButton{
    float: left;
}
.navbar{
    border-bottom: 1px solid #000;
}
</style>
