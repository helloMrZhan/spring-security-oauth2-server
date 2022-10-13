/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.90.129
 Source Server Type    : MySQL
 Source Server Version : 50649
 Source Host           : 172.16.90.129:3306
 Source Schema         : zjd

 Target Server Type    : MySQL
 Target Server Version : 50649
 File Encoding         : 65001

 Date: 17/05/2022 18:21:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_generic_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_generic_api`;
CREATE TABLE `sys_generic_api`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0待定',
  `url` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'api地址',
  `extend` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展功能json',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0待定',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `used` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用者buildids',
  `operate_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名称',
  `operate_dept` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人部门',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'api' ROW_FORMAT = Compact;

INSERT INTO `sys_generic_api`(`id`, `name`, `type`, `url`, `extend`, `status`, `remark`, `used`, `operate_name`, `operate_dept`, `create_time`, `update_time`) VALUES (1, '动态新增', '2', '/api/generic/dynamicAdd', '', '0', 'buildId=4\notherParams={9:{\"deviceInstallStatus\":\"2\"}}\n说明：\nbuildId，一般页面上自带，页面配置id\notherParams，需要配置，9是sqlId, deviceInstallStatus是字段名，2是更新后的值', NULL, 'admin', '', '2022-05-26 11:02:55', '2022-05-27 09:46:51');
INSERT INTO `sys_generic_api`(`id`, `name`, `type`, `url`, `extend`, `status`, `remark`, `used`, `operate_name`, `operate_dept`, `create_time`, `update_time`) VALUES (2, '动态更新', '2', '/api/generic/dynamicUpdate', '', '0', 'buildId=4\notherParams={9:{\"deviceInstallStatus\":\"2\"}}\n说明：\nbuildId，一般页面上自带，页面配置id\notherParams，需要配置，9是sqlId, deviceInstallStatus是字段名，2是更新后的值', NULL, 'admin', '', '2022-05-26 11:03:08', '2022-05-27 09:46:42');
INSERT INTO `sys_generic_api`(`id`, `name`, `type`, `url`, `extend`, `status`, `remark`, `used`, `operate_name`, `operate_dept`, `create_time`, `update_time`) VALUES (3, '动态查询', '1', '/api/generic/dynamicQuery', '', '0', '?sqlId=23&queryParam={\"value\":\"id\",\"label\":\"nickName\"}&needOther=[{\"value\":\"nickName\",\"label\":\"installName\"}]\n说明：\n needOther的value是sql中的值，label是回显的值\n queryParam的value是隐藏但是保存在字段中的值，label是回显的值但不保存的值，保存的话需要配置needOther', NULL, 'admin', '', '2022-05-26 11:03:24', '2022-05-26 11:04:21');
INSERT INTO `sys_generic_api`(`id`, `name`, `type`, `url`, `extend`, `status`, `remark`, `used`, `operate_name`, `operate_dept`, `create_time`, `update_time`) VALUES (4, '初始化接口', '1', '/api/generic/initDetail', '', '0', '?buildId=3&params={8:{\"code\": \"${codes.SBBH!\'\'}\"}}\n说明\nbuildId，一般页面上自带，页面配置id\nparams，需要配置，8是sqlId, code是字段名，${codes.SSSG!\'\'}说明是用codes的SSSG来替换', NULL, 'admin', '', '2022-05-26 11:10:58', '2022-05-26 11:12:13');
INSERT INTO `sys_generic_api`(`id`, `name`, `type`, `url`, `extend`, `status`, `remark`, `used`, `operate_name`, `operate_dept`, `create_time`, `update_time`) VALUES (5, '简单更新', '2', '/api/generic/simpleUpdate', '', '0', 'sqlId=2\nstatus=2\n说明：\nsqlId对应sql管理的id\nstatus是其他要更新的参数', NULL, 'admin', '', '2022-05-27 09:46:18', '2022-05-27 13:42:53');

-- ----------------------------
-- Table structure for sys_generic_build
-- ----------------------------
DROP TABLE IF EXISTS `sys_generic_build`;
CREATE TABLE `sys_generic_build`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '数据id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视图名称，即菜单标题',
  `dis_column` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '视图中所有使用到的字段信息JSON',
  `dis_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面配置信息JSON',
  `dis_menu` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新增菜单时的参数',
  `template_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导入模板下载地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '类型',
  `extend` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展功能',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT 'ID',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0-待设计，1-已设计，2-已发布',
  `operate_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名称',
  `operate_dept` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人部门',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通用生成表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_generic_groovy
-- ----------------------------
DROP TABLE IF EXISTS `sys_generic_groovy`;
CREATE TABLE `sys_generic_groovy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0待定',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'groovy代码',
  `extend` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展功能json',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0待定',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `used` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用者buildids',
  `operate_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名称',
  `operate_dept` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人部门',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'groovy' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_generic_history
-- ----------------------------
DROP TABLE IF EXISTS `sys_generic_history`;
CREATE TABLE `sys_generic_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0待定',
  `op` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '操作',
  `old_str` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '旧数据',
  `new_str` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '新数据',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0待定',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `operate_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名称',
  `operate_dept` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人部门',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '历史记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_generic_screen
-- ----------------------------
DROP TABLE IF EXISTS `sys_generic_screen`;
CREATE TABLE `sys_generic_screen`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0待定',
  `dis_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面配置信息JSON',
  `dis_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据JSON',
  `extend` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展功能',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0 未发布，1 已发布',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `operate_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名称',
  `operate_dept` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人部门',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '大屏' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_generic_sql
-- ----------------------------
DROP TABLE IF EXISTS `sys_generic_sql`;
CREATE TABLE `sys_generic_sql`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '1:标准,2:其他',
  `tables` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'sql表',
  `fields` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段JSON',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '新增时输入的sql语句',
  `extend` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展功能json',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0待定',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `used` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用者，buildids,datavids',
  `operate_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名称',
  `operate_dept` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人部门',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'sql数据源' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
