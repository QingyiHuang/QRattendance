/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : erwei

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-08 18:31:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `sphone` varchar(11) DEFAULT NULL,
  `spass` varchar(255) DEFAULT NULL,
  `slastlogintime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('11111111111', '2015214038', '2019-04-03 14:25:44');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dxyname` varchar(255) DEFAULT NULL,
  `dxiname` varchar(255) DEFAULT NULL,
  `dzyname` varchar(255) DEFAULT NULL,
  `dnjname` varchar(255) DEFAULT NULL,
  `dbjname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('37', '计算机', '软件工程', '软件工程', '2015', '13111');
INSERT INTO `dictionary` VALUES ('38', '通信', '网络通讯', '电子网络通讯', '2015', '13122');
INSERT INTO `dictionary` VALUES ('39', '自动化', '自动化', '嵌入式', '2015', '13133');

-- ----------------------------
-- Table structure for erwei
-- ----------------------------
DROP TABLE IF EXISTS `erwei`;
CREATE TABLE `erwei` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) DEFAULT NULL,
  `ecodepass` varchar(255) DEFAULT NULL,
  `estarttime` datetime DEFAULT NULL,
  `eserverpath` varchar(255) DEFAULT NULL,
  `eerweipath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erwei
-- ----------------------------

-- ----------------------------
-- Table structure for messagerecord
-- ----------------------------
DROP TABLE IF EXISTS `messagerecord`;
CREATE TABLE `messagerecord` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mcontent` varchar(500) DEFAULT NULL,
  `mdate` datetime DEFAULT NULL,
  `mfromid` int(11) DEFAULT NULL,
  `mtoid` int(11) DEFAULT NULL,
  `misread` int(1) DEFAULT '1' COMMENT '1表示未读\r\n2表示已读',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messagerecord
-- ----------------------------

-- ----------------------------
-- Table structure for qdrecord
-- ----------------------------
DROP TABLE IF EXISTS `qdrecord`;
CREATE TABLE `qdrecord` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` int(11) DEFAULT NULL,
  `qdate` text,
  `qtime` time DEFAULT NULL,
  `qstarttime` time DEFAULT NULL,
  `qteachermsg` int(2) DEFAULT NULL COMMENT '如果有直九表示 缺勤',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qdrecord
-- ----------------------------
INSERT INTO `qdrecord` VALUES ('512', '128', '2019-04-03 00:00:00', '14:47:59', '00:00:00', null);
INSERT INTO `qdrecord` VALUES ('513', '100', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('514', '119', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('515', '120', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('516', '121', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('517', '122', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('518', '123', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('519', '124', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('520', '125', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('521', '126', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('522', '127', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('523', '129', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('524', '990', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('525', '991', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('526', '992', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('527', '993', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('528', '994', '2019-04-03 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('529', '128', '2019-04-03 00:00:00', '14:50:58', '17:36:51', null);
INSERT INTO `qdrecord` VALUES ('530', '128', '2019-04-03 00:00:00', '15:03:42', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('531', '120', '2019-04-03 00:00:00', '15:03:43', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('532', '119', '2019-04-03 00:00:00', '15:03:57', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('533', '991', '2019-04-03 00:00:00', '15:03:58', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('534', '994', '2019-04-03 00:00:00', '15:04:09', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('535', '123', '2019-04-03 00:00:00', '15:04:12', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('536', '127', '2019-04-03 00:00:00', '15:04:22', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('537', '994', '2019-04-03 00:00:00', '15:06:54', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('538', '128', '2019-04-03 00:00:00', '15:06:55', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('539', '123', '2019-04-03 00:00:00', '15:06:55', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('540', '127', '2019-04-03 00:00:00', '15:07:05', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('541', '120', '2019-04-03 00:00:00', '15:07:06', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('542', '119', '2019-04-03 00:00:00', '15:07:08', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('543', '121', '2019-04-03 00:00:00', '15:07:09', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('544', '129', '2019-04-03 00:00:00', '15:07:39', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('545', '121', '2019-04-03 00:00:00', '13:00:00', '11:00:00', null);
INSERT INTO `qdrecord` VALUES ('546', '100', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('547', '122', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('548', '124', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('549', '125', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('550', '126', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('551', '990', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('552', '991', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('553', '992', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('554', '993', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('555', '995', '2019-04-03 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('556', '121', '2019-04-03 00:00:00', '15:20:02', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('557', '120', '2019-04-03 00:00:00', '20:40:29', '13:00:00', null);
INSERT INTO `qdrecord` VALUES ('558', '120', '2019-04-03 00:00:00', '20:44:36', '09:00:00', null);
INSERT INTO `qdrecord` VALUES ('559', '119', '2019-04-03 17:19:08', '17:19:08', '16:00:00', null);

-- ----------------------------
-- Table structure for qingjiarecord
-- ----------------------------
DROP TABLE IF EXISTS `qingjiarecord`;
CREATE TABLE `qingjiarecord` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` int(11) DEFAULT NULL,
  `qres` varchar(255) DEFAULT NULL,
  `qdate` datetime DEFAULT NULL,
  `qisread` int(1) DEFAULT '1' COMMENT '1表示未读  0表示已读',
  `qresult` int(1) DEFAULT NULL COMMENT '0 同意  1不同意',
  `teacherno` int(11) DEFAULT NULL,
  `qshiyou` int(255) DEFAULT NULL COMMENT '0事假 1 病假',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qingjiarecord
-- ----------------------------
INSERT INTO `qingjiarecord` VALUES ('67', '127', '11', '2019-04-08 00:00:00', '1', null, '34', '1');
INSERT INTO `qingjiarecord` VALUES ('68', '120', '病了', '2019-04-08 21:04:00', '0', '0', '34', '1');

-- ----------------------------
-- Table structure for starttime
-- ----------------------------
DROP TABLE IF EXISTS `starttime`;
CREATE TABLE `starttime` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `stime` time DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `iswork` int(11) DEFAULT NULL COMMENT '是否出勤，1为是，0为否',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of starttime
-- ----------------------------
INSERT INTO `starttime` VALUES ('12', '08:00:00', '34', '1');
INSERT INTO `starttime` VALUES ('13', '08:00:00', '34', '0');
INSERT INTO `starttime` VALUES ('14', '08:00:00', '35', '1');
INSERT INTO `starttime` VALUES ('15', '08:00:00', '35', null);
INSERT INTO `starttime` VALUES ('16', '10:00:00', '35', null);
INSERT INTO `starttime` VALUES ('17', '10:00:00', '35', null);
INSERT INTO `starttime` VALUES ('18', '10:00:00', '35', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sno表示学号',
  `sname` varchar(255) NOT NULL,
  `ssex` int(1) DEFAULT NULL,
  `sphone` varchar(11) NOT NULL,
  `spassword` varchar(255) DEFAULT NULL,
  `classno` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`,`sphone`),
  KEY `水电费` (`classno`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classno`) REFERENCES `dictionary` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('119', '黄卿怡', '1', '18983845705', '123456', '37');
INSERT INTO `student` VALUES ('120', '张淑然', '1', '22222222222', '123', '37');
INSERT INTO `student` VALUES ('121', '任惋洁', '1', '33333333333', '123', '37');
INSERT INTO `student` VALUES ('122', '许瑜文', '1', '44444444444', '123', '37');
INSERT INTO `student` VALUES ('124', '白婧芸', '1', '55555555555', '123', '37');
INSERT INTO `student` VALUES ('127', '林婧雯', '1', '66666666666', '123', '37');
INSERT INTO `student` VALUES ('128', '杨姝瑶', '1', '77777777777', '123', '37');
INSERT INTO `student` VALUES ('129', '李妍凌', '1', '88888888888', '123', '37');
INSERT INTO `student` VALUES ('991', '闵乾祺', '1', '99999999999', '123', '38');
INSERT INTO `student` VALUES ('993', '寇佳文', '1', '23333333333', '123', '38');
INSERT INTO `student` VALUES ('994', '武娉娟', '1', '34444444444', '123', '39');
INSERT INTO `student` VALUES ('995', '魏林娜', '1', '45555555555', '123', '39');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tphone` varchar(11) NOT NULL,
  `tname` varchar(255) NOT NULL,
  `tsex` int(1) NOT NULL DEFAULT '1',
  `tpassword` varchar(255) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('34', '18888888888', '代老师', '1', '1');
INSERT INTO `teacher` VALUES ('35', '19999999999', '劲老师', '0', '2');

-- ----------------------------
-- Table structure for teacherclass
-- ----------------------------
DROP TABLE IF EXISTS `teacherclass`;
CREATE TABLE `teacherclass` (
  `tcid` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) DEFAULT NULL,
  `dictionaryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tcid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacherclass
-- ----------------------------
INSERT INTO `teacherclass` VALUES ('30', '34', '37');
INSERT INTO `teacherclass` VALUES ('31', '35', '37');
INSERT INTO `teacherclass` VALUES ('32', '36', '37');
INSERT INTO `teacherclass` VALUES ('33', '37', '37');
