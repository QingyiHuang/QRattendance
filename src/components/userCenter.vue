<template>
    <div>
        <navbar/>

        
        <h4>更改头像</h4>
        用户中心，这里主要是展示用户数据，显示签到使用,针对本人的签到情况
        <el-row>
            <el-table
                class="atable"
                :data="tableData"
                stripe
                style="width: 80%">
                <el-table-column prop="sname" label="姓名" width="80">
                </el-table-column>
                <el-table-column prop="ssex" label="性别" width="80">
                </el-table-column>
                <el-table-column prop="sphone" label="电话" width="150">
                </el-table-column>
                <el-table-column prop="qdate" label="考勤时间" width="230">
                </el-table-column>
                <el-table-column prop="qteachermsg" label="考勤状态">
                </el-table-column>
            </el-table>
        </el-row>
    </div>
</template>
<script>
import navbar from '@/base/navBar.vue'
export default {
    components:{
        navbar
    },
    data(){
        return {
            tableData:[]
        }
    },
    created(){
        
        let data = {
          'sno': JSON.parse(window.localStorage.getItem('studentInfo')).sno
        }
        this.$axios.post('/api/recordbyname/recordbyName', data).then((response) => {
          if (response.data) {
            console.log(response.data)
            this.tableData = response.data
          } else {
            this.err()
          }
        })
    }
}
</script>
<style scoped>
    .atable{
        margin: 0 auto;
    }
    h4{
        margin-top: 100px;
    }
</style>