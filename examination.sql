/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : examination

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 23/04/2019 00:09:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`classId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (10, '班级1');
INSERT INTO `classes` VALUES (11, '班级2');
INSERT INTO `classes` VALUES (12, '班级3');
INSERT INTO `classes` VALUES (13, '班级4');

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination`  (
  `examId` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科目',
  `examName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  `beginTime` datetime(0) DEFAULT NULL,
  `endTime` datetime(0) DEFAULT NULL COMMENT '考试时长',
  `classids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1-未开始 2-进行中 3-已考完',
  `createUser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`examId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES (1, '语文', '递四方速递', 7, '2019-04-09 00:00:00', '2019-04-10 00:00:00', '[\"12\"]', '3', '1');
INSERT INTO `examination` VALUES (2, '英语', '英语期末考试', 8, '2019-04-16 16:21:00', '2019-04-16 17:30:00', '[\"10\",\"11\"]', '3', '1');
INSERT INTO `examination` VALUES (6, '英语', '英语期末考试', 12, '2019-04-16 16:20:00', '2019-04-16 17:30:00', '[\"10\",\"11\"]', '3', '1');
INSERT INTO `examination` VALUES (7, '语文', '语文期末考试', 12, '2019-04-17 09:30:00', '2019-04-17 11:30:00', '[\"10\",\"11\"]', '3', '1');
INSERT INTO `examination` VALUES (8, '语文', '语文期末考试', 8, '2019-04-17 09:30:00', '2019-04-17 11:30:00', '[\"10\",\"11\"]', '3', '1');
INSERT INTO `examination` VALUES (9, '语文', '语文期末考试', 10, '2019-04-17 09:30:00', '2019-04-17 11:30:00', '[\"10\",\"11\"]', '3', '1');
INSERT INTO `examination` VALUES (10, '语文', '语文期末考试', 12, '2019-04-17 09:30:00', '2019-04-17 11:30:00', '[\"10\",\"11\"]', '3', '1');
INSERT INTO `examination` VALUES (11, '语文', '语文期末考试', 11, '2019-04-17 09:30:00', '2019-04-17 11:30:00', '[\"12\"]', '3', '1');
INSERT INTO `examination` VALUES (12, '语文', '语文期末考试', 12, '2019-04-17 09:30:00', '2019-04-17 11:30:00', '[\"12\"]', '3', '1');
INSERT INTO `examination` VALUES (15, '语文', '2019语文期末考', 12, '2019-04-21 10:25:56', '2019-04-21 20:00:00', '[\"10\"]', '3', '1');
INSERT INTO `examination` VALUES (16, '语文', '20190422', 15, '2019-04-22 12:00:00', '2019-04-22 12:20:00', '[\"10\"]', '3', '1');

-- ----------------------------
-- Table structure for examinationpaper
-- ----------------------------
DROP TABLE IF EXISTS `examinationpaper`;
CREATE TABLE `examinationpaper`  (
  `PaperID` int(20) NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `QuestionIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目id',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SAQIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SelectNum` int(10) DEFAULT NULL,
  `SAQNum` int(10) DEFAULT NULL,
  `Score` int(10) DEFAULT NULL,
  `Subject` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TotalSelect` int(10) DEFAULT NULL,
  `TotalSAQ` int(10) DEFAULT NULL,
  `SelectScore` int(10) DEFAULT NULL,
  `SAQScore` int(10) DEFAULT NULL,
  PRIMARY KEY (`PaperID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examinationpaper
-- ----------------------------
INSERT INTO `examinationpaper` VALUES (7, '1', '数学试卷', '5', 2, 2, 100, '语文', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `examinationpaper` VALUES (8, '1,6', '英语试卷', '5,6', 2, 2, NULL, '语文', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `examinationpaper` VALUES (10, '1,6', '语文试卷', '8,9', 3, 2, 100, '语文', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `examinationpaper` VALUES (11, '1,6,9', '物理考试', '5,13', 3, 2, 100, '语文', 'admin', NULL, NULL, NULL, NULL);
INSERT INTO `examinationpaper` VALUES (12, '1,11', '化学考试', '9,10,12', 2, 3, 100, '语文', 'admin', 3, 2, 20, 20);
INSERT INTO `examinationpaper` VALUES (13, '9,7,12,10', '201904语文考试', '6,11,5', 4, 3, 100, '语文', 'null', 4, 3, 10, 20);
INSERT INTO `examinationpaper` VALUES (14, '6,10,8,13', '20190422', '6,15', 4, 2, 100, '语文', 'admin', 4, 2, 20, 10);
INSERT INTO `examinationpaper` VALUES (15, '15,16,6,9,10', '20190422', '6,15', 5, 2, 100, '语文', 'admin', 6, 2, 10, 20);

-- ----------------------------
-- Table structure for saq
-- ----------------------------
DROP TABLE IF EXISTS `saq`;
CREATE TABLE `saq`  (
  `SAQID` int(20) NOT NULL AUTO_INCREMENT,
  `Question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Subject` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Chapter` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Difficulty` int(10) DEFAULT NULL COMMENT '1-	easy\r\n2-	normal\r\n3-	hard\r\n',
  `CreateUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Answer` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SAQID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of saq
-- ----------------------------
INSERT INTO `saq` VALUES (5, '2', '语文', '第二章', 1, 'admin', '是');
INSERT INTO `saq` VALUES (6, '3', '语文', '第一章', 1, '1', '3');
INSERT INTO `saq` VALUES (7, '4', '语文', '第二章', 1, '1', '4');
INSERT INTO `saq` VALUES (8, '判断题一', '语文', '第一章', 2, '1', '是');
INSERT INTO `saq` VALUES (9, '测试是否对', '语文', '第一章', 1, '1', '是');
INSERT INTO `saq` VALUES (10, '测试是否对2', '数学', '第二章', 3, '1', '否');
INSERT INTO `saq` VALUES (11, '测试是否对', '语文', '第一章', 1, '1', '是');
INSERT INTO `saq` VALUES (12, '测试是否对2', '数学', '第二章', 3, '1', '否');
INSERT INTO `saq` VALUES (13, '测试是否对', '语文', '第一章', 1, '1', '是');
INSERT INTO `saq` VALUES (14, '测试是否对2', '数学', '第二章', 3, '1', '否');
INSERT INTO `saq` VALUES (15, '判断题1', '语文', '第三章', 2, 'admin', '是');
INSERT INTO `saq` VALUES (16, '判断题2', '语文', '第二章', 3, 'admin', '否');
INSERT INTO `saq` VALUES (17, '判断1', '语文', '第二章', 2, 'admin', '是');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `examId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`paperId`, `userId`, `examId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (12, 12, 1, '0');
INSERT INTO `score` VALUES (15, 12, 2, '40');
INSERT INTO `score` VALUES (15, 12, 3, '60');
INSERT INTO `score` VALUES (10, 12, 14, '0');
INSERT INTO `score` VALUES (16, 15, 2, '20');

-- ----------------------------
-- Table structure for singleselect
-- ----------------------------
DROP TABLE IF EXISTS `singleselect`;
CREATE TABLE `singleselect`  (
  `QuestionID` int(20) NOT NULL AUTO_INCREMENT,
  `Question` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ChoiceOne` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ChoiceTwo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ChoiceThree` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ChoiceFour` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Answer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Subject` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Chapter` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Difficulty` int(10) NOT NULL COMMENT '1-easy  2-normal  3-hard',
  `CreateUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`QuestionID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of singleselect
-- ----------------------------
INSERT INTO `singleselect` VALUES (1, '例二', '选项一', '选项二', '选项三', '选项四', '选项一', '语文', '第一章', 1, '1');
INSERT INTO `singleselect` VALUES (4, '题目三', '选项一', '选项二', '选项三', '选项四', '选项一', '历史', '第一章', 2, '1');
INSERT INTO `singleselect` VALUES (6, '2', '1', '2', '3', '4', '2', '语文', '第三章', 2, '1');
INSERT INTO `singleselect` VALUES (7, '3', '1', '3', '2', '4', '3', '语文', '第二章', 1, '1');
INSERT INTO `singleselect` VALUES (8, '1', '1', '1', '1', '1', '1', '语文', '第二章', 2, '1');
INSERT INTO `singleselect` VALUES (9, '4', '1', '2', '3', '4', '2', '语文', '第三章', 1, '1');
INSERT INTO `singleselect` VALUES (10, '请选择', '12', '13', '14', '15', 'A', '语文', '第三章', 2, '1');
INSERT INTO `singleselect` VALUES (11, '请选择', 'retert87', 'ftretf', 'dsfasf', 'fewef', 'D', '英语', '第三章', 3, '1');
INSERT INTO `singleselect` VALUES (12, '选择题1', '1', '2', '3', '4', '2', '语文', '第二章', 1, 'admin');
INSERT INTO `singleselect` VALUES (13, '选择题2', '1', '2', '3', '4', '2', '语文', '第二章', 2, 'admin');
INSERT INTO `singleselect` VALUES (14, '选择3', '选项一', '选项二', '选项三', '选项四', '选项一', '语文', '第二章', 1, 'admin');
INSERT INTO `singleselect` VALUES (15, '选择123', '1', '2', '3', '4', '1', '语文', '第一章', 1, '1201901');
INSERT INTO `singleselect` VALUES (16, '选择2', '1', '2', '3', '4123', '1', '语文', '第一章', 1, 'admin');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `UserID` int(10) NOT NULL AUTO_INCREMENT,
  `UserCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '123456', '管理员', NULL);
INSERT INTO `user` VALUES (2, '201901', '李丽', '12345', '学生', 10);
INSERT INTO `user` VALUES (3, '201902', '李玲', '12345', '学生', 10);
INSERT INTO `user` VALUES (4, '1201901', '王敏', '12345', '教师', NULL);
INSERT INTO `user` VALUES (5, '1201902', '黄亮', '12345', '教师', NULL);
INSERT INTO `user` VALUES (14, '201904', '杨建军', '123456', '教师', NULL);
INSERT INTO `user` VALUES (18, '2201904', '王浩', 'Qw123456', '教师', NULL);
INSERT INTO `user` VALUES (41, '123456', '张三', '123456', '学生', 11);
INSERT INTO `user` VALUES (42, '201903', '王五', '4564', '学生', 12);
INSERT INTO `user` VALUES (44, '654123', '王五', '4564', '学生', 13);

-- ----------------------------
-- Table structure for user_answer
-- ----------------------------
DROP TABLE IF EXISTS `user_answer`;
CREATE TABLE `user_answer`  (
  `examId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userAnswer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isCorrrent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`questionId`, `userId`, `type`, `paperId`, `examId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_answer
-- ----------------------------
INSERT INTO `user_answer` VALUES (10, 12, 1, 1, '1', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (12, 12, 1, 1, '2', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 1, 2, '2', '选项一', '选项一', b'1');
INSERT INTO `user_answer` VALUES (15, 12, 1, 3, '2', '选项一', '选项一', b'1');
INSERT INTO `user_answer` VALUES (16, 15, 6, 1, '1', '是', '3', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 6, 1, '2', '2', '2', b'1');
INSERT INTO `user_answer` VALUES (16, 15, 6, 2, '1', '是', '3', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 6, 2, '2', '2', '2', b'1');
INSERT INTO `user_answer` VALUES (10, 12, 9, 1, '1', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (12, 12, 9, 1, '1', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (10, 12, 9, 1, '2', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 9, 1, '2', '1', '2', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 9, 2, '1', '是', '是', b'1');
INSERT INTO `user_answer` VALUES (16, 15, 9, 2, '2', '1', '2', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 9, 3, '1', '是', '是', b'1');
INSERT INTO `user_answer` VALUES (10, 12, 10, 1, '1', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (12, 12, 10, 1, '1', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 10, 1, '2', '13', 'A', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 10, 2, '1', '是', '否', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 10, 2, '2', '13', 'A', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 10, 3, '1', '否', '否', b'1');
INSERT INTO `user_answer` VALUES (10, 12, 11, 1, '2', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (12, 12, 11, 1, '2', 'dsf', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 11, 2, '2', 'ftretf', 'D', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 11, 3, '2', 'ftretf', 'D', b'0');
INSERT INTO `user_answer` VALUES (12, 12, 12, 1, '1', 'fvd', 'fvd', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 12, 2, '1', '是', '否', b'0');
INSERT INTO `user_answer` VALUES (15, 12, 12, 3, '1', '是', '否', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 15, 1, '1', '否', '是', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 15, 1, '2', '1', '1', b'1');
INSERT INTO `user_answer` VALUES (16, 15, 15, 2, '1', '否', '是', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 15, 2, '2', '1', '1', b'1');
INSERT INTO `user_answer` VALUES (16, 15, 16, 1, '2', '2', '1', b'0');
INSERT INTO `user_answer` VALUES (16, 15, 16, 2, '2', '2', '1', b'0');

-- ----------------------------
-- Procedure structure for set_exam_status
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_exam_status`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_exam_status`()
BEGIN
	update examination SET `status`='1' where beginTime> NOW();
	update examination SET `status`='2' where  NOW() BETWEEN beginTime and endTime;
	update examination SET `status`='3' where endTime < NOW();

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
