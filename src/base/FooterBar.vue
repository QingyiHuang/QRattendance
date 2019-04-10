<template>
    <footer>
    <el-row class="footerBar">
        <el-col :span="24">
            <div>
                <span></span>
                <p>二维码签到考勤系统</p>
            </div>
        </el-col>
    </el-row>
    </footer>
</template>
<script>
export default {
    data(){
        return{

        }
    }
}
</script>
<style scoped>
footer{
    position: fixed;
    bottom: 0;
    width: 100%;
    z-index: 99999999999;
}
.footerBar{
    padding-top: 20px;
    padding-bottom: 20px;
    background-color: #373737;
    color: #FA3239;
    font-weight: bold;
}
</style>
