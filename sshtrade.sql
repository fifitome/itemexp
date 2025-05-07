/*
 Navicat Premium Data Transfer

 Source Server         : root@localhost
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : db_freetrade_sys

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 11/11/2024 09:41:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '收货地址编号',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `postcode` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户编号',
  `default_radio` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (9, '小瑾', '15222222222', '湖南省長沙市', NULL, 22, '否');
INSERT INTO `address` VALUES (6, '张晓松', '13244445555', '广州员村山顶100号', '510000', 22, '否');
INSERT INTO `address` VALUES (7, '李四', '13244445555', '湖南长沙欢乐家园小区100号', '5123333', 23, '是');
INSERT INTO `address` VALUES (8, '李小四', '13266667777', '广州南沙区100号', '510000', 23, '否');
INSERT INTO `address` VALUES (10, 'LRL', '15215222222', '湖南省長沙市', NULL, 24, '是');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '轮播图编号',
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `index_radio` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否首页',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (5, 'http://localhost:9090/file/download/390910b058ce489095524e26327c1b00.jpg', NULL, '是');
INSERT INTO `banner` VALUES (6, 'http://localhost:9090/file/download/813bdcc7ad3947d38bc6a56623e8192f.jpeg', NULL, '是');
INSERT INTO `banner` VALUES (7, 'http://localhost:9090/file/download/200a5102486a41d8b17720dd57b15929.jpg', NULL, '否');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '购物车编号',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '购买用户',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '购买商品',
  `num` int(0) NULL DEFAULT NULL COMMENT '数量',
  `price` double NULL DEFAULT NULL COMMENT '单价',
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goodid` int(0) NULL DEFAULT NULL COMMENT '产品编号',
  `biz_user_id` int(0) NULL DEFAULT NULL COMMENT '商品发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '男装');
INSERT INTO `category` VALUES (2, '女装');
INSERT INTO `category` VALUES (3, '化妆品');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录账户',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (1, 'zhangsan', '张三', 22);
INSERT INTO `consumer` VALUES (2, 'lisi', '李四', 23);
INSERT INTO `consumer` VALUES (3, 'LRL', NULL, 24);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `deleted` int(0) NULL DEFAULT 0 COMMENT '删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `c_d`(`code`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (2, 'message', 'message', 'icon', 0);
INSERT INTO `dict` VALUES (3, 'menu', 'menu', 'icon', 0);
INSERT INTO `dict` VALUES (4, 'grid', 'grid', 'icon', 0);
INSERT INTO `dict` VALUES (5, 'house', 'house', 'icon', 0);
INSERT INTO `dict` VALUES (6, 'user', 'user', 'icon', 0);
INSERT INTO `dict` VALUES (7, 'file', 'files', 'icon', 0);
INSERT INTO `dict` VALUES (8, 'money', 'money', 'icon', 0);
INSERT INTO `dict` VALUES (9, 'school', 'school', 'icon', 0);
INSERT INTO `dict` VALUES (10, 'notebook', 'notebook', 'icon', 0);
INSERT INTO `dict` VALUES (11, 'coin', 'coin', 'icon', 0);
INSERT INTO `dict` VALUES (12, 'set-up', 'set-up', 'icon', 0);
INSERT INTO `dict` VALUES (13, 'postcard', 'postcard', 'icon', 0);
INSERT INTO `dict` VALUES (14, 'food', 'food', 'icon', 0);
INSERT INTO `dict` VALUES (15, 'position', 'position', 'icon', 0);
INSERT INTO `dict` VALUES (16, 'chat-line-round', 'chat-line-round', 'icon', 0);
INSERT INTO `dict` VALUES (17, 'chat-dot-round', 'chat-dot-round', 'icon', 0);
INSERT INTO `dict` VALUES (18, 'setting', 'setting', 'icon', 0);
INSERT INTO `dict` VALUES (19, 'comment', 'comment', 'icon', 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `orders` int(0) NULL DEFAULT 1 COMMENT '顺序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'grid' COMMENT '图标',
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `pid` int(0) NULL DEFAULT NULL COMMENT '父级编号',
  `deleted` int(0) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型',
  `hide` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `a_d_index`(`auth`, `deleted`) USING BTREE,
  UNIQUE INDEX `p_p_d_index`(`path`, `page`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1793 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统管理', '', 2, 'menu', NULL, NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 1, 0);
INSERT INTO `menu` VALUES (3, '用户管理', 'user', 1, 'user', 'User', 'user.list', 1, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (4, '用户新增', '', 1, NULL, '', 'user.add', 3, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (8, '用户编辑', '', 1, NULL, NULL, 'user.edit', 3, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (9, '用户删除', NULL, 1, NULL, NULL, 'user.delete', 3, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (10, '角色管理', 'role', 1, 'grid', 'Role', 'role.list', 1, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (11, '权限管理', 'permission', 1, 'position', 'Permission', 'permission.list', 1, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (12, '首页', 'home', 1, 'house', 'Home', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (13, '数据字典管理', 'dict', 1, 'grid', 'Dict', 'dict.list', 1, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (14, '批量删除', NULL, 1, '', NULL, 'user.deleteBatch', 3, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (15, '用户导入', NULL, 1, NULL, NULL, 'user.import', 3, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (16, '用户导出', NULL, 1, NULL, NULL, 'user.export', 3, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (21, '角色新增', NULL, 1, NULL, '', 'role.add', 10, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (22, '角色编辑', NULL, 1, NULL, NULL, 'role.edit', 10, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (23, '角色删除', NULL, 1, NULL, NULL, 'role.delete', 10, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (25, '批量删除', NULL, 1, NULL, NULL, 'role.deleteBatch', 10, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (26, '角色导入', NULL, 1, NULL, NULL, 'role.import', 10, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (27, '角色导出', NULL, 1, NULL, NULL, 'role.export', 10, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (30, '权限新增', NULL, 1, NULL, '', 'permission.add', 11, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (31, '权限编辑', NULL, 1, NULL, NULL, 'permission.edit', 11, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (32, '权限删除', NULL, 1, NULL, NULL, 'permission.delete', 11, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (34, '权限导入', NULL, 1, NULL, NULL, 'permission.import', 11, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (35, '权限导出', NULL, 1, NULL, NULL, 'permission.export', 11, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (37, '数据字典新增', NULL, 1, NULL, '', 'dict.add', 13, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (38, '数据字典编辑', NULL, 1, NULL, NULL, 'dict.edit', 13, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (39, '数据字典删除', NULL, 1, NULL, NULL, 'dict.delete', 13, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (40, '批量删除', NULL, 1, NULL, NULL, 'dict.deleteBatch', 13, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (41, '数据字典导入', NULL, 1, NULL, NULL, 'dict.import', 13, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (42, '数据字典导出', NULL, 1, NULL, NULL, 'dict.export', 13, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (186, '数据图表', 'dashboard', 1, 'grid', 'Dashboard', NULL, NULL, 186, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (505, '公告管理', 'notice', 1, 'comment', 'Notice', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (506, '公告查询', NULL, 1, 'grid', NULL, 'notice.list', 505, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (507, '公告新增', NULL, 1, 'grid', NULL, 'notice.add', 505, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (508, '公告导入', NULL, 1, 'grid', NULL, 'notice.import', 505, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (509, '公告导出', NULL, 1, 'grid', NULL, 'notice.export', 505, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (510, '批量删除', NULL, 1, 'grid', NULL, 'notice.deleteBatch', 505, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (511, '公告编辑', NULL, 1, 'grid', NULL, 'notice.edit', 505, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (512, '公告删除', NULL, 1, 'grid', NULL, 'notice.delete', 505, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1721, '用户管理', 'consumer', 1, 'grid', 'Consumer', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1722, '用户查询', NULL, 1, 'grid', NULL, 'consumer.list', 1721, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1723, '用户新增', NULL, 1, 'grid', NULL, 'consumer.add', 1721, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1724, '用户导入', NULL, 1, 'grid', NULL, 'consumer.import', 1721, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1725, '用户导出', NULL, 1, 'grid', NULL, 'consumer.export', 1721, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1726, '批量删除', NULL, 1, 'grid', NULL, 'consumer.deleteBatch', 1721, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1727, '用户编辑', NULL, 1, 'grid', NULL, 'consumer.edit', 1721, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1728, '用户删除', NULL, 1, 'grid', NULL, 'consumer.delete', 1721, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1729, '商品分类管理', 'category', 1, 'grid', 'Category', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1730, '商品分类查询', NULL, 1, 'grid', NULL, 'category.list', 1729, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1731, '商品分类新增', NULL, 1, 'grid', NULL, 'category.add', 1729, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1732, '商品分类导入', NULL, 1, 'grid', NULL, 'category.import', 1729, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1733, '商品分类导出', NULL, 1, 'grid', NULL, 'category.export', 1729, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1734, '批量删除', NULL, 1, 'grid', NULL, 'category.deleteBatch', 1729, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1735, '商品分类编辑', NULL, 1, 'grid', NULL, 'category.edit', 1729, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1736, '商品分类删除', NULL, 1, 'grid', NULL, 'category.delete', 1729, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1737, '商品管理', 'product', 1, 'grid', 'Product', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1738, '商品查询', NULL, 1, 'grid', NULL, 'product.list', 1737, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1739, '商品新增', NULL, 1, 'grid', NULL, 'product.add', 1737, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1740, '商品导入', NULL, 1, 'grid', NULL, 'product.import', 1737, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1741, '商品导出', NULL, 1, 'grid', NULL, 'product.export', 1737, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1742, '批量删除', NULL, 1, 'grid', NULL, 'product.deleteBatch', 1737, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1743, '商品编辑', NULL, 1, 'grid', NULL, 'product.edit', 1737, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1744, '商品删除', NULL, 1, 'grid', NULL, 'product.delete', 1737, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1745, '支付类型管理', 'paytype', 1, 'grid', 'Paytype', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1746, '支付类型查询', NULL, 1, 'grid', NULL, 'paytype.list', 1745, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1747, '支付类型新增', NULL, 1, 'grid', NULL, 'paytype.add', 1745, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1748, '支付类型导入', NULL, 1, 'grid', NULL, 'paytype.import', 1745, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1749, '支付类型导出', NULL, 1, 'grid', NULL, 'paytype.export', 1745, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1750, '批量删除', NULL, 1, 'grid', NULL, 'paytype.deleteBatch', 1745, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1751, '支付类型编辑', NULL, 1, 'grid', NULL, 'paytype.edit', 1745, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1752, '支付类型删除', NULL, 1, 'grid', NULL, 'paytype.delete', 1745, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1753, '购物车管理', 'cart', 1, 'grid', 'Cart', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1754, '购物车查询', NULL, 1, 'grid', NULL, 'cart.list', 1753, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1755, '购物车新增', NULL, 1, 'grid', NULL, 'cart.add', 1753, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1756, '购物车导入', NULL, 1, 'grid', NULL, 'cart.import', 1753, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1757, '购物车导出', NULL, 1, 'grid', NULL, 'cart.export', 1753, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1758, '批量删除', NULL, 1, 'grid', NULL, 'cart.deleteBatch', 1753, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1759, '购物车编辑', NULL, 1, 'grid', NULL, 'cart.edit', 1753, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1760, '购物车删除', NULL, 1, 'grid', NULL, 'cart.delete', 1753, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1761, '商品订单管理', 'orders', 1, 'grid', 'Orders', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1762, '商品订单查询', NULL, 1, 'grid', NULL, 'orders.list', 1761, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1763, '商品订单新增', NULL, 1, 'grid', NULL, 'orders.add', 1761, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1764, '商品订单导入', NULL, 1, 'grid', NULL, 'orders.import', 1761, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1765, '商品订单导出', NULL, 1, 'grid', NULL, 'orders.export', 1761, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1766, '批量删除', NULL, 1, 'grid', NULL, 'orders.deleteBatch', 1761, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1767, '商品订单编辑', NULL, 1, 'grid', NULL, 'orders.edit', 1761, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1768, '商品订单删除', NULL, 1, 'grid', NULL, 'orders.delete', 1761, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1769, '收货地址管理', 'address', 1, 'grid', 'Address', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1770, '收货地址查询', NULL, 1, 'grid', NULL, 'address.list', 1769, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1771, '收货地址新增', NULL, 1, 'grid', NULL, 'address.add', 1769, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1772, '收货地址导入', NULL, 1, 'grid', NULL, 'address.import', 1769, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1773, '收货地址导出', NULL, 1, 'grid', NULL, 'address.export', 1769, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1774, '批量删除', NULL, 1, 'grid', NULL, 'address.deleteBatch', 1769, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1775, '收货地址编辑', NULL, 1, 'grid', NULL, 'address.edit', 1769, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1776, '收货地址删除', NULL, 1, 'grid', NULL, 'address.delete', 1769, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1777, '私聊管理', 'pm', 1, 'grid', 'Pm', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1778, '私聊查询', NULL, 1, 'grid', NULL, 'pm.list', 1777, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1779, '私聊新增', NULL, 1, 'grid', NULL, 'pm.add', 1777, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1780, '私聊导入', NULL, 1, 'grid', NULL, 'pm.import', 1777, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1781, '私聊导出', NULL, 1, 'grid', NULL, 'pm.export', 1777, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1782, '批量删除', NULL, 1, 'grid', NULL, 'pm.deleteBatch', 1777, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1783, '私聊编辑', NULL, 1, 'grid', NULL, 'pm.edit', 1777, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1784, '私聊删除', NULL, 1, 'grid', NULL, 'pm.delete', 1777, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1785, '轮播图管理', 'banner', 1, 'grid', 'Banner', NULL, NULL, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 2, 0);
INSERT INTO `menu` VALUES (1786, '轮播图查询', NULL, 1, 'grid', NULL, 'banner.list', 1785, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1787, '轮播图新增', NULL, 1, 'grid', NULL, 'banner.add', 1785, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1788, '轮播图导入', NULL, 1, 'grid', NULL, 'banner.import', 1785, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1789, '轮播图导出', NULL, 1, 'grid', NULL, 'banner.export', 1785, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1790, '批量删除', NULL, 1, 'grid', NULL, 'banner.deleteBatch', 1785, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1791, '轮播图编辑', NULL, 1, 'grid', NULL, 'banner.edit', 1785, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);
INSERT INTO `menu` VALUES (1792, '轮播图删除', NULL, 1, 'grid', NULL, 'banner.delete', 1785, 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 3, 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (10, '安全', '<p>网络安全</p><p><br></p>', '2024-11-10 20:37:56', NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '订单明细',
  `state_radio` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态,已下单|已发货|已收货|已取消',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '下单用户',
  `amount` double NULL DEFAULT NULL COMMENT '总金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `goodids` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '产品编号',
  `biz_user_id` int(0) NULL DEFAULT NULL COMMENT '商品发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 67 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (63, '20231029224837', '收货地址：张晓松，13244445555，广州员村山顶100号<br/>支付方式：微信支付<br/>商品明细：<br/><ul><li>商品：长袖t恤男士新款纯色棉潮流，数量：2，单价：69</li></ul>', '已取消', 22, 138, '2024-06-16 20:45:51', '2024-06-16 20:45:51', '2', 23);
INSERT INTO `orders` VALUES (64, '20231029225036', '收货地址：李四，13244445555，湖南长沙欢乐家园小区100号<br/>支付方式：支付宝<br/>商品明细：<br/><ul><li>商品：5A抑菌抗发黄T恤男40S新疆棉t恤，数量：3，单价：39.9</li></ul>', '已下单', 23, 119.7, '2024-06-16 20:45:51', '2024-06-16 20:45:51', '1', 22);
INSERT INTO `orders` VALUES (65, '20231030195218', '<p>收货地址：李四，13244445555，湖南长沙欢乐家园小区100号<br>支付方式：微信支付<br>商品明细：<br></p><ul><li>商品：测试商品，数量：2，单价：59.9</li></ul><p><br></p>', '已收货', 23, 119.8, '2024-06-16 20:45:51', '2024-06-16 20:45:51', '4', 22);
INSERT INTO `orders` VALUES (66, '20240523161616', '<p>收货地址：张晓松，13244445555，广州员村山顶100号<br>支付方式：微信支付<br>商品明细：<br></p><ul><li>商品：长袖t恤男士新款纯色棉潮流，数量：1，单价：69</li></ul><p><br></p>', '已取消', 22, 69, '2024-05-23 16:16:16', '2024-05-23 16:16:16', '2', 23);
INSERT INTO `orders` VALUES (68, '20241110205610', '收货地址：小瑾，15222222222，湖南省長沙市<br/>支付方式：微信支付<br/>商品明细：<br/><ul><li>商品：长袖t恤男士新款纯色棉潮流，数量：1，单价：69</li></ul>', '已下单', 22, 69, '2024-11-10 20:56:11', '2024-11-10 20:56:11', '2', 23);
INSERT INTO `orders` VALUES (69, '20241111092612', '收货地址：LRL，15215222222，湖南省長沙市<br/>支付方式：微信支付<br/>商品明细：<br/><ul><li>商品：长袖t恤男士新款纯色棉潮流，数量：1，单价：69</li></ul>', '已下单', 24, 69, '2024-11-11 09:26:13', '2024-11-11 09:26:13', '2', 23);

-- ----------------------------
-- Table structure for paytype
-- ----------------------------
DROP TABLE IF EXISTS `paytype`;
CREATE TABLE `paytype`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '方式编号',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支付名称',
  `img` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '支付方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paytype
-- ----------------------------
INSERT INTO `paytype` VALUES (1, '微信支付', 'http://localhost:9090/file/download/be0669367f0c491987b5b4b3b9a00297.png');
INSERT INTO `paytype` VALUES (2, '支付宝', 'http://localhost:9090/file/download/e639655d7b0248728463558d0ef1319a.png');

-- ----------------------------
-- Table structure for pm
-- ----------------------------
DROP TABLE IF EXISTS `pm`;
CREATE TABLE `pm`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `from_id` int(0) NULL DEFAULT NULL COMMENT '发送者',
  `to_id` int(0) NULL DEFAULT NULL COMMENT '接收者',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '聊天内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '私信信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pm
-- ----------------------------
INSERT INTO `pm` VALUES (7, 23, 22, '你好，李四', '2023-10-30 14:48:18');
INSERT INTO `pm` VALUES (8, 22, 23, '你好，张三，我是李四', '2023-10-30 14:49:05');
INSERT INTO `pm` VALUES (9, 23, 22, '你在哪里啊？', '2023-10-30 16:36:07');
INSERT INTO `pm` VALUES (10, 22, 23, '我在这里', '2023-10-30 16:36:27');
INSERT INTO `pm` VALUES (11, 23, 22, '我在广州', '2023-10-30 16:36:51');
INSERT INTO `pm` VALUES (12, 22, 23, '你好', '2023-10-30 17:16:22');
INSERT INTO `pm` VALUES (13, 22, 23, '你现在在哪里啊？', '2023-10-30 17:22:00');
INSERT INTO `pm` VALUES (14, 22, 23, '你好', '2023-10-30 19:50:01');
INSERT INTO `pm` VALUES (15, 23, 22, '我买了你的衣服', '2024-05-23 16:17:58');
INSERT INTO `pm` VALUES (16, 22, 23, '什么问题', '2024-05-23 16:18:24');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '商品简介',
  `price` double NULL DEFAULT NULL COMMENT '商品价格',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '商品分类',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `recom_radio` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否推荐,是|否',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '商品发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '5A抑菌抗发黄T恤男40S新疆棉t恤', 'http://localhost:9090/file/download/5a5c48ce4bc54f20bfeaf75725f98d2e.jpg', '<p><img src=\"http://localhost:9090/file/download/30cbd767b5034a3aa402e8a81465a264.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', 39.9, 1, '2024-06-16 20:45:51', '2024-06-16 20:45:51', NULL, 22);
INSERT INTO `product` VALUES (2, '长袖t恤男士新款纯色棉潮流', 'http://localhost:9090/file/download/04f5e3453aeb438c9bbb036d2c0133f8.jpeg', '<p><img src=\"http://localhost:9090/file/download/8798d5efb62d4ab68bb2f10efa47fec9.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', 69, 1, '2024-06-16 20:45:51', '2024-06-16 20:45:51', '是', 23);
INSERT INTO `product` VALUES (3, '罗蒙（R）衬衫女长袖', 'http://localhost:9090/file/download/3d5917d1fddb4072961d94a56c0dcb12.jpg', '<p><img src=\"http://localhost:9090/file/download/44f292345c1e41118c56367c8a06973c.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', 61.35, 2, '2024-06-16 20:45:51', '2024-06-16 20:45:51', '是', 22);
INSERT INTO `product` VALUES (5, '衬衫', 'http://localhost:9090/file/download/150526b20aad4bf697580f11967ecdec.jpg', '<p>仅试穿</p>', 20, 2, '2024-11-11 09:27:29', '2024-11-11 09:27:29', NULL, 24);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `deleted` int(0) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flag_deleted_idnex`(`flag`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', 'ADMIN', 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51');
INSERT INTO `role` VALUES (21, '用户', 'CONSUMER', 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51');

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int(0) NOT NULL COMMENT '角色',
  `permission_id` int(0) NOT NULL COMMENT '权限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22446 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES (22345, 1, 1);
INSERT INTO `rolemenu` VALUES (22411, 1, 3);
INSERT INTO `rolemenu` VALUES (22412, 1, 4);
INSERT INTO `rolemenu` VALUES (22413, 1, 8);
INSERT INTO `rolemenu` VALUES (22414, 1, 9);
INSERT INTO `rolemenu` VALUES (22418, 1, 10);
INSERT INTO `rolemenu` VALUES (22425, 1, 11);
INSERT INTO `rolemenu` VALUES (22346, 1, 12);
INSERT INTO `rolemenu` VALUES (22415, 1, 14);
INSERT INTO `rolemenu` VALUES (22416, 1, 15);
INSERT INTO `rolemenu` VALUES (22417, 1, 16);
INSERT INTO `rolemenu` VALUES (22419, 1, 21);
INSERT INTO `rolemenu` VALUES (22420, 1, 22);
INSERT INTO `rolemenu` VALUES (22421, 1, 23);
INSERT INTO `rolemenu` VALUES (22422, 1, 25);
INSERT INTO `rolemenu` VALUES (22423, 1, 26);
INSERT INTO `rolemenu` VALUES (22424, 1, 27);
INSERT INTO `rolemenu` VALUES (22426, 1, 30);
INSERT INTO `rolemenu` VALUES (22427, 1, 31);
INSERT INTO `rolemenu` VALUES (22428, 1, 32);
INSERT INTO `rolemenu` VALUES (22429, 1, 34);
INSERT INTO `rolemenu` VALUES (22430, 1, 35);
INSERT INTO `rolemenu` VALUES (22347, 1, 505);
INSERT INTO `rolemenu` VALUES (22348, 1, 506);
INSERT INTO `rolemenu` VALUES (22349, 1, 507);
INSERT INTO `rolemenu` VALUES (22350, 1, 508);
INSERT INTO `rolemenu` VALUES (22351, 1, 509);
INSERT INTO `rolemenu` VALUES (22352, 1, 510);
INSERT INTO `rolemenu` VALUES (22353, 1, 511);
INSERT INTO `rolemenu` VALUES (22354, 1, 512);
INSERT INTO `rolemenu` VALUES (22355, 1, 1721);
INSERT INTO `rolemenu` VALUES (22356, 1, 1722);
INSERT INTO `rolemenu` VALUES (22357, 1, 1723);
INSERT INTO `rolemenu` VALUES (22358, 1, 1724);
INSERT INTO `rolemenu` VALUES (22359, 1, 1725);
INSERT INTO `rolemenu` VALUES (22360, 1, 1726);
INSERT INTO `rolemenu` VALUES (22361, 1, 1727);
INSERT INTO `rolemenu` VALUES (22362, 1, 1728);
INSERT INTO `rolemenu` VALUES (22363, 1, 1729);
INSERT INTO `rolemenu` VALUES (22364, 1, 1730);
INSERT INTO `rolemenu` VALUES (22365, 1, 1731);
INSERT INTO `rolemenu` VALUES (22366, 1, 1732);
INSERT INTO `rolemenu` VALUES (22367, 1, 1733);
INSERT INTO `rolemenu` VALUES (22368, 1, 1734);
INSERT INTO `rolemenu` VALUES (22369, 1, 1735);
INSERT INTO `rolemenu` VALUES (22370, 1, 1736);
INSERT INTO `rolemenu` VALUES (22371, 1, 1737);
INSERT INTO `rolemenu` VALUES (22372, 1, 1738);
INSERT INTO `rolemenu` VALUES (22373, 1, 1739);
INSERT INTO `rolemenu` VALUES (22374, 1, 1740);
INSERT INTO `rolemenu` VALUES (22375, 1, 1741);
INSERT INTO `rolemenu` VALUES (22376, 1, 1742);
INSERT INTO `rolemenu` VALUES (22377, 1, 1743);
INSERT INTO `rolemenu` VALUES (22378, 1, 1744);
INSERT INTO `rolemenu` VALUES (22379, 1, 1745);
INSERT INTO `rolemenu` VALUES (22380, 1, 1746);
INSERT INTO `rolemenu` VALUES (22381, 1, 1747);
INSERT INTO `rolemenu` VALUES (22382, 1, 1748);
INSERT INTO `rolemenu` VALUES (22383, 1, 1749);
INSERT INTO `rolemenu` VALUES (22384, 1, 1750);
INSERT INTO `rolemenu` VALUES (22385, 1, 1751);
INSERT INTO `rolemenu` VALUES (22386, 1, 1752);
INSERT INTO `rolemenu` VALUES (22387, 1, 1761);
INSERT INTO `rolemenu` VALUES (22388, 1, 1762);
INSERT INTO `rolemenu` VALUES (22389, 1, 1763);
INSERT INTO `rolemenu` VALUES (22390, 1, 1764);
INSERT INTO `rolemenu` VALUES (22391, 1, 1765);
INSERT INTO `rolemenu` VALUES (22392, 1, 1766);
INSERT INTO `rolemenu` VALUES (22393, 1, 1767);
INSERT INTO `rolemenu` VALUES (22394, 1, 1768);
INSERT INTO `rolemenu` VALUES (22395, 1, 1769);
INSERT INTO `rolemenu` VALUES (22396, 1, 1770);
INSERT INTO `rolemenu` VALUES (22397, 1, 1771);
INSERT INTO `rolemenu` VALUES (22398, 1, 1772);
INSERT INTO `rolemenu` VALUES (22399, 1, 1773);
INSERT INTO `rolemenu` VALUES (22400, 1, 1774);
INSERT INTO `rolemenu` VALUES (22401, 1, 1775);
INSERT INTO `rolemenu` VALUES (22402, 1, 1776);
INSERT INTO `rolemenu` VALUES (22403, 1, 1785);
INSERT INTO `rolemenu` VALUES (22404, 1, 1786);
INSERT INTO `rolemenu` VALUES (22405, 1, 1787);
INSERT INTO `rolemenu` VALUES (22406, 1, 1788);
INSERT INTO `rolemenu` VALUES (22407, 1, 1789);
INSERT INTO `rolemenu` VALUES (22408, 1, 1790);
INSERT INTO `rolemenu` VALUES (22409, 1, 1791);
INSERT INTO `rolemenu` VALUES (22410, 1, 1792);
INSERT INTO `rolemenu` VALUES (4644, 3, 12);
INSERT INTO `rolemenu` VALUES (4645, 3, 490);
INSERT INTO `rolemenu` VALUES (4646, 3, 491);
INSERT INTO `rolemenu` VALUES (4647, 3, 494);
INSERT INTO `rolemenu` VALUES (4648, 3, 495);
INSERT INTO `rolemenu` VALUES (4649, 3, 496);
INSERT INTO `rolemenu` VALUES (5319, 4, 12);
INSERT INTO `rolemenu` VALUES (5320, 4, 505);
INSERT INTO `rolemenu` VALUES (5321, 4, 506);
INSERT INTO `rolemenu` VALUES (6118, 5, 12);
INSERT INTO `rolemenu` VALUES (6114, 5, 505);
INSERT INTO `rolemenu` VALUES (6119, 5, 506);
INSERT INTO `rolemenu` VALUES (6115, 5, 577);
INSERT INTO `rolemenu` VALUES (6120, 5, 578);
INSERT INTO `rolemenu` VALUES (6121, 5, 583);
INSERT INTO `rolemenu` VALUES (6116, 5, 593);
INSERT INTO `rolemenu` VALUES (6122, 5, 594);
INSERT INTO `rolemenu` VALUES (6123, 5, 595);
INSERT INTO `rolemenu` VALUES (6124, 5, 599);
INSERT INTO `rolemenu` VALUES (6125, 5, 600);
INSERT INTO `rolemenu` VALUES (6117, 5, 617);
INSERT INTO `rolemenu` VALUES (6126, 5, 618);
INSERT INTO `rolemenu` VALUES (6127, 5, 623);
INSERT INTO `rolemenu` VALUES (6128, 5, 624);
INSERT INTO `rolemenu` VALUES (7087, 6, 12);
INSERT INTO `rolemenu` VALUES (7088, 6, 505);
INSERT INTO `rolemenu` VALUES (7089, 6, 506);
INSERT INTO `rolemenu` VALUES (8104, 7, 12);
INSERT INTO `rolemenu` VALUES (8105, 7, 505);
INSERT INTO `rolemenu` VALUES (8106, 7, 506);
INSERT INTO `rolemenu` VALUES (9121, 8, 12);
INSERT INTO `rolemenu` VALUES (9122, 8, 505);
INSERT INTO `rolemenu` VALUES (9123, 8, 506);
INSERT INTO `rolemenu` VALUES (10138, 9, 12);
INSERT INTO `rolemenu` VALUES (10139, 9, 505);
INSERT INTO `rolemenu` VALUES (10140, 9, 506);
INSERT INTO `rolemenu` VALUES (11155, 10, 12);
INSERT INTO `rolemenu` VALUES (11156, 10, 505);
INSERT INTO `rolemenu` VALUES (11157, 10, 506);
INSERT INTO `rolemenu` VALUES (12172, 11, 12);
INSERT INTO `rolemenu` VALUES (12173, 11, 505);
INSERT INTO `rolemenu` VALUES (12174, 11, 506);
INSERT INTO `rolemenu` VALUES (13189, 12, 12);
INSERT INTO `rolemenu` VALUES (13190, 12, 505);
INSERT INTO `rolemenu` VALUES (13191, 12, 506);
INSERT INTO `rolemenu` VALUES (14206, 13, 12);
INSERT INTO `rolemenu` VALUES (14207, 13, 505);
INSERT INTO `rolemenu` VALUES (14208, 13, 506);
INSERT INTO `rolemenu` VALUES (15223, 14, 12);
INSERT INTO `rolemenu` VALUES (15224, 14, 505);
INSERT INTO `rolemenu` VALUES (15225, 14, 506);
INSERT INTO `rolemenu` VALUES (16240, 15, 12);
INSERT INTO `rolemenu` VALUES (16241, 15, 505);
INSERT INTO `rolemenu` VALUES (16242, 15, 506);
INSERT INTO `rolemenu` VALUES (17257, 16, 12);
INSERT INTO `rolemenu` VALUES (17258, 16, 505);
INSERT INTO `rolemenu` VALUES (17259, 16, 506);
INSERT INTO `rolemenu` VALUES (18274, 17, 12);
INSERT INTO `rolemenu` VALUES (18275, 17, 505);
INSERT INTO `rolemenu` VALUES (18276, 17, 506);
INSERT INTO `rolemenu` VALUES (19291, 18, 12);
INSERT INTO `rolemenu` VALUES (19292, 18, 505);
INSERT INTO `rolemenu` VALUES (19293, 18, 506);
INSERT INTO `rolemenu` VALUES (20308, 19, 12);
INSERT INTO `rolemenu` VALUES (20309, 19, 505);
INSERT INTO `rolemenu` VALUES (20310, 19, 506);
INSERT INTO `rolemenu` VALUES (21325, 20, 12);
INSERT INTO `rolemenu` VALUES (21326, 20, 505);
INSERT INTO `rolemenu` VALUES (21327, 20, 506);
INSERT INTO `rolemenu` VALUES (22435, 21, 12);
INSERT INTO `rolemenu` VALUES (22431, 21, 505);
INSERT INTO `rolemenu` VALUES (22436, 21, 506);
INSERT INTO `rolemenu` VALUES (22432, 21, 1721);
INSERT INTO `rolemenu` VALUES (22437, 21, 1722);
INSERT INTO `rolemenu` VALUES (22438, 21, 1727);
INSERT INTO `rolemenu` VALUES (22433, 21, 1737);
INSERT INTO `rolemenu` VALUES (22439, 21, 1738);
INSERT INTO `rolemenu` VALUES (22440, 21, 1739);
INSERT INTO `rolemenu` VALUES (22441, 21, 1743);
INSERT INTO `rolemenu` VALUES (22442, 21, 1744);
INSERT INTO `rolemenu` VALUES (22434, 21, 1761);
INSERT INTO `rolemenu` VALUES (22443, 21, 1762);
INSERT INTO `rolemenu` VALUES (22444, 21, 1767);
INSERT INTO `rolemenu` VALUES (22445, 21, 1768);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户唯一id',
  `deleted` int(0) NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `score` int(0) NULL DEFAULT 0 COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_index`(`uid`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`, `deleted`) USING BTREE,
  UNIQUE INDEX `email_index`(`email`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm', '管理员', 'admin@qq.com', '广州南沙区', '4918ea50c06a458f94878abe741b4f51', 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 'http://localhost:9090/file/download/a917433378864204964e6b47a749ffd0.jpg', 'ADMIN', 0);
INSERT INTO `user` VALUES (22, 'zhangsan', '$2a$10$CYnHbRDWap0NAUYWqeibwuzIx11ImIzdjoLglLDpD/oJ2kpgrf9de', '张三', 'zhangsan@qq.com', '广州南沙区', '3775be1e4f97459ea40d4a2416cee419', 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 'http://localhost:9090/file/download/8a316c76a2804436b9faff193d0b9270.jpg', 'CONSUMER', 0);
INSERT INTO `user` VALUES (23, 'lisi', '$2a$10$76w99.ylqHDV1wSfW4YKVuiFIw1gkVkq.W51Digeb0tv/ZBUuXP3K', '李四', 'lisi@qq.com', '广州南沙区', 'f604eba4e72c42d893a7d6eba7c3ec36', 0, '2024-06-16 20:45:51', '2024-06-16 20:45:51', 'http://localhost:9090/file/download/b3df6f2c877b43ee8220f4e01d2aac22.jpg', 'CONSUMER', 0);
INSERT INTO `user` VALUES (24, 'LRL', '$2a$10$LahvoNCnVZXpSW7jbYphNOOsxiqDEXqb4t1H3NV.xLBn7dq8ceZZC', 'LRL', '789456@qq.com', NULL, '156e10e53fa146b0ad1c90a823d2543c', 0, '2024-11-11 09:25:00', '2024-11-11 09:25:00', NULL, 'CONSUMER', 0);

SET FOREIGN_KEY_CHECKS = 1;
