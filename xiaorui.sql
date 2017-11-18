/*
Navicat MySQL Data Transfer

Source Server         : xiaorui
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : xiaorui

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-18 12:21:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category_
-- ----------------------------
DROP TABLE IF EXISTS `category_`;
CREATE TABLE `category_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_
-- ----------------------------
INSERT INTO `category_` VALUES ('10', 'category1');
INSERT INTO `category_` VALUES ('11', 'category2');
INSERT INTO `category_` VALUES ('12', 'category3');
INSERT INTO `category_` VALUES ('13', 'category4');
INSERT INTO `category_` VALUES ('14', 'category5');
INSERT INTO `category_` VALUES ('15', 'category6');
INSERT INTO `category_` VALUES ('16', 'category7');
INSERT INTO `category_` VALUES ('17', 'category8');
INSERT INTO `category_` VALUES ('18', 'category9');
INSERT INTO `category_` VALUES ('19', 'category10');
INSERT INTO `category_` VALUES ('20', 'category11');
INSERT INTO `category_` VALUES ('21', 'category12');
INSERT INTO `category_` VALUES ('22', 'category3');
INSERT INTO `category_` VALUES ('23', 'category4');
INSERT INTO `category_` VALUES ('24', 'category15');
INSERT INTO `category_` VALUES ('25', 'category16');
INSERT INTO `category_` VALUES ('26', 'category17');
INSERT INTO `category_` VALUES ('27', 'category18');
INSERT INTO `category_` VALUES ('28', 'category19');
INSERT INTO `category_` VALUES ('29', 'category20');
INSERT INTO `category_` VALUES ('30', 'category21');
INSERT INTO `category_` VALUES ('31', 'category22');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL,
  `fileUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', 'upload/fbbfd.png', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `password` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '肖锐', '123');
INSERT INTO `user` VALUES ('2', '肖锐2', '');
INSERT INTO `user` VALUES ('3', '肖锐3', '');
INSERT INTO `user` VALUES ('4', '肖锐4', '');
INSERT INTO `user` VALUES ('5', '肖锐5', '');
INSERT INTO `user` VALUES ('6', '肖锐6', '');
INSERT INTO `user` VALUES ('7', '肖锐7', '');
INSERT INTO `user` VALUES ('8', '肖锐8', '');
INSERT INTO `user` VALUES ('9', '肖锐9', '');
INSERT INTO `user` VALUES ('10', '肖锐10', '');
INSERT INTO `user` VALUES ('11', '肖锐11', '');
INSERT INTO `user` VALUES ('12', '肖锐12', '');
INSERT INTO `user` VALUES ('13', '肖锐13', '');
INSERT INTO `user` VALUES ('14', '肖锐14', '');
INSERT INTO `user` VALUES ('15', '肖锐15', '');
INSERT INTO `user` VALUES ('16', '肖锐16', '');
INSERT INTO `user` VALUES ('17', '肖锐17', '');
INSERT INTO `user` VALUES ('18', 'test', 'test');
INSERT INTO `user` VALUES ('19', 'Admin', '123456');
INSERT INTO `user` VALUES ('26', '1', '1');
INSERT INTO `user` VALUES ('27', '2', '2');
INSERT INTO `user` VALUES ('28', '3', '3');
INSERT INTO `user` VALUES ('29', '4', '4');
INSERT INTO `user` VALUES ('30', '5', '5');
INSERT INTO `user` VALUES ('31', '6', '6');
INSERT INTO `user` VALUES ('32', '7', '7');
INSERT INTO `user` VALUES ('33', '8', '8');
INSERT INTO `user` VALUES ('34', '11', '11');
INSERT INTO `user` VALUES ('35', '12', '12');

-- ----------------------------
-- Table structure for user_t
-- ----------------------------
DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_t
-- ----------------------------
INSERT INTO `user_t` VALUES ('1', '肖锐', '123456', '22');
