<template>
    <div class="navBar">
        <el-row>
            <el-col :offset="3" :span="2">
            <el-button class="backbtn" type="primary" size="normal" @click="goBack">&lt; 返回上层</el-button>
            </el-col>
            </el-row>
    </div>
</template>
<script>
export default {
    methods:{
        goBack(){

            this.$router.go(-1); //根据浏览器记录返回上一次

        }
    }
}
</script>
<style scoped>
    .navBar{
        position: relative;
        top: 0 ;
        height: 2em;
        width: 100%;
        background-color: dimgrey;
        overflow: hidden;
    }
    .backbtn{}
</style>