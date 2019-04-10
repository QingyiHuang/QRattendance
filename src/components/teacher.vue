<template>
  <div class="con">
    <el-row class="teacher_con">
      
      <el-col :md="{span:4,offset:4}" :xs="{span:24}" :sm="{span:8}">
        <h6>欢迎您：{{teacherName}}</h6>
          <!-- 适配窗口大小的的垂直导航 -->
        <el-menu default-active="1" class="el-menu-vertical-demo" theme="dark">
          <el-menu-item index="1" @click="classinfo">
            <el-icon class="h-icon-users"></el-icon>班级管理
          </el-menu-item>

          <el-menu-item index="2" @click="changeTabs">
            <el-icon class="h-icon-filter"></el-icon>系统设置
          </el-menu-item>
          <el-menu-item index="3" @click="logout">
            <el-icon class="h-icon-tip_error"></el-icon>用户注销
          </el-menu-item>
        </el-menu>
      </el-col>
      <!-- 右半部为两个标签页，分别设置displayblock和none -->
      <el-col  :md="{span: 12}" :xs="{span:24}" :sm="{span:16}">
        
          <!-- 注册count 为默认显示tab 里面有两个小tab-->
        <div ref="count" style="display:block">
          <el-tabs type="border-card">
            <!-- 小tab页1 -->
            <el-tab-pane label="扫码签到">

              <el-select v-model="listVaule" placeholder="请选择" @change="select">
                <el-option v-for="item in list" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
              </el-select>
            <!-- 调用qrcode生成二位码的js库 -->
              <div class="qr_img">
                <svg id="svg" width="300" height="300">
                  <g id="qrcode" ref="qrcode" />
                </svg>
              </div>
            <!-- 针对二维码进行放大和缩小 -->
              <el-button type="info" @click="zoom(1.1)">放大</el-button>
              <el-button type="info" @click="zoom(0.9)">缩小</el-button>
            </el-tab-pane>
            <!-- 小tab页2 -->
            <el-tab-pane label="出勤记录">
              <el-button type="info" icon="h-icon-search" :radius="true" class="searchBtn" @click="queryRecord">查询所有签到信息</el-button>
              <!-- 表格，用来陈列签到数据 -->
              <div style="margin-top:10px">
                <el-table :data="recordArr"  tooltip-effect="dark" border='false' style="width: 100%">
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
              </div>
            </el-tab-pane>
          </el-tabs>
        </div>
        <!-- 默认隐藏注册节点 隐藏tab 注册为manage-->
        <div style="display:none" ref='manage' class="manageBox">
          <p>请先设置时间再选择班级</p>
          <el-input placeholder="待访问地址" v-model="qrUrl" disabled>
            <template slot="prepend"><span class='fontBorder'>http://</span></template>
          </el-input>
          <div class="select">
            <el-select v-model="startTime" placeholder="请选择">
              <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value">
              </el-option>
            </el-select>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
//导入二维码库
import QRCode from '@/util/qrcode'
export default {
    data(){
      return{
        teacherName: '',
        disabled: true,
        qrUrl: 'http://192.168.191.1:8080',//ip地址每天都在变化
        scale: 1,//二维码缩放大小
        list: [],
        listVaule: '',//教师选择班级的时候会获取到班级的信息
        options: [//签到时间节点
          {
            value:'07:00',
            label:'07:00',
          },
          {
            value:'08:00',
            label:'08:00',
          },
          {
            value:'09:00',
            label:'09:00',
          },
          {
            value:'10:00',
            label:'10:00',
          },
          {
            value:'11:00',
            label:'11:00',
          },
          {
            value:'12:00',
            label:'12:00',
          },
          {
            value:'13:00',
            label:'13:00',
          },
          {
            value:'14:00',
            label:'14:00',
          },
          {
            value:'15:00',
            label:'15:00',
          },
          {
            value:'16:00',
            label:'16:00',
          },
          {
            value:'17:00',
            label:'17:00',
          },
          {
            value:'18:00',
            label:'18:00',
          }
        ],//获取上课时间节点，应该是后台发过来的
        startTime:'',
        recordArr:[],
      }
    },
    created(){//当没有权限的时候就push到首页，从localStorage里面找信息
      if(!window.localStorage.getItem('teacherInfo')){
        this.$router.push('/')
      }else{
        this.teacherName = JSON.parse(window.localStorage.getItem('teacherInfo')).tname
        
        //这里我们将设置一个默认签到时间，获取实际，默认到下一个整点
        let time = new Date()
        let nowHours = time.getHours()
        let nowMinutes = time.getMinutes()
        if(nowMinutes >= 0){
          nowHours++
        }
        this.startTime = nowHours+':'+'00';
        

        //获取班级的编号 传入教师id找到所管理的班级信息
        let data = {'id': JSON.parse(window.localStorage.getItem('teacherInfo')).tid}
        //console.log(data)
        this.$axios.post('/api/class/teacherClass',data)
        .then((res)=>{
          //console.log(res.data)
          var listObj = {}
          for (let i = 0; i < res.data.length; i++) {
            listObj.label = res.data[i].did + '编号' + res.data[i].dnjname + '级' + res.data[i].dzyname + '专业' + res.data[i].dbjname + '班级'
            listObj.value = res.data[i].did + '编号' + res.data[i].dnjname + '级' + res.data[i].dzyname + '专业' + res.data[i].dbjname + '班级'
            if (this.list.length === 0) {
              this.list.push(listObj)
            }
          }
        }).catch((err)=>{
          console.log(err)
        })
        
      }
    },
    methods:{
      classinfo(){
        this.$refs.count.style.display = 'block'
        this.$refs.manage.style.display = 'none'
      },
      //当我点击系统设置的时候，让tab1隐藏tab2显示
      changeTabs(){
        //获取所有注册节点并选中要操作的组件，然后对其设置显示和隐藏
        this.$refs.count.style.display = 'none'
        this.$refs.manage.style.display = 'block'
      },
      //绘制二维码按照班级绘制二维码
      //SVG可缩放矢量图形（Scalable Vector Graphics）
      createQr(cid,url,time){
        const qrcode = new QRCode(document.querySelector('#qrcode'), {
          //text: 'your content',
          width: 100,
          height: 100,
          colorDark: '#000000',
          colorLight: '#ffffff',
          correctLevel: QRCode.CorrectLevel.H, //容错级别
          useSVG: true
        })
          qrcode.makeCode(url+'?did='+cid+'&time='+time)
      },
      // 放大或者缩小
      zoom(num) {
        var svg = document.querySelector('#svg')
        this.scale = this.scale * num
        if (this.scale < 0.5 || this.scale > 1.1) {
          return
        } else {
          svg.setAttribute('transform', 'scale(' + this.scale + ')')
        }
      },
      //当选择完后调用qrcode，绘制二维码
      select(){
        let cid = this.listVaule.slice(0,2)//匹配开始到编的数据
        if(this.startTime){
          this.$options.methods.createQr(cid,this.qrUrl,this.startTime)// methods 中调用另外一个声明函数要使用this.$options.methods.函数名()
        }
      },
      //查询管理班级的考勤
      // 考勤记录查询
      queryRecord() {
        let data = {
          'classno': 37
        }
        this.$axios.post('/api/record/recordQuery', data).then((response) => {
          if (response.data) {
            console.log(response.data)
            this.recordArr = response.data
            // this.recordArr = response.data.slice(0)
          } else {
            this.err()
          }
        })
      },
      //用户登出  建议后期加入模态框。
      logout() {
        window.localStorage.removeItem('teacherInfo')
        window.localStorage.removeItem('isLogin')
        localStorage.removeItem('userName')
        this.$router.push('/login')
      }
    }
}
</script>
<style scoped>
.con{
    font-size: 2em;
}
.qr_img {
  margin: 0 auto;
  text-align: center;
  margin-top: 20px;
}
.searchBtn{
    float: left;
}
.manageBox{
  padding-left: 1em;
  padding-top: 1em;
  padding-right: 2em;
  background-color: cadetblue;
  height: 10em;
  overflow: hidden;
  border-radius: 4%;
}
</style>
