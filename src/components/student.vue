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
            <el-button class="diybtn" type="primary" size="large">查看考勤</el-button>
            <el-button class="diybtn" type="primary" size="large" @click="logout">用户注销</el-button>
        </el-row>

        
    </div>
</template>
<script>
export default {
    data() {
        return{
            sname: '',
            images: [],
        }
    },
    created(){
        this.$axios.get('http://10.196.76.127:8080/static/partmock/carouse.json')
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