<template>
  <div class="con">
    <el-row class="teacher_con">
      <!-- <h4>{{'欢迎：' + tid}}</h4> -->
      
      <el-col :md="{span:4,offset:4}" :xs="{span:8}" :sm="{span:8}">
        <h4>这里需要获取老师的姓名</h4>
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
      <el-col  :md="{span: 12}" :xs="{span:16}" :sm="{span:16}">
        <div ref="count" style="display:block">
          <el-tabs type="border-card">
            <!-- tab页1 -->
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
              <el-button type="primary" @click="zoom(1.1)">放大</el-button>
              <el-button type="primary" @click="zoom(0.9)">缩小</el-button>
            </el-tab-pane>
            <!-- tab页2 -->
            <el-tab-pane label="出勤记录">
              <el-button type="primary" @click="queryRecord">查询</el-button>
              <div style="margin-top:10px">
                <el-table :data="recordArr" height="200" border style="width: 100%">
                  <el-table-column prop="sname" label="姓名" width="80">
                  </el-table-column>
                  <el-table-column prop="ssex" label="性别" width="80">
                  </el-table-column>
                  <el-table-column prop="sphone" label="电话" width="150">
                  </el-table-column>
                  <el-table-column prop="qdate" label="考勤时间" width="230">
                  </el-table-column>
                  <el-table-column prop="ss" label="考勤状态">
                  </el-table-column>
                </el-table>
              </div>
            </el-tab-pane>
          </el-tabs>
        </div>
        <div style="display:none" ref='manage'>
          <el-input placeholder="待访问地址" v-model="qrURL">
            <template slot="prepend">Http://</template>
          </el-input>
          <div class="select">
            <el-select v-model="value" placeholder="请选择">
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
export default {
    
}
</script>
<style scoped>
.con{
    font-size: 2em;
}
.qr_img {
  margin-top: 20px;
}
</style>
