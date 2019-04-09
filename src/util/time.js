//拼接时间，主要是页面上需要调用时间的位置，就是学生点签到时记录下当前时间存入存入数据库，
//其实还有个比对的过程，当这个过程中的时间在设置签到时间之前就是签到，签到时间之后就是迟到
export default function startTime(selector) {
    var date = new Date()
    var d = date.getDate()
    var mon = date.getMonth() + 1
    var y = date.getFullYear()
    var h = date.getHours()
    var m = date.getMinutes()
    var s = date.getSeconds()
    h = checkTime(h)
    m = checkTime(m)
    s = checkTime(s)
    var result
    result = y + '年' + mon + '月' + d + '日  ' + h + ':' + m + ':' + s
    return result
  }
  
  function checkTime(i) {
    if (i < 10) {
      i = '0' + i
    }
    return i
  }
  