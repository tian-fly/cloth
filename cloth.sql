/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : cloth

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-02-21 22:19:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) NOT NULL,
  `login_ip` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态： 1：启用 2：停用',
  `login_time` int(11) DEFAULT NULL,
  `tel` char(11) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '1' COMMENT '是否可以删除 1：是 0：否',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'tian', '123456', '127.0.0.1', '1', '1576330022', '13554561111', '1', '1', '1573910555', '1576328557', null);
INSERT INTO `admin` VALUES ('2', 'lili', '123456', '127.0.0.1', '1', '1573548059', '13554561121', '1', '5', '1573910599', '1573548059', null);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播图位置',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '首页顶部', null, '1573891928', null);

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL COMMENT '商品',
  `banner_id` int(11) NOT NULL COMMENT '所属轮播图的ID',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES ('1', '60', '1', '1', null, '1573890701', null);
INSERT INTO `banner_item` VALUES ('2', '61', '34', '1', null, null, null);
INSERT INTO `banner_item` VALUES ('4', '62', '35', '1', null, '1573890721', null);
INSERT INTO `banner_item` VALUES ('5', '63', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `centerImg_id` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '女士上装', null, '0', null, '1573008857', null);
INSERT INTO `category` VALUES ('2', '女士下装', null, '0', null, null, null);
INSERT INTO `category` VALUES ('3', '女士外套', null, '0', null, null, null);
INSERT INTO `category` VALUES ('4', '男士上装', null, '0', null, null, null);
INSERT INTO `category` VALUES ('5', '男士下装', null, '0', null, null, null);
INSERT INTO `category` VALUES ('6', '男士外套', null, '0', null, null, null);
INSERT INTO `category` VALUES ('7', '套装', null, '0', null, null, null);
INSERT INTO `category` VALUES ('8', 'T恤', '23', '1', null, '1573008974', null);
INSERT INTO `category` VALUES ('9', '衬衫', '24', '1', null, null, null);
INSERT INTO `category` VALUES ('10', '针织衫', '25', '1', null, null, null);
INSERT INTO `category` VALUES ('11', '毛衣', '26', '1', null, null, null);
INSERT INTO `category` VALUES ('12', '马夹', '27', '1', null, null, null);
INSERT INTO `category` VALUES ('13', '休闲裤', '28', '2', null, null, null);
INSERT INTO `category` VALUES ('14', '牛仔裤', '29', '2', null, null, null);
INSERT INTO `category` VALUES ('15', '阔腿裤', '30', '2', null, null, null);
INSERT INTO `category` VALUES ('16', '背带裤', '31', '2', null, null, null);
INSERT INTO `category` VALUES ('17', '外套', '32', '3', null, null, null);
INSERT INTO `category` VALUES ('18', '风衣', '33', '3', null, null, null);
INSERT INTO `category` VALUES ('19', '羽绒服', '34', '3', null, null, null);
INSERT INTO `category` VALUES ('20', '棉衣', '35', '3', null, null, null);
INSERT INTO `category` VALUES ('21', '连衣裙', '36', '7', null, null, null);
INSERT INTO `category` VALUES ('22', '半身裙', '37', '7', null, null, null);
INSERT INTO `category` VALUES ('23', '百褶裙', '38', '7', null, null, null);
INSERT INTO `category` VALUES ('24', '短袖T恤', '39', '4', null, null, null);
INSERT INTO `category` VALUES ('26', '长袖衬衫', '41', '4', null, null, null);
INSERT INTO `category` VALUES ('28', '短裤', '42', '5', null, null, null);
INSERT INTO `category` VALUES ('29', '休闲裤', '43', '5', null, null, null);
INSERT INTO `category` VALUES ('30', '牛仔裤', '44', '5', null, null, null);
INSERT INTO `category` VALUES ('31', '风衣', '45', '6', null, null, null);
INSERT INTO `category` VALUES ('32', '西装', '46', '6', null, null, null);
INSERT INTO `category` VALUES ('33', '马甲/背心', '47', '6', null, null, null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论类容',
  `star` int(8) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `standard_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '好看，好看', '5', '1', '2', '2', '1', '1573210222', '1573210222', null);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `content` varchar(160) NOT NULL,
  `user_id` int(8) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:可删除',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '66666', '1', '1', '1570091286', '1570091286', null);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/head/20191111\\f4e1e7dae3fe1f2d1799d6e2a20650f1.jpg', null, '1573484197', null);
INSERT INTO `image` VALUES ('8', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/color/20191108\\fa77f484455f0eb8995090c2aac7790c.jpg', null, '1573200206', null);
INSERT INTO `image` VALUES ('9', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/color/20191107\\ea3eac7e75c94e6d34e191cf24482345.jpg', null, '1573093810', null);
INSERT INTO `image` VALUES ('23', '/images/女士上装/T恤/a/20191114\\f17d6e1c71084ac4b9dad86c673fae15.jpg', null, '1573721132', null);
INSERT INTO `image` VALUES ('24', '/images/女士上装/衬衫/a/20191114\\b6e1db43ccc8c1c9dbacc0b41b3a1506.jpg', null, '1573721203', null);
INSERT INTO `image` VALUES ('25', '/images/女士上装/针织衫/a/20191114\\8f3aee3dbda46410f2f78e9c7960a678.jpg', null, '1573721214', null);
INSERT INTO `image` VALUES ('26', '/images/女士上装/毛衣/a/20191114\\55b62c9420b3608994627f8c913149e3.jpg', null, '1573721224', null);
INSERT INTO `image` VALUES ('27', '/images/女士上装/马夹/a/20191114\\f0177b5a33cb1949e7215afb3d1e6777.jpg', null, '1573721234', null);
INSERT INTO `image` VALUES ('28', '/images/女士下装/休闲裤/a/20191114\\085a5ea335de7f23b742431e8206d18a.jpg', null, '1573721258', null);
INSERT INTO `image` VALUES ('29', '/images/女士下装/牛仔裤/a/20191114\\c9539e9249743faea53425a15d1b8cf6.jpg', null, '1573721276', null);
INSERT INTO `image` VALUES ('30', '/images/女士下装/阔腿裤/a/20191114\\c04e9b0595ee3633ee30dd9162f225b7.jpg', null, '1573721286', null);
INSERT INTO `image` VALUES ('31', '/images/女士下装/背带裤/a/20191114\\22cfa07e52699f6ce8ad8fbb65544794.jpg', null, '1573721296', null);
INSERT INTO `image` VALUES ('32', '/images/女士外套/外套/a/20191114\\976924322e3b5e1c339559edb9fcfb7f.jpg', null, '1573721322', null);
INSERT INTO `image` VALUES ('33', '/images/女士外套/风衣/a/20191114\\a2b38561d5e96654b10c0a1220f1fba5.jpg', null, '1573721332', null);
INSERT INTO `image` VALUES ('34', '/images/女士外套/羽绒服/a/20191114\\d95398763fbc500e944a7f9b1cde9b42.jpg', null, '1573721343', null);
INSERT INTO `image` VALUES ('35', '/images/女士外套/棉衣/a/20191114\\21fdfa7528cdfa96b7eb75db87967a87.jpg', null, '1573721353', null);
INSERT INTO `image` VALUES ('36', '/images/套装/连衣裙/a/20191114\\09ce574c3d50dce3895dba3127a0d802.jpg', null, '1573721584', null);
INSERT INTO `image` VALUES ('37', '/images/套装/半身裙/a/20191114\\b37c197f03f45df00ca648809f1289ef.jpg', null, '1573721593', null);
INSERT INTO `image` VALUES ('38', '/images/套装/百褶裙/a/20191114\\3976ec81e1da8c928bbae14a5e6e58ec.jpg', null, '1573721603', null);
INSERT INTO `image` VALUES ('39', '/images/男士上装/短袖T恤/a/20191114\\b3b802423fd87522f5adaba29fbcbd09.png', null, '1573721378', null);
INSERT INTO `image` VALUES ('40', '/images/男士上装/长袖T恤/a/20191114\\b3b802423fd87522f5adaba29fbcbd02.png', null, null, null);
INSERT INTO `image` VALUES ('41', '/images/男士上装/长袖衬衫/a/20191114\\97cd559a1784522a2ca6128fa85c89db.png', null, '1573721404', null);
INSERT INTO `image` VALUES ('42', '/images/男士下装/短裤/a/20191114\\a3a18610cff406e5abf280852deaecb3.png', null, '1573721440', null);
INSERT INTO `image` VALUES ('43', '/images/男士下装/休闲裤/a/20191114\\4c245f9aac2c0984af55e6c4a9b37fae.png', null, '1573721450', null);
INSERT INTO `image` VALUES ('44', '/images/男士下装/牛仔裤/a/20191114\\82a967f1dadb0d7037deef43eb7fe940.png', null, '1573721460', null);
INSERT INTO `image` VALUES ('45', '/images/男士外套/风衣/a/20191114\\e5b16d8f1bc09e8027df040f3fffbd70.png', null, '1573721519', null);
INSERT INTO `image` VALUES ('46', '/images/男士外套/西装/a/20191114\\b02ee74fedd3ebe76c3c0a921488a568.png', null, '1573721530', null);
INSERT INTO `image` VALUES ('47', '/images/男士外套/马甲/背心/a/20191114\\d5939ba303b5ef044896804ac6c4d253.png', null, '1573721556', null);
INSERT INTO `image` VALUES ('54', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/body/20191107\\c4d695df5540dee2e71a03d1d3bc1843.jpg', '1573095285', '1573095285', null);
INSERT INTO `image` VALUES ('55', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/body/20191107\\6127283f1331097899af5b2efd34a253.jpg', '1573095286', '1573095286', null);
INSERT INTO `image` VALUES ('56', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/body/20191107\\606ea5241d8cdfde9272d7df0522d8cd.jpg', '1573095287', '1573095287', null);
INSERT INTO `image` VALUES ('57', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/body/20191107\\b931a8538b9f748a68462798d486f771.jpg', '1573095288', '1573095288', null);
INSERT INTO `image` VALUES ('58', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/body/20191107\\50471111ea99a46c665ef2db4402a22a.jpg', '1573095288', '1573095288', null);
INSERT INTO `image` VALUES ('59', '/images/女士上装/T恤/美特斯邦威/【纯色百搭 清新休闲】夏季新款女装短袖t恤纯色打底衫女式t恤/head/20191107\\57e3aa7af1185018dfb672063fea6ad2.jpg', '1573113002', '1573113092', null);
INSERT INTO `image` VALUES ('60', '/images/banner/首页顶部/item/20191115\\b88c3123e00b6bee75a569827618f0b9.jpg', null, '1573812316', null);
INSERT INTO `image` VALUES ('61', '/images/banner/首页顶部/item/20191115\\0e0257281b0e0a5a832604894073c0c9.jpg', null, '1573812336', null);
INSERT INTO `image` VALUES ('62', '/images/banner/首页顶部/item/20191115\\29df36f139af8c30bbed8748c78e2f4f.jpg', null, '1573812400', null);
INSERT INTO `image` VALUES ('63', '/images/banner/首页顶部/item/20191115\\3decc33708dbfebcf0a6ec68b5613e82.jpg', null, '1573812419', null);
INSERT INTO `image` VALUES ('64', '/images/女士上装/T恤/美特斯邦威/【纯色百搭 清新休闲】夏季新款女装短袖t恤纯色打底衫女式t恤/color/20191111\\de2e76d1a66b4c3d28d108fd1fa55534.jpg', '1573135945', '1573484808', null);
INSERT INTO `image` VALUES ('65', '/images/女士上装/T恤/OopsCiah/初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T/head/20191111\\9b39fd77b3803dec73cda956df9bbd4d.jpg', '1573484905', '1573484976', null);
INSERT INTO `image` VALUES ('66', '/images/女士上装/T恤/OopsCiah/初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T/body/20191111\\a6885ec2b757ab5a6403ea6947568208.jpg', '1573485152', '1573485152', null);
INSERT INTO `image` VALUES ('68', '/images/女士上装/T恤/OopsCiah/初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T/body/20191111\\a5e6142bb95b910e6ec43404e9bb279a.jpg', '1573485155', '1573485155', null);
INSERT INTO `image` VALUES ('69', '/images/女士上装/T恤/OopsCiah/初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T/color/20191111\\560b86baeefd83a7d9f12fe7ad9aa314.jpg', '1573485201', '1573485342', null);
INSERT INTO `image` VALUES ('70', '/images/女士上装/T恤/OopsCiah/初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T/color/20191111\\8ace0238dc858ea9d7b55eebdc67877b.jpg', '1573485216', '1573485216', null);
INSERT INTO `image` VALUES ('71', '/images/女士上装/T恤/OopsCiah/初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T/body/20191111\\dac62541d04c521da151ef3f63497360.jpg', '1573485434', '1573485434', null);
INSERT INTO `image` VALUES ('72', '/images/女士上装/T恤/OopsCiah/初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T/body/20191111\\6062559c5773e2504837a0562ebaf508.jpg', '1573485434', '1573485434', null);
INSERT INTO `image` VALUES ('75', '/images/女士上装/T恤/翰代维/长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤/head/20191117\\f8f28f7b0f8a70e1d8e3f36e7d6bd5b3.jpg', '1573985684', '1573985684', null);
INSERT INTO `image` VALUES ('76', '/images/女士上装/T恤/翰代维/长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤/color/20191117\\8a88f6fd256bd76895897a5a26d6818c.jpg', '1573985773', '1573985773', null);
INSERT INTO `image` VALUES ('77', '/images/女士上装/T恤/翰代维/长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤/body/20191117\\52a947d3403c2e12db50ce47da65f68e.jpg', '1573985880', '1573985880', null);
INSERT INTO `image` VALUES ('78', '/images/女士上装/T恤/翰代维/长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤/body/20191117\\9ef2818771a6aa87e5bca48df80b613d.jpg', '1573985881', '1573985881', null);
INSERT INTO `image` VALUES ('79', '/images/女士上装/T恤/翰代维/长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤/body/20191117\\efa67c3be44109768fd98356fa2e8cc6.jpg', '1573985883', '1573985883', null);
INSERT INTO `image` VALUES ('80', '/images/女士上装/T恤/翰代维/长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤/body/20191117\\f9c537fadb19d4fc2433a40bad473872.jpg', '1573985884', '1573985884', null);
INSERT INTO `image` VALUES ('81', '/images/女士上装/T恤/翰代维/长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤/color/20191117\\2b8cb8112754040b73c899eb561acc2e.jpg', '1573987017', '1573987017', null);
INSERT INTO `image` VALUES ('82', '/images/女士上装/T恤/慕诗涵/秋冬季新品时尚翻领拼接款休闲百搭长袖T恤/head/20191117\\795e704bf1038e04eec3ab6ce701f53e.jpg', '1573987809', '1573987809', null);
INSERT INTO `image` VALUES ('83', '/images/女士上装/T恤/慕诗涵/秋冬季新品时尚翻领拼接款休闲百搭长袖T恤/color/20191117\\1805fa78c28aa15a2a81fee3a42b1a37.jpg', '1573987833', '1573987833', null);
INSERT INTO `image` VALUES ('84', '/images/女士上装/T恤/慕诗涵/秋冬季新品时尚翻领拼接款休闲百搭长袖T恤/body/20191117\\3b8c28371381116a0e503349b7114799.jpg', '1573987869', '1573987869', null);
INSERT INTO `image` VALUES ('85', '/images/女士上装/T恤/慕诗涵/秋冬季新品时尚翻领拼接款休闲百搭长袖T恤/body/20191117\\aac028debc40bfda12109cdee6b187d9.jpg', '1573987870', '1573987870', null);
INSERT INTO `image` VALUES ('86', '/images/女士上装/T恤/慕诗涵/秋冬季新品时尚翻领拼接款休闲百搭长袖T恤/body/20191117\\5f105fab73460f63ee84e92b9db00334.jpg', '1573987870', '1573987870', null);
INSERT INTO `image` VALUES ('87', '/images/女士上装/T恤/RARAMAX/百搭金丝绒网纱拼接打底衫百搭修身圆领长袖t恤上衣/head/20191117\\70327af15447e8d2d49ad699aa48a32b.jpg', '1573988072', '1573988093', null);
INSERT INTO `image` VALUES ('88', '/images/女士上装/T恤/RARAMAX/百搭金丝绒网纱拼接打底衫百搭修身圆领长袖t恤上衣/color/20191117\\17123b77930e4620916f6ae14045f4f9.jpg', '1573988104', '1573988104', null);
INSERT INTO `image` VALUES ('89', '/images/女士上装/T恤/RARAMAX/百搭金丝绒网纱拼接打底衫百搭修身圆领长袖t恤上衣/body/20191117\\4e4d38af0089bc42a90774881484e9ac.jpg', '1573988127', '1573988127', null);
INSERT INTO `image` VALUES ('90', '/images/女士上装/T恤/RARAMAX/百搭金丝绒网纱拼接打底衫百搭修身圆领长袖t恤上衣/body/20191117\\d2ebd174b769ee55f76c2db722dcfb15.jpg', '1573988127', '1573988127', null);
INSERT INTO `image` VALUES ('91', '/images/女士上装/T恤/RARAMAX/百搭金丝绒网纱拼接打底衫百搭修身圆领长袖t恤上衣/body/20191117\\e8d9d0cc682c2a087320502e8484ae80.jpg', '1573988128', '1573988128', null);
INSERT INTO `image` VALUES ('92', '/images/女士上装/T恤/RARAMAX/百搭金丝绒网纱拼接打底衫百搭修身圆领长袖t恤上衣/body/20191117\\9d49403f45ce4d35aa659448b781be2f.jpg', '1573988129', '1573988129', null);
INSERT INTO `image` VALUES ('93', '/images/女士上装/T恤/promone/2019秋冬新款时尚撞色条纹t恤女百搭印花圆领休闲长袖t恤上衣/head/20191117\\27d3cb2b4b0183d219ca3650d1178445.jpg', '1573988331', '1573988331', null);
INSERT INTO `image` VALUES ('94', '/images/女士上装/T恤/promone/2019秋冬新款时尚撞色条纹t恤女百搭印花圆领休闲长袖t恤上衣/body/20191117\\c837a3da4593b025a418ac0068530710.jpg', '1573988353', '1573988353', null);
INSERT INTO `image` VALUES ('95', '/images/女士上装/T恤/promone/2019秋冬新款时尚撞色条纹t恤女百搭印花圆领休闲长袖t恤上衣/body/20191117\\b9009ccf83c9c9c94378b712c7816da8.jpg', '1573988353', '1573988353', null);
INSERT INTO `image` VALUES ('96', '/images/女士上装/T恤/promone/2019秋冬新款时尚撞色条纹t恤女百搭印花圆领休闲长袖t恤上衣/body/20191117\\b8cb484e6cf3c8f98493046a28b2c3c9.jpg', '1573988354', '1573988354', null);
INSERT INTO `image` VALUES ('97', '/images/女士上装/T恤/promone/2019秋冬新款时尚撞色条纹t恤女百搭印花圆领休闲长袖t恤上衣/body/20191117\\3179919ef93dab344ec826c9ae78ed56.jpg', '1573988355', '1573988355', null);
INSERT INTO `image` VALUES ('98', '/images/女士上装/T恤/promone/2019秋冬新款时尚撞色条纹t恤女百搭印花圆领休闲长袖t恤上衣/color/20191117\\d4e6138f4ac5d9537d52013862b17f6c.jpg', '1573988367', '1573988367', null);
INSERT INTO `image` VALUES ('99', '/images/女士上装/T恤/拓路者/秋冬新款韩版宽松T恤圆领长袖上衣不规则打底衫基础百搭女式T恤/head/20191117\\691170f189459b7b89bb531e9e800f62.jpg', '1573988591', '1573988591', null);
INSERT INTO `image` VALUES ('100', '/images/女士上装/T恤/拓路者/秋冬新款韩版宽松T恤圆领长袖上衣不规则打底衫基础百搭女式T恤/body/20191117\\7541d17a9510ecaabcaacff29f3c92bd.jpg', '1573988642', '1573988642', null);
INSERT INTO `image` VALUES ('101', '/images/女士上装/T恤/拓路者/秋冬新款韩版宽松T恤圆领长袖上衣不规则打底衫基础百搭女式T恤/body/20191117\\e08e8d45cb91577591a926939b708080.jpg', '1573988642', '1573988642', null);
INSERT INTO `image` VALUES ('102', '/images/女士上装/T恤/拓路者/秋冬新款韩版宽松T恤圆领长袖上衣不规则打底衫基础百搭女式T恤/body/20191117\\874da0d53b12b3d038d00e29e4e4daeb.jpg', '1573988643', '1573988643', null);
INSERT INTO `image` VALUES ('103', '/images/女士上装/T恤/拓路者/秋冬新款韩版宽松T恤圆领长袖上衣不规则打底衫基础百搭女式T恤/body/20191117\\c6f6dfe241e55f33ceac41eef503a87a.jpg', '1573988643', '1573988643', null);
INSERT INTO `image` VALUES ('104', '/images/女士上装/T恤/拓路者/秋冬新款韩版宽松T恤圆领长袖上衣不规则打底衫基础百搭女式T恤/color/20191117\\8ded03245a6d9ba6033b143a0fd4a811.jpg', '1573988657', '1573988657', null);
INSERT INTO `image` VALUES ('105', '/images/女士上装/T恤/MBSKY/女士韩版修身潮流拼接蕾丝圆领打底衫t恤 长袖T恤/head/20191118\\aca18cd9775b6bca531f3246923a065e.jpg', '1573989083', '1574073383', null);
INSERT INTO `image` VALUES ('106', '/images/女士上装/T恤/MBSKY/女士韩版修身潮流拼接蕾丝圆领打底衫t恤 长袖T恤/body/20191117\\6a1ffc0132f52839a5a504782d9ce698.jpg', '1573989104', '1573989104', null);
INSERT INTO `image` VALUES ('107', '/images/女士上装/T恤/MBSKY/女士韩版修身潮流拼接蕾丝圆领打底衫t恤 长袖T恤/body/20191117\\6214ba9302062b7cf1d9346803c1907f.jpg', '1573989105', '1573989105', null);
INSERT INTO `image` VALUES ('108', '/images/女士上装/T恤/MBSKY/女士韩版修身潮流拼接蕾丝圆领打底衫t恤 长袖T恤/body/20191117\\58b7dbf6caf932e8c91b25ddc6fb3acf.jpg', '1573989106', '1573989106', null);
INSERT INTO `image` VALUES ('109', '/images/女士上装/T恤/MBSKY/女士韩版修身潮流拼接蕾丝圆领打底衫t恤 长袖T恤/color/20191117\\d32faea26178599e93da907aaaef36dd.jpg', '1573989117', '1573989117', null);
INSERT INTO `image` VALUES ('110', '/images/女士上装/T恤/MBSKY/女士韩版修身潮流拼接蕾丝圆领打底衫t恤 长袖T恤/color/20191117\\fb4a4e38922fc924fddb1fa6d55979e5.jpg', '1573989127', '1573989127', null);
INSERT INTO `image` VALUES ('111', '/images/女士上装/T恤/promone/2019秋冬新款百搭弹力长袖半高领长袖t恤女字母印花袖套头上衣/head/20191117\\91b5449c219574b2af79a67e60540aa1.jpg', '1573989352', '1573989352', null);
INSERT INTO `image` VALUES ('112', '/images/女士上装/T恤/promone/2019秋冬新款百搭弹力长袖半高领长袖t恤女字母印花袖套头上衣/body/20191117\\97af479d4a9609697b1de53322f5c8cc.jpg', '1573989372', '1573989372', null);
INSERT INTO `image` VALUES ('113', '/images/女士上装/T恤/promone/2019秋冬新款百搭弹力长袖半高领长袖t恤女字母印花袖套头上衣/body/20191117\\0c1c1b36979cab0c128b242b59d3dd03.jpg', '1573989373', '1573989373', null);
INSERT INTO `image` VALUES ('114', '/images/女士上装/T恤/promone/2019秋冬新款百搭弹力长袖半高领长袖t恤女字母印花袖套头上衣/body/20191117\\f1a199f27e903225c1882364b4e30870.jpg', '1573989373', '1573989373', null);
INSERT INTO `image` VALUES ('115', '/images/女士上装/T恤/promone/2019秋冬新款百搭弹力长袖半高领长袖t恤女字母印花袖套头上衣/body/20191117\\c83ca60cb12f8cfbbf2e887d2b53222c.jpg', '1573989374', '1573989374', null);
INSERT INTO `image` VALUES ('116', '/images/女士上装/T恤/promone/2019秋冬新款百搭弹力长袖半高领长袖t恤女字母印花袖套头上衣/color/20191117\\da861565449c2ba1c62e1b7fc9926e70.jpg', '1573989385', '1573989385', null);
INSERT INTO `image` VALUES ('117', '/images/女士上装/衬衫/戈玛蒂/潮流设计风波点小衫女2019秋季新款法式浪漫娃娃领衬衫/head/20191119\\282b162426b08c04dfd43ab05195650c.jpg', '1574147537', '1574147537', null);
INSERT INTO `image` VALUES ('118', '/images/女士上装/衬衫/戈玛蒂/潮流设计风波点小衫女2019秋季新款法式浪漫娃娃领衬衫/body/20191119\\8adc30cb1a858b17051dd4c1903bb9d6.jpg', '1574147598', '1574147598', null);
INSERT INTO `image` VALUES ('119', '/images/女士上装/衬衫/戈玛蒂/潮流设计风波点小衫女2019秋季新款法式浪漫娃娃领衬衫/body/20191119\\4f0313028080167c5d828bac1da3ee2b.jpg', '1574147601', '1574147601', null);
INSERT INTO `image` VALUES ('120', '/images/女士上装/衬衫/戈玛蒂/潮流设计风波点小衫女2019秋季新款法式浪漫娃娃领衬衫/body/20191119\\a655c51e0ee2b9aaa271a4feb1c607be.jpg', '1574147601', '1574147601', null);
INSERT INTO `image` VALUES ('121', '/images/女士上装/衬衫/戈玛蒂/潮流设计风波点小衫女2019秋季新款法式浪漫娃娃领衬衫/body/20191119\\2e60ff8b5fee518ec87b0bcfd4bd8583.jpg', '1574147602', '1574147602', null);
INSERT INTO `image` VALUES ('122', '/images/女士上装/衬衫/戈玛蒂/潮流设计风波点小衫女2019秋季新款法式浪漫娃娃领衬衫/color/20191119\\acb8792c783ab844f98d4637dfeb3de4.jpg', '1574147632', '1574147632', null);
INSERT INTO `image` VALUES ('123', '/images/女士上装/衬衫/LWEST/2019秋季新品波点宽松雪纺长袖衬衫女款/head/20191119\\63229144fdd175fb953a360318444d60.jpg', '1574147677', '1574147677', null);
INSERT INTO `image` VALUES ('124', '/images/女士上装/衬衫/LWEST/2019秋季新品波点宽松雪纺长袖衬衫女款/body/20191119\\e9723f44cbb552c0aacbf6f4d14d709e.jpg', '1574147703', '1574147703', null);
INSERT INTO `image` VALUES ('125', '/images/女士上装/衬衫/LWEST/2019秋季新品波点宽松雪纺长袖衬衫女款/body/20191119\\c16595ddfe8e7d41fef91795e18c2d2e.jpg', '1574147704', '1574147704', null);
INSERT INTO `image` VALUES ('126', '/images/女士上装/衬衫/LWEST/2019秋季新品波点宽松雪纺长袖衬衫女款/body/20191119\\4215f5575047cc8e492cba46bb8dd119.jpg', '1574147704', '1574147704', null);
INSERT INTO `image` VALUES ('127', '/images/女士上装/衬衫/LWEST/2019秋季新品波点宽松雪纺长袖衬衫女款/body/20191119\\90584e4008a5364701da9571139205f1.jpg', '1574147705', '1574147705', null);
INSERT INTO `image` VALUES ('128', '/images/女士上装/衬衫/LWEST/2019秋季新品波点宽松雪纺长袖衬衫女款/color/20191119\\f9130fbef49a2bf7e6ab0da04cc2102d.jpg', '1574147720', '1574147720', null);
INSERT INTO `image` VALUES ('129', '/images/女士上装/衬衫/摩凡/秋冬新款优雅心形印花领口小香风系带衬衫女/head/20191119\\07252f9846d11b70e1ddceabf1888ed0.jpg', '1574147770', '1574147770', null);
INSERT INTO `image` VALUES ('130', '/images/女士上装/衬衫/摩凡/秋冬新款优雅心形印花领口小香风系带衬衫女/body/20191119\\dad03b7d59ad99ce546a1354faec2204.jpg', '1574147805', '1574147805', null);
INSERT INTO `image` VALUES ('131', '/images/女士上装/衬衫/摩凡/秋冬新款优雅心形印花领口小香风系带衬衫女/body/20191119\\44b1a99538dda6518f5021fc466b2ef7.jpg', '1574147806', '1574147806', null);
INSERT INTO `image` VALUES ('132', '/images/女士上装/衬衫/摩凡/秋冬新款优雅心形印花领口小香风系带衬衫女/body/20191119\\b5f481b22dfbc20e15af7734246503d3.jpg', '1574147806', '1574147806', null);
INSERT INTO `image` VALUES ('133', '/images/女士上装/衬衫/摩凡/秋冬新款优雅心形印花领口小香风系带衬衫女/body/20191119\\f8feffb6bdf13bb4b5beaaf198ff3433.jpg', '1574147807', '1574147807', null);
INSERT INTO `image` VALUES ('134', '/images/女士上装/衬衫/摩凡/秋冬新款优雅心形印花领口小香风系带衬衫女/color/20191119\\5dccfdd57969579624bbbce25bbda092.jpg', '1574149365', '1574149365', null);
INSERT INTO `image` VALUES ('135', '/images/女士上装/衬衫/摩凡/秋冬新款优雅心形印花领口小香风系带衬衫女/color/20191119\\026b4de309b2d11e2b4b0d3ee708e685.jpg', '1574149421', '1574149421', null);
INSERT INTO `image` VALUES ('136', '/images/女士上装/衬衫/BESSIE/2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫/head/20191119\\68f888f5396887782896c1569e36cda5.jpg', '1574149725', '1574149725', null);
INSERT INTO `image` VALUES ('137', '/images/女士上装/衬衫/BESSIE/2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫/body/20191119\\c9dcff9794af719e9d0b7087155c81db.jpg', '1574149747', '1574149747', null);
INSERT INTO `image` VALUES ('138', '/images/女士上装/衬衫/BESSIE/2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫/body/20191119\\df7d65461944e302d7dc3623e58afe00.jpg', '1574149748', '1574149748', null);
INSERT INTO `image` VALUES ('139', '/images/女士上装/衬衫/BESSIE/2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫/body/20191119\\02eb3f8377ab02a89e11b3b6797e3227.jpg', '1574149750', '1574149750', null);
INSERT INTO `image` VALUES ('140', '/images/女士上装/衬衫/BESSIE/2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫/body/20191119\\14ec62ed40db93d1c09cdc642c3fdc07.jpg', '1574149751', '1574149751', null);
INSERT INTO `image` VALUES ('141', '/images/女士上装/衬衫/BESSIE/2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫/body/20191119\\59e366a6a8b8e657f52129aca1fe803c.jpg', '1574149751', '1574149751', null);
INSERT INTO `image` VALUES ('142', '/images/女士上装/衬衫/BESSIE/2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫/color/20191119\\13180fe544d4edf3ba17bdc01500cf53.jpg', '1574149829', '1574149829', null);
INSERT INTO `image` VALUES ('143', '/images/女士上装/衬衫/BESSIE/2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫/color/20191119\\c3eee2235e13e353829fda5eef38a001.jpg', '1574149839', '1574149839', null);
INSERT INTO `image` VALUES ('144', '/images/女士上装/衬衫/戈玛蒂/经典休闲小衫女2019秋季新款时尚半透中袖衬衣/head/20191119\\7b478e7b6cbd8d833ea8932bf3e2ad93.jpg', '1574149894', '1574149894', null);
INSERT INTO `image` VALUES ('145', '/images/女士上装/衬衫/戈玛蒂/经典休闲小衫女2019秋季新款时尚半透中袖衬衣/body/20191119\\6c282a08880a2373742472fbef43320c.jpg', '1574149915', '1574149915', null);
INSERT INTO `image` VALUES ('146', '/images/女士上装/衬衫/戈玛蒂/经典休闲小衫女2019秋季新款时尚半透中袖衬衣/body/20191119\\11a452960528b6e8b1399679fb88677e.jpg', '1574149915', '1574149915', null);
INSERT INTO `image` VALUES ('147', '/images/女士上装/衬衫/戈玛蒂/经典休闲小衫女2019秋季新款时尚半透中袖衬衣/body/20191119\\4ba7072e3962eed584de71a595da761c.jpg', '1574149916', '1574149916', null);
INSERT INTO `image` VALUES ('148', '/images/女士上装/衬衫/戈玛蒂/经典休闲小衫女2019秋季新款时尚半透中袖衬衣/body/20191119\\429b5e2c705b42457d86fdc07df21a9c.jpg', '1574149916', '1574149916', null);
INSERT INTO `image` VALUES ('149', '/images/女士上装/衬衫/戈玛蒂/经典休闲小衫女2019秋季新款时尚半透中袖衬衣/color/20191119\\d73bb315e46d6dab7331be16df326707.jpg', '1574149935', '1574149935', null);
INSERT INTO `image` VALUES ('150', '/images/女士上装/衬衫/戈玛蒂/经典休闲小衫女2019秋季新款时尚半透中袖衬衣/color/20191119\\4c4ce17b17c264a1ea69befb60f78b78.jpg', '1574149973', '1574149973', null);
INSERT INTO `image` VALUES ('151', '/images/女士上装/衬衫/摩凡/优雅纯色气质领带雪纺女士衬衫/head/20191119\\d2a0a0e7a99cea7ae971e7a1c86a5210.jpg', '1574150021', '1574150021', null);
INSERT INTO `image` VALUES ('152', '/images/女士上装/衬衫/摩凡/优雅纯色气质领带雪纺女士衬衫/body/20191119\\748e1c6095055b579398012de68c8d20.jpg', '1574150039', '1574150039', null);
INSERT INTO `image` VALUES ('153', '/images/女士上装/衬衫/摩凡/优雅纯色气质领带雪纺女士衬衫/body/20191119\\63ca25498b24767579a605b08a06d7a0.jpg', '1574150040', '1574150040', null);
INSERT INTO `image` VALUES ('154', '/images/女士上装/衬衫/摩凡/优雅纯色气质领带雪纺女士衬衫/body/20191119\\67f8850b5c19e79023e583bcd14675f9.jpg', '1574150040', '1574150040', null);
INSERT INTO `image` VALUES ('155', '/images/女士上装/衬衫/摩凡/优雅纯色气质领带雪纺女士衬衫/body/20191119\\e1b85ad7af86447d85aa049b3f0aa48c.jpg', '1574150041', '1574150041', null);
INSERT INTO `image` VALUES ('156', '/images/女士上装/衬衫/摩凡/优雅纯色气质领带雪纺女士衬衫/color/20191119\\238e424f9c30c7bbfd69c928e8eecea6.jpg', '1574150145', '1574150145', null);
INSERT INTO `image` VALUES ('157', '/images/女士上装/针织衫/音卓/新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫/head/20191119\\af6e1ebb1ed8cba28a2aada283539ecd.jpg', '1574150204', '1574150204', null);
INSERT INTO `image` VALUES ('158', '/images/女士上装/针织衫/音卓/新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫/body/20191119\\911d149aae705e02c949245814e96fc7.jpg', '1574150230', '1574150230', null);
INSERT INTO `image` VALUES ('159', '/images/女士上装/针织衫/音卓/新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫/body/20191119\\db8a47acae3b230a461c7ff29eb2d9fc.jpg', '1574150230', '1574150230', null);
INSERT INTO `image` VALUES ('160', '/images/女士上装/针织衫/音卓/新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫/body/20191119\\23253a503918b891fde6f4487cc77cc9.jpg', '1574150231', '1574150231', null);
INSERT INTO `image` VALUES ('161', '/images/女士上装/针织衫/音卓/新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫/body/20191119\\760820e40ce8ee1b8ab38cb0450790aa.jpg', '1574150231', '1574150231', null);
INSERT INTO `image` VALUES ('162', '/images/女士上装/针织衫/音卓/新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫/color/20191119\\55fc62a5547d5b6b7ae58580f61f1694.jpg', '1574150252', '1574150252', null);
INSERT INTO `image` VALUES ('163', '/images/女士上装/针织衫/音卓/新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫/color/20191119\\6577d190d3b88dc1d2e53478516dc9a3.jpg', '1574150263', '1574150263', null);
INSERT INTO `image` VALUES ('164', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/head/20191119\\fced308f711f32f347edb78353b8e958.jpg', '1574150328', '1574150328', null);
INSERT INTO `image` VALUES ('165', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/body/20191119\\71fbdc35435d808912c2bcb93e81c246.jpg', '1574150349', '1574150349', null);
INSERT INTO `image` VALUES ('166', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/body/20191119\\d736d5ec978747f15cc5855781c6212b.jpg', '1574150350', '1574150350', null);
INSERT INTO `image` VALUES ('167', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/body/20191119\\67e7d63b096209862fa3fb0ff85fa798.jpg', '1574150351', '1574150351', null);
INSERT INTO `image` VALUES ('168', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/body/20191119\\68454dff34a652db33917b1d5a85e07c.jpg', '1574150351', '1574150351', null);
INSERT INTO `image` VALUES ('169', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/body/20191119\\758cdf6a093484acb7b163ab4a9aa847.jpg', '1574150351', '1574150351', null);
INSERT INTO `image` VALUES ('170', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/body/20191119\\3374443bc0aa09c24aaa05607159b93b.jpg', '1574150353', '1574150353', null);
INSERT INTO `image` VALUES ('171', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/color/20191119\\7f6a4bc19bcfe76e179197770386cea8.jpg', '1574150422', '1574150422', null);
INSERT INTO `image` VALUES ('172', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/color/20191119\\9d03b130aafb70f914598fc37ef37298.jpg', '1574150438', '1574150452', null);
INSERT INTO `image` VALUES ('173', '/images/女士上装/针织衫/LRUD/女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮/color/20191119\\9c0cf4faa8ad2f0bf885996b3d877334.jpg', '1574150464', '1574150464', null);
INSERT INTO `image` VALUES ('174', '/images/女士上装/针织衫/huagaa/秋冬女装新款V领单排彩色扣双口袋长袖针织开衫毛衣外套上衣/head/20191119\\596404861f2883a6787503c78baf1e80.jpg', '1574150502', '1574150502', null);
INSERT INTO `image` VALUES ('175', '/images/女士上装/针织衫/huagaa/秋冬女装新款V领单排彩色扣双口袋长袖针织开衫毛衣外套上衣/body/20191119\\2e0ab8d0e90c133cf05274fa2d296583.jpg', '1574150527', '1574150527', null);
INSERT INTO `image` VALUES ('176', '/images/女士上装/针织衫/huagaa/秋冬女装新款V领单排彩色扣双口袋长袖针织开衫毛衣外套上衣/body/20191119\\15ba3583340105f94088715ce5bff9d2.jpg', '1574150527', '1574150527', null);
INSERT INTO `image` VALUES ('177', '/images/女士上装/针织衫/huagaa/秋冬女装新款V领单排彩色扣双口袋长袖针织开衫毛衣外套上衣/body/20191119\\d4741f91e62d12730428f7dd6dbf1c88.jpg', '1574150528', '1574150528', null);
INSERT INTO `image` VALUES ('178', '/images/女士上装/针织衫/huagaa/秋冬女装新款V领单排彩色扣双口袋长袖针织开衫毛衣外套上衣/body/20191119\\8f3ab30ecb5a44e285e0e8b2a93d72e4.jpg', '1574150529', '1574150529', null);
INSERT INTO `image` VALUES ('179', '/images/女士上装/针织衫/huagaa/秋冬女装新款V领单排彩色扣双口袋长袖针织开衫毛衣外套上衣/color/20191119\\00123443e05241af4fd980bce665f24e.jpg', '1574150581', '1574150581', null);
INSERT INTO `image` VALUES ('180', '/images/女士上装/针织衫/LISA.LISA/简约通勤圆领秋装时尚宽松长袖打底针织衫女/head/20191119\\e7d9cccf7db9ca8792b76a8ac871bc8a.jpg', '1574150632', '1574150659', null);
INSERT INTO `image` VALUES ('181', '/images/女士上装/针织衫/LISA.LISA/简约通勤圆领秋装时尚宽松长袖打底针织衫女/body/20191119\\5c466055a91dcf7026ccad9f0dc0fb20.jpg', '1574150689', '1574150689', null);
INSERT INTO `image` VALUES ('182', '/images/女士上装/针织衫/LISA.LISA/简约通勤圆领秋装时尚宽松长袖打底针织衫女/body/20191119\\1448ff883b10169f76cfa7ee57e8e79b.jpg', '1574150689', '1574150689', null);
INSERT INTO `image` VALUES ('183', '/images/女士上装/针织衫/LISA.LISA/简约通勤圆领秋装时尚宽松长袖打底针织衫女/body/20191119\\727cb7a97fe5a631994c6cc8420f05fe.jpg', '1574150690', '1574150690', null);
INSERT INTO `image` VALUES ('184', '/images/女士上装/针织衫/LISA.LISA/简约通勤圆领秋装时尚宽松长袖打底针织衫女/body/20191119\\df7e15a518c3e0e8d97b801ddd23688d.jpg', '1574150690', '1574150690', null);
INSERT INTO `image` VALUES ('185', '/images/女士上装/针织衫/LISA.LISA/简约通勤圆领秋装时尚宽松长袖打底针织衫女/color/20191119\\71c6abb2ec6d161e85aedf9eb22b5efb.jpg', '1574151230', '1574151230', null);
INSERT INTO `image` VALUES ('186', '/images/女士上装/针织衫/吉牡/2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣/head/20191119\\4bc010c6bcfd7489c913fd614ccfece4.jpg', '1574151270', '1574151270', null);
INSERT INTO `image` VALUES ('187', '/images/女士上装/针织衫/吉牡/2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣/body/20191119\\495fa9caeb1d9aadde5bbf62d214e47f.jpg', '1574151285', '1574151285', null);
INSERT INTO `image` VALUES ('188', '/images/女士上装/针织衫/吉牡/2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣/body/20191119\\6e5a2076d4341ae81cdbd972367494aa.jpg', '1574151287', '1574151287', null);
INSERT INTO `image` VALUES ('189', '/images/女士上装/针织衫/吉牡/2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣/body/20191119\\f3a815f9c87dd5661bcb5a4a9d217e8c.jpg', '1574151287', '1574151287', null);
INSERT INTO `image` VALUES ('190', '/images/女士上装/针织衫/吉牡/2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣/body/20191119\\091fbe39c6e9b80c32be2d1bd4c0509d.jpg', '1574151291', '1574151291', null);
INSERT INTO `image` VALUES ('191', '/images/女士上装/针织衫/吉牡/2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣/color/20191119\\63a090a3991c6dd14b1d1812341cabcb.jpg', '1574151304', '1574151304', null);
INSERT INTO `image` VALUES ('192', '/images/女士上装/针织衫/吉牡/2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣/color/20191119\\9573bebc971e228617c83ad66d4d03f6.jpg', '1574151314', '1574151314', null);
INSERT INTO `image` VALUES ('193', '/images/女士上装/针织衫/ZIMMUR/条纹长袖蝴蝶结绑带喇叭袖设计立领镂空修身显瘦针织衫/head/20191119\\d1dd5fed98ca9d6a0f186e53a0c21b84.jpg', '1574151358', '1574151358', null);
INSERT INTO `image` VALUES ('194', '/images/女士上装/针织衫/ZIMMUR/条纹长袖蝴蝶结绑带喇叭袖设计立领镂空修身显瘦针织衫/body/20191119\\1dc91e4fa3ed56e073a7a3cb0c925cd3.jpg', '1574151380', '1574151380', null);
INSERT INTO `image` VALUES ('195', '/images/女士上装/针织衫/ZIMMUR/条纹长袖蝴蝶结绑带喇叭袖设计立领镂空修身显瘦针织衫/body/20191119\\192d1693310d890b4988ddcf7c1b0349.jpg', '1574151382', '1574151382', null);
INSERT INTO `image` VALUES ('196', '/images/女士上装/针织衫/ZIMMUR/条纹长袖蝴蝶结绑带喇叭袖设计立领镂空修身显瘦针织衫/body/20191119\\4afb22d26c1f945ac37fa5ab01cdfa71.jpg', '1574151382', '1574151382', null);
INSERT INTO `image` VALUES ('197', '/images/女士上装/针织衫/ZIMMUR/条纹长袖蝴蝶结绑带喇叭袖设计立领镂空修身显瘦针织衫/body/20191119\\9b9de394fb97ba8a714f15432f293e67.jpg', '1574151383', '1574151383', null);
INSERT INTO `image` VALUES ('198', '/images/女士上装/针织衫/ZIMMUR/条纹长袖蝴蝶结绑带喇叭袖设计立领镂空修身显瘦针织衫/color/20191119\\6a750a248c971cbe26e73f442c562f16.jpg', '1574151402', '1574151402', null);
INSERT INTO `image` VALUES ('199', '/images/女士上装/毛衣/GELU/2019秋季新款女式针织衫经典百搭毛衣/head/20191119\\395823c32d3df58cba7a9295e346bef1.jpg', '1574151479', '1574151479', null);
INSERT INTO `image` VALUES ('200', '/images/女士上装/毛衣/GELU/2019秋季新款女式针织衫经典百搭毛衣/body/20191119\\964712fbfe0ad9bb65b6f65f706eb852.jpg', '1574151496', '1574151496', null);
INSERT INTO `image` VALUES ('201', '/images/女士上装/毛衣/GELU/2019秋季新款女式针织衫经典百搭毛衣/body/20191119\\7b59456189af34b3e0b643b27ab4349e.jpg', '1574151498', '1574151498', null);
INSERT INTO `image` VALUES ('202', '/images/女士上装/毛衣/GELU/2019秋季新款女式针织衫经典百搭毛衣/body/20191119\\c1838f27db2f7ea8aabdbfb058830084.jpg', '1574151499', '1574151499', null);
INSERT INTO `image` VALUES ('203', '/images/女士上装/毛衣/GELU/2019秋季新款女式针织衫经典百搭毛衣/body/20191119\\b6d467de88d19802e6ae55f7b37200c6.jpg', '1574151500', '1574151500', null);
INSERT INTO `image` VALUES ('204', '/images/女士上装/毛衣/GELU/2019秋季新款女式针织衫经典百搭毛衣/color/20191119\\33d7022ceddefe99ed3ed8a0689e4d9d.jpg', '1574151517', '1574151517', null);
INSERT INTO `image` VALUES ('205', '/images/女士上装/毛衣/GELU/2019秋季新款女式针织衫经典百搭毛衣/color/20191119\\df085eec4381ecfe12ce73990c3b0b92.jpg', '1574151528', '1574151528', null);
INSERT INTO `image` VALUES ('206', '/images/女士上装/毛衣/翰代维/秋冬半高领毛衣长袖打底衫女针织衫/head/20191119\\38a1c31556ad0f173b48925a90c0279b.jpg', '1574151569', '1574151569', null);
INSERT INTO `image` VALUES ('207', '/images/女士上装/毛衣/翰代维/秋冬半高领毛衣长袖打底衫女针织衫/body/20191119\\19e19ed18671c15b88384e2498051ad7.jpg', '1574151589', '1574151589', null);
INSERT INTO `image` VALUES ('208', '/images/女士上装/毛衣/翰代维/秋冬半高领毛衣长袖打底衫女针织衫/body/20191119\\7cb9de78cb7a22164b17f532170b1222.jpg', '1574151591', '1574151591', null);
INSERT INTO `image` VALUES ('209', '/images/女士上装/毛衣/翰代维/秋冬半高领毛衣长袖打底衫女针织衫/body/20191119\\968b8c3b4ca44bc518a4ad387ee6c7e9.jpg', '1574151592', '1574151592', null);
INSERT INTO `image` VALUES ('210', '/images/女士上装/毛衣/翰代维/秋冬半高领毛衣长袖打底衫女针织衫/body/20191119\\6160aff9fcf503c52d14293035db1593.jpg', '1574151593', '1574151593', null);
INSERT INTO `image` VALUES ('211', '/images/女士上装/毛衣/翰代维/秋冬半高领毛衣长袖打底衫女针织衫/color/20191119\\62956d33fc3ed4ea3013867c146f48d9.jpg', '1574151611', '1574151611', null);
INSERT INTO `image` VALUES ('212', '/images/女士上装/毛衣/翰代维/秋冬半高领毛衣长袖打底衫女针织衫/color/20191119\\bbfd3414bcee7f48f9074a42042fd75b.jpg', '1574151717', '1574151717', null);
INSERT INTO `image` VALUES ('213', '/images/女士上装/毛衣/komilines/2019秋冬新款女式圆领毛衣宽松时尚动物图案刺绣套头上衣针织衫/head/20191119\\db3640bf29c9f353ba6867570ffc0df7.jpg', '1574151864', '1574151864', null);
INSERT INTO `image` VALUES ('214', '/images/女士上装/毛衣/komilines/2019秋冬新款女式圆领毛衣宽松时尚动物图案刺绣套头上衣针织衫/body/20191119\\740bc08e2b26740ea4dbbb5a72956c2f.jpg', '1574151895', '1574151895', null);
INSERT INTO `image` VALUES ('215', '/images/女士上装/毛衣/komilines/2019秋冬新款女式圆领毛衣宽松时尚动物图案刺绣套头上衣针织衫/body/20191119\\6acbe09c41d35ccafd641cc615e3c39b.jpg', '1574151896', '1574151896', null);
INSERT INTO `image` VALUES ('216', '/images/女士上装/毛衣/komilines/2019秋冬新款女式圆领毛衣宽松时尚动物图案刺绣套头上衣针织衫/body/20191119\\ad0b0a1d51275be1743f4b24f8f6ba4f.jpg', '1574151897', '1574151897', null);
INSERT INTO `image` VALUES ('217', '/images/女士上装/毛衣/komilines/2019秋冬新款女式圆领毛衣宽松时尚动物图案刺绣套头上衣针织衫/color/20191119\\9dd1d518873e657122f63692c3691202.jpg', '1574151913', '1574151913', null);
INSERT INTO `image` VALUES ('218', '/images/女士上装/毛衣/OUNIXUE/19秋冬新款时尚亮粉烫金波边半高领打底衫手缝珠扣T恤女式针织衫/head/20191119\\538000970af63084d332d10f59557b5a.jpg', '1574151955', '1574151955', null);
INSERT INTO `image` VALUES ('219', '/images/女士上装/毛衣/OUNIXUE/19秋冬新款时尚亮粉烫金波边半高领打底衫手缝珠扣T恤女式针织衫/body/20191119\\48e5c721f65410a23df8170948b466d3.jpg', '1574151974', '1574151974', null);
INSERT INTO `image` VALUES ('220', '/images/女士上装/毛衣/OUNIXUE/19秋冬新款时尚亮粉烫金波边半高领打底衫手缝珠扣T恤女式针织衫/body/20191119\\a11649229fd16b35468204cab6efd9d9.jpg', '1574151974', '1574151974', null);
INSERT INTO `image` VALUES ('221', '/images/女士上装/毛衣/OUNIXUE/19秋冬新款时尚亮粉烫金波边半高领打底衫手缝珠扣T恤女式针织衫/body/20191119\\89f10d075b8bcbb28456f36b91397dce.jpg', '1574151975', '1574151975', null);
INSERT INTO `image` VALUES ('222', '/images/女士上装/毛衣/OUNIXUE/19秋冬新款时尚亮粉烫金波边半高领打底衫手缝珠扣T恤女式针织衫/color/20191119\\5696d0a4bdf162357e114d9c255f6357.jpg', '1574151991', '1574151991', null);
INSERT INTO `image` VALUES ('223', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲/head/20191119\\6c6768ab4e61720861ae45ec4104c24a.jpg', '1574152129', '1574152129', null);
INSERT INTO `image` VALUES ('224', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲/color/20191119\\61fa8dc64cec3a32e79322b162a2ff47.jpg', '1574152146', '1574152146', null);
INSERT INTO `image` VALUES ('225', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲/color/20191119\\91ff0a11b6048fdb2dd91241f840e45d.jpg', '1574152162', '1574152162', null);
INSERT INTO `image` VALUES ('226', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲/body/20191119\\d2b9942bd4ccab0bd6bfbab09b186a97.jpg', '1574152181', '1574152181', null);
INSERT INTO `image` VALUES ('227', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲/body/20191119\\aa2f3ffb86fea92aa90e9b4f8a57817c.jpg', '1574152181', '1574152181', null);
INSERT INTO `image` VALUES ('228', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲/body/20191119\\9045553aac4078c4219468f6ed359e28.jpg', '1574152182', '1574152182', null);
INSERT INTO `image` VALUES ('229', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲/body/20191119\\7bf61fb6772a15e30edafb234079fac5.jpg', '1574152184', '1574152184', null);
INSERT INTO `image` VALUES ('230', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版女款马甲小个子格子立领无袖宽松保暖马夹/head/20191119\\6a9ce6f95dc8df9796ca69a845ad4e31.jpg', '1574152224', '1574152224', null);
INSERT INTO `image` VALUES ('231', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版女款马甲小个子格子立领无袖宽松保暖马夹/body/20191119\\472ff8f7f44f3426dd9a98d73852f2de.jpg', '1574152240', '1574152240', null);
INSERT INTO `image` VALUES ('232', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版女款马甲小个子格子立领无袖宽松保暖马夹/body/20191119\\485dbe82653d98d71bf4faeb9fcebb5b.jpg', '1574152241', '1574152241', null);
INSERT INTO `image` VALUES ('233', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版女款马甲小个子格子立领无袖宽松保暖马夹/body/20191119\\fa0b6c439c3c3133dce7d44091b1e619.jpg', '1574152242', '1574152242', null);
INSERT INTO `image` VALUES ('234', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版女款马甲小个子格子立领无袖宽松保暖马夹/body/20191119\\cd03ae3ebb867231c80e65efa415d443.jpg', '1574152242', '1574152242', null);
INSERT INTO `image` VALUES ('235', '/images/女士上装/马夹/艾欧唯/2019年冬新款韩版女款马甲小个子格子立领无袖宽松保暖马夹/color/20191119\\aa52327facd65d9f6e672ff32ed6c11f.jpg', '1574152259', '1574152259', null);
INSERT INTO `image` VALUES ('236', '/images/女士上装/马夹/SR/女款基础百搭纯色连帽保暖加厚棉服马夹/head/20191119\\33e61569595b059c4105208dc95c2aac.jpg', '1574152300', '1574152300', null);
INSERT INTO `image` VALUES ('237', '/images/女士上装/马夹/SR/女款基础百搭纯色连帽保暖加厚棉服马夹/body/20191119\\ce527ccc8e18ea8f8c718b82c0a8f6a1.jpg', '1574152318', '1574152318', null);
INSERT INTO `image` VALUES ('238', '/images/女士上装/马夹/SR/女款基础百搭纯色连帽保暖加厚棉服马夹/body/20191119\\df1d7dd790ebad982ddfc77fde8feb34.jpg', '1574152319', '1574152319', null);
INSERT INTO `image` VALUES ('239', '/images/女士上装/马夹/SR/女款基础百搭纯色连帽保暖加厚棉服马夹/body/20191119\\d3d7236a21dd808322e1b73890567f80.jpg', '1574152319', '1574152319', null);
INSERT INTO `image` VALUES ('240', '/images/女士上装/马夹/SR/女款基础百搭纯色连帽保暖加厚棉服马夹/color/20191119\\99daf9ff0ee82fdc03e903ba8b747fa1.jpg', '1574152415', '1574152415', null);
INSERT INTO `image` VALUES ('241', '/images/女士下装/休闲裤/苏醒的乐园/简约百搭女式休闲裤纯色丝绒加绒加厚开叉/head/20191119\\8ed38f18ed69a82461ffaf2250f9c2f5.jpg', '1574152504', '1574152504', null);
INSERT INTO `image` VALUES ('242', '/images/女士下装/休闲裤/苏醒的乐园/简约百搭女式休闲裤纯色丝绒加绒加厚开叉/body/20191119\\88f750fa42051bddd00e8984d1dd7845.jpg', '1574152531', '1574152531', null);
INSERT INTO `image` VALUES ('243', '/images/女士下装/休闲裤/苏醒的乐园/简约百搭女式休闲裤纯色丝绒加绒加厚开叉/body/20191119\\8560289ac772c6d0483e1c73c112c949.jpg', '1574152532', '1574152532', null);
INSERT INTO `image` VALUES ('244', '/images/女士下装/休闲裤/苏醒的乐园/简约百搭女式休闲裤纯色丝绒加绒加厚开叉/body/20191119\\c7f39ceddb70279104fca878a29496ed.jpg', '1574152533', '1574152533', null);
INSERT INTO `image` VALUES ('245', '/images/女士下装/休闲裤/苏醒的乐园/简约百搭女式休闲裤纯色丝绒加绒加厚开叉/body/20191119\\2eeb010a1069461d504956a259ccea80.jpg', '1574152533', '1574152533', null);
INSERT INTO `image` VALUES ('246', '/images/女士下装/休闲裤/苏醒的乐园/简约百搭女式休闲裤纯色丝绒加绒加厚开叉/color/20191119\\c1c5241b0c3f401ea0917157b2ebb230.jpg', '1574152551', '1574152551', null);
INSERT INTO `image` VALUES ('247', '/images/女士下装/休闲裤/索菲丝尔/2019百搭纯色简约休闲奶奶裤女哈伦裤/head/20191119\\4d428d5bae4b9124996833232273caf8.jpg', '1574152589', '1574152589', null);
INSERT INTO `image` VALUES ('248', '/images/女士下装/休闲裤/索菲丝尔/2019百搭纯色简约休闲奶奶裤女哈伦裤/body/20191119\\70c8497656ab582121d8dc397035212f.jpg', '1574152610', '1574152610', null);
INSERT INTO `image` VALUES ('249', '/images/女士下装/休闲裤/索菲丝尔/2019百搭纯色简约休闲奶奶裤女哈伦裤/body/20191119\\e7bf37a3da844d7ba7a0a22dbc0d4467.jpg', '1574152611', '1574152611', null);
INSERT INTO `image` VALUES ('250', '/images/女士下装/休闲裤/索菲丝尔/2019百搭纯色简约休闲奶奶裤女哈伦裤/body/20191119\\e52f9a59f38e1c3d044f5b3ff9a7df04.jpg', '1574152611', '1574152611', null);
INSERT INTO `image` VALUES ('251', '/images/女士下装/休闲裤/索菲丝尔/2019百搭纯色简约休闲奶奶裤女哈伦裤/color/20191119\\f7dcf93038cb7b21ccd2c3555f6f8e25.jpg', '1574152627', '1574152627', null);
INSERT INTO `image` VALUES ('252', '/images/女士下装/休闲裤/村上春/秋冬新品女式阔腿裤时尚高腰金属扣装饰格纹九分女休闲裤/head/20191119\\34c17b97033998a58311bc9190018957.jpg', '1574152657', '1574152722', null);
INSERT INTO `image` VALUES ('253', '/images/女士下装/休闲裤/村上春/秋冬新品女式阔腿裤时尚高腰金属扣装饰格纹九分女休闲裤/body/20191119\\eeae2ff0e9ff2fecbfcdd6b6dbddef1d.jpg', '1574152670', '1574152670', null);
INSERT INTO `image` VALUES ('254', '/images/女士下装/休闲裤/村上春/秋冬新品女式阔腿裤时尚高腰金属扣装饰格纹九分女休闲裤/body/20191119\\b0487753c5eb124649ce60ac7b8e2c58.jpg', '1574152672', '1574152672', null);
INSERT INTO `image` VALUES ('255', '/images/女士下装/休闲裤/村上春/秋冬新品女式阔腿裤时尚高腰金属扣装饰格纹九分女休闲裤/body/20191119\\09ea437ffd12a895ee20d3077d39481a.jpg', '1574152672', '1574152672', null);
INSERT INTO `image` VALUES ('256', '/images/女士下装/休闲裤/村上春/秋冬新品女式阔腿裤时尚高腰金属扣装饰格纹九分女休闲裤/color/20191119\\d234c22a572cf3f1f7b76f2e370604f6.jpg', '1574152691', '1574152703', null);
INSERT INTO `image` VALUES ('257', '/images/女士下装/牛仔裤/衣品天成/牛仔九分裤女2019秋装新款韩版时尚浅色直筒显瘦萝卜裤子/head/20191119\\77094d8fefcc705d8a589c23d52a4f70.jpg', '1574153112', '1574153112', null);
INSERT INTO `image` VALUES ('258', '/images/女士下装/牛仔裤/衣品天成/牛仔九分裤女2019秋装新款韩版时尚浅色直筒显瘦萝卜裤子/body/20191119\\dec355b4392e3ddaf5d39ef242eec8c4.jpg', '1574153129', '1574153129', null);
INSERT INTO `image` VALUES ('259', '/images/女士下装/牛仔裤/衣品天成/牛仔九分裤女2019秋装新款韩版时尚浅色直筒显瘦萝卜裤子/body/20191119\\756f1ce1857fade683ea019aff01bfe7.jpg', '1574153131', '1574153131', null);
INSERT INTO `image` VALUES ('260', '/images/女士下装/牛仔裤/衣品天成/牛仔九分裤女2019秋装新款韩版时尚浅色直筒显瘦萝卜裤子/color/20191119\\df3271e6fa8c3853241cc35abf1cfa02.jpg', '1574153147', '1574153147', null);
INSERT INTO `image` VALUES ('261', '/images/女士下装/牛仔裤/范奎恩/百搭直筒拼接口袋装饰显瘦大码无弹牛仔裤秋季新款宽松大码裤装/head/20191119\\d94930cf11412a3538617e0d14d20a1f.jpg', '1574153180', '1574153180', null);
INSERT INTO `image` VALUES ('262', '/images/女士下装/牛仔裤/范奎恩/百搭直筒拼接口袋装饰显瘦大码无弹牛仔裤秋季新款宽松大码裤装/body/20191119\\939acc949a0554ace358d64680b1adbf.jpg', '1574153201', '1574153201', null);
INSERT INTO `image` VALUES ('263', '/images/女士下装/牛仔裤/范奎恩/百搭直筒拼接口袋装饰显瘦大码无弹牛仔裤秋季新款宽松大码裤装/body/20191119\\43cb24ea2f63b8c256b1d4223b17dd16.jpg', '1574153203', '1574153203', null);
INSERT INTO `image` VALUES ('264', '/images/女士下装/牛仔裤/范奎恩/百搭直筒拼接口袋装饰显瘦大码无弹牛仔裤秋季新款宽松大码裤装/body/20191119\\a40911b89325fba2b7174f0e9552cab7.jpg', '1574153204', '1574153204', null);
INSERT INTO `image` VALUES ('265', '/images/女士下装/牛仔裤/范奎恩/百搭直筒拼接口袋装饰显瘦大码无弹牛仔裤秋季新款宽松大码裤装/body/20191119\\7413c544376f04dc4130fa6078749131.jpg', '1574153205', '1574153205', null);
INSERT INTO `image` VALUES ('266', '/images/女士下装/牛仔裤/范奎恩/百搭直筒拼接口袋装饰显瘦大码无弹牛仔裤秋季新款宽松大码裤装/color/20191119\\d14f012450aec3b9ab8f2b96da970c79.jpg', '1574153220', '1574153220', null);
INSERT INTO `image` VALUES ('267', '/images/女士下装/牛仔裤/嬉皮少女/高腰加绒九分牛仔裤女秋冬新款排扣可翻边小脚裤弹力修身铅笔裤子/head/20191119\\77662e0cbb2d8edb4e85691aaad8340d.jpg', '1574153254', '1574153254', null);
INSERT INTO `image` VALUES ('268', '/images/女士下装/牛仔裤/嬉皮少女/高腰加绒九分牛仔裤女秋冬新款排扣可翻边小脚裤弹力修身铅笔裤子/body/20191119\\be608a9ae68e83f91f6124c9718ef9c5.jpg', '1574153270', '1574153270', null);
INSERT INTO `image` VALUES ('269', '/images/女士下装/牛仔裤/嬉皮少女/高腰加绒九分牛仔裤女秋冬新款排扣可翻边小脚裤弹力修身铅笔裤子/body/20191119\\9b41ebcc5fe6a1c7d0a93e7fe0c10a5a.jpg', '1574153271', '1574153271', null);
INSERT INTO `image` VALUES ('270', '/images/女士下装/牛仔裤/嬉皮少女/高腰加绒九分牛仔裤女秋冬新款排扣可翻边小脚裤弹力修身铅笔裤子/body/20191119\\78f1918d027dbc4865a7e9a44e20f858.jpg', '1574153272', '1574153272', null);
INSERT INTO `image` VALUES ('271', '/images/女士下装/牛仔裤/嬉皮少女/高腰加绒九分牛仔裤女秋冬新款排扣可翻边小脚裤弹力修身铅笔裤子/color/20191119\\c8a54dc14b164284827b287de00a2e21.jpg', '1574153292', '1574153292', null);
INSERT INTO `image` VALUES ('272', '/images/女士下装/阔腿裤/DONEED/2019冬新款复古格纹通勤时尚配腰带格纹针织阔腿短裤/head/20191119\\2763c3c4f21342b43fcaa5b85afb5d16.jpg', '1574153540', '1574153540', null);
INSERT INTO `image` VALUES ('273', '/images/女士下装/阔腿裤/DONEED/2019冬新款复古格纹通勤时尚配腰带格纹针织阔腿短裤/body/20191119\\0487c864174794022f03f8d2d9ed329a.jpg', '1574153559', '1574153559', null);
INSERT INTO `image` VALUES ('274', '/images/女士下装/阔腿裤/DONEED/2019冬新款复古格纹通勤时尚配腰带格纹针织阔腿短裤/body/20191119\\c297c674be56c12aae6b91ec1f9fe6c4.jpg', '1574153560', '1574153560', null);
INSERT INTO `image` VALUES ('275', '/images/女士下装/阔腿裤/DONEED/2019冬新款复古格纹通勤时尚配腰带格纹针织阔腿短裤/body/20191119\\68b9449e7411835a9d85d12d5088bd46.jpg', '1574153560', '1574153560', null);
INSERT INTO `image` VALUES ('276', '/images/女士下装/阔腿裤/DONEED/2019冬新款复古格纹通勤时尚配腰带格纹针织阔腿短裤/body/20191119\\843406def6511f660f2f406ede426825.jpg', '1574153561', '1574153561', null);
INSERT INTO `image` VALUES ('277', '/images/女士下装/阔腿裤/DONEED/2019冬新款复古格纹通勤时尚配腰带格纹针织阔腿短裤/color/20191119\\a7a96502ac9b1f82615a6ed42676badb.jpg', '1574153577', '1574153577', null);
INSERT INTO `image` VALUES ('278', '/images/女士下装/阔腿裤/GYMCOLLEGE/2019冬新款宽松高腰直筒灯芯绒显瘦女式休闲裤长裤/head/20191119\\72424c0a73da507a86263c5cfae2e2e1.jpg', '1574153622', '1574153622', null);
INSERT INTO `image` VALUES ('279', '/images/女士下装/阔腿裤/GYMCOLLEGE/2019冬新款宽松高腰直筒灯芯绒显瘦女式休闲裤长裤/body/20191119\\af070cab2cf3759e404427a2204dc202.jpg', '1574153634', '1574153634', null);
INSERT INTO `image` VALUES ('280', '/images/女士下装/阔腿裤/GYMCOLLEGE/2019冬新款宽松高腰直筒灯芯绒显瘦女式休闲裤长裤/body/20191119\\fc41125dce7151fa078d504d4bb00549.jpg', '1574153635', '1574153635', null);
INSERT INTO `image` VALUES ('281', '/images/女士下装/阔腿裤/GYMCOLLEGE/2019冬新款宽松高腰直筒灯芯绒显瘦女式休闲裤长裤/body/20191119\\7d797841e260af6ebf02af707977596a.jpg', '1574153636', '1574153636', null);
INSERT INTO `image` VALUES ('282', '/images/女士下装/阔腿裤/GYMCOLLEGE/2019冬新款宽松高腰直筒灯芯绒显瘦女式休闲裤长裤/color/20191119\\1106e073673568b71ddcb503405b8e7e.jpg', '1574153652', '1574153652', null);
INSERT INTO `image` VALUES ('283', '/images/女士下装/阔腿裤/十月传奇/休闲裤女款裤子宽松秋季新款百搭显瘦女士高腰阔腿裤/head/20191119\\a4777d359e0deac40c68ea8fa8c5b800.jpg', '1574153684', '1574153684', null);
INSERT INTO `image` VALUES ('284', '/images/女士下装/阔腿裤/十月传奇/休闲裤女款裤子宽松秋季新款百搭显瘦女士高腰阔腿裤/body/20191119\\d388649fbd86051c31400e9974eb55d5.jpg', '1574153699', '1574153699', null);
INSERT INTO `image` VALUES ('285', '/images/女士下装/阔腿裤/十月传奇/休闲裤女款裤子宽松秋季新款百搭显瘦女士高腰阔腿裤/body/20191119\\4a347101d5672c202188e93c16e9039f.jpg', '1574153700', '1574153700', null);
INSERT INTO `image` VALUES ('286', '/images/女士下装/阔腿裤/十月传奇/休闲裤女款裤子宽松秋季新款百搭显瘦女士高腰阔腿裤/body/20191119\\7d1c87829cdfacba7fa601089216fae3.jpg', '1574153701', '1574153701', null);
INSERT INTO `image` VALUES ('287', '/images/女士下装/阔腿裤/十月传奇/休闲裤女款裤子宽松秋季新款百搭显瘦女士高腰阔腿裤/color/20191119\\c53e56304e3ed3af484bb43962246a47.jpg', '1574153716', '1574153716', null);
INSERT INTO `image` VALUES ('288', '/images/女士下装/背带裤/AS-BCN/AS-BCN女装时尚宽松吊带牛仔连体裤女/head/20191119\\be5ec50e8d98a4610cde067376e633dc.jpg', '1574153753', '1574153753', null);
INSERT INTO `image` VALUES ('289', '/images/女士下装/背带裤/AS-BCN/AS-BCN女装时尚宽松吊带牛仔连体裤女/body/20191119\\52106dde659db63984d16a5ed924a03c.jpg', '1574153770', '1574153770', null);
INSERT INTO `image` VALUES ('290', '/images/女士下装/背带裤/AS-BCN/AS-BCN女装时尚宽松吊带牛仔连体裤女/body/20191119\\60c9f2f4f2390d1d1c9da37742a6c3f8.jpg', '1574153771', '1574153771', null);
INSERT INTO `image` VALUES ('291', '/images/女士下装/背带裤/AS-BCN/AS-BCN女装时尚宽松吊带牛仔连体裤女/body/20191119\\4feaab8f50bd53069b2cf8bd315ab866.jpg', '1574153771', '1574153771', null);
INSERT INTO `image` VALUES ('292', '/images/女士下装/背带裤/AS-BCN/AS-BCN女装时尚宽松吊带牛仔连体裤女/color/20191119\\f497954078e81008d5921739bec00c7f.jpg', '1574153787', '1574153787', null);
INSERT INTO `image` VALUES ('293', '/images/女士下装/背带裤/Iammix27/2019秋装新款时尚牛仔背带裤女式连体裤/head/20191119\\d359a6960f760551d030c3ccbb42de56.jpg', '1574153840', '1574153840', null);
INSERT INTO `image` VALUES ('294', '/images/女士下装/背带裤/Iammix27/2019秋装新款时尚牛仔背带裤女式连体裤/body/20191119\\5e68517f91ccc59df07a9e8f31df6fb1.jpg', '1574153855', '1574153855', null);
INSERT INTO `image` VALUES ('295', '/images/女士下装/背带裤/Iammix27/2019秋装新款时尚牛仔背带裤女式连体裤/body/20191119\\e01266572fb58b43235dbff041558e88.jpg', '1574153856', '1574153856', null);
INSERT INTO `image` VALUES ('296', '/images/女士下装/背带裤/Iammix27/2019秋装新款时尚牛仔背带裤女式连体裤/body/20191119\\a1badee993159da266e681c37b45f45e.jpg', '1574153857', '1574153857', null);
INSERT INTO `image` VALUES ('297', '/images/女士下装/背带裤/Iammix27/2019秋装新款时尚牛仔背带裤女式连体裤/color/20191119\\95c069d5dfc736c8357e26ffd87c308c.jpg', '1574153875', '1574153875', null);
INSERT INTO `image` VALUES ('298', '/images/女士下装/背带裤/PERIGOT/秋女士无袖假两件休闲裤连体裤/head/20191119\\55646ba7fbd81f0f4a661cca05091aff.jpg', '1574153914', '1574153914', null);
INSERT INTO `image` VALUES ('299', '/images/女士下装/背带裤/PERIGOT/秋女士无袖假两件休闲裤连体裤/body/20191119\\d92e0628ad0896017ad921ee39dbbd58.jpg', '1574153927', '1574153927', null);
INSERT INTO `image` VALUES ('300', '/images/女士下装/背带裤/PERIGOT/秋女士无袖假两件休闲裤连体裤/body/20191119\\10083b50ee7f38e7a7a5f4ac556d47cd.jpg', '1574153929', '1574153929', null);
INSERT INTO `image` VALUES ('301', '/images/女士下装/背带裤/PERIGOT/秋女士无袖假两件休闲裤连体裤/color/20191119\\e8f80cdc038f4ba99842ea02fbd7661a.jpg', '1574153946', '1574153946', null);
INSERT INTO `image` VALUES ('302', '/images/女士外套/外套/菲阁/新品夏款慵懒风短款外搭休闲气质开衫镂空针织女式外套/head/20191119\\90f40c04bdcc54f0c71131f7ec430d9f.jpg', '1574153982', '1574153982', null);
INSERT INTO `image` VALUES ('303', '/images/女士外套/外套/菲阁/新品夏款慵懒风短款外搭休闲气质开衫镂空针织女式外套/body/20191119\\8822e75c50e1141a540a2a1caceee73a.jpg', '1574153994', '1574153994', null);
INSERT INTO `image` VALUES ('304', '/images/女士外套/外套/菲阁/新品夏款慵懒风短款外搭休闲气质开衫镂空针织女式外套/body/20191119\\a8db56a762cbb7bbaeb0f1a261809f35.jpg', '1574153995', '1574153995', null);
INSERT INTO `image` VALUES ('305', '/images/女士外套/外套/菲阁/新品夏款慵懒风短款外搭休闲气质开衫镂空针织女式外套/color/20191119\\51ef451b9b0cd5babad09da2b3ad94e6.jpg', '1574154017', '1574154017', null);
INSERT INTO `image` VALUES ('306', '/images/女士外套/外套/沫晗依美/呢料仿羊绒撞色拼接千鸟格外套/head/20191119\\bfacccca014c58bef2fc55dd3d2571d3.jpg', '1574154061', '1574154061', null);
INSERT INTO `image` VALUES ('307', '/images/女士外套/外套/沫晗依美/呢料仿羊绒撞色拼接千鸟格外套/body/20191119\\bf730063ec58e7ef387a1cc4ebba900b.jpg', '1574154077', '1574154077', null);
INSERT INTO `image` VALUES ('308', '/images/女士外套/外套/沫晗依美/呢料仿羊绒撞色拼接千鸟格外套/body/20191119\\e529e588baa8044ad8eb846dc976a4c9.jpg', '1574154078', '1574154078', null);
INSERT INTO `image` VALUES ('309', '/images/女士外套/外套/沫晗依美/呢料仿羊绒撞色拼接千鸟格外套/color/20191119\\377e111b0e072c5aa703909c7ada132e.jpg', '1574154102', '1574154102', null);
INSERT INTO `image` VALUES ('310', '/images/女士外套/外套/郁香菲/简约短款修身显瘦干练随性机车女小皮衣外套/head/20191119\\2187a2a64435f57e765d04b0afe7d076.jpg', '1574154144', '1574154144', null);
INSERT INTO `image` VALUES ('311', '/images/女士外套/外套/郁香菲/简约短款修身显瘦干练随性机车女小皮衣外套/body/20191119\\5af646ce1ec96d36f08308ba40b1070c.jpg', '1574154171', '1574154171', null);
INSERT INTO `image` VALUES ('312', '/images/女士外套/外套/郁香菲/简约短款修身显瘦干练随性机车女小皮衣外套/body/20191119\\8349391b28e5395ba29d95b9b8155382.jpg', '1574154172', '1574154172', null);
INSERT INTO `image` VALUES ('313', '/images/女士外套/外套/郁香菲/简约短款修身显瘦干练随性机车女小皮衣外套/color/20191119\\2476bdf73cf158aa59d80ddec65700e8.jpg', '1574154199', '1574154199', null);
INSERT INTO `image` VALUES ('314', '/images/女士外套/风衣/似水年华/2019秋季新款时尚韩版双排扣修身显瘦休闲女式风衣中长款/head/20191119\\c6f89a83f148eace97f3dd06c89e99b5.jpg', '1574154231', '1574154330', null);
INSERT INTO `image` VALUES ('315', '/images/女士外套/风衣/似水年华/2019秋季新款时尚韩版双排扣修身显瘦休闲女式风衣中长款/body/20191119\\a52c685d0fe9a628f341662dd5a736f7.jpg', '1574154265', '1574154265', null);
INSERT INTO `image` VALUES ('316', '/images/女士外套/风衣/似水年华/2019秋季新款时尚韩版双排扣修身显瘦休闲女式风衣中长款/body/20191119\\e2db607fd83bfbc52da9c0ff21d065c1.jpg', '1574154266', '1574154266', null);
INSERT INTO `image` VALUES ('317', '/images/女士外套/风衣/似水年华/2019秋季新款时尚韩版双排扣修身显瘦休闲女式风衣中长款/color/20191119\\35c319aad3129a611c07da91ae9e6b8d.jpg', '1574154292', '1574154351', null);
INSERT INTO `image` VALUES ('318', '/images/女士上装/T恤/似水年华/秋季新款时尚百搭简约通勤翻领单排扣系带女式风衣中长款/head/20191119\\684bb189d759c9d438da0a5a0bc210e5.jpg', '1574154509', '1574154509', null);
INSERT INTO `image` VALUES ('319', '/images/女士上装/T恤/似水年华/秋季新款时尚百搭简约通勤翻领单排扣系带女式风衣中长款/body/20191119\\e5b3c6b4b761a20028e9b9e73f8c9b14.jpg', '1574154522', '1574154522', null);
INSERT INTO `image` VALUES ('320', '/images/女士上装/T恤/似水年华/秋季新款时尚百搭简约通勤翻领单排扣系带女式风衣中长款/body/20191119\\bbb222cae1367088f864cb75ae0d80ff.jpg', '1574154523', '1574154523', null);
INSERT INTO `image` VALUES ('321', '/images/女士上装/T恤/似水年华/秋季新款时尚百搭简约通勤翻领单排扣系带女式风衣中长款/color/20191119\\40613c35c0650ad5a8dfca3a13654ead.jpg', '1574154547', '1574154547', null);
INSERT INTO `image` VALUES ('322', '/images/女士外套/风衣/她图/2019秋冬女装新品中长款工装外套休闲小个子风衣韩版宽松潮/head/20191119\\2013e5db7ba27b8a625f49bf9c7f4b6d.jpg', '1574154581', '1574154581', null);
INSERT INTO `image` VALUES ('323', '/images/女士外套/风衣/她图/2019秋冬女装新品中长款工装外套休闲小个子风衣韩版宽松潮/body/20191119\\b2ec1de3a9ae1df72af0f70109d1f1fb.jpg', '1574154597', '1574154597', null);
INSERT INTO `image` VALUES ('324', '/images/女士外套/风衣/她图/2019秋冬女装新品中长款工装外套休闲小个子风衣韩版宽松潮/body/20191119\\50f678177676b92ac9f0c16423e6fe68.jpg', '1574154598', '1574154598', null);
INSERT INTO `image` VALUES ('325', '/images/女士外套/风衣/她图/2019秋冬女装新品中长款工装外套休闲小个子风衣韩版宽松潮/color/20191119\\bd579a144cf1236804cd3d2a00e31138.jpg', '1574154622', '1574154622', null);
INSERT INTO `image` VALUES ('326', '/images/女士外套/羽绒服/坦博尔/女士短款新品轻薄连帽修身百搭羽绒服外套/head/20191119\\bacbcd60237559c1f57fd731a59c3c2d.jpg', '1574154767', '1574154767', null);
INSERT INTO `image` VALUES ('327', '/images/女士外套/羽绒服/坦博尔/女士短款新品轻薄连帽修身百搭羽绒服外套/body/20191119\\380aed9a10e5b3f9fd5b98959d5f66ac.jpg', '1574154783', '1574154783', null);
INSERT INTO `image` VALUES ('328', '/images/女士外套/羽绒服/坦博尔/女士短款新品轻薄连帽修身百搭羽绒服外套/body/20191119\\0aa02ce238baf20c583071700a64925e.jpg', '1574154785', '1574154785', null);
INSERT INTO `image` VALUES ('329', '/images/女士外套/羽绒服/坦博尔/女士短款新品轻薄连帽修身百搭羽绒服外套/color/20191119\\2429f282ba560294edab21925a46645d.jpg', '1574154813', '1574154813', null);
INSERT INTO `image` VALUES ('330', '/images/女士外套/羽绒服/乐町/2019冬季新款厚外套白色灯芯绒羽绒服中长款宽松韩版小个/head/20191119\\c9a50fd9cbdd38fc3869cff3a757b54a.jpg', '1574154871', '1574154871', null);
INSERT INTO `image` VALUES ('331', '/images/女士外套/羽绒服/乐町/2019冬季新款厚外套白色灯芯绒羽绒服中长款宽松韩版小个/body/20191119\\f8f3890f5895ded8265067543af8f4eb.jpg', '1574154888', '1574154888', null);
INSERT INTO `image` VALUES ('332', '/images/女士外套/羽绒服/乐町/2019冬季新款厚外套白色灯芯绒羽绒服中长款宽松韩版小个/body/20191119\\158f940914b5dddf3e0bfaeabc240ffe.jpg', '1574154889', '1574154889', null);
INSERT INTO `image` VALUES ('333', '/images/女士外套/羽绒服/乐町/2019冬季新款厚外套白色灯芯绒羽绒服中长款宽松韩版小个/color/20191119\\a7b57d66afe8a8e0a8b46912d0ccf1b8.jpg', '1574154909', '1574154909', null);
INSERT INTO `image` VALUES ('334', '/images/女士上装/T恤/丝柏舍/女士韩版宽松长袖连帽侧开叉前短后长棉衣/head/20191119\\cbb19baf15362edef5c5928c94f3069f.jpg', '1574154979', '1574154979', null);
INSERT INTO `image` VALUES ('335', '/images/女士上装/T恤/丝柏舍/女士韩版宽松长袖连帽侧开叉前短后长棉衣/body/20191119\\5a24bce3752183150a4ed04dc4ecf606.jpg', '1574155000', '1574155000', null);
INSERT INTO `image` VALUES ('336', '/images/女士上装/T恤/丝柏舍/女士韩版宽松长袖连帽侧开叉前短后长棉衣/body/20191119\\39994368ad9f7ef934a8dbb740f4a3a8.jpg', '1574155002', '1574155002', null);
INSERT INTO `image` VALUES ('337', '/images/女士上装/T恤/丝柏舍/女士韩版宽松长袖连帽侧开叉前短后长棉衣/color/20191119\\cc18e255d01e3c951c775c6be1eab5cc.jpg', '1574155031', '1574155031', null);
INSERT INTO `image` VALUES ('338', '/images/女士外套/棉衣/jk&js/冬季旗袍女中国风棉衣加厚保暖中式女装复古连衣裙冬改良唐装棉袄/head/20191119\\a677d4e6e552d16183a763935d55ad19.jpg', '1574155078', '1574155078', null);
INSERT INTO `image` VALUES ('339', '/images/女士外套/棉衣/jk&js/冬季旗袍女中国风棉衣加厚保暖中式女装复古连衣裙冬改良唐装棉袄/body/20191119\\b863636146c92df3ca799be8bccbdcc9.jpg', '1574155093', '1574155093', null);
INSERT INTO `image` VALUES ('340', '/images/女士外套/棉衣/jk&js/冬季旗袍女中国风棉衣加厚保暖中式女装复古连衣裙冬改良唐装棉袄/body/20191119\\a9ca4766f685e41ed235adec955aa9a3.jpg', '1574155094', '1574155094', null);
INSERT INTO `image` VALUES ('341', '/images/女士外套/棉衣/jk&js/冬季旗袍女中国风棉衣加厚保暖中式女装复古连衣裙冬改良唐装棉袄/color/20191119\\4a85bb4a05aea42476aa2c06d7ed07fd.jpg', '1574155120', '1574155120', null);
INSERT INTO `image` VALUES ('342', '/images/套装/连衣裙/卡帝乐鳄鱼/2019秋季新款时尚字母印花圆领条纹短袖连衣裙秋装女裙子/head/20191119\\347af59ff762f78b8a1a132f2212ae86.jpg', '1574155149', '1574155149', null);
INSERT INTO `image` VALUES ('343', '/images/套装/连衣裙/卡帝乐鳄鱼/2019秋季新款时尚字母印花圆领条纹短袖连衣裙秋装女裙子/body/20191119\\7dfaee5a43af4c16a709b2e65d05d25c.jpg', '1574155163', '1574155163', null);
INSERT INTO `image` VALUES ('344', '/images/套装/连衣裙/卡帝乐鳄鱼/2019秋季新款时尚字母印花圆领条纹短袖连衣裙秋装女裙子/body/20191119\\8123340b2c606b6ced1a6e2998e73e20.jpg', '1574155164', '1574155164', null);
INSERT INTO `image` VALUES ('345', '/images/套装/连衣裙/卡帝乐鳄鱼/2019秋季新款时尚字母印花圆领条纹短袖连衣裙秋装女裙子/color/20191119\\f14489200422ec2616b483b4803f0450.jpg', '1574155184', '1574155184', null);
INSERT INTO `image` VALUES ('346', '/images/套装/连衣裙/韩都衣舍/2019秋季新款韩版女款打底针织拼接网纱连衣裙/head/20191119\\de03fdcd4e595bf7940ad739ed53eda9.jpg', '1574155218', '1574155218', null);
INSERT INTO `image` VALUES ('347', '/images/套装/连衣裙/韩都衣舍/2019秋季新款韩版女款打底针织拼接网纱连衣裙/body/20191119\\efbb5af18563337a0232a3f86fc174e9.jpg', '1574155236', '1574155236', null);
INSERT INTO `image` VALUES ('348', '/images/套装/连衣裙/韩都衣舍/2019秋季新款韩版女款打底针织拼接网纱连衣裙/body/20191119\\8b4bc517a8967ffaebb7eaf922891dd9.jpg', '1574155237', '1574155237', null);
INSERT INTO `image` VALUES ('349', '/images/套装/连衣裙/韩都衣舍/2019秋季新款韩版女款打底针织拼接网纱连衣裙/color/20191119\\788e0049c993800f8cd973f456062774.jpg', '1574155255', '1574155255', null);
INSERT INTO `image` VALUES ('350', '/images/套装/半身裙/唐狮/女合体格纹百褶毛呢短半裙/head/20191119\\5b3da1f74b2187e975fefed6dd637d24.jpg', '1574155296', '1574155296', null);
INSERT INTO `image` VALUES ('351', '/images/套装/半身裙/唐狮/女合体格纹百褶毛呢短半裙/body/20191119\\296cdcddf371e1d4a8354468aaea1cca.jpg', '1574155546', '1574155546', null);
INSERT INTO `image` VALUES ('352', '/images/套装/半身裙/唐狮/女合体格纹百褶毛呢短半裙/body/20191119\\14688ce1ee43ec58726a2784253a0dfc.jpg', '1574155547', '1574155547', null);
INSERT INTO `image` VALUES ('353', '/images/套装/半身裙/唐狮/女合体格纹百褶毛呢短半裙/color/20191119\\a8de38e026fd7cdb170eb8027ead3d07.jpg', '1574155570', '1574155570', null);
INSERT INTO `image` VALUES ('354', '/images/套装/半身裙/TERRE BLEUES/2019春秋新款气质女装裙子高腰显瘦包臀短款PU皮裙A字半身裙女/head/20191119\\8722daf39efbc7345793061639bb751c.jpg', '1574155643', '1574155643', null);
INSERT INTO `image` VALUES ('355', '/images/套装/半身裙/TERRE BLEUES/2019春秋新款气质女装裙子高腰显瘦包臀短款PU皮裙A字半身裙女/body/20191119\\96e4aa89f689d227393a5830a004c32a.jpg', '1574155660', '1574155660', null);
INSERT INTO `image` VALUES ('356', '/images/套装/半身裙/TERRE BLEUES/2019春秋新款气质女装裙子高腰显瘦包臀短款PU皮裙A字半身裙女/body/20191119\\1bdaa6a6647a99ae49652a42679e003f.jpg', '1574155661', '1574155661', null);
INSERT INTO `image` VALUES ('357', '/images/套装/半身裙/TERRE BLEUES/2019春秋新款气质女装裙子高腰显瘦包臀短款PU皮裙A字半身裙女/color/20191119\\ae23bd943103b7fea123ea2f3b22cf1f.jpg', '1574155683', '1574155683', null);
INSERT INTO `image` VALUES ('358', '/images/套装/百褶裙/BANANA BABY/2019夏季新款韩版中长款百褶裙渐变网纱半身裙仙女裙/head/20191119\\0a205f70915b2c0723a296affbcc65d1.jpg', '1574155720', '1574155720', null);
INSERT INTO `image` VALUES ('359', '/images/套装/百褶裙/BANANA BABY/2019夏季新款韩版中长款百褶裙渐变网纱半身裙仙女裙/body/20191119\\ea990bf8c7131a79c16e37cb90ac96fb.jpg', '1574155741', '1574155741', null);
INSERT INTO `image` VALUES ('360', '/images/套装/百褶裙/BANANA BABY/2019夏季新款韩版中长款百褶裙渐变网纱半身裙仙女裙/body/20191119\\e4b054c0be2577acee7fcd3a5e5d9baa.jpg', '1574155742', '1574155742', null);
INSERT INTO `image` VALUES ('361', '/images/套装/百褶裙/BANANA BABY/2019夏季新款韩版中长款百褶裙渐变网纱半身裙仙女裙/color/20191119\\12b72927c3190481dd0261d5d5c621ac.jpg', '1574155760', '1574155760', null);
INSERT INTO `image` VALUES ('362', '/images/套装/百褶裙/柯玛妮克/2019春季新款减龄半身裙/head/20191119\\8cc94aa8066a6ab9af3c9f06e2f0e9d0.jpg', '1574155813', '1574155813', null);
INSERT INTO `image` VALUES ('363', '/images/套装/百褶裙/柯玛妮克/2019春季新款减龄半身裙/body/20191119\\98962fa0354aef4727e603ee03a45bb3.jpg', '1574155842', '1574155842', null);
INSERT INTO `image` VALUES ('364', '/images/套装/百褶裙/柯玛妮克/2019春季新款减龄半身裙/body/20191119\\4f704af2db37e3653986b1fae3dea959.jpg', '1574155843', '1574155843', null);
INSERT INTO `image` VALUES ('365', '/images/套装/百褶裙/柯玛妮克/2019春季新款减龄半身裙/color/20191119\\22c1b177a7a644748865ffbeaed9cc74.jpg', '1574155863', '1574155863', null);
INSERT INTO `image` VALUES ('366', '/images/男士上装/短袖T恤/唐狮/男式t恤纯色印花男/head/20191119\\1597fecc9a10175bbede0e66c124955c.jpg', '1574156205', '1574156205', null);
INSERT INTO `image` VALUES ('367', '/images/男士上装/短袖T恤/唐狮/男式t恤纯色印花男/color/20191119\\eb95ec5adbb854e0575f75efcf78fa98.jpg', '1574156480', '1574156480', null);
INSERT INTO `image` VALUES ('368', '/images/男士上装/短袖T恤/唐狮/男式t恤纯色印花男/color/20191119\\94947de417a0cc9411213746989af289.jpg', '1574156492', '1574156492', null);
INSERT INTO `image` VALUES ('369', '/images/男士上装/短袖T恤/唐狮/男式t恤纯色印花男/body/20191119\\e3b931551b229f66fa016a390d4f638c.jpg', '1574156521', '1574156521', null);
INSERT INTO `image` VALUES ('370', '/images/男士上装/短袖T恤/唐狮/男式t恤纯色印花男/body/20191119\\1a02dc23b24956ea38c4310781a5d8cb.jpg', '1574156522', '1574156522', null);
INSERT INTO `image` VALUES ('371', '/images/男士上装/短袖T恤/唐狮/男式t恤纯色印花男/body/20191119\\184c5721fc7a3d16f2182b01896ca2a2.jpg', '1574156523', '1574156523', null);
INSERT INTO `image` VALUES ('372', '/images/男士上装/短袖T恤/翰代维/ 2019夏季新款韩版印花男士t恤/head/20191119\\e859b755936368a7f4076bfd6c0df262.jpg', '1574156589', '1574159261', null);
INSERT INTO `image` VALUES ('375', '/images/男士上装/短袖T恤/翰代维/ 2019夏季新款韩版印花男士t恤/color/20191119\\0f0271a854e3140cc1dc6a188e752119.jpg', '1574156628', '1574159283', null);
INSERT INTO `image` VALUES ('376', '/images/男士上装/长袖衬衫/Nōvachic/秋冬季新品男式衬衣休闲纯色衬衫长袖男士衬衫/head/20191119\\f9904d57eae90534b17e92b890b15170.jpg', '1574157237', '1574157237', null);
INSERT INTO `image` VALUES ('377', '/images/男士上装/长袖衬衫/Nōvachic/秋冬季新品男式衬衣休闲纯色衬衫长袖男士衬衫/body/20191119\\13eb55850ae59525a2f7364a7d36941f.jpg', '1574157256', '1574157256', null);
INSERT INTO `image` VALUES ('378', '/images/男士上装/长袖衬衫/Nōvachic/秋冬季新品男式衬衣休闲纯色衬衫长袖男士衬衫/body/20191119\\592307831ba9326740a0140c78de49b9.jpg', '1574157256', '1574157256', null);
INSERT INTO `image` VALUES ('379', '/images/男士上装/长袖衬衫/Nōvachic/秋冬季新品男式衬衣休闲纯色衬衫长袖男士衬衫/color/20191119\\cea7d89babcc41edd4a131d80f0551f7.jpg', '1574157276', '1574157276', null);
INSERT INTO `image` VALUES ('380', '/images/男士上装/长袖衬衫/G2000/男装商务休闲口袋细条纹衬衫柔软打底长袖衬衣/head/20191119\\a1485e306059630ea3f50154ea315425.jpg', '1574157317', '1574157317', null);
INSERT INTO `image` VALUES ('381', '/images/男士上装/长袖衬衫/G2000/男装商务休闲口袋细条纹衬衫柔软打底长袖衬衣/body/20191119\\4cad4a04863af699e1683a64a6506150.jpg', '1574157331', '1574157331', null);
INSERT INTO `image` VALUES ('382', '/images/男士上装/长袖衬衫/G2000/男装商务休闲口袋细条纹衬衫柔软打底长袖衬衣/color/20191119\\3284b84d43b2ba8f27ad8276513bf5ad.jpg', '1574157355', '1574157355', null);
INSERT INTO `image` VALUES ('383', '/images/男士下装/短裤/FSK/2019新款男式休闲裤男款运动裤子五分百搭沙滩裤男士短裤夏季/head/20191119\\6091f46fdb1f7db7c0610de5f961d1f6.jpg', '1574157936', '1574157936', null);
INSERT INTO `image` VALUES ('384', '/images/男士下装/短裤/FSK/2019新款男式休闲裤男款运动裤子五分百搭沙滩裤男士短裤夏季/body/20191119\\bfa0d05c8c3e34805b008fc79888641e.jpg', '1574157964', '1574157964', null);
INSERT INTO `image` VALUES ('385', '/images/男士下装/短裤/FSK/2019新款男式休闲裤男款运动裤子五分百搭沙滩裤男士短裤夏季/body/20191119\\394ebf23bdfaa6615613ad2cd84318c9.jpg', '1574157965', '1574157965', null);
INSERT INTO `image` VALUES ('386', '/images/男士下装/短裤/FSK/2019新款男式休闲裤男款运动裤子五分百搭沙滩裤男士短裤夏季/color/20191119\\bfe4818e372014308e407905f297e15a.jpg', '1574158003', '1574158003', null);
INSERT INTO `image` VALUES ('387', '/images/男士下装/短裤/RAMPAGE/美国潮牌夏季休闲短裤港风男士水洗五分裤/head/20191119\\d9e1d95bb683db16d4035c9bebf2a260.jpg', '1574158065', '1574158065', null);
INSERT INTO `image` VALUES ('388', '/images/男士下装/短裤/RAMPAGE/美国潮牌夏季休闲短裤港风男士水洗五分裤/body/20191119\\3e2dadaa3ad3b7175d755fe64d67e274.jpg', '1574158091', '1574158091', null);
INSERT INTO `image` VALUES ('389', '/images/男士下装/短裤/RAMPAGE/美国潮牌夏季休闲短裤港风男士水洗五分裤/body/20191119\\c53989dceddaa423d9fc1a037155681d.jpg', '1574158092', '1574158092', null);
INSERT INTO `image` VALUES ('390', '/images/男士下装/短裤/RAMPAGE/美国潮牌夏季休闲短裤港风男士水洗五分裤/body/20191119\\ff78306ce68db37750025ce0ad941100.jpg', '1574158093', '1574158093', null);
INSERT INTO `image` VALUES ('391', '/images/男士下装/短裤/RAMPAGE/美国潮牌夏季休闲短裤港风男士水洗五分裤/body/20191119\\32e137270f5496d8295d1a480b16dcf8.jpg', '1574158094', '1574158094', null);
INSERT INTO `image` VALUES ('392', '/images/男士下装/短裤/RAMPAGE/美国潮牌夏季休闲短裤港风男士水洗五分裤/color/20191119\\f749e1b23aae7c19981eda85d9fd019c.jpg', '1574158134', '1574158134', null);
INSERT INTO `image` VALUES ('393', '/images/男士下装/短裤/RAMPAGE/美国潮牌夏季休闲短裤港风男士水洗五分裤/color/20191119\\d6cf261f29c5794347d5095a5d8879bd.jpg', '1574158147', '1574158147', null);
INSERT INTO `image` VALUES ('394', '/images/男士下装/休闲裤/衣品天成/2019秋季新款男裤子休闲潮流韩版直筒束脚工装裤子男式休闲裤/head/20191119\\aeee9bd5e77edb8016067a0024d8f5f3.jpg', '1574158227', '1574158227', null);
INSERT INTO `image` VALUES ('395', '/images/男士下装/休闲裤/衣品天成/2019秋季新款男裤子休闲潮流韩版直筒束脚工装裤子男式休闲裤/body/20191119\\eb05e0c2ba3716ba59e3870557977644.jpg', '1574158244', '1574158244', null);
INSERT INTO `image` VALUES ('396', '/images/男士下装/休闲裤/衣品天成/2019秋季新款男裤子休闲潮流韩版直筒束脚工装裤子男式休闲裤/body/20191119\\3cb5e53d58759fad1a1a867b93aaa7c5.jpg', '1574158249', '1574158249', null);
INSERT INTO `image` VALUES ('397', '/images/男士下装/休闲裤/衣品天成/2019秋季新款男裤子休闲潮流韩版直筒束脚工装裤子男式休闲裤/color/20191119\\a2444ad496fcc0cbd514e3c1a28de935.jpg', '1574158280', '1574158280', null);
INSERT INTO `image` VALUES ('398', '/images/男士下装/休闲裤/KM KILO KM&METERS/2019新品纯色小脚经典舒适休闲裤长裤男士休闲裤/head/20191119\\fed588c50bf6d20054dfdf949b21e4cc.jpg', '1574158341', '1574158360', null);
INSERT INTO `image` VALUES ('399', '/images/男士下装/休闲裤/KM KILO KM&METERS/2019新品纯色小脚经典舒适休闲裤长裤男士休闲裤/body/20191119\\a20efa32e5cae798428d52b7e30c5ff3.jpg', '1574158381', '1574158381', null);
INSERT INTO `image` VALUES ('400', '/images/男士下装/休闲裤/KM KILO KM&METERS/2019新品纯色小脚经典舒适休闲裤长裤男士休闲裤/body/20191119\\76170989670488b76533a358eb2dd7ea.jpg', '1574158382', '1574158382', null);
INSERT INTO `image` VALUES ('401', '/images/男士下装/休闲裤/KM KILO KM&METERS/2019新品纯色小脚经典舒适休闲裤长裤男士休闲裤/color/20191119\\cf72e6ffd6036093cf5100e28a9f56df.jpg', '1574158410', '1574158410', null);
INSERT INTO `image` VALUES ('402', '/images/男士下装/牛仔裤/杰米克/显瘦微弹裤子男士加绒牛仔裤直筒裤宽松男士牛仔裤秋冬/head/20191119\\85c4e3f12d10462190046cf8f644ed9a.jpg', '1574158477', '1574158477', null);
INSERT INTO `image` VALUES ('403', '/images/男士下装/牛仔裤/杰米克/显瘦微弹裤子男士加绒牛仔裤直筒裤宽松男士牛仔裤秋冬/body/20191119\\449b6c29b0e254c307af4a4c7afc602b.jpg', '1574158493', '1574158493', null);
INSERT INTO `image` VALUES ('404', '/images/男士下装/牛仔裤/杰米克/显瘦微弹裤子男士加绒牛仔裤直筒裤宽松男士牛仔裤秋冬/body/20191119\\5ace2c946dfa55f4c10918c55fc013c3.jpg', '1574158494', '1574158494', null);
INSERT INTO `image` VALUES ('405', '/images/男士下装/牛仔裤/杰米克/显瘦微弹裤子男士加绒牛仔裤直筒裤宽松男士牛仔裤秋冬/color/20191119\\d124bdaddf2cb752fcde0ae89910b8bb.jpg', '1574158517', '1574158517', null);
INSERT INTO `image` VALUES ('406', '/images/男士下装/牛仔裤/衣品天/冬季男装裤子毛边水洗休闲修身加绒保暖直筒男士牛仔长裤/head/20191119\\d792016b71f0e401ddff3eb1af5d17ed.jpg', '1574158563', '1574158563', null);
INSERT INTO `image` VALUES ('407', '/images/男士下装/牛仔裤/衣品天/冬季男装裤子毛边水洗休闲修身加绒保暖直筒男士牛仔长裤/body/20191119\\9a7cb0647796a55d015ebf19fc6f6804.jpg', '1574158579', '1574158579', null);
INSERT INTO `image` VALUES ('408', '/images/男士下装/牛仔裤/衣品天/冬季男装裤子毛边水洗休闲修身加绒保暖直筒男士牛仔长裤/body/20191119\\0b1c928feae4387c5ccb0078fdaa33dc.jpg', '1574158580', '1574158580', null);
INSERT INTO `image` VALUES ('409', '/images/男士下装/牛仔裤/衣品天/冬季男装裤子毛边水洗休闲修身加绒保暖直筒男士牛仔长裤/color/20191119\\6cd3e8708fba78e138e9886a30076f97.jpg', '1574158600', '1574158600', null);
INSERT INTO `image` VALUES ('410', '/images/男士外套/风衣/法蘭詩頓/2019秋季新品男士春秋中长款风衣男士风衣中长款青年男士风衣/head/20191119\\5e750ca1b7ca6dc64e47ba36550cda06.jpg', '1574158634', '1574158634', null);
INSERT INTO `image` VALUES ('411', '/images/男士外套/风衣/法蘭詩頓/2019秋季新品男士春秋中长款风衣男士风衣中长款青年男士风衣/body/20191119\\ae75eb72fcb5ad43e0b3d52026fecccf.jpg', '1574158649', '1574158649', null);
INSERT INTO `image` VALUES ('412', '/images/男士外套/风衣/法蘭詩頓/2019秋季新品男士春秋中长款风衣男士风衣中长款青年男士风衣/body/20191119\\c8ed82c136ec0590c1acdf6011ab1e2f.jpg', '1574158649', '1574158649', null);
INSERT INTO `image` VALUES ('413', '/images/男士外套/风衣/法蘭詩頓/2019秋季新品男士春秋中长款风衣男士风衣中长款青年男士风衣/color/20191119\\d2c9888bffdd9ad97220c534a9554779.jpg', '1574158674', '1574158674', null);
INSERT INTO `image` VALUES ('414', '/images/男士外套/风衣/凯撒大帝/2019秋冬新品商务休闲男士长款夹克外套男时尚印花男士风衣/head/20191119\\557cd94ec94901b84a384022e710e2ef.jpg', '1574158721', '1574158721', null);
INSERT INTO `image` VALUES ('415', '/images/男士外套/风衣/凯撒大帝/2019秋冬新品商务休闲男士长款夹克外套男时尚印花男士风衣/body/20191119\\68244e5eb44667256ec402745ff72cc9.jpg', '1574158737', '1574158737', null);
INSERT INTO `image` VALUES ('416', '/images/男士外套/风衣/凯撒大帝/2019秋冬新品商务休闲男士长款夹克外套男时尚印花男士风衣/body/20191119\\683796871872c2040842ad42cf50b404.jpg', '1574158739', '1574158739', null);
INSERT INTO `image` VALUES ('417', '/images/男士外套/风衣/凯撒大帝/2019秋冬新品商务休闲男士长款夹克外套男时尚印花男士风衣/color/20191119\\1ee914f10445a54f431077fafeddac9a.jpg', '1574158761', '1574158761', null);
INSERT INTO `image` VALUES ('418', '/images/男士外套/西装/法蘭詩頓/2019秋季首发新品西装上衣外套男士休闲西装外套男士西装/head/20191119\\2340a3729bd3b71707e73a9b1c1f6705.jpg', '1574158797', '1574158797', null);
INSERT INTO `image` VALUES ('419', '/images/男士外套/西装/法蘭詩頓/2019秋季首发新品西装上衣外套男士休闲西装外套男士西装/body/20191119\\be55c0ff67b9fc2d472416b9d4e7b0f7.jpg', '1574158812', '1574158812', null);
INSERT INTO `image` VALUES ('420', '/images/男士外套/西装/法蘭詩頓/2019秋季首发新品西装上衣外套男士休闲西装外套男士西装/body/20191119\\1f3f639081ac80200234324ec23c4d2b.jpg', '1574158813', '1574158813', null);
INSERT INTO `image` VALUES ('421', '/images/男士外套/西装/法蘭詩頓/2019秋季首发新品西装上衣外套男士休闲西装外套男士西装/color/20191119\\6aadf3a3559488ba89a5fad295011a33.jpg', '1574158835', '1574158835', null);
INSERT INTO `image` VALUES ('422', '/images/男士外套/西装/爵士丹尼/2018秋冬新款绅士男士品格挺括羊毛质感商务西装上衣/head/20191119\\c9fcc1c8d6e6dd0870219ca436064116.jpg', '1574158882', '1574158882', null);
INSERT INTO `image` VALUES ('423', '/images/男士外套/西装/爵士丹尼/2018秋冬新款绅士男士品格挺括羊毛质感商务西装上衣/body/20191119\\51c9d62d3e3d9d15a7a0e54dd06586d5.jpg', '1574158912', '1574158912', null);
INSERT INTO `image` VALUES ('424', '/images/男士外套/西装/爵士丹尼/2018秋冬新款绅士男士品格挺括羊毛质感商务西装上衣/body/20191119\\2be80bd090515129ef4affd18ee8a9ff.jpg', '1574158913', '1574158913', null);
INSERT INTO `image` VALUES ('425', '/images/男士外套/西装/爵士丹尼/2018秋冬新款绅士男士品格挺括羊毛质感商务西装上衣/body/20191119\\b508d431efdfa19c8253e1779449f0b1.jpg', '1574158915', '1574158915', null);
INSERT INTO `image` VALUES ('426', '/images/男士外套/西装/爵士丹尼/2018秋冬新款绅士男士品格挺括羊毛质感商务西装上衣/color/20191119\\86ddc4daa483059941f7a133f00724e5.jpg', '1574158936', '1574158936', null);
INSERT INTO `image` VALUES ('427', '/images/男士外套/马甲/背心/高尔普/2019秋冬新款保暖百搭男款坎肩男装保暖背心马甲男/head/20191119\\01ef1497e1c059d0d6f74b8475f5053e.jpg', '1574158971', '1574158971', null);
INSERT INTO `image` VALUES ('428', '/images/男士外套/马甲/背心/高尔普/2019秋冬新款保暖百搭男款坎肩男装保暖背心马甲男/body/20191119\\eb732b49ae9ca6832cd89b4f19cb68ca.jpg', '1574158987', '1574158987', null);
INSERT INTO `image` VALUES ('429', '/images/男士外套/马甲/背心/高尔普/2019秋冬新款保暖百搭男款坎肩男装保暖背心马甲男/body/20191119\\d52b52cc231d2ffef67878779c2a202c.jpg', '1574158989', '1574158989', null);
INSERT INTO `image` VALUES ('430', '/images/男士外套/马甲/背心/高尔普/2019秋冬新款保暖百搭男款坎肩男装保暖背心马甲男/color/20191119\\08b566d80e852ed2884215816ceb0cc8.jpg', '1574159014', '1574159014', null);
INSERT INTO `image` VALUES ('431', '/images/男士外套/马甲/背心/KOJO/马甲男秋冬季无袖保暖运动休闲上衣背心青少年连帽马夹男士外套/head/20191119\\9433c94e81b81a9134c79f662e244d86.jpg', '1574159043', '1574159043', null);
INSERT INTO `image` VALUES ('432', '/images/男士外套/马甲/背心/KOJO/马甲男秋冬季无袖保暖运动休闲上衣背心青少年连帽马夹男士外套/body/20191119\\91726840f3ac7ea7440a7d8653aa910b.jpg', '1574159058', '1574159058', null);
INSERT INTO `image` VALUES ('433', '/images/男士外套/马甲/背心/KOJO/马甲男秋冬季无袖保暖运动休闲上衣背心青少年连帽马夹男士外套/body/20191119\\832fcddfc3e57d2b83a551a7ca1f5d96.jpg', '1574159059', '1574159059', null);
INSERT INTO `image` VALUES ('434', '/images/男士外套/马甲/背心/KOJO/马甲男秋冬季无袖保暖运动休闲上衣背心青少年连帽马夹男士外套/color/20191119\\72645b4695ec4a5edafa86d414592cab.jpg', '1574159101', '1574159101', null);
INSERT INTO `image` VALUES ('435', '/images/男士上装/短袖T恤/翰代维/ 2019夏季新款韩版印花男士t恤/body/20191119\\7f7248861fe9492f32eb0c1aec8f504f.jpg', '1574159350', '1574159350', null);
INSERT INTO `image` VALUES ('436', '/images/男士上装/短袖T恤/翰代维/ 2019夏季新款韩版印花男士t恤/body/20191119\\3a16dcafed0ef462fbe9194732470021.jpg', '1574159351', '1574159351', null);
INSERT INTO `image` VALUES ('437', '/images/男士上装/短袖T恤/FAIRYs/2019秋季新款男士简约休闲圆领长袖T恤/head/20191119\\6b4c9c47ea3915e566783ab4108821d7.jpg', '1574159702', '1574160266', null);
INSERT INTO `image` VALUES ('438', '/images/男士上装/短袖T恤/FAIRYs/2019秋季新款男士简约休闲圆领长袖T恤/body/20191119\\7d46743ca3cadf46390331506cd69cfe.jpg', '1574160284', '1574160284', null);
INSERT INTO `image` VALUES ('439', '/images/男士上装/短袖T恤/卡丹路/2019秋季新款长袖t恤男士V领内搭体恤衫青年男装修身打底上衣S/color/20191119\\6f4242423c93add1ba1f91d352d6144d.jpg', '1574160296', '1574160384', null);
INSERT INTO `image` VALUES ('440', '/images/男士上装/短袖T恤/卡丹路/2019秋季新款长袖t恤男士V领内搭体恤衫青年男装修身打底上衣S/head/20191119\\4d1ae191c301f558efb0e3c954ece53b.jpg', '1574160340', '1574160340', null);
INSERT INTO `image` VALUES ('441', '/images/男士上装/短袖T恤/卡丹路/2019秋季新款长袖t恤男士V领内搭体恤衫青年男装修身打底上衣S/body/20191119\\a80bec857d4207504d6634aeab0c8648.jpg', '1574160355', '1574160355', null);
INSERT INTO `image` VALUES ('442', '/images/男士上装/短袖T恤/卡丹路/2019秋季新款长袖t恤男士V领内搭体恤衫青年男装修身打底上衣S/body/20191119\\89cc066fd62240028a89399d2449dd4e.jpg', '1574160356', '1574160356', null);
INSERT INTO `image` VALUES ('443', '/images/男士上装/短袖T恤/FAIRYs/2019秋季新款男士简约休闲圆领长袖T恤/color/20191119\\96c68397f3c456da20ab5adb5f1077b0.jpg', '1574160403', '1574160403', null);
INSERT INTO `image` VALUES ('444', '/images/女士上装/T恤/美特斯邦威/【纯色百搭 清新休闲】夏季新款女装短袖t恤纯色打底衫女式t恤/body/20191119\\36a3864d3afbc25df36e4e12622eac32.jpg', '1574160529', '1574160529', null);
INSERT INTO `image` VALUES ('445', '/images/女士上装/T恤/美特斯邦威/【纯色百搭 清新休闲】夏季新款女装短袖t恤纯色打底衫女式t恤/body/20191119\\c1e52ab7a07815d4fb2182350db42b61.jpg', '1574160530', '1574160530', null);
INSERT INTO `image` VALUES ('446', '/images/女士上装/T恤/美特斯邦威/【纯色百搭 清新休闲】夏季新款女装短袖t恤纯色打底衫女式t恤/body/20191119\\e31611a6fa6ba62d256a989ce2dea08a.jpg', '1574160531', '1574160531', null);
INSERT INTO `image` VALUES ('447', '/images/女士上装/T恤/美特斯邦威/【纯色百搭 清新休闲】夏季新款女装短袖t恤纯色打底衫女式t恤/color/20191119\\4ebbe8a324744a7a993fd2452d8bfd83.jpg', '1574160601', '1574160601', null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ord` int(11) NOT NULL COMMENT '排序',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单ID',
  `controller` varchar(20) NOT NULL COMMENT '控制器',
  `method` varchar(20) NOT NULL COMMENT '方法',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态： 0：不可用 1：可用',
  `is_delete` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否删除 1：是 0：否',
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否影藏  0：否 1：是',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '1', '0', 'admin', 'index', '管理员管理', '1', '1', '0', null, '1569672779', null);
INSERT INTO `menu` VALUES ('5', '1', '1', 'admin', 'admin_list', '管理员列表', '1', '1', '0', '1560824533', '1569672780', null);
INSERT INTO `menu` VALUES ('9', '2', '1', 'admin', 'admin_edit', '添加（编辑）管理员', '1', '1', '1', '1560825304', '1569672780', null);
INSERT INTO `menu` VALUES ('10', '3', '1', ' admin', 'admin_del', '删除管理员', '1', '1', '1', '1560825451', '1569672780', null);
INSERT INTO `menu` VALUES ('11', '4', '1', 'admin', 'no_del', '批量恢复管理员', '1', '1', '1', '1560825675', '1569672780', null);
INSERT INTO `menu` VALUES ('41', '8', '0', 'system', 'index', '系统管理', '1', '1', '0', '1561191270', '1573964020', null);
INSERT INTO `menu` VALUES ('13', '5', '1', 'admin', 'admin_status', '管理员状态', '1', '1', '1', '1560825823', '1569672780', null);
INSERT INTO `menu` VALUES ('14', '2', '0', 'menu', 'index', '菜单管理', '1', '1', '0', '1560932481', '1569672780', null);
INSERT INTO `menu` VALUES ('15', '1', '14', 'menu', 'menu_list', '菜单列表', '1', '1', '0', '1560932764', '1569672780', null);
INSERT INTO `menu` VALUES ('56', '3', '0', 'user', 'index', '用户管理', '1', '1', '0', '1569586189', '1569673069', null);
INSERT INTO `menu` VALUES ('61', '4', '0', 'product', 'index', '商品管理', '1', '1', '0', '1570453335', '1570453335', null);
INSERT INTO `menu` VALUES ('58', '1', '56', 'user', 'user_list', '用户列表', '1', '1', '0', '1569586299', '1569673069', null);
INSERT INTO `menu` VALUES ('62', '1', '61', 'product', 'product_list', '商品列表', '1', '1', '0', '1570453394', '1570453394', null);
INSERT INTO `menu` VALUES ('26', '2', '14', 'menu', 'menu_edit', '添加(编辑)菜单', '1', '1', '1', '1560933419', '1569672781', null);
INSERT INTO `menu` VALUES ('27', '3', '14', 'menu', 'menu_del', '删除菜单', '1', '1', '1', '1560933467', '1569672781', null);
INSERT INTO `menu` VALUES ('28', '4', '14', 'menu', 'menu_delAll', '删除全部菜单', '1', '1', '1', '1560933509', '1569672781', null);
INSERT INTO `menu` VALUES ('29', '5', '14', 'menu', 'no_del', '批量恢复全部菜单', '1', '1', '1', '1560933560', '1569672781', null);
INSERT INTO `menu` VALUES ('30', '6', '14', 'menu', 'menu_status', '菜单状态', '1', '1', '1', '1560933588', '1569672781', null);
INSERT INTO `menu` VALUES ('36', '6', '1', 'role', 'role_list', '角色(权限)管理', '1', '1', '0', '1560934855', '1569672780', null);
INSERT INTO `menu` VALUES ('37', '7', '1', 'role', 'role_edit', '添加（编辑角色）', '1', '1', '1', '1560934921', '1569672780', null);
INSERT INTO `menu` VALUES ('38', '8', '1', 'role', 'role_del', '删除角色', '1', '1', '1', '1560934954', '1569672780', null);
INSERT INTO `menu` VALUES ('39', '9', '1', 'role', 'no_del', '角色恢复', '1', '1', '1', '1560935012', '1569672780', null);
INSERT INTO `menu` VALUES ('40', '10', '1', 'role', 'role_status', '角色状态', '1', '1', '1', '1560935050', '1569672780', null);
INSERT INTO `menu` VALUES ('42', '1', '41', 'system', 'index', '系统信息', '1', '1', '0', '1561191317', '1569672781', null);
INSERT INTO `menu` VALUES ('60', '2', '73', 'feedback', 'feedback_list', '反馈列表', '1', '1', '0', '1570079519', '1573964109', null);
INSERT INTO `menu` VALUES ('63', '2', '61', 'product', 'add', '添加商品', '1', '1', '0', '1570453443', '1570453443', null);
INSERT INTO `menu` VALUES ('64', '5', '0', 'order', 'index', '订单管理', '1', '1', '0', '1570453479', '1570453551', null);
INSERT INTO `menu` VALUES ('67', '2', '64', 'order', 'getMoney', '已支付订单', '1', '1', '0', '1570463120', '1570463140', null);
INSERT INTO `menu` VALUES ('66', '1', '64', 'order', 'noGetMoney', '未支付订单', '1', '1', '0', '1570463057', '1570463057', null);
INSERT INTO `menu` VALUES ('68', '3', '64', 'order', 'getProduct', '已发货订单', '1', '1', '0', '1570463197', '1570463197', null);
INSERT INTO `menu` VALUES ('69', '4', '64', 'order', 'successTrade', '交易成功订单', '1', '1', '0', '1570463239', '1570463239', null);
INSERT INTO `menu` VALUES ('70', '3', '61', 'category', 'category_list', '商品分类', '1', '1', '0', '1570608178', '1570608178', null);
INSERT INTO `menu` VALUES ('71', '6', '0', 'banner', 'index', '轮播图管理', '1', '1', '0', '1573117226', '1573117226', null);
INSERT INTO `menu` VALUES ('72', '1', '71', 'banner', 'banner_list', '轮播列表', '1', '1', '0', '1573117270', '1573117270', null);
INSERT INTO `menu` VALUES ('73', '7', '0', 'comment', 'index', '评论管理', '1', '1', '0', '1573964083', '1573964083', null);
INSERT INTO `menu` VALUES ('74', '1', '73', 'comment', 'comment_list', '评论列表', '1', '1', '0', '1573964272', '1573964272', null);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(30) NOT NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '下单用户ID',
  `total_price` int(6) NOT NULL COMMENT '商品总价',
  `count` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单备注',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态 0：未支付 1：已支付 2：已发货 3：交易成功',
  `pre_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pre_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pre_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `read` tinyint(1) DEFAULT '0' COMMENT '0:未读 1：已读',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('12', 'A20191006715571570376716', '1', '1', '2', '2333', '1', '广东省东莞市南城区西湖路99号广科', '李一', '12345678911', '0', '1570376707', '1570526466', null);
INSERT INTO `order` VALUES ('25', 'A20191008463681570530270', '1', '58', '1', '2333', '0', '广东省东莞市南城区西湖路99号广科', '李一', '12345678911', '0', '1570530270', '1570530270', null);
INSERT INTO `order` VALUES ('26', 'A20191107598161573133627', '1', '174', '1', '2333', '0', '北京北京啦啦', '小龙', '12345678911', '0', '1573133624', '1573133624', null);
INSERT INTO `order` VALUES ('27', 'A20191107454021573135804', '1', '143', '2', '2333', '3', '广东省 广州市xxxxx', '李二', '12345678977', '0', '1573135804', '1573210047', null);
INSERT INTO `order` VALUES ('28', 'A20191214577791576322805', '1', '82', '1', '2333', '1', '广东省东莞市西湖路99号广科', '李一', '12345678911', '0', '1576322805', '1576322805', null);

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `count` int(11) NOT NULL COMMENT '购买商品数量',
  `standard_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('12', '1', '1', '1');
INSERT INTO `order_product` VALUES ('12', '8', '1', '8');
INSERT INTO `order_product` VALUES ('25', '1', '1', '1');
INSERT INTO `order_product` VALUES ('26', '1', '3', '1');
INSERT INTO `order_product` VALUES ('27', '1', '2', '2');
INSERT INTO `order_product` VALUES ('27', '34', '1', '20');
INSERT INTO `order_product` VALUES ('28', '36', '2', '27');

-- ----------------------------
-- Table structure for param
-- ----------------------------
DROP TABLE IF EXISTS `param`;
CREATE TABLE `param` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) DEFAULT NULL,
  `season` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fabric` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scene` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material` varchar(150) NOT NULL,
  `explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` int(8) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of param
-- ----------------------------
INSERT INTO `param` VALUES ('23', '2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤 长袖T恤女 条纹T恤 女士T恤 舒适面料', '秋', '棉氨', '运动,休闲,通勤', '中国', '休闲,时尚,百搭', '面料成分：95%棉 5%氨纶', '	手洗，最高洗涤温度40ﾟC，不可漂白；平摊晾干；熨斗底板最高温度110ﾟC；不可干洗。', '1', null, '1573555154', null);
INSERT INTO `param` VALUES ('26', '【纯色百搭 清新休闲】夏季新款女装短袖t恤纯色打底衫女式t恤', '春,夏,秋', '棉', '约会,度假,休闲,居家,运动,旅游,逛街,通勤,校园', '中国', '休闲,时尚,潮流,百搭,经典运动风,学院风,简约风,青春活力,甜美可爱,运动休闲,基础大众', '纯棉', '手洗，最高温度30°c，不可漂白，在阴凉处悬挂晾干，熨斗底板最高温度110°c，不可干洗', '34', '1573036733', '1573036733', null);
INSERT INTO `param` VALUES ('27', '初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T长袖纯色内搭外穿t恤', '春,秋,冬', '聚酯纤维,棉', '休闲', '中国', '休闲', '聚酯纤维,90%棉', '最高洗涤温度30℃ 常规洗涤，不可漂白，悬挂晾干，熨斗底板最高温度110℃，不可干洗', '35', '1573483229', '1573483229', null);
INSERT INTO `param` VALUES ('28', '长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤 秋冬新款 女士半高领潮流字母T恤衫 日常穿搭款 休闲百搭', '春,秋,冬', '聚酯纤维,氨纶(莱卡)', '休闲,校园,通勤', '中国', '休闲,简约风,时尚', '66%聚酯纤维30%粘纤4%氨纶', '最高洗涤温度30℃缓和程序 不可漂白?悬挂晾干 熨斗底板最高温度110℃ 不可干洗', '36', '1573985584', '1573985584', null);
INSERT INTO `param` VALUES ('29', '秋冬季新品时尚翻领拼接款休闲百搭长袖T恤', '秋', '氨纶(莱卡),聚酯纤维,棉', '运动、休闲', '中国', '休闲,时尚,百搭', '聚酯纤维97% 氨纶3%', '低温手洗 不可漂白 平摊晾干 低温熨烫 常规干洗', '37', '1573987782', '1573987782', null);
INSERT INTO `param` VALUES ('30', '百搭金丝绒网纱拼接打底衫百搭修身圆领长袖t恤上衣', '春,秋,冬', '聚酯纤维,氨纶(莱卡)', '约会,休闲,逛街', '中国', '欧美,休闲', '92.0%聚酯纤维 8.0%氨纶', '手洗 最高洗涤温度40度，不可漂白，平放晾干，低温熨烫，不可干洗', '38', '1573988048', '1573988048', null);
INSERT INTO `param` VALUES ('31', '2019秋冬新款时尚撞色条纹t恤女百搭印花圆领休闲长袖t恤上衣', '春,秋,冬', '棉', '休闲,度假,约会,通勤,逛街', '中国', '休闲,时尚,潮流,百搭,通勤', '90.1%棉 9.9%氨纶', '最高洗涤温度30℃；不可漂白；悬挂晾干；熨斗底板最高温度110℃；常规干洗', '39', '1573988293', '1573988293', null);
INSERT INTO `param` VALUES ('32', '秋冬新款韩版宽松T恤圆领长袖上衣不规则打底衫基础百搭女式T恤', '春,秋', '棉', '度假,运动,休闲', '中国', '百搭,简约风,运动休闲', '90.1%棉 9.9%氨纶', '手洗，最高洗涤温度40℃，不可漂白，悬挂晾干，不可翻转干燥，熨斗底板最高温度110℃-蒸汽熨烫可能造成不可回复的损伤-不可干洗', '40', '1573988565', '1573988565', null);
INSERT INTO `param` VALUES ('33', '【弹力修身】女士韩版修身潮流拼接蕾丝圆领打底衫t恤 长袖T恤  韩版简约 时尚减龄', '春,秋,冬', '棉', '休闲,通勤,校园', '中国 广东 中山', '休闲,时尚,百搭', '95%棉 5%氨纶', '最高洗涤温度30℃常规洗涤 不可漂白 悬挂晾干 熨斗底板最高温度110℃ 不可干洗', '41', '1573988866', '1573988866', null);
INSERT INTO `param` VALUES ('34', '2019秋冬新款百搭弹力长袖半高领长袖t恤女字母印花袖套头上衣', '春,秋,冬', '棉', '休闲,度假,约会,通勤,逛街', '中国', '休闲,时尚,潮流,百搭,通勤', '91%棉 9%氨纶', '最高洗涤温度30℃；不可漂白；悬挂晾干；熨斗底板最高温度110℃；常规干洗', '42', '1573989321', '1573989321', null);
INSERT INTO `param` VALUES ('35', '潮流设计风波点小衫女2019秋季新款法式浪漫娃娃领衬衫', '秋', '聚酯纤维', '约会,商务,逛街', '中国', '潮流,商务,唯美风', '99.9%聚酯纤维', '最高洗涤温度30℃；不可漂白；悬挂晾干；熨斗底板最高温度110℃；', '43', '1574083902', '1574083902', null);
INSERT INTO `param` VALUES ('36', '2019秋季新品波点宽松雪纺长袖衬衫女款', '秋', '聚酯纤维', '休闲', '中国', '休闲', '100%聚酯纤维', '最高洗涤温度30℃；不可漂白；悬挂晾干；熨斗底板最高温度110℃；', '44', '1574084078', '1574084078', null);
INSERT INTO `param` VALUES ('37', '秋冬新款优雅心形印花领口小香风系带衬衫女', '秋,冬', '聚酯纤维', '通勤', '中国', '优雅', '100%聚酯纤维', '常规手洗 悬挂晾干 不可漂白 不可翻转干燥 熨斗底板最高温度110℃ ', '45', '1574084208', '1574084208', null);
INSERT INTO `param` VALUES ('38', '2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫', '春,秋', '00%聚酯纤维', '约会,通勤,逛街', '中国深圳', '时尚,优雅,百搭', '00%聚酯纤维', '可以手洗，不可氯漂，中温熨烫，悬挂凉干，可以干洗', '46', '1574084326', '1574084326', null);
INSERT INTO `param` VALUES ('39', '经典休闲小衫女2019秋季新款时尚半透中袖衬衣', '秋', '聚酯纤维', '休闲,居家,校园', '中国', '时尚,潮流,优雅', '100%聚酯纤维', '可以手洗，不可氯漂，中温熨烫，悬挂凉干，可以干洗', '47', '1574084425', '1574084425', null);
INSERT INTO `param` VALUES ('40', '优雅纯色气质领带雪纺女士衬衫 气质领带 宽松袖型 优雅纯色雪纺女士衬衫', '秋,冬', '聚酯纤维', '通勤', '中国', '休闲,时尚,通勤', '97.5%聚酯纤维2.5%氨纶', '常规手洗 悬挂晾干 不可漂白 不可翻转干燥 熨斗底板最高温度110℃ 不可干洗', '48', '1574084579', '1574084579', null);
INSERT INTO `param` VALUES ('41', '新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫', '春,秋', '聚酯纤维,锦纶(尼龙),粘胶纤维', '通勤', '中国', '通勤', '面料：53%粘胶纤维27.9%聚酯纤维19.1%锦纶', '手洗（最高洗涤温度40℃），不可漂白，悬挂晾干，中温熨烫，常规干洗', '49', '1574087923', '1574087923', null);
INSERT INTO `param` VALUES ('42', '女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮', '春,秋,冬', '聚酯纤维', '通勤', '中古', '日韩,简约风,小清新', '45.2%粘纤 30.6%聚酯纤维 24.2%锦纶', '手洗（最高洗涤温度40℃），不可漂白', '50', '1574088032', '1574088032', null);
INSERT INTO `param` VALUES ('43', '秋冬女装新款V领单排彩色扣双口袋长袖针织开衫毛衣外套上衣', '秋', '锦纶(尼龙),腈纶,聚酯纤维', '通勤,校园,逛街', '中国', '时尚,百搭,基础大众', '腈纶53.6% 聚酯纤维27.2% 锦纶19.2%', '单独手洗、不可漂白、在阴凉处平摊晾干、熨斗底板最高温度110℃ 温馨提示，与其他衣物分开手洗，为保持衣物色泽，衣物浸泡时间不可超过15分钟。可搭配金纺等柔软剂使衣物纤维更有质地。', '51', '1574088171', '1574088171', null);
INSERT INTO `param` VALUES ('44', '【降价清仓】简约通勤圆领秋装时尚宽松长袖打底针织衫女', '春,秋,冬', '聚酯纤维,锦纶(尼龙),粘胶纤维', '通勤', '中国', '优雅,通勤,简约风', '粘纤54.9% 聚酯纤维26.8%锦纶18.3%', '建议手洗、不可漂白、悬挂晾干、低温熨烫、不能干洗', '52', '1574088330', '1574088330', null);
INSERT INTO `param` VALUES ('45', '2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣', '秋,冬', '聚酯纤维', '运动,休闲,通勤', '中国', '休闲,时尚,简约风', '100%聚酯纤维', '手洗，最高洗涤温度40ﾟC，不可漂白；平摊晾干；不可翻转干燥', '53', '1574088512', '1574088512', null);
INSERT INTO `param` VALUES ('46', '19年春季女装新品 基础百搭 减龄设计 修身打底 简约大方', '春', '针织面料', '约会,休闲,通勤,逛街', '深圳', '时尚,潮流,优雅,百搭,通勤,唯美风,简约风,轻熟风', '94.8%棉 5.2%氨纶', '不可浸泡，分开洗涤， 手洗，最高洗涤温度40℃;不可漂白;', '54', '1574088723', '1574088723', null);
INSERT INTO `param` VALUES ('47', '2019秋季新款女式针织衫经典百搭毛衣', '秋', '锦纶(尼龙),聚酯纤维,粘胶纤维', '约会,度假,休闲,校园,旅游,逛街', '中国', '日韩,休闲,时尚,百搭,通勤', '53.7%粘纤26.4%聚酯纤维19.14%锦纶', '手洗?最高洗涤温度40℃ 不可漂白 平摊晾干?', '55', '1574088897', '1574088897', null);
INSERT INTO `param` VALUES ('48', '【妻子的浪漫旅行明星推荐】秋冬半高领毛衣长袖打底衫女针织衫', '春,秋,冬', '聚酯纤维,锦纶(尼龙)', '约会,度假,休闲,校园,旅游,逛街', '中国', '日韩,休闲,时尚,百搭,通勤', '50%粘纤 30%聚酯纤维 20%锦纶', '手洗?最高洗涤温度40℃ 不可漂白 平摊晾干? 熨斗底板最高温度110℃ 不可干洗', '56', '1574089039', '1574089039', null);
INSERT INTO `param` VALUES ('49', '2019秋冬新款女式圆领毛衣宽松时尚动物图案刺绣套头上衣针织衫', '春,秋,冬', '粘胶纤维', '休闲,通勤', '中国', '休闲,时尚,潮流', '50%粘纤 30%聚酯纤维 20%锦纶', '最高洗涤温度30℃缓和程序 不可漂白?悬挂晾干 熨斗底板最高温度100℃ 不可干洗', '57', '1574089181', '1574089181', null);
INSERT INTO `param` VALUES ('50', '19秋冬新款时尚亮粉烫金波边半高领打底衫手缝珠扣T恤女式针织衫', '冬', '聚酯纤维', '通勤', '中国', '通勤', '97.3%聚酯纤维 2.7%氨纶(含烫金)\"', '手洗，最高洗涤温度40℃ 不可漂白 悬挂晾干 熨斗底板最高温度110度 不可干洗 不可绞拧\"', '58', '1574089279', '1574089279', null);
INSERT INTO `param` VALUES ('51', '2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲', '冬', '聚酯纤维', '约会,休闲,通勤', '杭州', '韩,百搭,慵懒风', '100%聚酯纤维 面料（基纱）', '手洗，不可漂白，中温熨烫，常规干洗', '59', '1574089766', '1574089766', null);
INSERT INTO `param` VALUES ('52', '', '冬', '聚酯纤维', '休闲,通勤,逛街', '杭州', '日韩,潮流,百搭', '面料：100%聚酯纤维 里料：100%聚酯纤维', '手洗，不可漂白，中温熨烫，常规干洗', '60', '1574089868', '1574089868', null);
INSERT INTO `param` VALUES ('53', '【2019年冬季新品】女款基础百搭纯色连帽保暖加厚棉服马夹', '冬', '锦纶(尼龙),聚酯纤维', '休闲', '中国', '休闲,时尚,百搭', '成分：面料：55%锦纶 45%聚酯纤维 里料：100%聚酯纤维 胆布：100%聚酯纤维', '手洗，不可漂白，中温熨烫，常规干洗', '61', '1574089996', '1574089996', null);
INSERT INTO `param` VALUES ('54', '简约百搭女式休闲裤纯色丝绒加绒加厚开叉短裤 百搭纯色开叉/不开叉短裤', '秋,冬', '氨纶(莱卡),聚酯纤维', '休闲', '中国', '休闲,百搭,简约风', '面料成分：93%聚酯纤维 7%氨纶 里层成分：93%聚酯纤维 7%氨纶', '30度水洗，不可漂白，平摊晾干，低温熨烫，不可干洗', '62', '1574090804', '1574090804', null);
INSERT INTO `param` VALUES ('55', '【冬加厚新款】2019百搭纯色简约休闲奶奶裤女哈伦裤', '冬', '聚酯纤维', '通勤', '通勤', '通勤', '面料：92.8%聚酯纤维 7.2%粘纤', '最高洗涤温度30℃，', '63', '1574090921', '1574090921', null);
INSERT INTO `param` VALUES ('56', '秋冬新品女式阔腿裤时尚高腰金属扣装饰格纹九分女休闲裤', '春,秋,冬', '聚酯纤维', '度假,休闲,旅游', '中国', '时尚,简约风,小清新', '面料:100%聚酯纤维 里料:100%聚酯纤维', '手洗-最高洗涤温度40℃，不可漂白，悬挂晾干，熨斗底板最高温度110℃', '64', '1574091012', '1574091012', null);
INSERT INTO `param` VALUES ('57', '牛仔九分裤女2019秋装新款韩版时尚浅色直筒显瘦萝卜裤子', '冬,秋', '棉', '通勤', '中国', '休闲,时尚,通勤', '棉', '无', '65', '1574125968', '1574125968', null);
INSERT INTO `param` VALUES ('58', '百搭直筒拼接口袋装饰显瘦大码无弹牛仔裤秋季新款宽松大码裤装', '春,秋,冬', '棉', '休闲', '中国济南', '日韩', '100%棉', '建议反面轻柔洗涤，温水分色洗涤并悬挂晾干，以免衣服染色。', '66', '1574126089', '1574126089', null);
INSERT INTO `param` VALUES ('59', '高腰加绒九分牛仔裤女秋冬新款排扣可翻边小脚裤弹力修身铅笔裤子', '春,夏,秋', '棉', '校园,旅游,逛街', '中国', '经典,牛仔系,街头风', '78.4%棉 19.78%聚酯纤维 1.9%氨纶', '建议反面轻柔洗涤，温水分色洗涤并悬挂晾干，以免衣服染色。', '67', '1574126205', '1574126205', null);
INSERT INTO `param` VALUES ('60', '2019冬新款复古格纹通勤时尚配腰带格纹针织阔腿短裤', '春,秋,冬', '氨纶(莱卡),聚酯纤维,粘胶纤维', '约会,休闲,通勤', '中国', '时尚,通勤,文艺风', '面料：73.2%聚酯纤维22.5%粘纤4.3%氨纶', '1.手洗最高洗涤温度40℃ 2.不可漂白 3.阴凉处平摊晾干 4.熨斗底板最高温度110℃ 5.常规干洗 6.请与其他衣物分开洗涤', '68', '1574126466', '1574126466', null);
INSERT INTO `param` VALUES ('61', '2019冬新款宽松高腰直筒灯芯绒显瘦女式休闲裤长裤', '冬', '棉,氨纶(莱卡)', '约会,逛街', '中国', '休闲,时尚,百搭', '98%棉 2%氨纶', '最高洗涤温度30℃常规程序，不可漂白，悬挂晾干，熨斗底板最高温度110℃，蒸汽熨烫可能造成不可回复的损伤，不可干洗。', '69', '1574126554', '1574126554', null);
INSERT INTO `param` VALUES ('62', '休闲裤女款裤子宽松秋季新款百搭显瘦女士高腰阔腿裤', '夏', '聚酯纤维', '通勤', '中国', '通勤', '99.5%聚酯纤维', '最高洗涤温度30℃常规程序，不可漂白，悬挂晾干，熨斗底板最高温度110℃，蒸汽熨烫可能造成不可回复的损伤，不可干洗。', '70', '1574126875', '1574126875', null);
INSERT INTO `param` VALUES ('63', '连体裤女】AS-BCN女装时尚宽松吊带牛仔连体裤女', '春', '棉', '通用', '中国', '通用', '98.9%棉1.1%氨纶', '低温水洗不可漂白悬挂晾干低温熨烫常规干洗', '71', '1574127009', '1574127009', null);
INSERT INTO `param` VALUES ('64', '2019秋装新款时尚牛仔背带裤女式连体裤', '春,秋', '氨纶(莱卡),棉', '通勤', '中国', '时尚', '98.9%棉1.1%氨纶', '低温水洗不可漂白悬挂晾干低温熨烫常规干洗', '72', '1574127104', '1574127104', null);
INSERT INTO `param` VALUES ('65', '秋女士无袖假两件休闲裤连体裤', '春,秋', '聚酯纤维', '休闲,通勤', '中国', '休闲,时尚', '98.9%棉1.1%氨纶', '低温水洗不可漂白悬挂晾干低温熨烫常规干洗', '73', '1574127182', '1574127182', null);
INSERT INTO `param` VALUES ('66', '新品夏款慵懒风短款外搭休闲气质开衫镂空针织女式外套', '春,夏', '棉', '度假,沙滩,通勤,校园,旅游,逛街', '中国', '通勤', '100%棉', '手洗（最高洗涤温度40℃），不可漂白，悬挂晾', '74', '1574127311', '1574127311', null);
INSERT INTO `param` VALUES ('67', '【2019冬新款女式外套】呢料仿羊绒撞色拼接千鸟格外套', '冬', '聚酯纤维', '休闲,通勤,逛街', '中国', '时尚,潮流,百搭,通勤', '成分：面料：55.8%聚酯纤维 21%羊毛 15.1%棉 8.1%粘胶纤维', '最高洗涤温度30℃ 缓和程序 不可漂白 悬挂晾干 熨斗底板最高温度110℃ 缓和干洗', '75', '1574127429', '1574127429', null);
INSERT INTO `param` VALUES ('68', '简约短款修身显瘦干练随性机车女小皮衣外套', '春', '粘纤', '休闲,商务', '杭州', '休闲,时尚,通勤', '面料：100%粘纤（涂层除外） 里料：100%聚酯纤维', '1不可漂白2平铺晾干3最高洗涤温度30度常规程序', '76', '1574127562', '1574127562', null);
INSERT INTO `param` VALUES ('69', '2019秋季新款时尚韩版双排扣修身显瘦休闲女式风衣中长款', '秋,冬', '棉', '通勤', '浙江杭州', '通勤', '面料：52.7%棉 47.3%聚酯纤维 里料：100%聚酯纤维', '手洗，最高洗涤温度40℃ 不可漂白 悬挂晾干 熨斗底板最高温度110℃ 常规湿洗', '77', '1574127688', '1574127688', null);
INSERT INTO `param` VALUES ('70', '秋季新款时尚百搭简约通勤翻领单排扣系带女式风衣中长款', '春,秋', '棉,聚酯纤维', '通勤', '浙江杭州', '通勤', '面料：55.1%棉 35.7%聚酯纤维 9.2%锦纶', '手洗最高洗涤温度40°C 不可漂白 在阴凉处平摊晾干 熨斗底板最高温度110℃ 缓和干洗', '78', '1574127786', '1574127786', null);
INSERT INTO `param` VALUES ('71', '2019秋冬女装新品中长款工装外套休闲小个子风衣韩版宽松潮', '秋', '聚酯纤维', '通勤', '中国', '欧美', '35.7%聚酯纤维 9.2%锦纶', '手洗最高洗涤温度40℃，不可漂白，悬挂晾干，熨斗底板最高温度110℃', '79', '1574127881', '1574127881', null);
INSERT INTO `param` VALUES ('72', '女士短款新品轻薄连帽修身百搭羽绒服外套', '春,秋,冬', '锦纶(尼龙)', '约会,度假,居家,通勤,校园,旅游', '中国', '日韩,潮流,百搭,通勤,学院风,简约风,小清新', '锦纶(尼龙)', '可水洗，水温30度；不可使用含氟漂白剂；翻滚烘干，低温；低温熨烫，110摄氏度；不可干洗', '80', '1574128018', '1574128018', null);
INSERT INTO `param` VALUES ('73', '2019冬季新款厚外套白色灯芯绒羽绒服中长款宽松韩版小个', '冬', '灯芯绒', '度假,休闲,逛街', '中国', '小清新,青春活力,甜美可爱', '灯芯绒', '与其它衣物分开洗，不可浸泡，不可绞拧，手洗最高温度40℃', '81', '1574128124', '1574128124', null);
INSERT INTO `param` VALUES ('74', '【2019冬装新款】女士韩版宽松长袖连帽侧开叉前短后长棉衣', '冬', '聚酯纤维', '休闲,逛街', '中国', '日韩,时尚', '面料1：100%聚酯纤维面料2：100%聚酯纤维', '手洗 最高40℃ 不可漂白 平摊晾干 不可翻转干 低温烫最高110℃', '82', '1574128234', '1574128234', null);
INSERT INTO `param` VALUES ('75', '冬季旗袍女中国风棉衣加厚保暖中式女装复古连衣裙冬改良唐装棉袄', '冬', '聚酯纤维', '休闲,逛街', '中国', '日韩,时尚', '聚酯纤维', '手洗 最高40℃ 不可漂白 平摊晾干 不可翻转干 低温烫最高110℃', '83', '1574128342', '1574128342', null);
INSERT INTO `param` VALUES ('76', '2019秋季新款时尚字母印花圆领条纹短袖连衣裙 秋装女裙子', '春,夏,秋', '氨纶(莱卡),棉', '约会,休闲,逛街', '中国', '休闲,时尚', '棉95.6% 氨纶4.4%', '深浅衣服分开洗.最高洗涤水温在30℃左右，缓和程序', '84', '1574128458', '1574128458', null);
INSERT INTO `param` VALUES ('77', '2019秋季新款韩版女款打底针织拼接网纱连衣裙 打底针织拼接网纱裙子 修身版型 a字裙', '春,秋', '粘胶纤维,锦纶(尼龙),聚酯纤维', '休闲,旅游,逛街', '济南', '休闲,时尚,慵懒风', '上身:44%粘纤33%锦纶23%聚酯纤维|下身网纱面料:100%聚酯纤维', '深浅衣服分开洗.最高洗涤水温在30℃左右，缓和程序、不可漂白', '85', '1574128553', '1574128553', null);
INSERT INTO `param` VALUES ('78', '女合体格纹百褶毛呢短半裙', '四季适用', '腈纶,聚酯纤维,羊毛', '约会,度假,运动,休闲,通勤,校园', '中国', '休闲,时尚,潮流,经典,百搭,通勤', '面料：79%聚酯纤维+11.2%绵羊毛', '0℃常规水洗，不可漂白，悬挂晾干', '86', '1574128652', '1574128652', null);
INSERT INTO `param` VALUES ('79', '2019春秋新款气质女装裙子高腰显瘦包臀短款PU皮裙A字半身裙女', '春,秋', '聚酯纤维,粘胶纤维', '休闲,通勤', '中国', '日韩,休闲,时尚', '面料：83.4%粘纤16.6%聚酯纤维里料：100%聚酯纤维', '30℃常规水洗，不可漂白，悬挂晾干', '87', '1574128754', '1574128754', null);
INSERT INTO `param` VALUES ('80', '2019夏季新款韩版中长款百褶裙渐变网纱半身裙仙女裙', '春,夏', '聚酯纤维', '通勤', '中国', '日韩,休闲,时尚', '面料：100%聚酯纤维 里料：100%聚酯纤维（含聚酯薄膜纤维）', '30℃常规水洗，不可漂白，悬挂晾干，熨斗底板最高温度110℃', '88', '1574128875', '1574128875', null);
INSERT INTO `param` VALUES ('81', '2019春季新款减龄半身裙 休闲百搭蛋糕裙百褶裙女', '春,夏', '聚酯纤维', '约会,休闲,校园', '中国', '休闲,时尚,百搭,复古风', '100%聚酯纤维', '30℃常规水洗，不可漂白，悬挂晾干，熨斗底板最高温度110℃', '89', '1574128962', '1574128962', null);
INSERT INTO `param` VALUES ('82', '男式t恤纯色印花男', '夏', '棉', '约会,度假,休闲,居家', '中国', '日韩,休闲,时尚,潮流', '100%棉', '最高洗涤温度30℃ 常规程序 不可漂白 悬挂晾干', '90', '1574129178', '1574129178', null);
INSERT INTO `param` VALUES ('83', '2019夏季新款韩版印花男士t恤短袖男装短袖男士圆领短袖t恤士t恤短袖潮牌男装男士打底衫t恤', '.夏', '棉', '逛街,休闲,校园,日常', '中国', '日韩,街头风,时尚,休闲,潮流', '95%棉 5%氨纶', '最高洗涤温度30℃缓和程序 不可漂白?悬挂晾干 熨斗底板最高温度110℃', '91', '1574129309', '1574129309', null);
INSERT INTO `param` VALUES ('84', '2019秋季新款男士简约休闲圆领长袖T恤', '春,秋', '棉', '居家,日常,通勤', '中国广东广州', '日韩,休闲,时尚', '100%棉', '最高洗涤温度30℃缓和程序 不可漂白', '92', '1574129385', '1574129385', null);
INSERT INTO `param` VALUES ('85', '2019秋季新款长袖t恤男士V领内搭体恤衫青年男装修身打底上衣', '春,秋,冬', '棉', '休闲,居家,日常', '中国', '休闲,经典,简约风', '棉95% 氨纶5%', '最高洗涤温度30℃缓和程序 不可漂白', '93', '1574129467', '1574129467', null);
INSERT INTO `param` VALUES ('86', '【高弹牛津纺】秋冬季新品男式衬衣休闲纯色衬衫长袖男士衬衫', '春,秋,冬', '棉', '约会,度假,运动,休闲', '中国', '英伦,休闲,时尚', '97%棉 3%氨纶', '手洗，最高温度30°c，不可漂白', '94', '1574129566', '1574129566', null);
INSERT INTO `param` VALUES ('87', '秋冬新款 男装商务休闲口袋细条纹衬衫 柔软打底长袖衬', '四季适用', '棉', '商务,通勤,上班', '中国', '商务,绅士系,基础大众', '棉60% 聚酯纤维40%', '手洗，最高温度30°c，不可漂白，在阴凉处悬挂晾干', '95', '1574137995', '1574137995', null);
INSERT INTO `param` VALUES ('88', '2019新款男式休闲裤男款运动裤子五分百搭沙滩裤男士短裤夏季', '夏', '涤纶', '运动,休闲', '中国', '休闲,时尚,潮流', '涤纶', '最高洗涤温度30℃；不可漂白；悬挂晾干', '96', '1574138390', '1574138390', null);
INSERT INTO `param` VALUES ('89', '美国潮牌夏季休闲短裤港风男士水洗五分裤', '夏', '棉', '约会,度假,运动', '中国', '日韩,英伦,休闲,时尚', '100%棉', '洗涤温度30℃，不可漂白，阴凉处悬挂晾干，低温熨烫', '97', '1574138526', '1574138526', null);
INSERT INTO `param` VALUES ('90', '2019秋季新款男裤子休闲潮流韩版直筒束脚工装裤子男式休闲裤', '夏', '棉', '休闲,日常', '中国', '休闲,青春活力,工装风', '面料成分：军绿色97.5%棉 2.5%其他纤维 黑色100%棉', '手洗 最高洗涤温度30℃ 不可漂白 悬挂晾干', '98', '1574138613', '1574138613', null);
INSERT INTO `param` VALUES ('91', '2019新品纯色小脚经典舒适休闲裤长裤男士休闲裤', '春,秋,冬', '棉', '日常,旅游,逛街', '中国', '时尚,潮流,潮牌', '面料：100%棉', '最高洗涤温度30℃常规洗涤 不可漂白 悬挂晾干', '99', '1574138720', '1574138720', null);
INSERT INTO `param` VALUES ('92', '商务休闲 显瘦微弹裤子男士加绒牛仔裤直筒裤宽松男士牛仔裤秋冬', '四季适用', '混纺', '休闲', '中国', '休闲', '混纺', '洗涤说明：最高洗涤温度30℃。不可漂白。', '100', '1574139009', '1574139009', null);
INSERT INTO `param` VALUES ('93', '冬季男装裤子毛边水洗休闲修身加绒保暖直筒男士牛仔长裤', '冬', '聚酯纤维', '日常', '中国', '休闲', '面料成分：蓝色63.4%棉33.5%聚酯纤维2.2%氨纶0.9%氨纶', '手洗 最高洗涤温度30℃ 不可漂白 悬挂晾干', '101', '1574139117', '1574139117', null);
INSERT INTO `param` VALUES ('94', '2019秋季新品男士春秋中长款风衣男士风衣中长款青年男士风衣', '春,秋', '聚酯纤维', '休闲,商务', '中国', '休闲,商务', '聚酯纤维', '手洗', '102', '1574139372', '1574139372', null);
INSERT INTO `param` VALUES ('95', '2019秋冬新品商务休闲男士长款夹克外套男时尚印花男士风衣', '春,秋,冬', '聚酯纤维', '休闲,商务,日常', '中国', '休闲,时尚,商务休闲', '聚酯纤维', '手洗', '103', '1574139540', '1574139540', null);
INSERT INTO `param` VALUES ('96', '2019秋季首发新品西装上衣外套男士休闲西装外套男士西装', '春,秋', '聚酯纤维', '休闲,商务', '广州', '休闲,商务', '聚酯纤维', '不可水洗，不可漂白，悬挂晾干，不可翻转干燥', '104', '1574139793', '1574139793', null);
INSERT INTO `param` VALUES ('97', '2018秋冬新款绅士男士品格挺括羊毛质感商务西装上衣', '春,秋', '聚酯纤维', '休闲,商务', '广州', '休闲,商务', '面料：78.7%羊毛 21.3%聚酯纤维 里料：50%粘纤 50%聚酯纤维', '不可水洗，不可漂白，悬挂晾干，不可翻转干燥', '105', '1574139916', '1574139916', null);
INSERT INTO `param` VALUES ('98', '2019秋冬新款保暖百搭男款坎肩男装保暖背心马甲男', '秋,冬', '聚酯纤维', '度假,休闲,逛街', '中国', '休闲,时尚,潮流', '面料：100%聚酯纤维 里料：100%聚酯纤维', '最高洗涤温度30℃；不可漂白；悬挂晾干；', '106', '1574140042', '1574140042', null);
INSERT INTO `param` VALUES ('99', '马甲男秋冬季无袖保暖运动休闲上衣背心青少年连帽马夹男士外套', '春,秋,', '聚酯纤维', '运动,休闲,日常', '中国', '休闲,时尚,潮流', '100%聚酯纤维', '最高洗涤温度30℃；不可漂白；悬挂晾干', '107', '1574140143', '1574140143', null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL,
  `sell` int(8) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:在架',
  `centerImg_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL COMMENT '商品所属分类id',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否为热商品 0：否 1:是',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '吉牡', '2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤', '59.00', '9', '1', '1', '8', '1', '1570376707', '1573566206', null);
INSERT INTO `product` VALUES ('34', '美特斯邦威', '【纯色百搭 清新休闲】夏季新款女装短袖t恤纯色打底衫女式t恤', '27.00', '1', '1', '59', '8', '0', '1573036733', '1573036733', null);
INSERT INTO `product` VALUES ('35', 'OopsCiah', '初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T', '49.00', '0', '1', '65', '8', '0', '1573910599', '1573483229', null);
INSERT INTO `product` VALUES ('36', '翰代维', '长袖打底衫女潮流字母女装上衣2019秋冬新款宽松内搭女式T恤', '41.00', '2', '1', '75', '8', '0', '1573985584', '1573985584', null);
INSERT INTO `product` VALUES ('37', '慕诗涵', '秋冬季新品时尚翻领拼接款休闲百搭长袖T恤', '98.00', '0', '1', '82', '8', '0', '1573987782', '1573987782', null);
INSERT INTO `product` VALUES ('38', 'RARAMAX', '百搭金丝绒网纱拼接打底衫百搭修身圆领长袖t恤上衣', '65.00', '0', '1', '87', '8', '0', '1573988048', '1573988048', null);
INSERT INTO `product` VALUES ('39', 'promone', '2019秋冬新款时尚撞色条纹t恤女百搭印花圆领休闲长袖t恤上衣', '33.00', '0', '1', '93', '8', '0', '1573988293', '1573988293', null);
INSERT INTO `product` VALUES ('40', '拓路者', '秋冬新款韩版宽松T恤圆领长袖上衣不规则打底衫基础百搭女式T恤', '69.00', '0', '1', '99', '8', '0', '1573988565', '1573988565', null);
INSERT INTO `product` VALUES ('41', 'MBSKY', '女士韩版修身潮流拼接蕾丝圆领打底衫t恤 长袖T恤', '45.00', '0', '1', '105', '8', '0', '1573988866', '1573989072', null);
INSERT INTO `product` VALUES ('42', 'promone', '2019秋冬新款百搭弹力长袖半高领长袖t恤女字母印花袖套头上衣', '49.00', '0', '1', '111', '8', '0', '1573989321', '1573989321', null);
INSERT INTO `product` VALUES ('43', '戈玛蒂', '潮流设计风波点小衫女2019秋季新款法式浪漫娃娃领衬衫', '84.00', '0', '1', '117', '9', '0', '1574083902', '1574083902', null);
INSERT INTO `product` VALUES ('44', 'LWEST', '2019秋季新品波点宽松雪纺长袖衬衫女款', '120.00', '0', '1', '123', '9', '0', '1574084078', '1574084078', null);
INSERT INTO `product` VALUES ('45', '摩凡', '秋冬新款优雅心形印花领口小香风系带衬衫女', '99.00', '0', '1', '129', '9', '0', '1574084208', '1574084208', null);
INSERT INTO `product` VALUES ('46', 'BESSIE', '2019秋新款时尚一件搭所有经典不败蝴蝶结系带七分袖百搭女衬衫', '90.00', '0', '1', '136', '9', '0', '1574084326', '1574084326', null);
INSERT INTO `product` VALUES ('47', '戈玛蒂', '经典休闲小衫女2019秋季新款时尚半透中袖衬衣', '64.00', '0', '1', '144', '9', '0', '1574084425', '1574084425', null);
INSERT INTO `product` VALUES ('48', '摩凡', '优雅纯色气质领带雪纺女士衬衫', '129.00', '0', '1', '151', '9', '0', '1574084579', '1574084579', null);
INSERT INTO `product` VALUES ('49', '音卓', '新款秋装韩范个性流行百搭圆领修身显瘦小清新毛衣气质女生针织衫', '47.00', '0', '1', '157', '10', '0', '1574087923', '1574087923', null);
INSERT INTO `product` VALUES ('50', 'LRUD', '女式针织衫2019秋冬新款韩版短款修身V领长袖外套上衣潮', '59.00', '0', '1', '164', '10', '0', '1574088032', '1574088032', null);
INSERT INTO `product` VALUES ('51', 'huagaa', '秋冬女装新款V领单排彩色扣双口袋长袖针织开衫毛衣外套上衣', '85.00', '0', '1', '174', '10', '0', '1574088171', '1574088171', null);
INSERT INTO `product` VALUES ('52', 'LISA.LISA', '简约通勤圆领秋装时尚宽松长袖打底针织衫女', '55.00', '0', '1', '180', '10', '0', '1574088330', '1574088330', null);
INSERT INTO `product` VALUES ('53', '吉牡', '2019新款时尚通勤撞色秋冬女装圆领套头针织衫女式毛衣', '79.00', '0', '1', '186', '10', '0', '1574088512', '1574088512', null);
INSERT INTO `product` VALUES ('54', 'ZIMMUR', '条纹长袖蝴蝶结绑带喇叭袖设计立领镂空修身显瘦针织衫', '60.00', '0', '1', '193', '10', '0', '1574088723', '1574088723', null);
INSERT INTO `product` VALUES ('55', 'GELU', '2019秋季新款女式针织衫经典百搭毛衣', '29.00', '0', '1', '199', '11', '0', '1574088897', '1574151463', null);
INSERT INTO `product` VALUES ('56', '翰代维', '秋冬半高领毛衣长袖打底衫女针织衫', '49.00', '0', '1', '206', '11', '0', '1574089039', '1574089039', null);
INSERT INTO `product` VALUES ('57', 'komilines', '2019秋冬新款女式圆领毛衣宽松时尚动物图案刺绣套头上衣针织衫', '69.00', '0', '1', '213', '11', '0', '1574089181', '1574151849', null);
INSERT INTO `product` VALUES ('58', 'OUNIXUE', '19秋冬新款时尚亮粉烫金波边半高领打底衫手缝珠扣T恤女式针织衫', '98.00', '0', '1', '218', '11', '0', '1574089279', '1574089279', null);
INSERT INTO `product` VALUES ('59', '艾欧唯', '2019年冬新款韩版仿羊羔毛马夹外套女百搭毛绒宽松无袖马甲', '157.00', '0', '1', '223', '12', '0', '1574089766', '1574089766', null);
INSERT INTO `product` VALUES ('60', '艾欧唯', '2019年冬新款韩版女款马甲小个子格子立领无袖宽松保暖马夹', '103.00', '0', '1', '230', '12', '0', '1574089868', '1574089868', null);
INSERT INTO `product` VALUES ('61', 'SR', '女款基础百搭纯色连帽保暖加厚棉服马夹', '279.00', '0', '1', '236', '12', '0', '1574089996', '1574089996', null);
INSERT INTO `product` VALUES ('62', '苏醒的乐园', '简约百搭女式休闲裤纯色丝绒加绒加厚开叉', '75.00', '0', '1', '241', '13', '0', '1574090804', '1574090804', null);
INSERT INTO `product` VALUES ('63', '索菲丝尔', '2019百搭纯色简约休闲奶奶裤女哈伦裤', '149.00', '0', '1', '247', '13', '0', '1574090921', '1574090921', null);
INSERT INTO `product` VALUES ('64', '村上春', '秋冬新品女式阔腿裤时尚高腰金属扣装饰格纹九分女休闲裤', '169.00', '0', '1', '252', '13', '0', '1574091012', '1574091012', null);
INSERT INTO `product` VALUES ('65', '衣品天成', '牛仔九分裤女2019秋装新款韩版时尚浅色直筒显瘦萝卜裤子', '55.00', '0', '1', '257', '14', '0', '1574125968', '1574125968', null);
INSERT INTO `product` VALUES ('66', '范奎恩', '百搭直筒拼接口袋装饰显瘦大码无弹牛仔裤秋季新款宽松大码裤装', '56.00', '0', '1', '261', '14', '0', '1574126089', '1574126089', null);
INSERT INTO `product` VALUES ('67', '嬉皮少女', '高腰加绒九分牛仔裤女秋冬新款排扣可翻边小脚裤弹力修身铅笔裤子', '119.00', '0', '1', '267', '14', '0', '1574126205', '1574126205', null);
INSERT INTO `product` VALUES ('68', 'DONEED', '2019冬新款复古格纹通勤时尚配腰带格纹针织阔腿短裤', '118.00', '0', '1', '272', '15', '0', '1574126466', '1574126466', null);
INSERT INTO `product` VALUES ('69', 'GYMCOLLEGE', '2019冬新款宽松高腰直筒灯芯绒显瘦女式休闲裤长裤', '169.00', '0', '1', '278', '15', '0', '1574126554', '1574126554', null);
INSERT INTO `product` VALUES ('70', '十月传奇', '休闲裤女款裤子宽松秋季新款百搭显瘦女士高腰阔腿裤', '80.00', '0', '1', '283', '15', '0', '1574126875', '1574126875', null);
INSERT INTO `product` VALUES ('71', 'AS-BCN', 'AS-BCN女装时尚宽松吊带牛仔连体裤女', '109.00', '0', '1', '288', '16', '0', '1574127009', '1574127009', null);
INSERT INTO `product` VALUES ('72', 'Iammix27', '2019秋装新款时尚牛仔背带裤女式连体裤', '92.00', '0', '1', '293', '16', '0', '1574127104', '1574127104', null);
INSERT INTO `product` VALUES ('73', 'PERIGOT', '秋女士无袖假两件休闲裤连体裤', '139.00', '0', '1', '298', '16', '0', '1574127182', '1574127182', null);
INSERT INTO `product` VALUES ('74', '菲阁', '新品夏款慵懒风短款外搭休闲气质开衫镂空针织女式外套', '47.00', '0', '1', '302', '17', '0', '1574127311', '1574127311', null);
INSERT INTO `product` VALUES ('75', '沫晗依美', '呢料仿羊绒撞色拼接千鸟格外套', '119.00', '0', '1', '306', '17', '0', '1574127429', '1574127429', null);
INSERT INTO `product` VALUES ('76', '郁香菲', '简约短款修身显瘦干练随性机车女小皮衣外套', '214.00', '0', '1', '310', '17', '0', '1574127562', '1574127562', null);
INSERT INTO `product` VALUES ('77', '似水年华', '2019秋季新款时尚韩版双排扣修身显瘦休闲女式风衣中长款', '269.00', '0', '1', '314', '18', '0', '1574127688', '1574127688', null);
INSERT INTO `product` VALUES ('78', '似水年华', '秋季新款时尚百搭简约通勤翻领单排扣系带女式风衣中长款', '183.00', '0', '1', '318', '18', '0', '1574127786', '1574127786', null);
INSERT INTO `product` VALUES ('79', '她图', '2019秋冬女装新品中长款工装外套休闲小个子风衣韩版宽松潮', '253.00', '0', '1', '322', '18', '0', '1574127881', '1574127881', null);
INSERT INTO `product` VALUES ('80', '坦博尔', '女士短款新品轻薄连帽修身百搭羽绒服外套', '138.00', '0', '1', '326', '19', '0', '1574128018', '1574128018', null);
INSERT INTO `product` VALUES ('81', '乐町', '2019冬季新款厚外套白色灯芯绒羽绒服中长款宽松韩版小个', '146.00', '0', '1', '330', '19', '0', '1574128124', '1574128124', null);
INSERT INTO `product` VALUES ('82', '丝柏舍', '女士韩版宽松长袖连帽侧开叉前短后长棉衣', '147.00', '0', '1', '334', '8', '0', '1574128234', '1574128234', null);
INSERT INTO `product` VALUES ('83', 'jk&js', '冬季旗袍女中国风棉衣加厚保暖中式女装复古连衣裙冬改良唐装棉袄', '115.00', '0', '1', '338', '20', '0', '1574128342', '1574128342', null);
INSERT INTO `product` VALUES ('84', '卡帝乐鳄鱼', '2019秋季新款时尚字母印花圆领条纹短袖连衣裙秋装女裙子', '47.00', '0', '1', '342', '21', '0', '1574128458', '1574128458', null);
INSERT INTO `product` VALUES ('85', '韩都衣舍', '2019秋季新款韩版女款打底针织拼接网纱连衣裙', '131.00', '0', '1', '346', '21', '0', '1574128553', '1574128553', null);
INSERT INTO `product` VALUES ('86', '唐狮', '女合体格纹百褶毛呢短半裙', '98.00', '0', '1', '350', '22', '0', '1574128652', '1574128652', null);
INSERT INTO `product` VALUES ('87', 'TERRE BLEUES', '2019春秋新款气质女装裙子高腰显瘦包臀短款PU皮裙A字半身裙女', '75.00', '0', '1', '354', '22', '0', '1574128754', '1574155628', null);
INSERT INTO `product` VALUES ('88', 'BANANA BABY', '2019夏季新款韩版中长款百褶裙渐变网纱半身裙仙女裙', '118.00', '0', '1', '358', '23', '0', '1574128875', '1574128875', null);
INSERT INTO `product` VALUES ('89', '柯玛妮克', '2019春季新款减龄半身裙', '66.00', '0', '1', '362', '23', '0', '1574128962', '1574128962', null);
INSERT INTO `product` VALUES ('90', '唐狮', '男式t恤纯色印花男', '37.00', '0', '1', '366', '24', '0', '1574129178', '1574129178', null);
INSERT INTO `product` VALUES ('91', '翰代维', ' 2019夏季新款韩版印花男士t恤', '34.00', '0', '1', '372', '24', '0', '1574129309', '1574129309', null);
INSERT INTO `product` VALUES ('92', 'FAIRYs', '2019秋季新款男士简约休闲圆领长袖T恤', '76.00', '0', '1', '437', '24', '0', '1574129385', '1574159600', null);
INSERT INTO `product` VALUES ('93', '卡丹路', '2019秋季新款长袖t恤男士V领内搭体恤衫青年男装修身打底上衣S', '98.00', '0', '1', '440', '24', '0', '1574129467', '1574156964', null);
INSERT INTO `product` VALUES ('94', 'Nōvachic', '秋冬季新品男式衬衣休闲纯色衬衫长袖男士衬衫', '119.00', '0', '1', '376', '26', '0', '1574129566', '1574129566', null);
INSERT INTO `product` VALUES ('95', 'G2000', '男装商务休闲口袋细条纹衬衫柔软打底长袖衬衣', '178.00', '0', '1', '380', '26', '0', '1574137995', '1574137995', null);
INSERT INTO `product` VALUES ('96', 'FSK', '2019新款男式休闲裤男款运动裤子五分百搭沙滩裤男士短裤夏季', '45.00', '0', '1', '383', '28', '0', '1574138390', '1574138390', null);
INSERT INTO `product` VALUES ('97', 'RAMPAGE', '美国潮牌夏季休闲短裤港风男士水洗五分裤', '51.00', '0', '1', '387', '28', '0', '1574138526', '1574138526', null);
INSERT INTO `product` VALUES ('98', '衣品天成', '2019秋季新款男裤子休闲潮流韩版直筒束脚工装裤子男式休闲裤', '61.00', '0', '1', '394', '29', '0', '1574138613', '1574138613', null);
INSERT INTO `product` VALUES ('99', 'KM KILO KM&METERS', '2019新品纯色小脚经典舒适休闲裤长裤男士休闲裤', '79.00', '0', '1', '398', '29', '0', '1574138720', '1574138720', null);
INSERT INTO `product` VALUES ('100', '杰米克', '显瘦微弹裤子男士加绒牛仔裤直筒裤宽松男士牛仔裤秋冬', '148.00', '0', '1', '402', '30', '0', '1574139008', '1574139008', null);
INSERT INTO `product` VALUES ('101', '衣品天', '冬季男装裤子毛边水洗休闲修身加绒保暖直筒男士牛仔长裤', '84.00', '0', '1', '406', '30', '0', '1574139117', '1574139117', null);
INSERT INTO `product` VALUES ('102', '法蘭詩頓', '2019秋季新品男士春秋中长款风衣男士风衣中长款青年男士风衣', '299.00', '0', '1', '410', '31', '0', '1574139372', '1574139372', null);
INSERT INTO `product` VALUES ('103', '凯撒大帝', '2019秋冬新品商务休闲男士长款夹克外套男时尚印花男士风衣', '178.00', '0', '1', '414', '31', '0', '1574139540', '1574139540', null);
INSERT INTO `product` VALUES ('104', '法蘭詩頓', '2019秋季首发新品西装上衣外套男士休闲西装外套男士西装', '336.00', '0', '1', '418', '32', '0', '1574139793', '1574139793', null);
INSERT INTO `product` VALUES ('105', '爵士丹尼', '2018秋冬新款绅士男士品格挺括羊毛质感商务西装上衣', '676.00', '0', '1', '422', '32', '0', '1574139916', '1574139916', null);
INSERT INTO `product` VALUES ('106', '高尔普', '2019秋冬新款保暖百搭男款坎肩男装保暖背心马甲男', '119.00', '0', '1', '427', '33', '0', '1574140042', '1574140042', null);
INSERT INTO `product` VALUES ('107', 'KOJO', '马甲男秋冬季无袖保暖运动休闲上衣背心青少年连帽马夹男士外套', '179.00', '0', '1', '431', '33', '0', '1574140143', '1574140143', null);

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('17', '54', '1', '1573095286', '1573095286', null);
INSERT INTO `product_image` VALUES ('18', '55', '1', '1573095286', '1573095286', null);
INSERT INTO `product_image` VALUES ('19', '56', '1', '1573095287', '1573095287', null);
INSERT INTO `product_image` VALUES ('20', '57', '1', '1573095288', '1573095288', null);
INSERT INTO `product_image` VALUES ('21', '58', '1', '1573095289', '1573095289', null);
INSERT INTO `product_image` VALUES ('22', '66', '35', '1573485152', '1573485152', null);
INSERT INTO `product_image` VALUES ('24', '68', '35', '1573485155', '1573485155', null);
INSERT INTO `product_image` VALUES ('25', '71', '35', '1573485434', '1573485434', null);
INSERT INTO `product_image` VALUES ('26', '72', '35', '1573485434', '1573485434', null);
INSERT INTO `product_image` VALUES ('27', '77', '36', '1573985881', '1573985881', null);
INSERT INTO `product_image` VALUES ('28', '78', '36', '1573985881', '1573985881', null);
INSERT INTO `product_image` VALUES ('29', '79', '36', '1573985883', '1573985883', null);
INSERT INTO `product_image` VALUES ('30', '80', '36', '1573985884', '1573985884', null);
INSERT INTO `product_image` VALUES ('31', '84', '37', '1573987870', '1573987870', null);
INSERT INTO `product_image` VALUES ('32', '85', '37', '1573987870', '1573987870', null);
INSERT INTO `product_image` VALUES ('33', '86', '37', '1573987870', '1573987870', null);
INSERT INTO `product_image` VALUES ('34', '89', '38', '1573988127', '1573988127', null);
INSERT INTO `product_image` VALUES ('35', '90', '38', '1573988127', '1573988127', null);
INSERT INTO `product_image` VALUES ('36', '91', '38', '1573988128', '1573988128', null);
INSERT INTO `product_image` VALUES ('37', '92', '38', '1573988129', '1573988129', null);
INSERT INTO `product_image` VALUES ('38', '94', '39', '1573988353', '1573988353', null);
INSERT INTO `product_image` VALUES ('39', '95', '39', '1573988353', '1573988353', null);
INSERT INTO `product_image` VALUES ('40', '96', '39', '1573988354', '1573988354', null);
INSERT INTO `product_image` VALUES ('41', '97', '39', '1573988355', '1573988355', null);
INSERT INTO `product_image` VALUES ('42', '100', '40', '1573988642', '1573988642', null);
INSERT INTO `product_image` VALUES ('43', '101', '40', '1573988642', '1573988642', null);
INSERT INTO `product_image` VALUES ('44', '102', '40', '1573988643', '1573988643', null);
INSERT INTO `product_image` VALUES ('45', '103', '40', '1573988643', '1573988643', null);
INSERT INTO `product_image` VALUES ('46', '106', '41', '1573989105', '1573989105', null);
INSERT INTO `product_image` VALUES ('47', '107', '41', '1573989105', '1573989105', null);
INSERT INTO `product_image` VALUES ('48', '108', '41', '1573989106', '1573989106', null);
INSERT INTO `product_image` VALUES ('49', '112', '42', '1573989372', '1573989372', null);
INSERT INTO `product_image` VALUES ('50', '113', '42', '1573989373', '1573989373', null);
INSERT INTO `product_image` VALUES ('51', '114', '42', '1573989373', '1573989373', null);
INSERT INTO `product_image` VALUES ('52', '115', '42', '1573989375', '1573989375', null);
INSERT INTO `product_image` VALUES ('53', '118', '43', '1574147599', '1574147599', null);
INSERT INTO `product_image` VALUES ('54', '119', '43', '1574147601', '1574147601', null);
INSERT INTO `product_image` VALUES ('55', '120', '43', '1574147602', '1574147602', null);
INSERT INTO `product_image` VALUES ('56', '121', '43', '1574147602', '1574147602', null);
INSERT INTO `product_image` VALUES ('57', '124', '44', '1574147703', '1574147703', null);
INSERT INTO `product_image` VALUES ('58', '125', '44', '1574147704', '1574147704', null);
INSERT INTO `product_image` VALUES ('59', '126', '44', '1574147704', '1574147704', null);
INSERT INTO `product_image` VALUES ('60', '127', '44', '1574147705', '1574147705', null);
INSERT INTO `product_image` VALUES ('61', '130', '45', '1574147805', '1574147805', null);
INSERT INTO `product_image` VALUES ('62', '131', '45', '1574147806', '1574147806', null);
INSERT INTO `product_image` VALUES ('63', '132', '45', '1574147806', '1574147806', null);
INSERT INTO `product_image` VALUES ('64', '133', '45', '1574147807', '1574147807', null);
INSERT INTO `product_image` VALUES ('65', '137', '46', '1574149747', '1574149747', null);
INSERT INTO `product_image` VALUES ('66', '138', '46', '1574149749', '1574149749', null);
INSERT INTO `product_image` VALUES ('67', '139', '46', '1574149750', '1574149750', null);
INSERT INTO `product_image` VALUES ('68', '140', '46', '1574149751', '1574149751', null);
INSERT INTO `product_image` VALUES ('69', '141', '46', '1574149751', '1574149751', null);
INSERT INTO `product_image` VALUES ('70', '145', '47', '1574149915', '1574149915', null);
INSERT INTO `product_image` VALUES ('71', '146', '47', '1574149915', '1574149915', null);
INSERT INTO `product_image` VALUES ('72', '147', '47', '1574149916', '1574149916', null);
INSERT INTO `product_image` VALUES ('73', '148', '47', '1574149916', '1574149916', null);
INSERT INTO `product_image` VALUES ('74', '152', '48', '1574150039', '1574150039', null);
INSERT INTO `product_image` VALUES ('75', '153', '48', '1574150040', '1574150040', null);
INSERT INTO `product_image` VALUES ('76', '154', '48', '1574150040', '1574150040', null);
INSERT INTO `product_image` VALUES ('77', '155', '48', '1574150041', '1574150041', null);
INSERT INTO `product_image` VALUES ('78', '158', '49', '1574150230', '1574150230', null);
INSERT INTO `product_image` VALUES ('79', '159', '49', '1574150230', '1574150230', null);
INSERT INTO `product_image` VALUES ('80', '160', '49', '1574150231', '1574150231', null);
INSERT INTO `product_image` VALUES ('81', '161', '49', '1574150231', '1574150231', null);
INSERT INTO `product_image` VALUES ('82', '165', '50', '1574150349', '1574150349', null);
INSERT INTO `product_image` VALUES ('83', '166', '50', '1574150350', '1574150350', null);
INSERT INTO `product_image` VALUES ('84', '167', '50', '1574150351', '1574150351', null);
INSERT INTO `product_image` VALUES ('85', '168', '50', '1574150351', '1574150351', null);
INSERT INTO `product_image` VALUES ('86', '169', '50', '1574150352', '1574150352', null);
INSERT INTO `product_image` VALUES ('87', '170', '50', '1574150353', '1574150353', null);
INSERT INTO `product_image` VALUES ('88', '175', '51', '1574150527', '1574150527', null);
INSERT INTO `product_image` VALUES ('89', '176', '51', '1574150528', '1574150528', null);
INSERT INTO `product_image` VALUES ('90', '177', '51', '1574150528', '1574150528', null);
INSERT INTO `product_image` VALUES ('91', '178', '51', '1574150529', '1574150529', null);
INSERT INTO `product_image` VALUES ('92', '181', '52', '1574150689', '1574150689', null);
INSERT INTO `product_image` VALUES ('93', '182', '52', '1574150689', '1574150689', null);
INSERT INTO `product_image` VALUES ('94', '183', '52', '1574150690', '1574150690', null);
INSERT INTO `product_image` VALUES ('95', '184', '52', '1574150690', '1574150690', null);
INSERT INTO `product_image` VALUES ('96', '187', '53', '1574151286', '1574151286', null);
INSERT INTO `product_image` VALUES ('97', '188', '53', '1574151287', '1574151287', null);
INSERT INTO `product_image` VALUES ('98', '189', '53', '1574151288', '1574151288', null);
INSERT INTO `product_image` VALUES ('99', '190', '53', '1574151291', '1574151291', null);
INSERT INTO `product_image` VALUES ('100', '194', '54', '1574151381', '1574151381', null);
INSERT INTO `product_image` VALUES ('101', '195', '54', '1574151382', '1574151382', null);
INSERT INTO `product_image` VALUES ('102', '196', '54', '1574151383', '1574151383', null);
INSERT INTO `product_image` VALUES ('103', '197', '54', '1574151383', '1574151383', null);
INSERT INTO `product_image` VALUES ('104', '200', '55', '1574151496', '1574151496', null);
INSERT INTO `product_image` VALUES ('105', '201', '55', '1574151498', '1574151498', null);
INSERT INTO `product_image` VALUES ('106', '202', '55', '1574151499', '1574151499', null);
INSERT INTO `product_image` VALUES ('107', '203', '55', '1574151500', '1574151500', null);
INSERT INTO `product_image` VALUES ('108', '207', '56', '1574151590', '1574151590', null);
INSERT INTO `product_image` VALUES ('109', '208', '56', '1574151591', '1574151591', null);
INSERT INTO `product_image` VALUES ('110', '209', '56', '1574151592', '1574151592', null);
INSERT INTO `product_image` VALUES ('111', '210', '56', '1574151593', '1574151593', null);
INSERT INTO `product_image` VALUES ('112', '214', '57', '1574151895', '1574151895', null);
INSERT INTO `product_image` VALUES ('113', '215', '57', '1574151896', '1574151896', null);
INSERT INTO `product_image` VALUES ('114', '216', '57', '1574151897', '1574151897', null);
INSERT INTO `product_image` VALUES ('115', '219', '58', '1574151974', '1574151974', null);
INSERT INTO `product_image` VALUES ('116', '220', '58', '1574151974', '1574151974', null);
INSERT INTO `product_image` VALUES ('117', '221', '58', '1574151975', '1574151975', null);
INSERT INTO `product_image` VALUES ('118', '226', '59', '1574152181', '1574152181', null);
INSERT INTO `product_image` VALUES ('119', '227', '59', '1574152182', '1574152182', null);
INSERT INTO `product_image` VALUES ('120', '228', '59', '1574152182', '1574152182', null);
INSERT INTO `product_image` VALUES ('121', '229', '59', '1574152184', '1574152184', null);
INSERT INTO `product_image` VALUES ('122', '231', '60', '1574152241', '1574152241', null);
INSERT INTO `product_image` VALUES ('123', '232', '60', '1574152242', '1574152242', null);
INSERT INTO `product_image` VALUES ('124', '233', '60', '1574152242', '1574152242', null);
INSERT INTO `product_image` VALUES ('125', '234', '60', '1574152242', '1574152242', null);
INSERT INTO `product_image` VALUES ('126', '237', '61', '1574152318', '1574152318', null);
INSERT INTO `product_image` VALUES ('127', '238', '61', '1574152319', '1574152319', null);
INSERT INTO `product_image` VALUES ('128', '239', '61', '1574152319', '1574152319', null);
INSERT INTO `product_image` VALUES ('129', '242', '62', '1574152532', '1574152532', null);
INSERT INTO `product_image` VALUES ('130', '243', '62', '1574152532', '1574152532', null);
INSERT INTO `product_image` VALUES ('131', '244', '62', '1574152533', '1574152533', null);
INSERT INTO `product_image` VALUES ('132', '245', '62', '1574152534', '1574152534', null);
INSERT INTO `product_image` VALUES ('133', '248', '63', '1574152610', '1574152610', null);
INSERT INTO `product_image` VALUES ('134', '249', '63', '1574152611', '1574152611', null);
INSERT INTO `product_image` VALUES ('135', '250', '63', '1574152611', '1574152611', null);
INSERT INTO `product_image` VALUES ('136', '253', '64', '1574152671', '1574152671', null);
INSERT INTO `product_image` VALUES ('137', '254', '64', '1574152672', '1574152672', null);
INSERT INTO `product_image` VALUES ('138', '255', '64', '1574152672', '1574152672', null);
INSERT INTO `product_image` VALUES ('139', '258', '65', '1574153130', '1574153130', null);
INSERT INTO `product_image` VALUES ('140', '259', '65', '1574153131', '1574153131', null);
INSERT INTO `product_image` VALUES ('141', '262', '66', '1574153202', '1574153202', null);
INSERT INTO `product_image` VALUES ('142', '263', '66', '1574153203', '1574153203', null);
INSERT INTO `product_image` VALUES ('143', '264', '66', '1574153204', '1574153204', null);
INSERT INTO `product_image` VALUES ('144', '265', '66', '1574153205', '1574153205', null);
INSERT INTO `product_image` VALUES ('145', '268', '67', '1574153271', '1574153271', null);
INSERT INTO `product_image` VALUES ('146', '269', '67', '1574153272', '1574153272', null);
INSERT INTO `product_image` VALUES ('147', '270', '67', '1574153272', '1574153272', null);
INSERT INTO `product_image` VALUES ('148', '273', '68', '1574153559', '1574153559', null);
INSERT INTO `product_image` VALUES ('149', '274', '68', '1574153560', '1574153560', null);
INSERT INTO `product_image` VALUES ('150', '275', '68', '1574153561', '1574153561', null);
INSERT INTO `product_image` VALUES ('151', '276', '68', '1574153562', '1574153562', null);
INSERT INTO `product_image` VALUES ('152', '279', '69', '1574153634', '1574153634', null);
INSERT INTO `product_image` VALUES ('153', '280', '69', '1574153635', '1574153635', null);
INSERT INTO `product_image` VALUES ('154', '281', '69', '1574153636', '1574153636', null);
INSERT INTO `product_image` VALUES ('155', '284', '70', '1574153700', '1574153700', null);
INSERT INTO `product_image` VALUES ('156', '285', '70', '1574153701', '1574153701', null);
INSERT INTO `product_image` VALUES ('157', '286', '70', '1574153701', '1574153701', null);
INSERT INTO `product_image` VALUES ('158', '289', '71', '1574153770', '1574153770', null);
INSERT INTO `product_image` VALUES ('159', '290', '71', '1574153771', '1574153771', null);
INSERT INTO `product_image` VALUES ('160', '291', '71', '1574153772', '1574153772', null);
INSERT INTO `product_image` VALUES ('161', '294', '72', '1574153855', '1574153855', null);
INSERT INTO `product_image` VALUES ('162', '295', '72', '1574153856', '1574153856', null);
INSERT INTO `product_image` VALUES ('163', '296', '72', '1574153857', '1574153857', null);
INSERT INTO `product_image` VALUES ('164', '299', '73', '1574153927', '1574153927', null);
INSERT INTO `product_image` VALUES ('165', '300', '73', '1574153929', '1574153929', null);
INSERT INTO `product_image` VALUES ('166', '303', '74', '1574153994', '1574153994', null);
INSERT INTO `product_image` VALUES ('167', '304', '74', '1574153995', '1574153995', null);
INSERT INTO `product_image` VALUES ('168', '307', '75', '1574154078', '1574154078', null);
INSERT INTO `product_image` VALUES ('169', '308', '75', '1574154079', '1574154079', null);
INSERT INTO `product_image` VALUES ('170', '311', '76', '1574154171', '1574154171', null);
INSERT INTO `product_image` VALUES ('171', '312', '76', '1574154172', '1574154172', null);
INSERT INTO `product_image` VALUES ('172', '315', '77', '1574154265', '1574154265', null);
INSERT INTO `product_image` VALUES ('173', '316', '77', '1574154266', '1574154266', null);
INSERT INTO `product_image` VALUES ('174', '319', '78', '1574154522', '1574154522', null);
INSERT INTO `product_image` VALUES ('175', '320', '78', '1574154523', '1574154523', null);
INSERT INTO `product_image` VALUES ('176', '323', '79', '1574154597', '1574154597', null);
INSERT INTO `product_image` VALUES ('177', '324', '79', '1574154599', '1574154599', null);
INSERT INTO `product_image` VALUES ('178', '327', '80', '1574154784', '1574154784', null);
INSERT INTO `product_image` VALUES ('179', '328', '80', '1574154785', '1574154785', null);
INSERT INTO `product_image` VALUES ('180', '331', '81', '1574154888', '1574154888', null);
INSERT INTO `product_image` VALUES ('181', '332', '81', '1574154890', '1574154890', null);
INSERT INTO `product_image` VALUES ('182', '335', '82', '1574155001', '1574155001', null);
INSERT INTO `product_image` VALUES ('183', '336', '82', '1574155002', '1574155002', null);
INSERT INTO `product_image` VALUES ('184', '339', '83', '1574155094', '1574155094', null);
INSERT INTO `product_image` VALUES ('185', '340', '83', '1574155095', '1574155095', null);
INSERT INTO `product_image` VALUES ('186', '343', '84', '1574155163', '1574155163', null);
INSERT INTO `product_image` VALUES ('187', '344', '84', '1574155165', '1574155165', null);
INSERT INTO `product_image` VALUES ('188', '347', '85', '1574155236', '1574155236', null);
INSERT INTO `product_image` VALUES ('189', '348', '85', '1574155237', '1574155237', null);
INSERT INTO `product_image` VALUES ('190', '351', '86', '1574155547', '1574155547', null);
INSERT INTO `product_image` VALUES ('191', '352', '86', '1574155547', '1574155547', null);
INSERT INTO `product_image` VALUES ('192', '355', '87', '1574155660', '1574155660', null);
INSERT INTO `product_image` VALUES ('193', '356', '87', '1574155661', '1574155661', null);
INSERT INTO `product_image` VALUES ('194', '359', '88', '1574155741', '1574155741', null);
INSERT INTO `product_image` VALUES ('195', '360', '88', '1574155742', '1574155742', null);
INSERT INTO `product_image` VALUES ('196', '363', '89', '1574155843', '1574155843', null);
INSERT INTO `product_image` VALUES ('197', '364', '89', '1574155843', '1574155843', null);
INSERT INTO `product_image` VALUES ('198', '369', '90', '1574156522', '1574156522', null);
INSERT INTO `product_image` VALUES ('199', '370', '90', '1574156523', '1574156523', null);
INSERT INTO `product_image` VALUES ('200', '371', '90', '1574156523', '1574156523', null);
INSERT INTO `product_image` VALUES ('203', '377', '94', '1574157256', '1574157256', null);
INSERT INTO `product_image` VALUES ('204', '378', '94', '1574157257', '1574157257', null);
INSERT INTO `product_image` VALUES ('205', '381', '95', '1574157331', '1574157331', null);
INSERT INTO `product_image` VALUES ('206', '384', '96', '1574157964', '1574157964', null);
INSERT INTO `product_image` VALUES ('207', '385', '96', '1574157965', '1574157965', null);
INSERT INTO `product_image` VALUES ('208', '388', '97', '1574158091', '1574158091', null);
INSERT INTO `product_image` VALUES ('209', '389', '97', '1574158092', '1574158092', null);
INSERT INTO `product_image` VALUES ('210', '390', '97', '1574158093', '1574158093', null);
INSERT INTO `product_image` VALUES ('211', '391', '97', '1574158095', '1574158095', null);
INSERT INTO `product_image` VALUES ('212', '395', '98', '1574158244', '1574158244', null);
INSERT INTO `product_image` VALUES ('213', '396', '98', '1574158249', '1574158249', null);
INSERT INTO `product_image` VALUES ('214', '399', '99', '1574158381', '1574158381', null);
INSERT INTO `product_image` VALUES ('215', '400', '99', '1574158382', '1574158382', null);
INSERT INTO `product_image` VALUES ('216', '403', '100', '1574158493', '1574158493', null);
INSERT INTO `product_image` VALUES ('217', '404', '100', '1574158494', '1574158494', null);
INSERT INTO `product_image` VALUES ('218', '407', '101', '1574158579', '1574158579', null);
INSERT INTO `product_image` VALUES ('219', '408', '101', '1574158580', '1574158580', null);
INSERT INTO `product_image` VALUES ('220', '411', '102', '1574158649', '1574158649', null);
INSERT INTO `product_image` VALUES ('221', '412', '102', '1574158650', '1574158650', null);
INSERT INTO `product_image` VALUES ('222', '415', '103', '1574158737', '1574158737', null);
INSERT INTO `product_image` VALUES ('223', '416', '103', '1574158739', '1574158739', null);
INSERT INTO `product_image` VALUES ('224', '419', '104', '1574158812', '1574158812', null);
INSERT INTO `product_image` VALUES ('225', '420', '104', '1574158813', '1574158813', null);
INSERT INTO `product_image` VALUES ('226', '423', '105', '1574158912', '1574158912', null);
INSERT INTO `product_image` VALUES ('227', '424', '105', '1574158913', '1574158913', null);
INSERT INTO `product_image` VALUES ('228', '425', '105', '1574158915', '1574158915', null);
INSERT INTO `product_image` VALUES ('229', '428', '106', '1574158987', '1574158987', null);
INSERT INTO `product_image` VALUES ('230', '429', '106', '1574158989', '1574158989', null);
INSERT INTO `product_image` VALUES ('231', '432', '107', '1574159058', '1574159058', null);
INSERT INTO `product_image` VALUES ('232', '433', '107', '1574159059', '1574159059', null);
INSERT INTO `product_image` VALUES ('233', '435', '91', '1574159351', '1574159351', null);
INSERT INTO `product_image` VALUES ('234', '436', '91', '1574159352', '1574159352', null);
INSERT INTO `product_image` VALUES ('235', '438', '92', '1574160284', '1574160284', null);
INSERT INTO `product_image` VALUES ('236', '441', '93', '1574160355', '1574160355', null);
INSERT INTO `product_image` VALUES ('237', '442', '93', '1574160356', '1574160356', null);
INSERT INTO `product_image` VALUES ('238', '444', '34', '1574160529', '1574160529', null);
INSERT INTO `product_image` VALUES ('239', '445', '34', '1574160530', '1574160530', null);
INSERT INTO `product_image` VALUES ('240', '446', '34', '1574160531', '1574160531', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '角色名',
  `right` text NOT NULL COMMENT '权限',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `is_delete` tinyint(2) DEFAULT '1' COMMENT '是否删除 1：是 0：否',
  `status` int(2) DEFAULT '1' COMMENT '状态：0：禁用 1：可用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '[\"1\",\"5\",\"9\",\"10\",\"11\",\"13\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"14\",\"15\",\"26\",\"27\",\"28\",\"29\",\"30\",\"56\",\"58\",\"61\",\"62\",\"63\",\"70\",\"64\",\"67\",\"66\",\"68\",\"69\",\"71\",\"72\",\"73\",\"60\",\"74\"]', null, '1573964286', null, '1', '1');
INSERT INTO `role` VALUES ('5', '普通管理员', '[\"56\",\"58\",\"60\",\"61\",\"62\",\"63\",\"70\"]', '1561019681', '1573548008', null, '1', '1');

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` int(8) unsigned NOT NULL,
  `standard` char(10) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0:结束 1:开始',
  `img_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skill
-- ----------------------------
INSERT INTO `skill` VALUES ('1', '吉牡', '2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤', '60', '白色+L', '30.00', '1', '/images/女士上装/T恤/吉牡/2019新款时尚条纹V领打底衫秋季长袖T恤女士T恤/head/20191111\\f4e1e7dae3fe1f2d1799d6e2a20650f1.jpg', '1574338900', '1574339900', null, null, null);
INSERT INTO `skill` VALUES ('2', 'OopsCiah', '初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T', '20', '黑色+L', '25.00', '1', '/images/女士上装/T恤/OopsCiah/初秋新款紧身时尚鸡心领显瘦百搭泫雅风潮T/head/20191111\\9b39fd77b3803dec73cda956df9bbd4d.jpg', '1574338500', '1574340000', null, null, null);

-- ----------------------------
-- Table structure for standard
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `color` char(10) NOT NULL,
  `size` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` int(8) NOT NULL,
  `sell` int(8) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:在架',
  `centerImg_id` int(8) DEFAULT NULL,
  `product_id` int(8) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of standard
-- ----------------------------
INSERT INTO `standard` VALUES ('1', '白色', 'M', '16', '1', '1', '8', '1', null, '1573050250', null);
INSERT INTO `standard` VALUES ('2', '白色', 'L', '10', '2', '1', '8', '1', null, null, null);
INSERT INTO `standard` VALUES ('3', '白色', 'XL', '20', '1', '1', '8', '1', null, null, null);
INSERT INTO `standard` VALUES ('4', '黑色', 'M', '50', '1', '1', '9', '1', null, null, null);
INSERT INTO `standard` VALUES ('5', '黑色', 'L', '40', '1', '1', '9', '1', null, null, null);
INSERT INTO `standard` VALUES ('6', '黑色', 'XL', '105', '1', '1', '9', '1', null, null, null);
INSERT INTO `standard` VALUES ('7', '黑色', 'XXL', '18', '1', '1', '9', '1', null, null, null);
INSERT INTO `standard` VALUES ('20', '黄色', 'M', '9', '1', '1', '64', '34', '1573036733', '1573036733', null);
INSERT INTO `standard` VALUES ('21', '黄色', 'L', '10', '0', '1', '64', '34', '1573036733', '1573036733', null);
INSERT INTO `standard` VALUES ('22', '黑色', 'M', '20', '0', '1', '69', '35', '1573483229', '1573483229', null);
INSERT INTO `standard` VALUES ('23', '黑色', 'L', '20', '0', '1', '69', '35', '1573483229', '1573483229', null);
INSERT INTO `standard` VALUES ('25', '黑色', 'M', '20', '0', '1', '76', '36', '1573985584', '1573985584', null);
INSERT INTO `standard` VALUES ('26', '黑色', 'L', '20', '0', '1', '76', '36', '1573985584', '1573985584', null);
INSERT INTO `standard` VALUES ('27', '白色', 'M', '28', '2', '1', '81', '36', '1573985584', '1573985584', null);
INSERT INTO `standard` VALUES ('28', '白色', 'L', '30', '0', '1', '81', '36', '1573985584', '1573985584', null);
INSERT INTO `standard` VALUES ('29', '白色', 'XL', '30', '0', '1', '81', '36', '1573985584', '1573985584', null);
INSERT INTO `standard` VALUES ('30', '黑色', 'M', '30', '0', '1', '83', '37', '1573987782', '1573987782', null);
INSERT INTO `standard` VALUES ('31', '黑色', 'L', '30', '0', '1', '83', '37', '1573987782', '1573987782', null);
INSERT INTO `standard` VALUES ('32', '黑色', 'XL', '20', '0', '1', '83', '37', '1573987782', '1573987782', null);
INSERT INTO `standard` VALUES ('33', '黑色', 'M', '50', '0', '1', '88', '38', '1573988048', '1573988048', null);
INSERT INTO `standard` VALUES ('34', '黑色', 'L', '60', '0', '1', '88', '38', '1573988048', '1573988048', null);
INSERT INTO `standard` VALUES ('35', '灰色', 'M', '20', '0', '1', '98', '39', '1573988294', '1573988294', null);
INSERT INTO `standard` VALUES ('36', '灰色', 'L', '30', '0', '1', '98', '39', '1573988294', '1573988294', null);
INSERT INTO `standard` VALUES ('37', '白色', 'M', '50', '0', '1', '104', '40', '1573988565', '1573988565', null);
INSERT INTO `standard` VALUES ('38', '白色', 'L', '20', '0', '1', '104', '40', '1573988565', '1573988565', null);
INSERT INTO `standard` VALUES ('39', '白色', 'XL', '20', '0', '1', '104', '40', '1573988565', '1573988565', null);
INSERT INTO `standard` VALUES ('40', '白色', 'M', '10', '0', '1', '109', '41', '1573988866', '1573988866', null);
INSERT INTO `standard` VALUES ('41', '白色', 'L', '20', '0', '1', '109', '41', '1573988866', '1573988866', null);
INSERT INTO `standard` VALUES ('42', '黑色', 'M', '50', '0', '1', '110', '41', '1573988866', '1573988866', null);
INSERT INTO `standard` VALUES ('43', '白色', 'M', '300', '0', '1', '116', '42', '1573989321', '1573989321', null);
INSERT INTO `standard` VALUES ('44', '白色', 'L', '20', '0', '1', '116', '42', '1573989321', '1573989321', null);
INSERT INTO `standard` VALUES ('45', '白色', 'XL', '50', '0', '1', '116', '42', '1573989321', '1573989321', null);
INSERT INTO `standard` VALUES ('46', '花色', 'M', '20', '0', '1', '122', '43', '1574083902', '1574083902', null);
INSERT INTO `standard` VALUES ('47', '花色', 'L', '20', '0', '1', '122', '43', '1574083902', '1574083902', null);
INSERT INTO `standard` VALUES ('48', '白色', 'M', '20', '0', '1', '128', '44', '1574084078', '1574084078', null);
INSERT INTO `standard` VALUES ('49', '白色', 'XL', '30', '0', '1', '128', '44', '1574084078', '1574084078', null);
INSERT INTO `standard` VALUES ('53', '白色', 'M', '50', '0', '1', '142', '46', '1574084326', '1574149787', null);
INSERT INTO `standard` VALUES ('54', '白色', 'L', '50', '0', '1', '142', '46', '1574084326', '1574149799', null);
INSERT INTO `standard` VALUES ('55', '白色', 'M', '20', '0', '1', '149', '47', '1574084425', '1574084425', null);
INSERT INTO `standard` VALUES ('56', '白色', 'L', '20', '0', '1', '149', '47', '1574084425', '1574084425', null);
INSERT INTO `standard` VALUES ('57', '黑色', 'M', '20', '0', '1', '150', '47', '1574084425', '1574149945', null);
INSERT INTO `standard` VALUES ('58', '黑色', 'L', '30', '0', '1', '150', '47', '1574084425', '1574149956', null);
INSERT INTO `standard` VALUES ('59', '紫色', 'M', '20', '0', '1', '156', '48', '1574084579', '1574150115', null);
INSERT INTO `standard` VALUES ('60', '紫色', 'L', '60', '0', '1', '156', '48', '1574084579', '1574150123', null);
INSERT INTO `standard` VALUES ('61', '紫色', 'XL', '20', '0', '1', '156', '48', '1574084579', '1574150131', null);
INSERT INTO `standard` VALUES ('66', '白色', 'M', '20', '0', '1', '162', '49', '1574087923', '1574087923', null);
INSERT INTO `standard` VALUES ('67', '白色', 'L', '20', '0', '1', '162', '49', '1574087923', '1574087923', null);
INSERT INTO `standard` VALUES ('68', '蓝色', 'M', '50', '0', '1', '163', '49', '1574087923', '1574087923', null);
INSERT INTO `standard` VALUES ('69', '蓝色', 'L', '60', '0', '1', '163', '49', '1574087923', '1574087923', null);
INSERT INTO `standard` VALUES ('70', '米白', 'M', '20', '0', '1', '171', '50', '1574088032', '1574088032', null);
INSERT INTO `standard` VALUES ('71', '米白', 'L', '60', '0', '1', '171', '50', '1574088032', '1574088032', null);
INSERT INTO `standard` VALUES ('72', '粉色', 'M', '60', '0', '1', '179', '51', '1574088171', '1574088171', null);
INSERT INTO `standard` VALUES ('73', '粉色', 'L', '60', '0', '1', '179', '51', '1574088171', '1574088171', null);
INSERT INTO `standard` VALUES ('74', '粉色', 'XL', '60', '0', '1', '179', '51', '1574088171', '1574088171', null);
INSERT INTO `standard` VALUES ('77', '橘色', 'L', '60', '0', '1', '185', '52', '1574088330', '1574151204', null);
INSERT INTO `standard` VALUES ('78', '橘色', 'XL', '50', '0', '1', '185', '52', '1574088330', '1574151214', null);
INSERT INTO `standard` VALUES ('81', '白色', 'M', '20', '0', '1', '191', '53', '1574088512', '1574088512', null);
INSERT INTO `standard` VALUES ('82', '黑色', 'M', '50', '0', '1', '192', '53', '1574088512', '1574088512', null);
INSERT INTO `standard` VALUES ('83', '黑色', 'L', '20', '0', '1', '192', '53', '1574088512', '1574088512', null);
INSERT INTO `standard` VALUES ('84', '灰色', 'M', '20', '0', '1', '198', '54', '1574088723', '1574088723', null);
INSERT INTO `standard` VALUES ('85', '灰色', 'L', '30', '0', '1', '198', '54', '1574088723', '1574088723', null);
INSERT INTO `standard` VALUES ('86', '灰色', 'XL', '50', '0', '1', '198', '54', '1574088723', '1574088723', null);
INSERT INTO `standard` VALUES ('87', '白色', 'M', '20', '0', '1', '204', '55', '1574088897', '1574088897', null);
INSERT INTO `standard` VALUES ('88', '白色', 'L', '30', '0', '1', '204', '55', '1574088897', '1574088897', null);
INSERT INTO `standard` VALUES ('89', '粉色', 'M', '20', '0', '1', '205', '55', '1574088897', '1574088897', null);
INSERT INTO `standard` VALUES ('90', '粉色', 'L', '50', '0', '1', '205', '55', '1574088897', '1574088897', null);
INSERT INTO `standard` VALUES ('91', '白色', 'M', '30', '0', '1', '211', '56', '1574089039', '1574089039', null);
INSERT INTO `standard` VALUES ('92', '白色', 'L', '60', '0', '1', '211', '56', '1574089039', '1574089039', null);
INSERT INTO `standard` VALUES ('93', '黑色', 'M', '60', '0', '1', '212', '56', '1574089039', '1574089039', null);
INSERT INTO `standard` VALUES ('94', '黑色', 'L', '50', '0', '1', '212', '56', '1574089039', '1574089039', null);
INSERT INTO `standard` VALUES ('95', '灰色', 'M', '20', '0', '1', '217', '57', '1574089181', '1574089181', null);
INSERT INTO `standard` VALUES ('96', '灰色', 'L', '20', '0', '1', '217', '57', '1574089181', '1574089181', null);
INSERT INTO `standard` VALUES ('97', '灰色', 'XL', '90', '0', '1', '217', '57', '1574089181', '1574089181', null);
INSERT INTO `standard` VALUES ('98', '橘红', 'M', '20', '0', '1', '222', '58', '1574089279', '1574089279', null);
INSERT INTO `standard` VALUES ('99', '橘红', 'L', '30', '0', '1', '222', '58', '1574089279', '1574089279', null);
INSERT INTO `standard` VALUES ('100', '白色', 'M', '20', '0', '1', '224', '59', '1574089766', '1574089766', null);
INSERT INTO `standard` VALUES ('101', '浅绿', 'M', '20', '0', '1', '225', '59', '1574089766', '1574089766', null);
INSERT INTO `standard` VALUES ('102', '灰色', 'M', '20', '0', '1', '235', '60', '1574089868', '1574089868', null);
INSERT INTO `standard` VALUES ('103', '灰色', 'L', '60', '0', '1', '235', '60', '1574089868', '1574089868', null);
INSERT INTO `standard` VALUES ('104', '白色', 'L', '60', '0', '1', '240', '61', '1574089996', '1574089996', null);
INSERT INTO `standard` VALUES ('105', '白色', 'XL', '62', '0', '1', '240', '61', '1574089996', '1574089996', null);
INSERT INTO `standard` VALUES ('106', '黑色', 'M', '50', '0', '1', '246', '62', '1574090804', '1574090804', null);
INSERT INTO `standard` VALUES ('107', '黑色', 'L', '60', '0', '1', '246', '62', '1574090804', '1574090804', null);
INSERT INTO `standard` VALUES ('108', '白色', 'L', '60', '0', '1', '251', '63', '1574090922', '1574090922', null);
INSERT INTO `standard` VALUES ('109', '白色', 'XL', '60', '0', '1', '251', '63', '1574090922', '1574090922', null);
INSERT INTO `standard` VALUES ('110', '褐色', 'M', '60', '0', '1', '256', '64', '1574091012', '1574091012', null);
INSERT INTO `standard` VALUES ('111', '褐色', 'L', '60', '0', '1', '256', '64', '1574091012', '1574091012', null);
INSERT INTO `standard` VALUES ('112', '蓝色', 'M', '30', '0', '1', '260', '65', '1574125968', '1574125968', null);
INSERT INTO `standard` VALUES ('113', '蓝色', 'L', '50', '0', '1', '260', '65', '1574125968', '1574125968', null);
INSERT INTO `standard` VALUES ('114', '蓝色', 'M', '50', '0', '1', '266', '66', '1574126089', '1574126089', null);
INSERT INTO `standard` VALUES ('115', '蓝色', 'XL', '50', '0', '1', '266', '66', '1574126089', '1574126089', null);
INSERT INTO `standard` VALUES ('116', '蓝色', 'M', '60', '0', '1', '271', '67', '1574126205', '1574126205', null);
INSERT INTO `standard` VALUES ('117', '蓝色', 'L', '60', '0', '1', '271', '67', '1574126205', '1574126205', null);
INSERT INTO `standard` VALUES ('118', '蓝色', 'XL', '56', '0', '1', '271', '67', '1574126205', '1574126205', null);
INSERT INTO `standard` VALUES ('119', '米格', 'M', '20', '0', '1', '277', '68', '1574126466', '1574126466', null);
INSERT INTO `standard` VALUES ('120', '米格', 'L', '60', '0', '1', '277', '68', '1574126466', '1574126466', null);
INSERT INTO `standard` VALUES ('121', '黑色', 'L', '30', '0', '1', '282', '69', '1574126554', '1574126554', null);
INSERT INTO `standard` VALUES ('122', '黑色', 'XL', '30', '0', '1', '282', '69', '1574126554', '1574126554', null);
INSERT INTO `standard` VALUES ('123', '白色', 'M', '30', '0', '1', '287', '70', '1574126875', '1574126875', null);
INSERT INTO `standard` VALUES ('124', '白色', 'L', '20', '0', '1', '287', '70', '1574126875', '1574126875', null);
INSERT INTO `standard` VALUES ('125', '灰色', 'L', '30', '0', '1', '292', '71', '1574127009', '1574127009', null);
INSERT INTO `standard` VALUES ('126', '灰色', 'XL', '60', '0', '1', '292', '71', '1574127009', '1574127009', null);
INSERT INTO `standard` VALUES ('127', '蓝色', 'L', '65', '0', '1', '297', '72', '1574127104', '1574127104', null);
INSERT INTO `standard` VALUES ('128', '蓝色', 'L', '60', '0', '1', '297', '72', '1574127104', '1574127104', null);
INSERT INTO `standard` VALUES ('129', '黑色', 'M', '30', '0', '1', '301', '73', '1574127182', '1574127182', null);
INSERT INTO `standard` VALUES ('130', '黑色', 'L', '56', '0', '1', '301', '73', '1574127182', '1574127182', null);
INSERT INTO `standard` VALUES ('131', '白色', 'M', '60', '0', '1', '305', '74', '1574127311', '1574127311', null);
INSERT INTO `standard` VALUES ('132', '白色', 'L', '60', '0', '1', '305', '74', '1574127311', '1574127311', null);
INSERT INTO `standard` VALUES ('133', '粉色', 'L', '30', '0', '1', '309', '75', '1574127429', '1574127429', null);
INSERT INTO `standard` VALUES ('134', '粉色', 'XL', '50', '0', '1', '309', '75', '1574127429', '1574127429', null);
INSERT INTO `standard` VALUES ('135', '黑色', 'M', '20', '0', '1', '313', '76', '1574127562', '1574127562', null);
INSERT INTO `standard` VALUES ('136', '黑色', 'L', '20', '0', '1', '313', '76', '1574127562', '1574127562', null);
INSERT INTO `standard` VALUES ('137', '黑色', 'L', '60', '0', '1', '317', '77', '1574127688', '1574127688', null);
INSERT INTO `standard` VALUES ('138', '黑色', 'L', '60', '0', '1', '321', '78', '1574127786', '1574127786', null);
INSERT INTO `standard` VALUES ('139', '棕色', 'L', '60', '0', '1', '325', '79', '1574127881', '1574127881', null);
INSERT INTO `standard` VALUES ('140', '棕色', 'XL', '60', '0', '1', '325', '79', '1574127881', '1574127881', null);
INSERT INTO `standard` VALUES ('141', '紫色', 'L', '60', '0', '1', '329', '80', '1574128018', '1574128018', null);
INSERT INTO `standard` VALUES ('142', '紫色', 'XL', '30', '0', '1', '329', '80', '1574128018', '1574128018', null);
INSERT INTO `standard` VALUES ('143', '白色', 'L', '60', '0', '1', '333', '81', '1574128124', '1574128124', null);
INSERT INTO `standard` VALUES ('144', '白色', 'XL', '60', '0', '1', '333', '81', '1574128124', '1574128124', null);
INSERT INTO `standard` VALUES ('145', '黄色', 'L', '60', '0', '1', '337', '82', '1574128234', '1574128234', null);
INSERT INTO `standard` VALUES ('146', '黄色', 'XL', '90', '0', '1', '337', '82', '1574128234', '1574128234', null);
INSERT INTO `standard` VALUES ('147', '青花瓷', 'L', '60', '0', '1', '341', '83', '1574128342', '1574128342', null);
INSERT INTO `standard` VALUES ('148', '青花瓷', 'XL', '90', '0', '1', '341', '83', '1574128342', '1574128342', null);
INSERT INTO `standard` VALUES ('149', '白色', 'M', '60', '0', '1', '345', '84', '1574128458', '1574128458', null);
INSERT INTO `standard` VALUES ('150', '白色', 'L', '90', '0', '1', '345', '84', '1574128458', '1574128458', null);
INSERT INTO `standard` VALUES ('151', '灰色', 'M', '60', '0', '1', '349', '85', '1574128553', '1574128553', null);
INSERT INTO `standard` VALUES ('152', '灰色', 'L', '90', '0', '1', '349', '85', '1574128553', '1574128553', null);
INSERT INTO `standard` VALUES ('153', '灰色', 'M', '60', '0', '1', '353', '86', '1574128652', '1574128652', null);
INSERT INTO `standard` VALUES ('154', '灰色', 'L', '60', '0', '1', '353', '86', '1574128652', '1574128652', null);
INSERT INTO `standard` VALUES ('155', '黑色', 'L', '60', '0', '1', '357', '87', '1574128754', '1574128754', null);
INSERT INTO `standard` VALUES ('156', '黑色', 'XL', '60', '0', '1', '357', '87', '1574128754', '1574128754', null);
INSERT INTO `standard` VALUES ('157', '蓝色', 'M', '60', '0', '1', '361', '88', '1574128875', '1574128875', null);
INSERT INTO `standard` VALUES ('158', '蓝色', 'L', '45', '0', '1', '361', '88', '1574128875', '1574128875', null);
INSERT INTO `standard` VALUES ('159', '黑色', 'M', '60', '0', '1', '365', '89', '1574128962', '1574128962', null);
INSERT INTO `standard` VALUES ('160', '黑色', 'L', '20', '0', '1', '365', '89', '1574128962', '1574128962', null);
INSERT INTO `standard` VALUES ('161', '白色', 'M', '50', '0', '1', '368', '90', '1574129178', '1574129178', null);
INSERT INTO `standard` VALUES ('162', '白色', 'L', '30', '0', '1', '368', '90', '1574129178', '1574129178', null);
INSERT INTO `standard` VALUES ('163', '棕色', 'M', '30', '0', '1', '367', '90', '1574129178', '1574129178', null);
INSERT INTO `standard` VALUES ('164', '棕色', 'L', '30', '0', '1', '367', '90', '1574129178', '1574129178', null);
INSERT INTO `standard` VALUES ('165', '白色', 'M', '20', '0', '1', '375', '91', '1574129309', '1574129309', null);
INSERT INTO `standard` VALUES ('166', '白色', 'L', '20', '0', '1', '375', '91', '1574129309', '1574129309', null);
INSERT INTO `standard` VALUES ('167', '白色', 'XL', '20', '0', '1', '375', '91', '1574129309', '1574129309', null);
INSERT INTO `standard` VALUES ('168', '蓝色', 'L', '60', '0', '1', '443', '92', '1574129385', '1574129385', null);
INSERT INTO `standard` VALUES ('169', '白色', 'L', '20', '0', '1', '439', '93', '1574129467', '1574129467', null);
INSERT INTO `standard` VALUES ('170', '白色', 'XL', '50', '0', '1', '439', '93', '1574129467', '1574129467', null);
INSERT INTO `standard` VALUES ('171', '白色', 'M', '50', '0', '1', '379', '94', '1574129566', '1574129566', null);
INSERT INTO `standard` VALUES ('172', '白色', 'L', '20', '0', '1', '379', '94', '1574129566', '1574129566', null);
INSERT INTO `standard` VALUES ('173', '浅灰', 'M', '30', '0', '1', '382', '95', '1574137995', '1574137995', null);
INSERT INTO `standard` VALUES ('174', '浅灰', 'L', '30', '0', '1', '382', '95', '1574137995', '1574137995', null);
INSERT INTO `standard` VALUES ('175', '黑色', 'M', '20', '0', '1', '386', '96', '1574138390', '1574138390', null);
INSERT INTO `standard` VALUES ('176', '黑色', 'XL', '30', '0', '1', '386', '96', '1574138390', '1574138390', null);
INSERT INTO `standard` VALUES ('177', '黑色', 'M', '20', '0', '1', '392', '97', '1574138526', '1574138526', null);
INSERT INTO `standard` VALUES ('178', '黑色', 'L', '30', '0', '1', '392', '97', '1574138526', '1574138526', null);
INSERT INTO `standard` VALUES ('179', '橘色', 'L', '30', '0', '1', '393', '97', '1574138526', '1574138526', null);
INSERT INTO `standard` VALUES ('180', '绿色', 'M', '20', '0', '1', '397', '98', '1574138614', '1574138614', null);
INSERT INTO `standard` VALUES ('181', '绿色', 'L', '30', '0', '1', '397', '98', '1574138614', '1574138614', null);
INSERT INTO `standard` VALUES ('182', '棕色', 'M', '20', '0', '1', '401', '99', '1574138720', '1574138720', null);
INSERT INTO `standard` VALUES ('183', '棕色', 'XL', '30', '0', '1', '401', '99', '1574138720', '1574138720', null);
INSERT INTO `standard` VALUES ('184', '蓝色', 'L', '30', '0', '1', '405', '100', '1574139009', '1574139009', null);
INSERT INTO `standard` VALUES ('185', '蓝色', 'XL', '20', '0', '1', '405', '100', '1574139009', '1574139009', null);
INSERT INTO `standard` VALUES ('186', '蓝色', 'L', '20', '0', '1', '409', '101', '1574139117', '1574139117', null);
INSERT INTO `standard` VALUES ('187', '蓝色', 'XL', '20', '0', '1', '409', '101', '1574139117', '1574139117', null);
INSERT INTO `standard` VALUES ('188', '黑色', 'XL', '30', '0', '1', '413', '102', '1574139372', '1574139372', null);
INSERT INTO `standard` VALUES ('189', '黑色', 'L', '20', '0', '1', '413', '102', '1574139372', '1574139372', null);
INSERT INTO `standard` VALUES ('190', '灰色', 'XL', '60', '0', '1', '417', '103', '1574139540', '1574139540', null);
INSERT INTO `standard` VALUES ('191', '灰色', 'L', '60', '0', '1', '417', '103', '1574139540', '1574139540', null);
INSERT INTO `standard` VALUES ('192', '蓝色', 'L', '20', '0', '1', '421', '104', '1574139793', '1574139793', null);
INSERT INTO `standard` VALUES ('193', '蓝色', 'XL', '30', '0', '1', '421', '104', '1574139793', '1574139793', null);
INSERT INTO `standard` VALUES ('194', '黑色', 'L', '30', '0', '1', '426', '105', '1574139916', '1574139916', null);
INSERT INTO `standard` VALUES ('195', '黑色', 'XL', '30', '0', '1', '426', '105', '1574139916', '1574139916', null);
INSERT INTO `standard` VALUES ('196', '黑色', 'M', '30', '0', '1', '430', '106', '1574140042', '1574140042', null);
INSERT INTO `standard` VALUES ('197', '黑色', 'L', '30', '0', '1', '430', '106', '1574140042', '1574140042', null);
INSERT INTO `standard` VALUES ('198', '黑色', 'XL', '30', '0', '1', '430', '106', '1574140042', '1574140042', null);
INSERT INTO `standard` VALUES ('199', '白色', 'M', '30', '0', '1', '434', '107', '1574140143', '1574140143', null);
INSERT INTO `standard` VALUES ('200', '白色', 'L', '50', '0', '1', '434', '107', '1574140143', '1574140143', null);
INSERT INTO `standard` VALUES ('201', '粉色', 'M', '25', '0', '1', '134', '45', '1574149283', '1574149295', null);
INSERT INTO `standard` VALUES ('202', '粉色', 'L', '30', '0', '1', '134', '45', '1574149310', '1574149310', null);
INSERT INTO `standard` VALUES ('203', '红色', 'M', '30', '0', '1', '135', '45', '1574149326', '1574149326', null);
INSERT INTO `standard` VALUES ('204', '红色', 'L', '60', '0', '1', '135', '45', '1574149349', '1574149349', null);
INSERT INTO `standard` VALUES ('205', '黑色', 'L', '30', '0', '1', '143', '46', '1574149815', '1574149815', null);
INSERT INTO `standard` VALUES ('206', '黑色', 'M', '30', '0', '1', '172', '50', '1574150379', '1574150379', null);
INSERT INTO `standard` VALUES ('207', '黑色', 'L', '30', '0', '1', '172', '50', '1574150393', '1574150393', null);
INSERT INTO `standard` VALUES ('208', '紫色', 'L', '30', '0', '1', '173', '50', '1574150407', '1574150407', null);
INSERT INTO `standard` VALUES ('209', '白色', 'M', '20', '0', '1', '447', '34', '1574160580', '1574160580', null);
INSERT INTO `standard` VALUES ('210', '白色', 'L', '30', '0', '1', '447', '34', '1574160590', '1574160590', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar_url` text COMMENT '头像',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别：0：男 1：女  2：外星人',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date DEFAULT NULL COMMENT '生日',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可删除：1：不可 0：可',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '/user_avatar/20191120\\9a211f5903f7eb6638afcb8038eca828.jpg', 'tian', '123456', '2', '13512345678', '1234567891', '1047918241@qq.com', '2019-08-09', '1', '1', null, '1574252076', null);
INSERT INTO `user` VALUES ('2', '/user_avatar/20190812\\920daf32fe76fa875a19c60ffcfaa2a5.jpg', 'ssssss', 'e10adc3949ba59abbe56e057f20f883e', '0', '13512345678', '1234567891', '123456789@qq.com', '2017-06-20', '1', '1', '1564971573', '1564971573', null);
INSERT INTO `user` VALUES ('3', '/user_avatar/20190812\\920daf32fe76fa875a19c60ffcfaa2a5.jpg', 'nunu', 'e10adc3949ba59abbe56e057f20f883e', '0', '13566612345', '1234567891', '1555555@qq.com', '2019-08-12', '1', '1', '1565184206', '1569640734', null);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(50) NOT NULL COMMENT '收货人电话',
  `province` varchar(50) NOT NULL COMMENT '省',
  `city` varchar(50) NOT NULL COMMENT '市',
  `zone` varchar(50) NOT NULL,
  `detail` varchar(255) NOT NULL COMMENT '详细地址',
  `primary` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:默认地址',
  `user_id` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES ('1', '李一', '12345678911', '广东省', '东莞市', '南城区', '西湖路99号广科', '1', '1', null, null, null);
INSERT INTO `user_address` VALUES ('2', '李二', '12345678977', '广东省 ', '广州市', '天河区', 'xxxxx', '0', '1', null, null, null);
INSERT INTO `user_address` VALUES ('3', '小龙', '12345678911', '北京', '北京', '东城区', '啦啦', '0', '1', '1570607643', '1570607643', null);
