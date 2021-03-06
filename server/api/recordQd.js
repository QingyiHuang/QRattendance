var models = require('../db');
var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var $sql = require('../sqlMap');

// 连接数据库
var conn = mysql.createConnection(models.mysql);

conn.connect();
var jsonWrite = function(res, ret) {
    if(typeof ret === 'undefined') {
        res.json({
            code: '1',
            msg: '操作失败'
        });
    } else {
        res.json(ret);
    }
};
//[params.studentno,params.qdate,params.qtime,params.qstarttime]
//[params.classno]
// 进行签到
router.post('/recordQd', (req, res) => {
    var sql = $sql.student.record_qd;
    var params = req.body;//传入四个数据，
    console.log(params);
    conn.query(sql, [params.studentno,params.qdate,params.qtime,params.qstarttime,params.qteachermsg], function(err, result) {
        if (err) {
            console.log(err);
        }
        if (result) {
            jsonWrite(res, result);
        }
    })
});

module.exports = router;