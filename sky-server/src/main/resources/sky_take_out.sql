/*
 Navicat Premium Dump SQL

 Source Server         : Local_MySQL
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : sky_take_out

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 02/12/2025 18:08:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1, 1001, '张三', '男', '13800138000', '110000', '北京市', '110100', '北京市', '110105', '朝阳区', '某某街道101号', '公司', 1);
INSERT INTO `address_book` VALUES (4, 1003, '王五', '女', '13800138002', '310000', '上海市', '310100', '上海市', '310105', '长宁区', '中山公园路88号', '家', 1);
INSERT INTO `address_book` VALUES (5, 1004, '赵六', '男', '13800138003', '440100', '广东省', '440100', '广州市', '440106', '天河区', '天河路385号', '公司', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int(11) NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (11, 1, '酒水饮料', 10, 1, '2022-06-09 22:09:18', '2022-06-09 22:09:18', 1, 1);
INSERT INTO `category` VALUES (12, 1, '传统主食', 9, 1, '2022-06-09 22:09:32', '2022-06-09 22:18:53', 1, 1);
INSERT INTO `category` VALUES (13, 2, '人气套餐', 12, 1, '2022-06-09 22:11:38', '2022-06-10 11:04:40', 1, 1);
INSERT INTO `category` VALUES (15, 2, '商务套餐', 13, 1, '2022-06-09 22:14:10', '2022-06-10 11:04:48', 1, 1);
INSERT INTO `category` VALUES (16, 1, '蜀味烤鱼', 4, 1, '2022-06-09 22:15:37', '2025-11-15 22:16:34', 1, 1);
INSERT INTO `category` VALUES (17, 1, '蜀味牛蛙', 5, 1, '2022-06-09 22:16:14', '2022-08-31 14:39:44', 1, 1);
INSERT INTO `category` VALUES (18, 1, '特色蒸菜', 6, 1, '2022-06-09 22:17:42', '2022-06-09 22:17:42', 1, 1);
INSERT INTO `category` VALUES (19, 1, '新鲜时蔬', 7, 1, '2022-06-09 22:18:12', '2022-06-09 22:18:28', 1, 1);
INSERT INTO `category` VALUES (20, 1, '水煮鱼', 8, 1, '2022-06-09 22:22:29', '2022-06-09 22:23:45', 1, 1);
INSERT INTO `category` VALUES (21, 1, '汤类', 11, 1, '2022-06-10 10:51:47', '2022-06-10 10:51:47', 1, 1);
INSERT INTO `category` VALUES (23, 2, '测试一', 17, 1, '2025-11-15 22:17:04', '2025-11-15 22:17:21', 1, 1);
INSERT INTO `category` VALUES (25, 1, '测试二', 16, 0, '2025-11-18 21:11:11', '2025-11-18 21:11:11', 1, 1);
INSERT INTO `category` VALUES (26, 1, '菜品分类测试一', 15, 0, '2025-11-18 21:32:32', '2025-11-18 21:32:32', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(11) NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (46, '王老吉', 11, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '', 1, '2022-06-09 22:40:47', '2022-06-09 22:40:47', 1, 1);
INSERT INTO `dish` VALUES (47, '北冰洋', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', '还是小时候的味道', 1, '2022-06-10 09:18:49', '2022-06-10 09:18:49', 1, 1);
INSERT INTO `dish` VALUES (48, '雪花啤酒', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', '', 1, '2022-06-10 09:22:54', '2022-06-10 09:22:54', 1, 1);
INSERT INTO `dish` VALUES (49, '米饭', 12, 2.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', '精选五常大米', 1, '2022-06-10 09:30:17', '2022-06-10 09:30:17', 1, 1);
INSERT INTO `dish` VALUES (50, '馒头', 12, 1.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', '优质面粉', 1, '2022-06-10 09:34:28', '2022-06-10 09:34:28', 1, 1);
INSERT INTO `dish` VALUES (51, '老坛酸菜鱼', 20, 56.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4a9cefba-6a74-467e-9fde-6e687ea725d7.png', '原料：汤，草鱼，酸菜', 1, '2022-06-10 09:40:51', '2022-06-10 09:40:51', 1, 1);
INSERT INTO `dish` VALUES (52, '经典酸菜鮰鱼', 20, 66.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', '原料：酸菜，江团，鮰鱼', 1, '2022-06-10 09:46:02', '2022-06-10 09:46:02', 1, 1);
INSERT INTO `dish` VALUES (53, '蜀味水煮草鱼', 20, 38.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', '原料：草鱼，汤', 1, '2022-06-10 09:48:37', '2022-06-10 09:48:37', 1, 1);
INSERT INTO `dish` VALUES (54, '清炒小油菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png', '原料：小油菜', 1, '2022-06-10 09:51:46', '2022-06-10 09:51:46', 1, 1);
INSERT INTO `dish` VALUES (55, '蒜蓉娃娃菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', '原料：蒜，娃娃菜', 1, '2022-06-10 09:53:37', '2022-06-10 09:53:37', 1, 1);
INSERT INTO `dish` VALUES (56, '清炒西兰花', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png', '原料：西兰花', 1, '2022-06-10 09:55:44', '2022-06-10 09:55:44', 1, 1);
INSERT INTO `dish` VALUES (57, '炝炒圆白菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png', '原料：圆白菜', 1, '2022-06-10 09:58:35', '2022-06-10 09:58:35', 1, 1);
INSERT INTO `dish` VALUES (58, '清蒸鲈鱼', 18, 98.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', '原料：鲈鱼', 1, '2022-06-10 10:12:28', '2022-06-10 10:12:28', 1, 1);
INSERT INTO `dish` VALUES (59, '东坡肘子', 18, 138.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', '原料：猪肘棒', 1, '2022-06-10 10:24:03', '2022-06-10 10:24:03', 1, 1);
INSERT INTO `dish` VALUES (60, '梅菜扣肉', 18, 58.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png', '原料：猪肉，梅菜', 1, '2022-06-10 10:26:03', '2022-06-10 10:26:03', 1, 1);
INSERT INTO `dish` VALUES (61, '剁椒鱼头', 18, 66.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', '原料：鲢鱼，剁椒', 1, '2022-06-10 10:28:54', '2022-06-10 10:28:54', 1, 1);
INSERT INTO `dish` VALUES (62, '金汤酸菜牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', '原料：鲜活牛蛙，酸菜', 1, '2022-06-10 10:33:05', '2022-06-10 10:33:05', 1, 1);
INSERT INTO `dish` VALUES (63, '香锅牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', '配料：鲜活牛蛙，莲藕，青笋', 1, '2022-06-10 10:35:40', '2022-06-10 10:35:40', 1, 1);
INSERT INTO `dish` VALUES (64, '馋嘴牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', '配料：鲜活牛蛙，丝瓜，黄豆芽', 1, '2022-06-10 10:37:52', '2022-06-10 10:37:52', 1, 1);
INSERT INTO `dish` VALUES (65, '草鱼2斤', 16, 68.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', '原料：草鱼，黄豆芽，莲藕', 1, '2022-06-10 10:41:08', '2022-06-10 10:41:08', 1, 1);
INSERT INTO `dish` VALUES (66, '江团鱼2斤', 16, 119.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', '配料：江团鱼，黄豆芽，莲藕', 1, '2022-06-10 10:42:42', '2022-06-10 10:42:42', 1, 1);
INSERT INTO `dish` VALUES (67, '鮰鱼2斤', 16, 72.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', '原料：鮰鱼，黄豆芽，莲藕', 1, '2022-06-10 10:43:56', '2022-06-10 10:43:56', 1, 1);
INSERT INTO `dish` VALUES (68, '鸡蛋汤', 21, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', '配料：鸡蛋，紫菜', 1, '2022-06-10 10:54:25', '2022-06-10 10:54:25', 1, 1);
INSERT INTO `dish` VALUES (69, '平菇豆腐汤', 21, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', '配料：豆腐，平菇', 1, '2022-06-10 10:55:02', '2022-06-10 10:55:02', 1, 1);
INSERT INTO `dish` VALUES (70, '特色蒸菜测试一', 18, 25.00, 'http://127.0.0.1:8080/upload/2025/11/18/59c78cab-b805-4dd8-9bcd-0bc824d534cd.png', '特色蒸菜测试一', 0, '2025-11-18 21:14:23', '2025-11-18 21:14:23', 1, 1);
INSERT INTO `dish` VALUES (76, '水煮鱼测试一', 20, 36.00, 'http://127.0.0.1:8080/upload/2025/11/19/17674f40-03c8-4874-9aeb-f40b673ae75c.png', '水煮鱼测试一', 1, '2025-11-19 19:43:23', '2025-11-29 09:54:56', 1, 1);
INSERT INTO `dish` VALUES (78, '水煮鱼测试三测', 20, 60.00, 'http://127.0.0.1:8080/upload/2025/11/19/dd9e2d44-cc6c-41dc-b413-33c6407c5870.png', '水煮鱼测试三测', 0, '2025-11-19 19:44:09', '2025-11-19 20:13:11', 1, 1);
INSERT INTO `dish` VALUES (79, '牛蛙测试一', 17, 33.00, 'http://127.0.0.1:8080/upload/2025/11/19/ccffe7d0-3898-4162-b6c5-342712062697.png', '牛蛙测试一', 0, '2025-11-19 20:14:17', '2025-11-19 20:14:26', 1, 1);
INSERT INTO `dish` VALUES (86, '特色蒸菜c', 18, 21.00, 'http://127.0.0.1:8080/upload/2025/11/20/4d04e610-31ee-4da1-917a-15d9deb9176e.png', '特色蒸菜c', 0, '2025-11-20 18:23:29', '2025-11-20 18:23:29', 1, 1);
INSERT INTO `dish` VALUES (87, 'ausd', 16, 11.00, 'http://127.0.0.1:8080/upload/2025/11/29/1b39e40e-3521-43b3-829f-b23cb57f4ad0.jpeg', '', 0, '2025-11-29 10:03:09', '2025-11-29 10:13:57', 1, 1);
INSERT INTO `dish` VALUES (88, 'asdasdasd', 18, 123.00, 'http://127.0.0.1:8080/upload/2025/11/29/dac2606b-4456-48d6-8c1d-cfa8f0818f34.jpg', '', 0, '2025-11-29 10:08:46', '2025-11-29 10:08:46', 1, 1);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint(20) NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (40, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (41, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (42, 7, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (45, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (46, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (47, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (48, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (49, 2, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (50, 4, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (51, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (52, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (86, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (87, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (88, 51, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (89, 51, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (92, 53, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (93, 53, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (94, 54, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (95, 56, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (96, 57, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (97, 60, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (101, 66, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (102, 67, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (103, 65, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (108, 76, '甜味', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (109, 76, '忌口', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (114, 78, '温度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (115, 78, '忌口', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (116, 78, '甜味', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (117, 78, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (119, 79, '温度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (123, 86, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (124, 86, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (125, 86, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (127, 88, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (129, 87, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);
INSERT INTO `employee` VALUES (2, '章小明', 'xiaoming', 'e10adc3949ba59abbe56e057f20f883e', '12345678921', '1', '123456789456123567', 1, '2025-11-14 19:40:28', '2025-11-14 19:40:28', 10, 10);
INSERT INTO `employee` VALUES (3, '测试1', 'test1', 'e10adc3949ba59abbe56e057f20f883e', '15586736490', '1', '420384200001124019', 1, '2025-11-14 19:44:58', '2025-11-15 22:03:24', 10, 1);
INSERT INTO `employee` VALUES (7, '测试2', 'test2', 'e10adc3949ba59abbe56e057f20f883e', '15586235364', '1', '420156225788555555', 1, '2025-11-14 20:07:20', '2025-11-14 20:07:20', 10, 10);
INSERT INTO `employee` VALUES (8, '测试3', 'test3', 'e10adc3949ba59abbe56e057f20f883e', '15526456354', '0', '526325655655556324', 1, '2025-11-14 20:09:28', '2025-11-14 20:09:28', 10, 10);
INSERT INTO `employee` VALUES (9, '测试4', 'test4', 'e10adc3949ba59abbe56e057f20f883e', '14525621111', '0', '202546558745654521', 1, '2025-11-14 20:13:59', '2025-11-16 12:44:00', 10, 1);
INSERT INTO `employee` VALUES (10, '测试5', 'test5', 'e10adc3949ba59abbe56e057f20f883e', '15586545400', '0', '202546555478848795', 1, '2025-11-14 20:14:58', '2025-11-15 22:05:05', 1, 1);
INSERT INTO `employee` VALUES (11, '测试6', 'test6', 'e10adc3949ba59abbe56e057f20f883e', '15523569511', '1', '420546855655475216', 1, '2025-11-15 21:16:28', '2025-11-16 13:11:25', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (5, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 5, 65, NULL, '微辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (6, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 6, 62, NULL, '中辣', 1, 88.00);
INSERT INTO `order_detail` VALUES (7, '馒头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', 6, 50, NULL, '', 2, 2.00);
INSERT INTO `order_detail` VALUES (8, '北冰洋', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', 6, 47, NULL, '', 1, 4.00);
INSERT INTO `order_detail` VALUES (9, '套餐六', 'http://127.0.0.1:8080/upload/2025/11/20/b6dcbc17-9bf2-4eee-a16f-be27cbe872e9.png', 7, NULL, 36, '', 1, 212.00);
INSERT INTO `order_detail` VALUES (10, '经典酸菜鮰鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', 8, 52, NULL, '微辣', 1, 66.00);
INSERT INTO `order_detail` VALUES (11, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 8, 55, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (12, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 9, 48, NULL, '', 2, 8.00);
INSERT INTO `order_detail` VALUES (13, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 9, 49, NULL, '', 2, 4.00);
INSERT INTO `order_detail` VALUES (14, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 10, 53, NULL, '中辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (15, '平菇豆腐汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', 10, 69, NULL, '', 1, 6.00);
INSERT INTO `order_detail` VALUES (16, '套餐一', 'http://127.0.0.1:8080/upload/2025/11/20/22284f2c-de8d-4da9-b5c8-921107eb1ec7.png', 11, NULL, 33, '', 1, 222.00);
INSERT INTO `order_detail` VALUES (17, '馒头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', 11, 50, NULL, '', 1, 3.00);
INSERT INTO `order_detail` VALUES (18, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 12, 58, NULL, '', 1, 98.00);
INSERT INTO `order_detail` VALUES (19, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 12, 46, NULL, '少糖', 2, 12.00);
INSERT INTO `order_detail` VALUES (20, '经典酸菜鮰鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', 13, 52, NULL, '不辣', 1, 66.00);
INSERT INTO `order_detail` VALUES (21, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 14, 53, NULL, '中辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (22, '套餐一', 'http://127.0.0.1:8080/upload/2025/11/20/22284f2c-de8d-4da9-b5c8-921107eb1ec7.png', 15, NULL, 33, '', 1, 222.00);
INSERT INTO `order_detail` VALUES (23, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 16, 58, NULL, '', 1, 98.00);
INSERT INTO `order_detail` VALUES (24, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 16, 46, NULL, '少糖', 2, 12.00);
INSERT INTO `order_detail` VALUES (25, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 17, 58, NULL, '不辣', 1, 98.00);
INSERT INTO `order_detail` VALUES (26, '经典酸菜鮰鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', 18, 52, NULL, '微辣', 1, 66.00);
INSERT INTO `order_detail` VALUES (27, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 19, 53, NULL, '中辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (28, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 20, 55, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (29, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 21, 48, NULL, '', 2, 8.00);
INSERT INTO `order_detail` VALUES (30, '套餐一', 'http://127.0.0.1:8080/upload/2025/11/20/22284f2c-de8d-4da9-b5c8-921107eb1ec7.png', 22, NULL, 33, '', 1, 222.00);
INSERT INTO `order_detail` VALUES (31, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 23, 58, NULL, '', 1, 98.00);
INSERT INTO `order_detail` VALUES (32, '经典酸菜鮰鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', 24, 52, NULL, '微辣', 1, 66.00);
INSERT INTO `order_detail` VALUES (33, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 25, 53, NULL, '中辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (34, '平菇豆腐汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', 25, 69, NULL, '', 1, 6.00);
INSERT INTO `order_detail` VALUES (35, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 26, 58, NULL, '', 1, 98.00);
INSERT INTO `order_detail` VALUES (36, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 26, 46, NULL, '少糖', 2, 12.00);
INSERT INTO `order_detail` VALUES (37, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 27, 53, NULL, '中辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (38, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 28, 61, NULL, '中辣', 1, 66.00);
INSERT INTO `order_detail` VALUES (39, '梅菜扣肉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png', 28, 60, NULL, '', 1, 58.00);
INSERT INTO `order_detail` VALUES (40, '香锅牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', 29, 63, NULL, '微辣', 1, 88.00);
INSERT INTO `order_detail` VALUES (41, '清炒西兰花', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png', 29, 56, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (42, '家庭套餐', 'http://127.0.0.1:8080/upload/2025/12/02/family_set.png', 30, NULL, 37, '', 1, 399.00);
INSERT INTO `order_detail` VALUES (43, '鸡蛋汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', 30, 68, NULL, '', 1, 4.00);
INSERT INTO `order_detail` VALUES (44, '商务套餐升级版', 'http://127.0.0.1:8080/upload/2025/12/02/business_set.png', 31, NULL, 38, '', 1, 299.00);
INSERT INTO `order_detail` VALUES (45, '炝炒圆白菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png', 31, 57, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (46, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 32, 67, NULL, '重辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (47, '北冰洋', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', 32, 47, NULL, '', 2, 8.00);
INSERT INTO `order_detail` VALUES (48, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 33, 62, NULL, '不辣', 1, 88.00);
INSERT INTO `order_detail` VALUES (49, '套餐六', 'http://127.0.0.1:8080/upload/2025/11/20/b6dcbc17-9bf2-4eee-a16f-be27cbe872e9.png', 34, NULL, 36, '', 1, 212.00);
INSERT INTO `order_detail` VALUES (50, '馒头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', 34, 50, NULL, '', 2, 2.00);
INSERT INTO `order_detail` VALUES (51, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 35, 59, NULL, '', 1, 138.00);
INSERT INTO `order_detail` VALUES (52, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 35, 46, NULL, '无糖', 2, 12.00);
INSERT INTO `order_detail` VALUES (53, '清炒小油菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png', 36, 54, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (54, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 36, 65, NULL, '微辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (55, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 37, 55, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (56, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 37, 48, NULL, '', 3, 12.00);
INSERT INTO `order_detail` VALUES (57, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 38, 62, NULL, '不辣', 1, 88.00);
INSERT INTO `order_detail` VALUES (58, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 38, 49, NULL, '', 3, 6.00);
INSERT INTO `order_detail` VALUES (59, '套餐六', 'http://127.0.0.1:8080/upload/2025/11/20/b6dcbc17-9bf2-4eee-a16f-be27cbe872e9.png', 39, NULL, 36, '', 1, 212.00);
INSERT INTO `order_detail` VALUES (60, '馒头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', 39, 50, NULL, '', 2, 2.00);
INSERT INTO `order_detail` VALUES (61, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 40, 59, NULL, '', 1, 138.00);
INSERT INTO `order_detail` VALUES (62, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 40, 46, NULL, '无糖', 2, 12.00);
INSERT INTO `order_detail` VALUES (63, '清炒小油菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png', 41, 54, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (64, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 41, 65, NULL, '微辣', 1, 68.00);
INSERT INTO `order_detail` VALUES (65, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 42, 55, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (66, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 42, 48, NULL, '', 3, 12.00);
INSERT INTO `order_detail` VALUES (67, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 43, 61, NULL, '中辣', 1, 66.00);
INSERT INTO `order_detail` VALUES (68, '梅菜扣肉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png', 43, 60, NULL, '', 1, 58.00);
INSERT INTO `order_detail` VALUES (69, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 44, 67, NULL, '重辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (70, '北冰洋', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', 44, 47, NULL, '', 2, 8.00);
INSERT INTO `order_detail` VALUES (71, '清炒西兰花', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png', 45, 56, NULL, '', 1, 18.00);
INSERT INTO `order_detail` VALUES (72, '香锅牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', 45, 63, NULL, '微辣', 1, 88.00);
INSERT INTO `order_detail` VALUES (73, '鸡蛋汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', 46, 68, NULL, '', 1, 4.00);
INSERT INTO `order_detail` VALUES (74, '家庭套餐', 'http://127.0.0.1:8080/upload/2025/12/02/family_set.png', 46, NULL, 37, '', 1, 399.00);
INSERT INTO `order_detail` VALUES (75, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 47, 65, NULL, '微辣', 1, 68.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(20) NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int(11) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int(11) NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int(11) NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, 'ORDER20231201001', 6, 1001, 2001, '2023-12-01 12:00:00', '2023-12-01 12:05:00', 1, 1, 99.90, '请尽快配送', '13800138000', '北京市朝阳区某某街道101号', NULL, '张三', '订单超时，自动取消', NULL, '2025-12-02 13:25:55', '2023-12-01 13:00:00', 0, NULL, 2, 1, 1);
INSERT INTO `orders` VALUES (5, 'ORDER20251202001', 5, 1001, 1, '2025-12-02 13:00:00', '2025-12-02 13:30:00', 1, 1, 68.00, '尽快配送', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-12-02 14:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (6, 'ORDER20251202002', 4, 1003, 5, '2025-12-02 14:00:00', NULL, 2, 1, 100.00, '', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-12-02 14:30:00', 1, NULL, 3, 3, 1);
INSERT INTO `orders` VALUES (7, 'ORDER20251202003', 3, 1004, 6, '2025-12-02 15:00:00', NULL, 1, 1, 212.00, '餐具多带一份', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-12-02 15:30:00', 0, NULL, 5, 4, 0);
INSERT INTO `orders` VALUES (8, 'ORDER20251125001', 5, 1001, 1, '2025-11-25 09:10:00', '2025-11-25 09:40:00', 1, 1, 84.00, '尽快', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-11-25 10:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (9, 'ORDER20251125002', 5, 1002, 2, '2025-11-25 12:10:00', '2025-11-25 12:40:00', 2, 1, 12.00, '', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-11-25 13:00:00', 1, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (10, 'ORDER20251126001', 5, 1003, 5, '2025-11-26 10:00:00', '2025-11-26 10:30:00', 1, 1, 44.00, '不要香菜', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-11-26 11:00:00', 1, NULL, 1, 1, 1);
INSERT INTO `orders` VALUES (11, 'ORDER20251126002', 5, 1004, 6, '2025-11-26 18:00:00', '2025-11-26 18:30:00', 1, 1, 225.00, '餐具多带', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-11-26 19:00:00', 1, NULL, 3, 4, 0);
INSERT INTO `orders` VALUES (12, 'ORDER20251127001', 4, 1001, 1, '2025-11-27 11:00:00', NULL, 1, 1, 110.00, '', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-11-27 11:30:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (13, 'ORDER20251127002', 3, 1002, 2, '2025-11-27 14:00:00', NULL, 2, 1, 66.00, '开发票', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-11-27 14:30:00', 0, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (14, 'ORDER20251128001', 5, 1003, 5, '2025-11-28 09:00:00', '2025-11-28 09:30:00', 1, 1, 38.00, '', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-11-28 10:00:00', 1, NULL, 1, 1, 1);
INSERT INTO `orders` VALUES (15, 'ORDER20251128002', 5, 1004, 6, '2025-11-28 12:00:00', '2025-11-28 12:30:00', 1, 1, 222.00, '加急', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-11-28 13:00:00', 1, NULL, 3, 3, 0);
INSERT INTO `orders` VALUES (16, 'ORDER20251129001', 5, 1001, 1, '2025-11-29 17:10:00', '2025-11-29 17:40:00', 1, 1, 110.00, '', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-11-29 18:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (17, 'ORDER20251129002', 4, 1002, 2, '2025-11-29 19:00:00', NULL, 2, 1, 98.00, '不要辣', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-11-29 19:30:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (18, 'ORDER20251130001', 5, 1003, 5, '2025-11-30 10:00:00', '2025-11-30 10:30:00', 1, 1, 66.00, '', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-11-30 11:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (19, 'ORDER20251130002', 5, 1004, 6, '2025-11-30 16:00:00', '2025-11-30 16:30:00', 1, 1, 38.00, '开发票', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-11-30 17:00:00', 1, NULL, 1, 1, 1);
INSERT INTO `orders` VALUES (20, 'ORDER20251201001', 3, 1001, 1, '2025-12-01 09:00:00', NULL, 1, 1, 18.00, '', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-12-01 09:30:00', 1, NULL, 1, 1, 1);
INSERT INTO `orders` VALUES (21, 'ORDER20251201002', 5, 1002, 2, '2025-12-01 12:00:00', '2025-12-01 12:30:00', 2, 1, 8.00, '', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-12-01 13:00:00', 1, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (22, 'ORDER20251201003', 4, 1003, 5, '2025-12-01 15:00:00', NULL, 1, 1, 222.00, '加急', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-12-01 15:30:00', 1, NULL, 3, 4, 0);
INSERT INTO `orders` VALUES (23, 'ORDER20251202004', 5, 1004, 6, '2025-12-02 08:00:00', '2025-12-02 08:30:00', 1, 1, 98.00, '', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-12-02 09:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (24, 'ORDER20251202005', 5, 1001, 1, '2025-12-02 10:00:00', '2025-12-02 10:30:00', 1, 1, 66.00, '不要蒜', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-12-02 11:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (25, 'ORDER20251202006', 3, 1002, 2, '2025-12-02 11:00:00', NULL, 2, 1, 44.00, '', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-12-02 11:30:00', 0, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (26, 'ORDER20251202007', 4, 1003, 5, '2025-12-02 14:00:00', NULL, 1, 1, 110.00, '开发票', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-12-02 14:30:00', 1, NULL, 2, 2, 0);
INSERT INTO `orders` VALUES (27, 'ORDER20251202008', 5, 1004, 6, '2025-12-02 16:00:00', '2025-12-02 16:30:00', 1, 1, 38.00, '', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-12-02 17:00:00', 1, NULL, 1, 1, 1);
INSERT INTO `orders` VALUES (28, 'ORDER20251115001', 5, 1001, 1, '2025-11-15 18:10:00', '2025-11-15 18:40:00', 1, 1, 124.00, '不要香菜', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-11-15 19:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (29, 'ORDER20251115002', 5, 1002, 2, '2025-11-15 19:00:00', '2025-11-15 19:30:00', 2, 1, 106.00, '', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-11-15 20:00:00', 1, NULL, 2, 3, 1);
INSERT INTO `orders` VALUES (30, 'ORDER20251116001', 5, 1003, 5, '2025-11-16 12:10:00', '2025-11-16 12:40:00', 1, 1, 106.00, '', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-11-16 13:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (31, 'ORDER20251116002', 4, 1004, 6, '2025-11-16 18:00:00', NULL, 1, 1, 317.00, '加急', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-11-16 18:30:00', 1, NULL, 3, 4, 0);
INSERT INTO `orders` VALUES (32, 'ORDER20251117001', 5, 1001, 1, '2025-11-17 11:00:00', '2025-11-17 11:30:00', 1, 1, 403.00, '开发票', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-11-17 12:00:00', 1, NULL, 4, 4, 0);
INSERT INTO `orders` VALUES (33, 'ORDER20251117002', 3, 1002, 2, '2025-11-17 14:00:00', NULL, 2, 1, 80.00, '', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-11-17 14:30:00', 0, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (34, 'ORDER20251118001', 5, 1003, 5, '2025-11-18 17:10:00', '2025-11-18 17:40:00', 1, 1, 317.00, '', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-11-18 18:00:00', 1, NULL, 3, 3, 0);
INSERT INTO `orders` VALUES (35, 'ORDER20251118002', 5, 1004, 6, '2025-11-18 19:00:00', '2025-11-18 19:30:00', 1, 1, 80.00, '不要辣', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-11-18 20:00:00', 1, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (36, 'ORDER20251119001', 5, 1001, 1, '2025-11-19 10:10:00', '2025-11-19 10:40:00', 1, 1, 80.00, '', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-11-19 11:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (37, 'ORDER20251119002', 4, 1002, 2, '2025-11-19 18:00:00', NULL, 2, 1, 94.00, '尽快', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-11-19 18:30:00', 1, NULL, 2, 3, 1);
INSERT INTO `orders` VALUES (38, 'ORDER20251120001', 5, 1003, 5, '2025-11-20 18:10:00', '2025-11-20 18:40:00', 1, 1, 94.00, '', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-11-20 19:00:00', 1, NULL, 2, 3, 1);
INSERT INTO `orders` VALUES (39, 'ORDER20251120002', 5, 1004, 6, '2025-11-20 20:00:00', '2025-11-20 20:30:00', 1, 1, 214.00, '餐具多带', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-11-20 21:00:00', 1, NULL, 3, 4, 0);
INSERT INTO `orders` VALUES (40, 'ORDER20251121001', 3, 1001, 1, '2025-11-21 12:10:00', NULL, 1, 1, 86.00, '', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-11-21 12:30:00', 1, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (41, 'ORDER20251121002', 5, 1002, 2, '2025-11-21 15:00:00', '2025-11-21 15:30:00', 2, 1, 150.00, '开发票', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-11-21 16:00:00', 1, NULL, 2, 2, 0);
INSERT INTO `orders` VALUES (42, 'ORDER20251122001', 5, 1003, 5, '2025-11-22 19:10:00', '2025-11-22 19:40:00', 1, 1, 150.00, '', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-11-22 20:00:00', 1, NULL, 2, 2, 0);
INSERT INTO `orders` VALUES (43, 'ORDER20251122002', 4, 1004, 6, '2025-11-22 21:00:00', NULL, 1, 1, 86.00, '加急', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-11-22 21:30:00', 1, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (44, 'ORDER20251123001', 5, 1001, 1, '2025-11-23 11:10:00', '2025-11-23 11:40:00', 1, 1, 86.00, '', '13800138000', '北京市朝阳区某某街道101号', '张三', '张三', NULL, NULL, NULL, '2025-11-23 12:00:00', 1, NULL, 2, 2, 1);
INSERT INTO `orders` VALUES (45, 'ORDER20251123002', 5, 1002, 2, '2025-11-23 18:00:00', '2025-11-23 18:30:00', 2, 1, 30.00, '不要蒜', '13800138001', '北京市海淀区中关村大街1号', '李四', '李四', NULL, NULL, NULL, '2025-11-23 19:00:00', 1, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (46, 'ORDER20251124001', 3, 1003, 5, '2025-11-24 17:10:00', NULL, 1, 1, 30.00, '', '13800138002', '上海市长宁区中山公园路88号', '王五', '王五', NULL, NULL, NULL, '2025-11-24 17:30:00', 1, NULL, 1, 2, 1);
INSERT INTO `orders` VALUES (47, 'ORDER20251124002', 5, 1004, 6, '2025-11-24 19:00:00', '2025-11-24 19:30:00', 1, 1, 68.00, '', '13800138003', '广州市天河区天河路385号', '赵六', '赵六', NULL, NULL, NULL, '2025-11-24 20:00:00', 1, NULL, 2, 2, 1);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int(11) NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (33, 13, '套餐一', 222.00, 0, '', 'http://127.0.0.1:8080/upload/2025/11/20/22284f2c-de8d-4da9-b5c8-921107eb1ec7.png', '2025-11-20 19:26:07', '2025-11-20 19:26:07', 1, 1);
INSERT INTO `setmeal` VALUES (34, 13, '套餐二', 222.00, 0, '', 'http://127.0.0.1:8080/upload/2025/11/20/f8963e05-d8b6-4a43-b1d5-aee1a651eee4.png', '2025-11-20 19:26:25', '2025-11-20 19:26:25', 1, 1);
INSERT INTO `setmeal` VALUES (35, 13, '套餐三', 2323.00, 0, '', 'http://127.0.0.1:8080/upload/2025/11/20/76b61cc7-d3f2-460c-b2a1-bb5329607dd0.png', '2025-11-20 19:26:55', '2025-11-29 09:55:06', 1, 1);
INSERT INTO `setmeal` VALUES (36, 13, '套餐六', 212.00, 1, '', 'http://127.0.0.1:8080/upload/2025/11/20/b6dcbc17-9bf2-4eee-a16f-be27cbe872e9.png', '2025-11-20 19:27:23', '2025-11-20 19:47:30', 1, 1);
INSERT INTO `setmeal` VALUES (37, 13, '家庭套餐', 399.00, 1, '适合3-4人食用', 'http://127.0.0.1:8080/upload/2025/12/02/family_set.png', '2025-12-02 12:00:00', '2025-12-02 12:00:00', 1, 1);
INSERT INTO `setmeal` VALUES (38, 15, '商务套餐升级版', 299.00, 1, '商务宴请优选', 'http://127.0.0.1:8080/upload/2025/12/02/business_set.png', '2025-12-02 12:10:00', '2025-12-02 12:10:00', 1, 1);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int(11) NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (51, 33, 65, '草鱼2斤', 68.00, 1);
INSERT INTO `setmeal_dish` VALUES (52, 33, 66, '江团鱼2斤', 119.00, 1);
INSERT INTO `setmeal_dish` VALUES (53, 33, 67, '鮰鱼2斤', 72.00, 1);
INSERT INTO `setmeal_dish` VALUES (54, 34, 62, '金汤酸菜牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (55, 34, 63, '香锅牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (56, 34, 53, '蜀味水煮草鱼', 38.00, 1);
INSERT INTO `setmeal_dish` VALUES (57, 34, 51, '老坛酸菜鱼', 56.00, 1);
INSERT INTO `setmeal_dish` VALUES (58, 34, 52, '经典酸菜鮰鱼', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (59, 35, 68, '鸡蛋汤', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (60, 35, 69, '平菇豆腐汤', 6.00, 1);
INSERT INTO `setmeal_dish` VALUES (61, 35, 48, '雪花啤酒', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (62, 35, 47, '北冰洋', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (63, 35, 46, '王老吉', 6.00, 1);
INSERT INTO `setmeal_dish` VALUES (64, 35, 50, '馒头', 1.00, 1);
INSERT INTO `setmeal_dish` VALUES (65, 35, 49, '米饭', 2.00, 1);
INSERT INTO `setmeal_dish` VALUES (66, 35, 54, '清炒小油菜', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (67, 35, 55, '蒜蓉娃娃菜', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (68, 35, 56, '清炒西兰花', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (69, 35, 57, '炝炒圆白菜', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (70, 35, 58, '清蒸鲈鱼', 98.00, 1);
INSERT INTO `setmeal_dish` VALUES (71, 35, 59, '东坡肘子', 138.00, 1);
INSERT INTO `setmeal_dish` VALUES (72, 35, 60, '梅菜扣肉', 58.00, 1);
INSERT INTO `setmeal_dish` VALUES (73, 35, 61, '剁椒鱼头', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (74, 35, 52, '经典酸菜鮰鱼', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (75, 35, 51, '老坛酸菜鱼', 56.00, 1);
INSERT INTO `setmeal_dish` VALUES (76, 35, 53, '蜀味水煮草鱼', 38.00, 1);
INSERT INTO `setmeal_dish` VALUES (77, 35, 63, '香锅牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (78, 35, 62, '金汤酸菜牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (119, 36, 62, '金汤酸菜牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (120, 36, 63, '香锅牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (121, 36, 53, '蜀味水煮草鱼', 38.00, 1);
INSERT INTO `setmeal_dish` VALUES (122, 36, 51, '老坛酸菜鱼', 56.00, 1);
INSERT INTO `setmeal_dish` VALUES (123, 36, 52, '经典酸菜鮰鱼', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (124, 36, 61, '剁椒鱼头', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (125, 36, 60, '梅菜扣肉', 58.00, 1);
INSERT INTO `setmeal_dish` VALUES (126, 36, 59, '东坡肘子', 138.00, 1);
INSERT INTO `setmeal_dish` VALUES (127, 36, 58, '清蒸鲈鱼', 98.00, 1);
INSERT INTO `setmeal_dish` VALUES (128, 36, 57, '炝炒圆白菜', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (129, 36, 56, '清炒西兰花', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (130, 36, 54, '清炒小油菜', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (131, 36, 49, '米饭', 2.00, 1);
INSERT INTO `setmeal_dish` VALUES (132, 36, 50, '馒头', 1.00, 1);
INSERT INTO `setmeal_dish` VALUES (133, 36, 46, '王老吉', 6.00, 1);
INSERT INTO `setmeal_dish` VALUES (134, 36, 47, '北冰洋', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (135, 36, 48, '雪花啤酒', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (136, 36, 69, '平菇豆腐汤', 6.00, 1);
INSERT INTO `setmeal_dish` VALUES (137, 36, 68, '鸡蛋汤', 4.00, 1);
INSERT INTO `setmeal_dish` VALUES (138, 37, 51, '老坛酸菜鱼', 56.00, 1);
INSERT INTO `setmeal_dish` VALUES (139, 37, 54, '清炒小油菜', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (140, 37, 49, '米饭', 2.00, 3);
INSERT INTO `setmeal_dish` VALUES (141, 37, 46, '王老吉', 6.00, 3);
INSERT INTO `setmeal_dish` VALUES (142, 38, 62, '金汤酸菜牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (143, 38, 58, '清蒸鲈鱼', 98.00, 1);
INSERT INTO `setmeal_dish` VALUES (144, 38, 68, '鸡蛋汤', 4.00, 2);
INSERT INTO `setmeal_dish` VALUES (145, 38, 49, '米饭', 2.00, 2);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (1, '1', '1', 1, 1, 1, '1', 1, 1.00, '2025-11-05 12:29:58');
INSERT INTO `shopping_cart` VALUES (9, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 1001, 46, NULL, '无糖', 2, 12.00, '2025-12-02 11:00:00');
INSERT INTO `shopping_cart` VALUES (10, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 1002, 49, NULL, '', 1, 2.00, '2025-12-02 11:10:00');
INSERT INTO `shopping_cart` VALUES (11, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 1003, 62, NULL, '微辣', 1, 88.00, '2025-12-02 11:20:00');
INSERT INTO `shopping_cart` VALUES (12, '套餐六', 'http://127.0.0.1:8080/upload/2025/11/20/b6dcbc17-9bf2-4eee-a16f-be27cbe872e9.png', 1004, NULL, 36, '', 1, 212.00, '2025-12-02 11:30:00');
INSERT INTO `shopping_cart` VALUES (13, '经典酸菜鮰鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/5260ff39-986c-4a97-8850-2ec8c7583efc.png', 1001, 52, NULL, '微辣', 1, 66.00, '2025-11-25 09:00:00');
INSERT INTO `shopping_cart` VALUES (14, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 1001, 55, NULL, '', 1, 18.00, '2025-11-25 09:05:00');
INSERT INTO `shopping_cart` VALUES (15, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 1002, 48, NULL, '', 2, 8.00, '2025-11-26 12:00:00');
INSERT INTO `shopping_cart` VALUES (16, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 1002, 49, NULL, '', 2, 4.00, '2025-11-26 12:05:00');
INSERT INTO `shopping_cart` VALUES (17, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 1003, 53, NULL, '中辣', 1, 38.00, '2025-11-27 18:00:00');
INSERT INTO `shopping_cart` VALUES (18, '平菇豆腐汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', 1003, 69, NULL, '', 1, 6.00, '2025-11-27 18:10:00');
INSERT INTO `shopping_cart` VALUES (19, '套餐一', 'http://127.0.0.1:8080/upload/2025/11/20/22284f2c-de8d-4da9-b5c8-921107eb1ec7.png', 1004, NULL, 33, '', 1, 222.00, '2025-11-28 11:00:00');
INSERT INTO `shopping_cart` VALUES (20, '馒头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', 1004, 50, NULL, '', 3, 3.00, '2025-11-28 11:05:00');
INSERT INTO `shopping_cart` VALUES (21, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 1001, 58, NULL, '', 1, 98.00, '2025-11-29 17:00:00');
INSERT INTO `shopping_cart` VALUES (22, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 1001, 46, NULL, '少糖', 2, 12.00, '2025-11-29 17:05:00');
INSERT INTO `shopping_cart` VALUES (23, '剁椒鱼头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', 1001, 61, NULL, '中辣', 1, 66.00, '2025-11-15 18:00:00');
INSERT INTO `shopping_cart` VALUES (24, '梅菜扣肉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/6080b118-e30a-4577-aab4-45042e3f88be.png', 1001, 60, NULL, '', 1, 58.00, '2025-11-15 18:05:00');
INSERT INTO `shopping_cart` VALUES (25, '香锅牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/f5ac8455-4793-450c-97ba-173795c34626.png', 1002, 63, NULL, '微辣', 1, 88.00, '2025-11-16 12:00:00');
INSERT INTO `shopping_cart` VALUES (26, '清炒西兰花', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png', 1002, 56, NULL, '', 1, 18.00, '2025-11-16 12:05:00');
INSERT INTO `shopping_cart` VALUES (27, '家庭套餐', 'http://127.0.0.1:8080/upload/2025/12/02/family_set.png', 1003, NULL, 37, '', 1, 399.00, '2025-11-17 11:00:00');
INSERT INTO `shopping_cart` VALUES (28, '鸡蛋汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', 1003, 68, NULL, '', 1, 4.00, '2025-11-17 11:05:00');
INSERT INTO `shopping_cart` VALUES (29, '商务套餐升级版', 'http://127.0.0.1:8080/upload/2025/12/02/business_set.png', 1004, NULL, 38, '', 1, 299.00, '2025-11-18 17:00:00');
INSERT INTO `shopping_cart` VALUES (30, '炝炒圆白菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/22f59feb-0d44-430e-a6cd-6a49f27453ca.png', 1004, 57, NULL, '', 1, 18.00, '2025-11-18 17:10:00');
INSERT INTO `shopping_cart` VALUES (31, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 1001, 67, NULL, '重辣', 1, 72.00, '2025-11-19 10:00:00');
INSERT INTO `shopping_cart` VALUES (32, '北冰洋', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', 1001, 47, NULL, '', 2, 8.00, '2025-11-19 10:05:00');
INSERT INTO `shopping_cart` VALUES (33, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 1002, 62, NULL, '不辣', 1, 88.00, '2025-11-20 18:00:00');
INSERT INTO `shopping_cart` VALUES (34, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 1002, 49, NULL, '', 3, 6.00, '2025-11-20 18:05:00');
INSERT INTO `shopping_cart` VALUES (35, '套餐六', 'http://127.0.0.1:8080/upload/2025/11/20/b6dcbc17-9bf2-4eee-a16f-be27cbe872e9.png', 1003, NULL, 36, '', 1, 212.00, '2025-11-21 12:00:00');
INSERT INTO `shopping_cart` VALUES (36, '馒头', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/475cc599-8661-4899-8f9e-121dd8ef7d02.png', 1003, 50, NULL, '', 2, 2.00, '2025-11-21 12:05:00');
INSERT INTO `shopping_cart` VALUES (37, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 1004, 59, NULL, '', 1, 138.00, '2025-11-22 19:00:00');
INSERT INTO `shopping_cart` VALUES (38, '王老吉', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', 1004, 46, NULL, '无糖', 2, 12.00, '2025-11-22 19:05:00');
INSERT INTO `shopping_cart` VALUES (39, '清炒小油菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png', 1001, 54, NULL, '', 1, 18.00, '2025-11-23 11:00:00');
INSERT INTO `shopping_cart` VALUES (40, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 1001, 65, NULL, '微辣', 1, 68.00, '2025-11-23 11:05:00');
INSERT INTO `shopping_cart` VALUES (41, '蒜蓉娃娃菜', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', 1002, 55, NULL, '', 1, 18.00, '2025-11-24 17:00:00');
INSERT INTO `shopping_cart` VALUES (42, '雪花啤酒', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', 1002, 48, NULL, '', 3, 12.00, '2025-11-24 17:05:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1005 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1001, 'oUxYK5K6K6K6K6K6K6K6K6K6K6K', '张三', '13800138000', '男', '110101199001011234', 'https://example.com/avatar.jpg', '2025-12-01 13:15:05');
INSERT INTO `user` VALUES (1002, 'oUxYK5K6K6K6K6K6K6K6K6K6K62', '李四', '13800138001', '男', '110101199001011224', 'https://example.com/avatar.jpg', '2025-12-01 13:15:05');
INSERT INTO `user` VALUES (1003, 'oUxYK5K6K6K6K6K6K6K6K6K6K63', '王五', '13800138002', '女', '110101199001011244', 'https://example.com/avatar3.jpg', '2025-12-02 10:00:00');
INSERT INTO `user` VALUES (1004, 'oUxYK5K6K6K6K6K6K6K6K6K6K64', '赵六', '13800138003', '男', '110101199001011254', 'https://example.com/avatar4.jpg', '2025-12-02 10:30:00');

SET FOREIGN_KEY_CHECKS = 1;
