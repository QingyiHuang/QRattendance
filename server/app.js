// node 后端服务器

const leaderLogin = require('./api/leaderLogin');
const teacherLogin = require('./api/teacherLogin');
const studentLogin = require('./api/studentLogin');
const teacherClass = require('./api/teacherClass');
const dictionaryQuery = require('./api/dictionaryQuery');
const dictionaryAdd = require('./api/dictionaryAdd');
const recordQuery = require('./api/recordQuery');
const recordQd = require('./api/recordQd');
const recordbyName = require('./api/recordbyName');
const echartTimes = require('./api/echartTimes.js')
const echartPeople = require('./api/echartPeople.js')

const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const express = require('express');
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));

app.all('*', function(req, res, next) {
res.header("Access-Control-Allow-Origin", "*");//项目上线后改成页面的地址
res.header("Access-Control-Allow-Headers", "X-Requested-With,Content-Type");
res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
next();
});

// 后端api路由
app.use('/api/user', leaderLogin);
app.use('/api/user', teacherLogin);
app.use('/api/user', studentLogin);
app.use('/api/class', teacherClass);
app.use('/api/dictionary', dictionaryQuery);
app.use('/api/dictionary', dictionaryAdd);
app.use('/api/record', recordQuery);
app.use('/api/record', recordQd);
app.use('/api/recordbyname',recordbyName);
app.use('/api/echart',echartTimes);
app.use('/api/echart',echartPeople);

// 监听端口
app.listen(3000);
console.log('success listen at port:3000......');
