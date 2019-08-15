/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : sell

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 28/11/2018 10:40:25
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `detail_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_price` decimal(8, 2) NOT NULL COMMENT '商品数量',
  `product_quantity` int(11) NOT NULL COMMENT '商品数量',
  `product_icon` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品小图',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1532785814665559308', '1532785814571501917', '123458', '芒果冰', 20.00, 1, 'http://xxx.jpg', '2018-07-28 21:50:14', '2018-07-28 21:50:14');
INSERT INTO `order_detail` VALUES ('1532786142882971640', '1532786142782800580', '123458', '芒果冰', 20.00, 1, 'http://xxx.jpg', '2018-07-28 21:55:42', '2018-07-28 21:55:42');
INSERT INTO `order_detail` VALUES ('1532786142916311971', '1532786142782800580', '123457', '皮皮虾', 3.20, 2, 'http://xxxx.jpg', '2018-07-28 21:55:42', '2018-07-28 21:55:42');
INSERT INTO `order_detail` VALUES ('1532846228711256107', '1532846228694169870', '123456', '皮蛋粥', 3.20, 1, 'http://xxxx.jpg', '2018-07-29 14:37:08', '2018-07-29 14:37:08');
INSERT INTO `order_detail` VALUES ('1532846355058417098', '1532846355056462752', '123456', '皮蛋粥', 3.20, 1, 'http://xxxx.jpg', '2018-07-29 14:39:15', '2018-07-29 14:39:15');
INSERT INTO `order_detail` VALUES ('1532847001867428879', '1532847001800649250', '123456', '皮蛋粥', 3.20, 1, 'http://xxxx.jpg', '2018-07-29 14:50:03', '2018-07-29 14:50:03');
INSERT INTO `order_detail` VALUES ('1532847049276280944', '1532847049273890840', '123456', '皮蛋粥', 3.20, 1, 'http://xxxx.jpg', '2018-07-29 14:58:12', '2018-07-29 14:58:12');
INSERT INTO `order_detail` VALUES ('1532849914325381198', '1532849914322167585', '123456', '皮蛋粥', 3.20, 1, 'http://xxxx.jpg', '2018-07-29 15:39:57', '2018-07-29 15:39:57');
INSERT INTO `order_detail` VALUES ('1532850035385711977', '1532850035323864450', '123456', '皮蛋粥', 3.20, 1, 'http://xxxx.jpg', '2018-07-29 15:40:40', '2018-07-29 15:40:40');

-- ----------------------------
-- Table structure for order_master
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master`  (
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buyer_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家名字',
  `buyer_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家地址',
  `buyer_openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家微信openid',
  `order_amount` decimal(8, 2) NOT NULL COMMENT '订单总金额',
  `order_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '订单状态',
  `pay_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '支付状态，默认0未支付',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `idx_buyer_openid`(`buyer_openid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_master
-- ----------------------------
INSERT INTO `order_master` VALUES ('1532785814571501917', '廖师兄', '1234567890', '广州市天河区', '110110', 20.00, 1, 1, '2018-07-29 13:39:07', '2018-08-06 13:24:40');
INSERT INTO `order_master` VALUES ('1532786142782800580', '廖师兄', '1234567890', '广州市天河区', '110110', 70.40, 2, 0, '2018-07-28 21:55:42', '2018-08-06 13:24:41');
INSERT INTO `order_master` VALUES ('1532846228694169870', '张三', '13609068793', '广州市海珠区', 'ewewen12f1d2f1d454fd', 3.20, 2, 0, '2018-07-29 14:37:08', '2018-08-06 13:24:53');
INSERT INTO `order_master` VALUES ('1532846355056462752', '张三', '13609068793', '广州市海珠区', 'ewewen12f1d2f1d454fd', 3.20, 2, 0, '2018-07-29 14:39:15', '2018-08-06 13:24:56');
INSERT INTO `order_master` VALUES ('1532847001800649250', '张三', '13609068793', '广州市越秀区', 'ewewen12f1d2f1d454fd', 3.20, 0, 0, '2018-07-29 14:50:03', '2018-08-06 13:25:01');
INSERT INTO `order_master` VALUES ('1532847049273890840', '张三', '13609068793', '广州市越秀区', 'ewewen12f1d2f1d454fd', 3.20, 1, 0, '2018-07-29 14:58:12', '2018-08-06 13:25:08');
INSERT INTO `order_master` VALUES ('1532849914322167585', '张三', '13609068793', '广州市番禺区', 'ewewen12f1d2f1d454fd', 3.20, 0, 0, '2018-07-29 15:39:57', '2018-08-06 13:25:14');
INSERT INTO `order_master` VALUES ('1532850035323864450', '张三', '13609068793', '广州市番禺区', 'ewewen12f1d2f1d454fd', 3.20, 0, 0, '2018-07-29 15:40:40', '2018-08-06 13:25:22');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE INDEX `uqe_category_type`(`category_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, '热销榜', 0, '2018-07-28 10:02:48', '2018-08-04 21:32:21');
INSERT INTO `product_category` VALUES (2, '男生最爱', 1, '2018-07-28 10:07:55', '2018-07-28 21:30:16');
INSERT INTO `product_category` VALUES (3, '女生最爱', 2, '2018-07-28 10:30:10', '2018-08-04 20:45:37');
INSERT INTO `product_category` VALUES (4, '男生专享', 3, '2018-07-28 11:03:14', '2018-08-04 20:45:39');
INSERT INTO `product_category` VALUES (13, '热销榜666', 100, '2018-08-04 20:59:53', '2018-08-04 20:59:53');
INSERT INTO `product_category` VALUES (21, '测试', 103, '2018-08-04 21:32:37', '2018-08-11 13:34:55');
INSERT INTO `product_category` VALUES (25, '师姐最不爱', 102, '2018-08-11 13:35:15', '2018-08-11 13:35:15');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_price` decimal(8, 2) NOT NULL COMMENT '单价',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `product_description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `product_icon` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `product_status` int(11) NOT NULL COMMENT '商品状态',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('123456', '皮蛋粥', 6.67, 55, '很好喝的粥', 'http://img3.imgtn.bdimg.com/it/u=3648971941,3500022642&fm=27&gp=0.jpg', 1, '2018-08-04 19:18:37', '2018-08-11 18:29:38', 0);
INSERT INTO `product_info` VALUES ('123457', '皮皮虾123', 3.20, 102, '很好吃的虾', 'https://cdn.haochu.com/d/file/20131120/efda5f1bfa2f1f8ab452837495447380.jpg', 1, '2018-08-04 19:17:37', '2018-08-04 19:40:39', 0);
INSERT INTO `product_info` VALUES ('123458', '芒果冰', 20.00, 204, '冰冰的很爽', 'http://i5.xiachufang.com/image/620/5febb4029f2911e38844b8ca3aeed2d7.jpg', 2, '2018-07-28 21:31:33', '2018-08-04 19:39:25', 0);
INSERT INTO `product_info` VALUES ('1533382637167627934', '潮汕牛肉丸', 40.00, 100, '好吃不上火', 'http://imgsrc.baidu.com/image/c0%3Dpixel_huitu%2C0%2C0%2C294%2C40/sign=90fa433207d79123f4ed9c34c44c3cee/e4dde71190ef76c6fd95e8119616fdfaaf516740.jpg', 1, '2018-08-04 19:37:17', '2018-08-04 19:43:37', 0);
INSERT INTO `product_info` VALUES ('1533382895077138814', '北京烤鸭', 66.00, 600, '打鸭子', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4160105330,3932180633&fm=27&gp=0.jpg', 2, '2018-08-04 19:41:35', '2018-08-04 19:41:35', 0);

-- ----------------------------
-- Table structure for seller_info
-- ----------------------------
DROP TABLE IF EXISTS `seller_info`;
CREATE TABLE `seller_info`  (
  `seller_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信openid',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`seller_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seller_info
-- ----------------------------
INSERT INTO `seller_info` VALUES ('1533436038586344602', 'admin', 'admin', 'abc', '2018-08-05 10:27:18', '2018-08-05 10:27:18');

SET FOREIGN_KEY_CHECKS = 1;


DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信openid',
  `role` tinyint(1) not null COMMENT '1buyer2seller', 
  `create_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家信息表' ROW_FORMAT = Dynamic;
