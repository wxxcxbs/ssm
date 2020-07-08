/*
MySQL Data Transfer
Source Host: localhost
Source Database: cjsf
Target Host: localhost
Target Database: cjsf
Date: 20/07/01 10:56:46
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for user_info
-- ----------------------------
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(255) default NULL,
  `user_password` varchar(255) default NULL,
  `user_account` varchar(255) default NULL,
  `user_sex` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '张三', 'abc123', '10001', '1');
INSERT INTO `user_info` VALUES ('2', '李四', 'abc123', '10002', '2');
