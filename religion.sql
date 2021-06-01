/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : religion

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 18/04/2021 13:15:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for broken_line
-- ----------------------------
DROP TABLE IF EXISTS `broken_line`;
CREATE TABLE `broken_line`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年份',
  `world_population` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '全球人口',
  `religion_people` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信教人口',
  `proportion` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '占比',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of broken_line
-- ----------------------------
INSERT INTO `broken_line` VALUES (1, '1970', '36.1', '29', '80.38');
INSERT INTO `broken_line` VALUES (2, '1980', '43.7', '34.6', '79.18');
INSERT INTO `broken_line` VALUES (3, '1985', '47.8', '37.6', '78.74');
INSERT INTO `broken_line` VALUES (4, '1990', '53', '42', '79.22');
INSERT INTO `broken_line` VALUES (5, '1996', '58', '47', '81');
INSERT INTO `broken_line` VALUES (6, '2000', '61.2', '52.1', '85');
INSERT INTO `broken_line` VALUES (7, '2010', '69', '58', '84');

-- ----------------------------
-- Table structure for religion_entity
-- ----------------------------
DROP TABLE IF EXISTS `religion_entity`;
CREATE TABLE `religion_entity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name_en` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家名称(英文)',
  `country_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家名称（中文）',
  `continent` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在大洲',
  `geographic_quadrant` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地理象限',
  `land_area` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国土面积',
  `total_population` int(11) NOT NULL COMMENT '人口总数',
  `language` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言',
  `religion` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宗教',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `country_name_en`(`country_name_en`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of religion_entity
-- ----------------------------
INSERT INTO `religion_entity` VALUES (1, 'Afghanistan', '阿富汗', '亚洲', '东北', '648', 16, '其它', '穆斯林');
INSERT INTO `religion_entity` VALUES (2, 'Albania', '阿尔巴尼亚', '欧洲', '东北', '29', 3, '其他印欧语系', '民族主义');
INSERT INTO `religion_entity` VALUES (3, 'Algeria', '阿尔及利亚', '非洲', '东北', '2388', 20, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (4, 'American-Samoa', '美属萨摩亚', '大洋洲', '西南', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (5, 'Andorra', '安道尔', '欧洲', '东北', '0', 0, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (6, 'Angola', '安哥拉', '非洲', '东南', '1247', 7, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (7, 'Anguilla', '安圭拉', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (8, 'Antigua-Barbuda', '安提瓜巴布达', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (9, 'Argentina', '阿根廷', '南美洲', '西南', '2777', 28, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (10, 'Argentine', '阿根廷人', '南美洲', '西南', '2777', 28, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (11, 'Australia', '澳大利亚', '大洋洲', '东南', '7690', 15, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (12, 'Austria', '奥地利', '欧洲', '东北', '84', 8, '德语', '天主教');
INSERT INTO `religion_entity` VALUES (13, 'Bahamas', '巴哈马', '北美洲', '西北', '19', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (14, 'Bahrain', '巴林', '亚洲', '东北', '1', 0, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (15, 'Bangladesh', '孟加拉国', '亚洲', '东北', '143', 90, '其他印欧语系', '穆斯林');
INSERT INTO `religion_entity` VALUES (16, 'Barbados', '巴巴多斯', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (17, 'Belgium', '比利时', '欧洲', '东北', '31', 10, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (18, 'Belize', '伯利兹', '北美洲', '西北', '23', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (19, 'Benin', '贝宁', '非洲', '东北', '113', 3, '法语', '马克思');
INSERT INTO `religion_entity` VALUES (20, 'Bermuda', '百慕大群岛', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (21, 'Bhutan', '不丹', '亚洲', '东北', '47', 1, '其它', '佛教');
INSERT INTO `religion_entity` VALUES (22, 'Bolivia', '玻利维亚', '南美洲', '西南', '1099', 6, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (23, 'Botswana', '博茨瓦纳', '非洲', '东南', '600', 1, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (24, 'Brazil', '巴西', '南美洲', '西南', '8512', 119, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (25, 'British-Virgin-Isles', '英属维尔京群岛', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (26, 'Brunei', '文莱', '亚洲', '东北', '6', 0, '其它', '穆斯林');
INSERT INTO `religion_entity` VALUES (27, 'Bulgaria', '保加利亚', '欧洲', '东北', '111', 9, '斯拉夫语', '民族主义');
INSERT INTO `religion_entity` VALUES (28, 'Burkina', '布基纳法索', '非洲', '西北', '274', 7, '法语', '马克思');
INSERT INTO `religion_entity` VALUES (29, 'Burma', '缅甸', '亚洲', '东北', '678', 35, '其它', '佛教');
INSERT INTO `religion_entity` VALUES (30, 'Burundi', '布隆迪', '非洲', '东南', '28', 4, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (31, 'Cameroon', '喀麦隆', '非洲', '东北', '474', 8, '法语', '基督教');
INSERT INTO `religion_entity` VALUES (32, 'Canada', '加拿大', '北美洲', '西北', '9976', 24, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (33, 'Cape-Verde-Islands', '佛得角群岛', '非洲', '西北', '4', 0, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (34, 'Cayman-Islands', '开曼群岛', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (35, 'Central-African-Republic', '中非共和国', '非洲', '东北', '623', 2, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (36, 'Chad', '乍得', '非洲', '东北', '1284', 4, '法语', '马克思');
INSERT INTO `religion_entity` VALUES (37, 'Chile', '智利', '南美洲', '西南', '757', 11, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (38, 'China', '中国', '亚洲', '东北', '9561', 1008, '阿拉伯语', '民族主义');
INSERT INTO `religion_entity` VALUES (39, 'Colombia', '哥伦比亚', '南美洲', '西北', '1139', 28, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (40, 'Comorro-Islands', '科摩罗群岛', '非洲', '东南', '2', 0, '法语', '穆斯林');
INSERT INTO `religion_entity` VALUES (41, 'Congo', '刚果', '非洲', '东南', '342', 2, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (42, 'Cook-Islands', '库克群岛', '大洋洲', '西南', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (43, 'Costa-Rica', '哥斯达黎加', '北美洲', '西北', '51', 2, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (44, 'Cuba', '古巴', '北美洲', '西北', '115', 10, '西班牙语', '民族主义');
INSERT INTO `religion_entity` VALUES (45, 'Cyprus', '塞浦路斯', '欧洲', '东北', '9', 1, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (46, 'Czechoslovakia', '捷克斯洛伐克', '欧洲', '东北', '128', 15, '斯拉夫语', '民族主义');
INSERT INTO `religion_entity` VALUES (47, 'Denmark', '丹麦', '欧洲', '东北', '43', 5, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (48, 'Djibouti', '吉布提', '非洲', '东北', '22', 0, '法语', '穆斯林');
INSERT INTO `religion_entity` VALUES (49, 'Dominica', '多米尼加', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (50, 'Dominican-Republic', '多米尼加共和国', '北美洲', '西北', '49', 6, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (51, 'Ecuador', '厄瓜多尔', '南美洲', '西南', '284', 8, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (52, 'Egypt', '埃及', '非洲', '东北', '1001', 47, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (53, 'El-Salvador', '萨尔瓦多', '北美洲', '西北', '21', 5, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (54, 'Equatorial-Guinea', '赤道几内亚', '非洲', '东北', '28', 0, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (55, 'Ethiopia', '埃塞俄比亚', '非洲', '东北', '1222', 31, '其它', '基督教');
INSERT INTO `religion_entity` VALUES (56, 'Faeroes', '费罗斯', '欧洲', '西北', '1', 0, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (57, 'Falklands-Malvinas', '福克兰-马尔维纳斯群岛', '南美洲', '西南', '12', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (58, 'Fiji', '斐济', '大洋洲', '东南', '18', 1, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (59, 'Finland', '芬兰', '欧洲', '东北', '337', 5, '日本 / 土耳其 / 芬兰 / 匈牙利', '基督教');
INSERT INTO `religion_entity` VALUES (60, 'France', '法国', '欧洲', '东北', '547', 54, '法语', '天主教');
INSERT INTO `religion_entity` VALUES (61, 'French-Guiana', '法属圭亚那', '南美洲', '西北', '91', 0, '法语', '天主教');
INSERT INTO `religion_entity` VALUES (62, 'French-Polynesia', '法属波利尼西亚', '大洋洲', '西南', '4', 0, '法语', '天主教');
INSERT INTO `religion_entity` VALUES (63, 'Gabon', '加蓬', '非洲', '东南', '268', 1, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (64, 'Gambia', '冈比亚', '非洲', '西北', '10', 1, '英语', '马克思');
INSERT INTO `religion_entity` VALUES (65, 'Germany-DDR', '德国DDR', '欧洲', '东北', '108', 17, '德语', '民族主义');
INSERT INTO `religion_entity` VALUES (66, 'Germany-FRG', '德国FRG', '欧洲', '东北', '249', 61, '德语', '基督教');
INSERT INTO `religion_entity` VALUES (67, 'Ghana', '加纳', '非洲', '西北', '239', 14, '英语', '马克思');
INSERT INTO `religion_entity` VALUES (68, 'Gibraltar', '直布罗陀', '欧洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (69, 'Greece', '希腊', '欧洲', '东北', '132', 10, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (70, 'Greenland', '格陵兰岛', '北美洲', '西北', '2176', 0, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (71, 'Grenada', '格林纳达', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (72, 'Guam', '关岛', '大洋洲', '东北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (73, 'Guatemala', '危地马拉', '北美洲', '西北', '109', 8, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (74, 'Guinea', '几内亚', '非洲', '西北', '246', 6, '法语', '穆斯林');
INSERT INTO `religion_entity` VALUES (75, 'Guinea-Bissau', '几内亚比绍', '非洲', '西北', '36', 1, '其他印欧语系', '马克思');
INSERT INTO `religion_entity` VALUES (76, 'Guyana', '圭亚那', '南美洲', '西北', '215', 1, '英语', '印度教');
INSERT INTO `religion_entity` VALUES (77, 'Haiti', '海地', '北美洲', '西北', '28', 6, '法语', '天主教');
INSERT INTO `religion_entity` VALUES (78, 'Honduras', '洪都拉斯', '北美洲', '西北', '112', 4, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (79, 'Hong-Kong', '香港', '亚洲', '东北', '1', 5, '阿拉伯语', '佛教');
INSERT INTO `religion_entity` VALUES (80, 'Hungary', '匈牙利', '欧洲', '东北', '93', 11, '日本 / 土耳其 / 芬兰 / 匈牙利', '民族主义');
INSERT INTO `religion_entity` VALUES (81, 'Iceland', '冰岛', '欧洲', '西北', '103', 0, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (82, 'India', '印度', '亚洲', '东北', '3268', 684, '其他印欧语系', '印度教');
INSERT INTO `religion_entity` VALUES (83, 'Indonesia', '印度尼西亚', '大洋洲', '东南', '1904', 157, '其它', '穆斯林');
INSERT INTO `religion_entity` VALUES (84, 'Iran', '伊朗', '亚洲', '东北', '1648', 39, '其他印欧语系', '穆斯林');
INSERT INTO `religion_entity` VALUES (85, 'Iraq', '伊拉克', '亚洲', '东北', '435', 14, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (86, 'Ireland', '爱尔兰', '欧洲', '西北', '70', 3, '英语', '天主教');
INSERT INTO `religion_entity` VALUES (87, 'Israel', '以色列', '亚洲', '东北', '21', 4, '其它', '其它');
INSERT INTO `religion_entity` VALUES (88, 'Italy', '意大利', '欧洲', '东北', '301', 57, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (89, 'Ivory-Coast', '象牙海岸', '非洲', '西北', '323', 7, '法语', '马克思');
INSERT INTO `religion_entity` VALUES (90, 'Jamaica', '牙买加', '北美洲', '西北', '11', 2, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (91, 'Japan', '日本', '亚洲', '东北', '372', 118, '日本 / 土耳其 / 芬兰 / 匈牙利', '其它');
INSERT INTO `religion_entity` VALUES (92, 'Jordan', '乔丹', '亚洲', '东北', '98', 2, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (93, 'Kampuchea', '柬埔寨', '亚洲', '东北', '181', 6, '其它', '佛教');
INSERT INTO `religion_entity` VALUES (94, 'Kenya', '肯尼亚', '非洲', '东北', '583', 17, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (95, 'Kiribati', '基里巴斯', '大洋洲', '东北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (96, 'Kuwait', '科威特', '亚洲', '东北', '18', 2, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (97, 'Laos', '老挝', '亚洲', '东北', '236', 3, '其它', '民族主义');
INSERT INTO `religion_entity` VALUES (98, 'Lebanon', '黎巴嫩', '亚洲', '东北', '10', 3, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (99, 'Lesotho', '莱索托', '非洲', '东南', '30', 1, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (100, 'Liberia', '利比里亚', '非洲', '西北', '111', 1, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (101, 'Libya', '利比亚', '非洲', '东北', '1760', 3, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (102, 'Liechtenstein', '列支敦士登', '欧洲', '东北', '0', 0, '德语', '天主教');
INSERT INTO `religion_entity` VALUES (103, 'Luxembourg', '卢森堡', '欧洲', '东北', '3', 0, '德语', '天主教');
INSERT INTO `religion_entity` VALUES (104, 'Malagasy', '马达加斯加', '非洲', '东南', '587', 9, '其它', '基督教');
INSERT INTO `religion_entity` VALUES (105, 'Malawi', '马拉维', '非洲', '东南', '118', 6, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (106, 'Malaysia', '马来西亚', '亚洲', '东北', '333', 13, '其它', '穆斯林');
INSERT INTO `religion_entity` VALUES (107, 'Maldive-Islands', '马尔代夫群岛', '亚洲', '东北', '0', 0, '其它', '穆斯林');
INSERT INTO `religion_entity` VALUES (108, 'Mali', '马里', '非洲', '西北', '1240', 7, '法语', '穆斯林');
INSERT INTO `religion_entity` VALUES (109, 'Malta', '马耳他', '欧洲', '东北', '0', 0, '其它', '天主教');
INSERT INTO `religion_entity` VALUES (110, 'Marianas', '马里亚纳群岛', '大洋洲', '东北', '0', 0, '其它', '基督教');
INSERT INTO `religion_entity` VALUES (111, 'Mauritania', '毛里塔尼亚', '非洲', '西北', '1031', 2, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (112, 'Mauritius', '毛里求斯', '非洲', '东南', '2', 1, '英语', '印度教');
INSERT INTO `religion_entity` VALUES (113, 'Mexico', '墨西哥', '北美洲', '西北', '1973', 77, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (114, 'Micronesia', '密克罗尼西亚', '大洋洲', '东北', '1', 0, '其它', '基督教');
INSERT INTO `religion_entity` VALUES (115, 'Monaco', '摩纳哥', '欧洲', '东北', '0', 0, '法语', '天主教');
INSERT INTO `religion_entity` VALUES (116, 'Mongolia', '蒙古', '亚洲', '东北', '1566', 2, '其它', '民族主义');
INSERT INTO `religion_entity` VALUES (117, 'Montserrat', '蒙特塞拉特', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (118, 'Morocco', '摩洛哥', '非洲', '西北', '447', 20, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (119, 'Mozambique', '莫桑比克', '非洲', '东南', '783', 12, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (120, 'Nauru', '瑙鲁', '大洋洲', '东南', '0', 0, '其它', '基督教');
INSERT INTO `religion_entity` VALUES (121, 'Nepal', '尼泊尔', '亚洲', '东北', '140', 16, '其它', '印度教');
INSERT INTO `religion_entity` VALUES (122, 'Netherlands', '荷兰', '欧洲', '东北', '41', 14, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (123, 'Netherlands-Antilles', '荷属安的列斯群岛', '北美洲', '西北', '0', 0, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (124, 'New-Zealand', '新西兰', '大洋洲', '东南', '268', 2, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (125, 'Nicaragua', '尼加拉瓜', '北美洲', '西北', '128', 3, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (126, 'Niger', '尼日尔', '非洲', '东北', '1267', 5, '法语', '穆斯林');
INSERT INTO `religion_entity` VALUES (127, 'Nigeria', '尼日利亚', '非洲', '东北', '925', 56, '其它', '穆斯林');
INSERT INTO `religion_entity` VALUES (128, 'Niue', '纽埃', '大洋洲', '西南', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (129, 'North-Korea', '朝鲜', '亚洲', '东北', '121', 18, '其它', '民族主义');
INSERT INTO `religion_entity` VALUES (130, 'North-Yemen', '北也门', '亚洲', '东北', '195', 9, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (131, 'Norway', '挪威', '欧洲', '东北', '324', 4, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (132, 'Oman', '阿曼', '亚洲', '东北', '212', 1, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (133, 'Pakistan', '巴基斯坦', '亚洲', '东北', '804', 84, '其他印欧语系', '穆斯林');
INSERT INTO `religion_entity` VALUES (134, 'Panama', '巴拿马', '南美洲', '西北', '76', 2, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (135, 'Papua-New-Guinea', '巴布亚新几内亚', '大洋洲', '东南', '463', 3, '英语', '马克思');
INSERT INTO `religion_entity` VALUES (136, 'Parguay', 'Parguay公司', '南美洲', '西南', '407', 3, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (137, 'Peru', '秘鲁', '南美洲', '西南', '1285', 14, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (138, 'Philippines', '菲律宾', '大洋洲', '东北', '300', 48, '其它', '天主教');
INSERT INTO `religion_entity` VALUES (139, 'Poland', '波兰', '欧洲', '东北', '313', 36, '斯拉夫语', '民族主义');
INSERT INTO `religion_entity` VALUES (140, 'Portugal', '葡萄牙', '欧洲', '西北', '92', 10, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (141, 'Puerto-Rico', '波多黎各', '北美洲', '西北', '9', 3, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (142, 'Qatar', '卡塔尔', '亚洲', '东北', '11', 0, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (143, 'Romania', '罗马尼亚', '欧洲', '东北', '237', 22, '其他印欧语系', '民族主义');
INSERT INTO `religion_entity` VALUES (144, 'Rwanda', '卢旺达', '非洲', '东南', '26', 5, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (145, 'San-Marino', '圣马力诺', '欧洲', '东北', '0', 0, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (146, 'Sao-Tome', '圣多美', '非洲', '东北', '0', 0, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (147, 'Saudi-Arabia', '沙特阿拉伯', '亚洲', '东北', '2150', 9, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (148, 'Senegal', '塞内加尔', '非洲', '西北', '196', 6, '法语', '穆斯林');
INSERT INTO `religion_entity` VALUES (149, 'Seychelles', '塞舌尔', '非洲', '东南', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (150, 'Sierra-Leone', '塞拉利昂', '非洲', '西北', '72', 3, '英语', '马克思');
INSERT INTO `religion_entity` VALUES (151, 'Singapore', '新加坡', '亚洲', '东北', '1', 3, '阿拉伯语', '佛教');
INSERT INTO `religion_entity` VALUES (152, 'Soloman-Islands', '索罗曼群岛', '大洋洲', '东南', '30', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (153, 'Somalia', '索马里', '非洲', '东北', '637', 5, '其它', '穆斯林');
INSERT INTO `religion_entity` VALUES (154, 'South-Africa', '南非', '非洲', '东南', '1221', 29, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (155, 'South-Korea', '韩国', '亚洲', '东北', '99', 39, '其它', '其它');
INSERT INTO `religion_entity` VALUES (156, 'South-Yemen', '南也门', '亚洲', '东北', '288', 2, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (157, 'Spain', '西班牙', '欧洲', '西北', '505', 38, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (158, 'Sri-Lanka', '斯里兰卡', '亚洲', '东北', '66', 15, '其它', '佛教');
INSERT INTO `religion_entity` VALUES (159, 'St-Helena', '圣赫勒拿', '非洲', '西南', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (160, 'St-Kitts-Nevis', '圣基茨和尼维斯', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (161, 'St-Lucia', '圣卢西亚', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (162, 'St-Vincent', '圣文森特', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (163, 'Sudan', '苏丹', '非洲', '东北', '2506', 20, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (164, 'Surinam', '苏里南', '南美洲', '西北', '63', 0, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (165, 'Swaziland', '斯威士兰', '非洲', '东南', '17', 1, '其它', '基督教');
INSERT INTO `religion_entity` VALUES (166, 'Sweden', '瑞典', '欧洲', '东北', '450', 8, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (167, 'Switzerland', '瑞士', '欧洲', '东北', '41', 6, '德语', '基督教');
INSERT INTO `religion_entity` VALUES (168, 'Syria', '叙利亚', '亚洲', '东北', '185', 10, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (169, 'Taiwan', '台湾', '亚洲', '东北', '36', 18, '阿拉伯语', '佛教');
INSERT INTO `religion_entity` VALUES (170, 'Tanzania', '坦桑尼亚', '非洲', '东南', '945', 18, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (171, 'Thailand', '泰国', '亚洲', '东北', '514', 49, '其它', '佛教');
INSERT INTO `religion_entity` VALUES (172, 'Togo', '多哥', '非洲', '东北', '57', 2, '法语', '其它');
INSERT INTO `religion_entity` VALUES (173, 'Tonga', '汤加', '大洋洲', '东南', '1', 0, '其它', '基督教');
INSERT INTO `religion_entity` VALUES (174, 'Trinidad-Tobago', '特立尼达和多巴哥', '南美洲', '西北', '5', 1, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (175, 'Tunisia', '突尼斯', '非洲', '东北', '164', 7, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (176, 'Turkey', '土耳其', '亚洲', '东北', '781', 45, '日本 / 土耳其 / 芬兰 / 匈牙利', '穆斯林');
INSERT INTO `religion_entity` VALUES (177, 'Turks-Cocos-Islands', '土耳其科科斯群岛', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (178, 'Tuvalu', '图瓦卢', '大洋洲', '东南', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (179, 'UAE', '阿拉伯联合酋长国', '亚洲', '东北', '84', 1, '中文', '穆斯林');
INSERT INTO `religion_entity` VALUES (180, 'Uganda', '乌干达', '非洲', '东北', '236', 13, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (181, 'UK', '英国', '欧洲', '西北', '245', 56, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (182, 'Uruguay', '乌拉圭', '南美洲', '西南', '178', 3, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (183, 'US-Virgin-Isles', '美属维尔京群岛', '北美洲', '西北', '0', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (184, 'USA', '美国', '北美洲', '西北', '9363', 231, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (185, 'USSR', '苏联', '亚洲', '东北', '22402', 274, '斯拉夫语', '民族主义');
INSERT INTO `religion_entity` VALUES (186, 'Vanuatu', '瓦努阿图', '大洋洲', '东南', '15', 0, '其他印欧语系', '基督教');
INSERT INTO `religion_entity` VALUES (187, 'Vatican-City', '梵蒂冈城', '欧洲', '东北', '0', 0, '其他印欧语系', '天主教');
INSERT INTO `religion_entity` VALUES (188, 'Venezuela', '委内瑞拉', '南美洲', '西北', '912', 15, '西班牙语', '天主教');
INSERT INTO `religion_entity` VALUES (189, 'Vietnam', '越南', '亚洲', '东北', '333', 60, '其它', '民族主义');
INSERT INTO `religion_entity` VALUES (190, 'Western-Samoa', '西萨摩亚', '大洋洲', '西南', '3', 0, '英语', '基督教');
INSERT INTO `religion_entity` VALUES (191, 'Yugoslavia', '南斯拉夫', '欧洲', '东北', '256', 22, '其他印欧语系', '民族主义');
INSERT INTO `religion_entity` VALUES (192, 'Zaire', '扎伊尔', '非洲', '东南', '905', 28, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (193, 'Zambia', '赞比亚', '非洲', '东南', '753', 6, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (194, 'Zimbabwe', '津巴布韦', '非洲', '东南', '391', 8, '其它', '马克思');
INSERT INTO `religion_entity` VALUES (195, 'Russia', '俄罗斯', '非洲', '东南', '342', 34, '', '基督教');

-- ----------------------------
-- Table structure for religion_new
-- ----------------------------
DROP TABLE IF EXISTS `religion_new`;
CREATE TABLE `religion_new`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宗教名',
  `total_people` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人数（以亿为单位）',
  `proportion` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '占比',
  `synopsis` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `religion_name`(`religion_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of religion_new
-- ----------------------------
INSERT INTO `religion_new` VALUES (1, '基督教', '19.6599', '33.15', '“基督教”一词在中国大陆的学术界使用时比较混乱，有广义和狭义之分。广义的基督教是指凡是信奉耶稣基督为救世主的所有教派，即包括了罗马公教(Catholic)、正教(Orthodox)、新教(Protestant)三大派及其他一些小教派在内，也就是英语中的Christianity之意；狭义的基督教是指其中的新教。\r\n由于历史原因，在华人中长期以来都习惯只把新教称为基督教。大陆的新教教会也从不称自己为新教，而只称基督教或耶稣教，而将罗马公教称为天主教，正教称为东正教。\r\n港、台华人为了解决这一混乱状况，把广义基督教称为“基督宗教”，以与专指新教的狭义基督教相区分。这一用法现也渐被大陆学者所接受。把广义基督教称“基督宗教”，而“基督教”一词就专指新教。');
INSERT INTO `religion_new` VALUES (2, '回教', '11.7933', '19.89', NULL);
INSERT INTO `religion_new` VALUES (3, '印度教', '7.6742', '12.94', NULL);
INSERT INTO `religion_new` VALUES (4, '佛教', '3.5688', '6.02', NULL);
INSERT INTO `religion_new` VALUES (5, '部落宗教', '2.4416', '4.12', NULL);
INSERT INTO `religion_new` VALUES (6, '无信仰', '7.7667', '13.10', NULL);
INSERT INTO `religion_new` VALUES (7, '大乘佛教', '2.1', '3.87', NULL);
INSERT INTO `religion_new` VALUES (8, '喇嘛教', '0.2', '1.1', NULL);
INSERT INTO `religion_new` VALUES (9, '伊斯兰教', '13', '18.8', NULL);
INSERT INTO `religion_new` VALUES (10, '什叶派', '1.2', '1.57', NULL);
INSERT INTO `religion_new` VALUES (11, '逊尼派', '9.5', '15.7', NULL);

-- ----------------------------
-- Table structure for religion_new_copy1
-- ----------------------------
DROP TABLE IF EXISTS `religion_new_copy1`;
CREATE TABLE `religion_new_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宗教名',
  `total_people` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人数（以亿为单位）',
  `proportion` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '占比',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `religion_name`(`religion_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of religion_new_copy1
-- ----------------------------
INSERT INTO `religion_new_copy1` VALUES (1, '基督教', '19.6599', '33.15');
INSERT INTO `religion_new_copy1` VALUES (2, '回教', '11.7933', '19.89');
INSERT INTO `religion_new_copy1` VALUES (3, '印度教', '7.6742', '12.94');
INSERT INTO `religion_new_copy1` VALUES (4, '佛教', '3.5688', '6.02');
INSERT INTO `religion_new_copy1` VALUES (5, '部落宗教', '2.4416', '4.12');
INSERT INTO `religion_new_copy1` VALUES (6, '无信仰', '7.7667', '13.10');
INSERT INTO `religion_new_copy1` VALUES (7, '大乘佛教', '2.1', '3.87');
INSERT INTO `religion_new_copy1` VALUES (8, '喇嘛教', '0.2', '1.1');
INSERT INTO `religion_new_copy1` VALUES (9, '伊斯兰教', '13', '18.8');
INSERT INTO `religion_new_copy1` VALUES (10, '什叶派', '1.2', '1.57');
INSERT INTO `religion_new_copy1` VALUES (11, '逊尼派', '9.5', '15.7');

-- ----------------------------
-- Table structure for user_information
-- ----------------------------
DROP TABLE IF EXISTS `user_information`;
CREATE TABLE `user_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户名',
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `authority` int(11) DEFAULT NULL COMMENT '权限（0、超级管理员 10、普通用户）',
  `passwd` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `religion_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '宗教信仰',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_information
-- ----------------------------
INSERT INTO `user_information` VALUES (1, 'admin', 0, 'admin', '111111', '22', '18312341231', '2222@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
