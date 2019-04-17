<template>
    <div>
        <navbar/>
        <div class="qjform">
            <el-form ref="form" label-position="top" :model="form" label-width="90px" content-width="300px">
            <!-- <el-form-item label="hello">
                <el-input v-model="form.name"></el-input>
            </el-form-item> -->

            <el-form-item label="请假类型">
                <el-select v-model="form.region" placeholder="请选择请假类型">
                <el-option label="病假" value="病假"></el-option>
                <el-option label="事假" value="事假"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="请假时间">
                <el-col :span="11">
                <el-date-picker type="date" placeholder="选择日期" v-model="form.date1" style="width: 100%;"></el-date-picker>
                </el-col>
                <el-col class="line" :span="2">-</el-col>
                <el-col :span="11">
                <el-time-picker type="fixed-time" placeholder="选择时间" v-model="form.date2" style="width: 100%;"></el-time-picker>
                </el-col>
            </el-form-item>
            <el-form-item label="请假理由">
                <el-input type="textarea" v-model="form.reason" tips="请写的详细点" tips-placement="right"></el-input>
            </el-form-item>
            <el-form-item class="demo-form-btns">
                <el-button type="primary" @click="onSubmit">请假</el-button>
                <el-button>取消</el-button>
            </el-form-item>
            </el-form>
        </div>
    </div>

</template>
<script>
import navbar from '../base/navBar.vue'
import {getDateYearAndDD} from '../util/toDateTime.js'
import {getDateSecond} from '../util/toDateTime.js'
  export default {
    components:{
        navbar
    },
    data() {
      return {
        form: {
            region:'',
            date1:'',
            date2:'',
            reason:''
        }
      }
    },
    methods: {
      onSubmit() {
          if(this.form.region && this.form.date1 && this.form.date2 &&this.form.reason){
            let data={
                'sno' : JSON.parse(window.localStorage.getItem('studentInfo')).sno,
                'sname' : JSON.parse(window.localStorage.getItem('studentInfo')).sname,
                'qtype' : this.form.region,
                'qres' : this.form.reason,
                'qdate' : getDateYearAndDD(this.form.date1)+' '+getDateSecond(this.form.date2)
            }
            this.$axios.post('/api/record/qingjia',data)
            .then((result) => {
                console.log(result)
                this.$message({
                showClose: true,
                message: '你已成功请假',
                type: 'success'
                });
            }).catch((err) => {
                console.log(err)
            });
          }else{
            this.$message({
            showClose: true,
            message: '您有内容没有输入',
            type: 'warning'
            });
          }
      }
    }
  }
</script>
<style scoped>
.qjform{
    margin: 0 auto;
    padding-top: 30px;
    width: 320px;
}
@media screen and (max-width: 720px) {
    .qjform{
        padding-top: 10px;
        padding-left: 10px;
    }
}
</style>