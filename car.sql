/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : auto_display
 Author								 : wuxi
 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 30/03/2023 22:07:37
*/
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for car_brand
-- ----------------------------
DROP TABLE IF EXISTS car_brand;
CREATE TABLE car_brand (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  name VARCHAR(50) NOT NULL COMMENT '品牌名称',
  logo VARCHAR(255) NOT NULL COMMENT '品牌Logo',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of car_brand
-- ----------------------------
INSERT INTO car_brand (id, name, logo) VALUES
(1, 'Toyota', 'https://img1.baidu.com/it/u=3541894318,1226852152&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1680541200&t=fe063808aea1e7c1e717b8388f8e7911'),
(2, 'Honda', 'https://img0.baidu.com/it/u=110755224,1310703387&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1680541200&t=9a592a95f0b544ed0e8e6ff3ef2d8413'),
(3, 'Ford', 'https://img2.baidu.com/it/u=517661408,1583636334&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1680541200&t=643f1c0a4649a484bda1e15466902a0c'),
(4, 'Nissan', 'https://img1.baidu.com/it/u=1320999440,2339853204&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1680541200&t=c9ca0ac82712490874df53dc75dbf946'),
(5, 'BMW', 'https://img0.baidu.com/it/u=869637323,43464939&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1680541200&t=49542589ff2c5c72ca152f7506c22f48');

-- ----------------------------
-- Table structure for car_series
-- ----------------------------
DROP TABLE IF EXISTS car_series;
CREATE TABLE car_series (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  name VARCHAR(50) NOT NULL COMMENT '系列名称',
  brand_id BIGINT UNSIGNED NOT NULL COMMENT '外键，关联car_brand表',
  PRIMARY KEY (id),
  KEY idx_car_series_brand_id (brand_id),
  CONSTRAINT fk_car_series_brand_id FOREIGN KEY (brand_id) REFERENCES car_brand (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of car_series
-- ----------------------------
INSERT INTO car_series (id, name, brand_id) VALUES
(1, 'Camry', 1),
(2, 'Accord', 2),
(3, 'F-150', 3),
(4, 'Altima', 4),
(5, '3 Series', 5);

-- ----------------------------
-- Table structure for car_model
-- ----------------------------
DROP TABLE IF EXISTS car_model;
CREATE TABLE car_model (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  name VARCHAR(50) NOT NULL COMMENT '车型名称',
  series_id BIGINT UNSIGNED NOT NULL COMMENT '外键，关联car_series表',
  price DECIMAL(10, 2) NOT NULL COMMENT '车型价格',
  description TEXT NOT NULL COMMENT '车型描述',
  photo VARCHAR(255) NOT NULL COMMENT '车型照片',
  release_date DATE NOT NULL COMMENT '发售日期',
  PRIMARY KEY (id),
  KEY idx_car_model_series_id (series_id),
  CONSTRAINT fk_car_model_series_id FOREIGN KEY (series_id) REFERENCES car_series (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of car_model
-- ----------------------------
INSERT INTO car_model (id, name, series_id, price, description, photo, release_date) VALUES
(1, 'Camry L', 1, 24950.00, 'This is a basic Camry model with a 2.5L 4-cylinder engine.', 'https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/3fbcb16f-8a68-4732-bd39-70921bf91371/5f6b642d-8bd3-4f98-a816-385510c1f5ba.png', '2021-06-01'),
(2, 'Accord LX', 2, 24270.00, 'This is a basic Accord model with a 1.5L turbocharged engine.', 'https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/7d5477ea-c625-467d-b978-9b4dbb062200/1bff5bbe-33b4-4a51-832b-15f3939fd450.png', '2021-07-01'),
(3, 'F-150 XL', 3, 28814.00, 'This is a basic F-150 model with a 3.3L V6 engine.', 'https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/a9cea891-99b7-4db2-81c7-486feebb4447/9a5b1536-928a-4b3c-a82b-d3956cf955a8.png', '2021-08-01'),
(4, 'Altima 2.5 S', 4, 24370.00, 'This is a basic Altima model with a 2.5L 4-cylinder engine.', 'https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/347e8da1-dee1-4479-a29f-9035909008b2/b993b92f-ba36-467d-932e-6b77dfbb2867.png', '2021-09-01'),
(5, '330i', 5, 41700.00, 'This is a basic 3 Series model with a 2.0L turbocharged engine.', 'https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/93c4b091-4f7e-45d3-8754-7eb0b7958134/92b94648-85e6-4b52-addd-5fb23d2ab108.png', '2021-10-01');

-- ----------------------------
-- Table structure for car_config
-- ----------------------------
DROP TABLE IF EXISTS car_config;
CREATE TABLE car_config (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  name VARCHAR(50) NOT NULL COMMENT '配置名称',
  value VARCHAR(255) NOT NULL COMMENT '配置值',
  model_id BIGINT UNSIGNED NOT NULL COMMENT '外键，关联car_model表',
  PRIMARY KEY (id),
  KEY idx_car_config_model_id (model_id),
  CONSTRAINT fk_car_config_model_id FOREIGN KEY (model_id) REFERENCES car_model (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of car_config
-- ----------------------------
INSERT INTO car_config (id, name, value, model_id) VALUES
(1, 'Engine Type', '4-Cylinder', 1),
(2, 'Exterior Color', 'White', 1),
(3, 'Engine Type', 'Turbocharged', 2),
(4, 'Exterior Color', 'Red', 2),
(5, 'Engine Type', 'V6', 3),
(6, 'Exterior Color', 'Blue', 3),
(7, 'Engine Type', '4-Cylinder', 4),
(8, 'Exterior Color', 'Black', 4),
(9, 'Engine Type', 'Turbocharged', 5),
(10, 'Exterior Color', 'Silver', 5);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  username VARCHAR(50) NOT NULL COMMENT '用户名',
  password VARCHAR(255) NOT NULL COMMENT '密码',
  role tinyint(4) NOT NULL DEFAULT 3 COMMENT '角色（1:经理/2:管理员/3:访客）',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user (username, password, role)
VALUES 
    ('admin', 'password', 0),
    ('guest1', 'password', 2),
    ('guest2', 'password', 2),
    ('guest3', 'password', 2),
    ('guest4', 'password', 2);

-- ----------------------------
-- Table structure for `car_like`
-- ----------------------------
DROP TABLE IF EXISTS `car_like`;
CREATE TABLE `car_like` (
  `id` BIGINT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `car_model_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `car_model_id` (`car_model_id`) USING BTREE,
  CONSTRAINT `car_like_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `car_like_ibfk_2` FOREIGN KEY (`car_model_id`) REFERENCES `car_model` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of car_like
-- ----------------------------
INSERT INTO `car_like` (`id`, `user_id`, `car_model_id`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 1),
(4, 4, 4),
(5, 5, 3),
(6, 4, 1),
(7, 2, 2),
(8, 4, 1),
(9, 5, 2),
(10, 2, 3);

SET FOREIGN_KEY_CHECKS = 1;
