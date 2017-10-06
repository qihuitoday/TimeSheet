/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : timesheet

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-07 00:19:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categary`
-- ----------------------------
DROP TABLE IF EXISTS `categary`;
CREATE TABLE `categary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Categary_Name` varchar(20) DEFAULT NULL,
  `Categary_Description` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categary
-- ----------------------------
INSERT INTO `categary` VALUES ('1', 'Communication', 'Communication');
INSERT INTO `categary` VALUES ('2', 'Requirement Analysis', 'Requirement Analysis');
INSERT INTO `categary` VALUES ('3', 'Design', 'Design');
INSERT INTO `categary` VALUES ('4', 'Development', 'Development');
INSERT INTO `categary` VALUES ('5', 'Test', 'Test');
INSERT INTO `categary` VALUES ('6', 'Review', 'Review');
INSERT INTO `categary` VALUES ('7', 'Bug Fix', 'Bug Fix');
INSERT INTO `categary` VALUES ('8', 'Trouble Shooting', 'Trouble Shooting');
INSERT INTO `categary` VALUES ('9', 'Knowledge Transfer', 'Knowledge Transfer');
INSERT INTO `categary` VALUES ('10', 'Tech.Study', 'Tech.Study');
INSERT INTO `categary` VALUES ('11', 'Others', 'Others');

-- ----------------------------
-- Table structure for `emailtemplate`
-- ----------------------------
DROP TABLE IF EXISTS `emailtemplate`;
CREATE TABLE `emailtemplate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `Email_Content_Begin` varchar(2000) DEFAULT NULL COMMENT '��ʼ',
  `Email_Content_End` varchar(40) DEFAULT NULL COMMENT '����',
  `Email_Contact_Person` varchar(20) DEFAULT NULL COMMENT '������',
  `Email_Telphone` varchar(20) DEFAULT NULL COMMENT '�绰',
  `Email_Content_Middle` varchar(100) DEFAULT NULL COMMENT '��ϵ����',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ÿ�������ʼ�';

-- ----------------------------
-- Records of emailtemplate
-- ----------------------------

-- ----------------------------
-- Table structure for `holidaystable`
-- ----------------------------
DROP TABLE IF EXISTS `holidaystable`;
CREATE TABLE `holidaystable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `Holiday_Date` datetime DEFAULT NULL COMMENT '����',
  `Holiday_Status` int(11) DEFAULT NULL COMMENT '״̬',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of holidaystable
-- ----------------------------

-- ----------------------------
-- Table structure for `jobtitle`
-- ----------------------------
DROP TABLE IF EXISTS `jobtitle`;
CREATE TABLE `jobtitle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Job_Title` varchar(20) DEFAULT NULL COMMENT 'ְ��',
  `Job_Desc` varchar(320) DEFAULT NULL COMMENT 'ְ������',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='�û�ְ��';

-- ----------------------------
-- Records of jobtitle
-- ----------------------------
INSERT INTO `jobtitle` VALUES ('1', 'Junior Developer', 'Junior Developer');
INSERT INTO `jobtitle` VALUES ('2', 'Senior Developer', 'Senior Developer');
INSERT INTO `jobtitle` VALUES ('3', 'Tech Writer', 'Tech Writer');
INSERT INTO `jobtitle` VALUES ('4', 'Junior Tester', 'Junior Tester');
INSERT INTO `jobtitle` VALUES ('5', 'Senior Tester', 'Senior Tester');
INSERT INTO `jobtitle` VALUES ('6', 'Test Lead', 'Test Lead');
INSERT INTO `jobtitle` VALUES ('7', 'Tech Lead', 'Tech Lead');
INSERT INTO `jobtitle` VALUES ('8', 'Support', 'Support');
INSERT INTO `jobtitle` VALUES ('9', 'Project Manager', 'Project Manager');
INSERT INTO `jobtitle` VALUES ('10', 'Administrator', 'Administrator');
INSERT INTO `jobtitle` VALUES ('11', 'UI Designer', 'UI Designer');
INSERT INTO `jobtitle` VALUES ('12', 'Intern', 'Intern');

-- ----------------------------
-- Table structure for `ottimesheet`
-- ----------------------------
DROP TABLE IF EXISTS `ottimesheet`;
CREATE TABLE `ottimesheet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Project_ID` int(11) DEFAULT NULL COMMENT '��ĿID',
  `UserInfo_ID` int(11) DEFAULT NULL COMMENT '�û�ID',
  `Time_Date` datetime DEFAULT NULL,
  `Time_Cost_Hours` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `Time_Description` varchar(320) DEFAULT NULL COMMENT '����',
  `Time_Status` int(11) DEFAULT NULL COMMENT '״̬',
  `Time_RejectComment` varchar(320) DEFAULT NULL COMMENT '�ܾ�����',
  `Time_LastModiDate` datetime DEFAULT NULL COMMENT '����޸�����',
  `Time_lastModifier` int(11) DEFAULT NULL COMMENT '����޸���',
  PRIMARY KEY (`ID`),
  KEY `FK_FK_OT_LastModifier_ID` (`Time_lastModifier`),
  KEY `FK_FK_OT_Project_ID` (`Project_ID`),
  KEY `FK_FK_OT_UserInfo_ID` (`UserInfo_ID`),
  CONSTRAINT `FK_FK_OT_LastModifier_ID` FOREIGN KEY (`Time_lastModifier`) REFERENCES `userinfo` (`ID`),
  CONSTRAINT `FK_FK_OT_Project_ID` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`ID`),
  CONSTRAINT `FK_FK_OT_UserInfo_ID` FOREIGN KEY (`UserInfo_ID`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ottimesheet
-- ----------------------------

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Project_Name` varchar(64) DEFAULT NULL COMMENT '��Ŀ����',
  `Project_Leader` int(11) DEFAULT NULL COMMENT '��Ŀ������',
  `Project_Status` int(11) DEFAULT NULL COMMENT '״̬',
  `Project_ViewStatus` int(11) DEFAULT NULL,
  `Project_Desc` varchar(320) DEFAULT NULL COMMENT '��Ŀ����',
  `Project_Flag` int(11) DEFAULT NULL COMMENT '�����֯(1:China  2:global',
  `Project_CreateBy` int(11) DEFAULT NULL,
  `Project_CreateTime` datetime DEFAULT NULL,
  `Project_UpdateBy` int(11) DEFAULT NULL,
  `Project_UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PROJECT_EMPLOYEE_Leader` (`Project_Leader`),
  KEY `FK_PROJECT_EMPLOYEE_CreateBy` (`Project_CreateBy`),
  KEY `FK_PROJECT_EMPLOYEE_UpdateBy` (`Project_UpdateBy`),
  CONSTRAINT `FK_PROJECT_EMPLOYEE_CreateBy` FOREIGN KEY (`Project_CreateBy`) REFERENCES `userinfo` (`ID`),
  CONSTRAINT `FK_PROJECT_EMPLOYEE_Leader` FOREIGN KEY (`Project_Leader`) REFERENCES `userinfo` (`ID`),
  CONSTRAINT `FK_PROJECT_EMPLOYEE_UpdateBy` FOREIGN KEY (`Project_UpdateBy`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ŀ';

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for `project_mid_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `project_mid_userinfo`;
CREATE TABLE `project_mid_userinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Project_ID` int(11) DEFAULT NULL COMMENT '��ĿID',
  `UserInfo_ID` int(11) DEFAULT NULL COMMENT '�û�ID',
  PRIMARY KEY (`ID`),
  KEY `FK_FK_TIME_MID_REFERENCE_PROJECT` (`Project_ID`),
  KEY `FK_FK_TIME_MID_REFERENCE_USERINFO` (`UserInfo_ID`),
  CONSTRAINT `FK_FK_TIME_MID_REFERENCE_PROJECT` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`ID`),
  CONSTRAINT `FK_FK_TIME_MID_REFERENCE_USERINFO` FOREIGN KEY (`UserInfo_ID`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ŀ���û��м��';

-- ----------------------------
-- Records of project_mid_userinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(20) DEFAULT NULL COMMENT '��ɫ����',
  `Role_Desc` varchar(320) DEFAULT NULL COMMENT '��ɫ����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'User', 'User');
INSERT INTO `role` VALUES ('2', 'Admin', 'Administrator');
INSERT INTO `role` VALUES ('3', 'PM', 'Project Manager');

-- ----------------------------
-- Table structure for `timesheet`
-- ----------------------------
DROP TABLE IF EXISTS `timesheet`;
CREATE TABLE `timesheet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Project_ID` int(11) DEFAULT NULL COMMENT '��ĿID',
  `UserInfo_ID` int(11) DEFAULT NULL COMMENT '�û�ID',
  `Time_Date` datetime DEFAULT NULL,
  `Time_Type` int(11) DEFAULT NULL COMMENT 'TimeSheetType',
  `Time_Cost_Hours` int(11) DEFAULT NULL COMMENT '����ʱ��',
  `Time_Week_Day` int(11) DEFAULT NULL COMMENT '��һ��',
  `Time_Description` varchar(320) DEFAULT NULL COMMENT '����',
  `Time_Status` int(11) DEFAULT NULL COMMENT '״̬',
  `Time_RejectComment` varchar(320) DEFAULT NULL COMMENT '�ܾ�����',
  `Time_CreateBy` int(11) DEFAULT NULL,
  `Time_CreateTime` datetime DEFAULT NULL,
  `Time_UpdateBy` int(11) DEFAULT NULL,
  `Time_UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TIMESHEE_EMPLOYEE_UserInfo_ID` (`UserInfo_ID`),
  KEY `FK_TIMESHEE_EMPLOYEE_Project_ID` (`Project_ID`),
  KEY `FK_TIMESHEE_EMPLOYEE_Time_CreateBy` (`Time_CreateBy`),
  KEY `FK_TIMESHEE_EMPLOYEE_Time_Type` (`Time_Type`),
  CONSTRAINT `FK_TIMESHEE_EMPLOYEE_Project_ID` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`ID`),
  CONSTRAINT `FK_TIMESHEE_EMPLOYEE_Time_CreateBy` FOREIGN KEY (`Time_CreateBy`) REFERENCES `userinfo` (`ID`),
  CONSTRAINT `FK_TIMESHEE_EMPLOYEE_Time_Type` FOREIGN KEY (`Time_Type`) REFERENCES `categary` (`ID`),
  CONSTRAINT `FK_TIMESHEE_EMPLOYEE_UserInfo_ID` FOREIGN KEY (`UserInfo_ID`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timesheet
-- ----------------------------

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` varchar(20) DEFAULT NULL,
  `User_Name` varchar(30) DEFAULT NULL,
  `User_Ename` varchar(30) DEFAULT NULL COMMENT 'Ӣ',
  `User_Password` varchar(20) DEFAULT NULL,
  `User_Email` varchar(30) DEFAULT NULL,
  `User_JobTitle` int(11) DEFAULT NULL COMMENT 'JobTitle',
  `User_Status` int(11) DEFAULT NULL COMMENT '״̬',
  `User_SupNO` int(11) DEFAULT NULL,
  `User_TeamFlag` int(11) DEFAULT NULL,
  `User_CreateBy` int(11) DEFAULT NULL,
  `User_CreateTime` datetime DEFAULT NULL,
  `User_UpdateBy` int(11) DEFAULT NULL,
  `User_UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USERINFO_JOBTITLE_User_JobTitle` (`User_JobTitle`),
  CONSTRAINT `FK_USERINFO_JOBTITLE_User_JobTitle` FOREIGN KEY (`User_JobTitle`) REFERENCES `jobtitle` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'aaa', 'aaa', 'aaa', 'aaa', 'aaa@aaa.com', null, '1', null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for `userinfo_mid_role`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo_mid_role`;
CREATE TABLE `userinfo_mid_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Role_ID` int(11) DEFAULT NULL COMMENT '��ɫID',
  `UserInfo_ID` int(11) DEFAULT NULL COMMENT '�û�ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='�û��ͽ�ɫ�м��';

-- ----------------------------
-- Records of userinfo_mid_role
-- ----------------------------
INSERT INTO `userinfo_mid_role` VALUES ('1', '2', '1');
