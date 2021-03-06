// sql语句
var sqlMap = {
  // 用户
  leader: {
    query: 'select * from account where sphone = ? and spass = ?',
    query_dic: 'select * from dictionary order by did desc',
    add_dic: 'insert into dictionary(dxyname,dxiname,dzyname,dnjname,dbjname) value(?,?,?,?,?)'
  },
  teacher: {
    query: 'select * from teacher where tphone = ? and tpassword = ?',
    class: 'select d.did , d.dnjname,d.dzyname,d.dbjname from teacher t,dictionary d,teacherclass  tc where t.tid = ? and tc.dictionaryid = d.did and tc.teacherid = t.tid',
    record_query: 'select s.sname,s.ssex,s.sphone, q.qdate,(q.qdate+qtime)>(q.qdate+qstarttime) ss  ,q.qteachermsg'
    +' from qdrecord q,student s where q.studentno = s.sno  and  s.classno= ?',
    query_qingjia: 'select sname,qtype,qres,qdate from qingjiarecord'
  },
  student: {
    query: 'select * from student where sphone = ? and spassword = ?',
    record_qd: 'INSERT INTO qdrecord(studentno,qdate,qtime,qstarttime,qteachermsg) VALUES (?,?,?,?,?)',
    querybyname: 'select s.sname,s.ssex,s.sphone, q.qdate,q.qteachermsg'
    +' from qdrecord q,student s where q.studentno = s.sno  and  s.sno= ?',
    // 'select * from qdrecord where studentno = ?'
    qingjia: 'INSERT INTO qingjiarecord(studentno,sname,qtype,qres,qdate,teacherno) VALUES (?,?,?,?,?,34)',
  },
  echart: {
    echart_time: ' select count(q.qdate) as times from qdrecord q  where q.qdate like ? ' +
    'union all select count(q.qdate) as times from qdrecord q  where q.qdate like ?' +
    'union all select count(q.qdate) as times from qdrecord q  where q.qdate like ?' + 
    'union all select count(q.qdate) as times from qdrecord q  where q.qdate like ?' +
    'union all select count(q.qdate) as times from qdrecord q  where q.qdate like ?' ,
    echart_people: 'select count(q.qteachermsg) as nn from qdrecord q where q.qteachermsg = ?' +
    'union all select count(r.qteachermsg) as nn from qdrecord r where r.qteachermsg like ?',
  }
}

module.exports = sqlMap;
