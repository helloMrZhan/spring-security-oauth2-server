/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : oauth2

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 23/10/2022 22:01:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '角色',
  `is_valid` tinyint(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (1, 'abc', '昵称st', '13888888888', 'abc@zjq.com', 'e10adc3949ba59abbe56e057f20f883e', '/abc', 'ROLE_USER', 1, '2020-11-06 16:17:52', '2020-11-06 16:17:55');
INSERT INTO `t_users` VALUES (2, 'test', 'test', '13666666666', NULL, 'e10adc3949ba59abbe56e057f20f883e', '/test', 'ROLE_USER', 1, '2020-11-12 12:01:13', '2020-11-12 12:01:13');
INSERT INTO `t_users` VALUES (3, 'test2', 'test2', '13666666667', NULL, 'e10adc3949ba59abbe56e057f20f883e', '/test2', 'ROLE_USER', 1, '2020-11-12 17:47:12', '2020-11-12 17:47:12');
INSERT INTO `t_users` VALUES (5, 'zjq', '共饮一杯无', '12311112222', NULL, 'e10adc3949ba59abbe56e057f20f883e', 'https://blog.csdn.net/qq_35427589?type=blog', 'ROLE_USER', 1, '2020-11-13 12:29:49', '2020-11-13 12:29:49');

SET FOREIGN_KEY_CHECKS = 1;
