/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-17 17:10:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for handle_log
-- ----------------------------
DROP TABLE IF EXISTS `handle_log`;
CREATE TABLE `handle_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作用户',
  `route` varchar(50) NOT NULL COMMENT '路由地址',
  `msg` varchar(255) NOT NULL COMMENT '操作说明',
  `params` text COMMENT '请求参数',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL COMMENT '日志表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '部门名称',
  `remark` varchar(255) DEFAULT '' COMMENT '简单说明',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '用户管理', '管理后台用户', '2017-04-05 14:04:38', '2017-04-14 15:51:01');

-- ----------------------------
-- Table structure for role_rule
-- ----------------------------
DROP TABLE IF EXISTS `role_rule`;
CREATE TABLE `role_rule` (
  `role_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门权限菜单表';

-- ----------------------------
-- Records of role_rule
-- ----------------------------
INSERT INTO `role_rule` VALUES ('1', '1');
INSERT INTO `role_rule` VALUES ('1', '2');
INSERT INTO `role_rule` VALUES ('1', '3');
INSERT INTO `role_rule` VALUES ('1', '4');
INSERT INTO `role_rule` VALUES ('1', '5');
INSERT INTO `role_rule` VALUES ('1', '6');
INSERT INTO `role_rule` VALUES ('1', '8');
INSERT INTO `role_rule` VALUES ('1', '9');
INSERT INTO `role_rule` VALUES ('1', '10');
INSERT INTO `role_rule` VALUES ('1', '11');
INSERT INTO `role_rule` VALUES ('1', '14');
INSERT INTO `role_rule` VALUES ('1', '15');
INSERT INTO `role_rule` VALUES ('1', '16');
INSERT INTO `role_rule` VALUES ('1', '18');


-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单',
  `name` varchar(100) NOT NULL COMMENT 'url地址 c+a',
  `title` varchar(100) NOT NULL COMMENT '菜单名称',
  `islink` tinyint(5) NOT NULL DEFAULT '0' COMMENT '是否菜单',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员才有的权限 0 不是 1 是',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort` int(3) NOT NULL DEFAULT '255' COMMENT '排序',
  `isverify` tinyint(1) NOT NULL DEFAULT '1' COMMENT '需要验证: 0 不需要 1需要',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rulename` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='权限&菜单表';

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('1', '0', 'user', '用户管理', '1', '1', null, '6', '0', '1', '2017-03-31 16:04:04', '2017-03-31 16:04:06');
INSERT INTO `rule` VALUES ('2', '1', 'rule/index', '菜单权限', '1', '1', '', '3', '1', '2', '2017-04-01 15:35:35', '2017-04-01 15:35:35');
INSERT INTO `rule` VALUES ('3', '0', 'index/main', '首页面板', '1', '0', '', '1', '0', '1', '2017-04-01 15:48:18', '2017-04-01 17:41:22');
INSERT INTO `rule` VALUES ('4', '1', 'user/index', '用户列表', '1', '1', '', '1', '0', '2', '2017-04-01 15:59:42', '2017-04-01 15:59:42');
INSERT INTO `rule` VALUES ('5', '1', 'role/index', '用户分组', '1', '1', '', '2', '1', '2', '2017-04-01 16:03:43', '2017-04-01 16:03:43');
INSERT INTO `rule` VALUES ('6', '2', 'rule/add', '菜单添加', '0', '1', '', '1', '1', '3', '2017-04-01 16:31:52', '2017-04-01 17:04:11');
INSERT INTO `rule` VALUES ('7', '2', 'rule/edit', '修改菜单', '0', '1', '', '2', '1', '3', '2017-04-01 16:42:20', '2017-04-01 17:06:00');
INSERT INTO `rule` VALUES ('8', '0', 'personal', '个人中心', '1', '0', '', '7', '0', '1', '2017-04-01 17:07:00', '2017-04-01 17:41:39');
INSERT INTO `rule` VALUES ('9', '8', 'index/personal', '个人中心', '1', '0', '', '1', '0', '2', '2017-04-01 17:35:30', '2017-04-08 10:05:03');
INSERT INTO `rule` VALUES ('10', '8', 'index/logout', '退出', '1', '0', '', '3', '0', '2', '2017-04-01 17:36:31', '2017-04-12 17:41:09');
INSERT INTO `rule` VALUES ('11', '5', 'role/add', '添加分组', '0', '1', '', '1', '0', '3', '2017-04-06 09:59:33', '2017-04-06 10:54:05');
INSERT INTO `rule` VALUES ('12', '5', 'role/edit', '修改分组', '0', '1', '', '2', '0', '3', '2017-04-06 10:53:43', '2017-04-06 10:53:56');
INSERT INTO `rule` VALUES ('13', '5', 'role/destroy', '删除分组', '0', '1', '', '3', '0', '3', '2017-04-06 10:54:41', '2017-04-06 10:54:41');
INSERT INTO `rule` VALUES ('14', '4', 'user/allot', '分配用户权限', '0', '1', '', '5', '0', '3', '2017-04-08 09:49:49', '2017-04-08 09:49:49');
INSERT INTO `rule` VALUES ('15', '4', 'user/add', '添加用户', '0', '1', '', '2', '0', '3', '2017-04-08 09:51:40', '2017-04-08 09:51:40');
INSERT INTO `rule` VALUES ('16', '4', 'user/edit', '修改用户', '0', '1', '', '3', '0', '3', '2017-04-08 09:52:04', '2017-04-08 09:52:31');
INSERT INTO `rule` VALUES ('17', '4', 'user/status', '禁用用户', '0', '1', '', '5', '0', '3', '2017-04-08 09:55:44', '2017-04-08 09:55:44');
INSERT INTO `rule` VALUES ('18', '8', 'index/log', '操作日志', '1', '0', '', '2', '0', '2', '2017-04-12 17:40:07', '2017-04-12 17:41:26');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL COMMENT '登录邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `role` int(10) NOT NULL DEFAULT '0' COMMENT '角色 ：0为超级管理员，只能有一个超级管理员，并且超级管理员不可禁用',
  `manager` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否部门管理者 0 否 1是',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态 1 开启 0 关闭',
  `last_ip` varchar(255) DEFAULT NULL,
  `last_time` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin@admin.com', 'fcea920f7412b5da7be0cf42b8c93759', '0', '0', '超管', '18526232020', '1', '127.0.0.1', '2017-04-14 17:48:07', '2017-03-22 10:35:17', '2017-04-14 17:48:07');
-- ----------------------------
-- Table structure for user_rule
-- ----------------------------
DROP TABLE IF EXISTS `user_rule`;
CREATE TABLE `user_rule` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限菜单表';

