SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌图片',
  `sort` int NULL DEFAULT 0 COMMENT '品牌排序',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌描述',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品品牌';



-- ----------------------------
-- Table structure for product_browse_history
-- ----------------------------
DROP TABLE IF EXISTS `product_browse_history`;
CREATE TABLE `product_browse_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号',
  `user_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '用户是否删除',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_spuId`(`spu_id` ASC) USING BTREE,
  INDEX `idx_userId`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品浏览记录表';



-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `parent_id` bigint NOT NULL COMMENT '父分类编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '移动端分类图',
  `sort` int NULL DEFAULT 0 COMMENT '分类排序',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类';



-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论编号，主键自增',
  `user_id` bigint NOT NULL COMMENT '评价人的用户编号，关联 MemberUserDO 的 id 编号',
  `user_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价人名称',
  `user_avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价人头像',
  `anonymous` bit(1) NOT NULL COMMENT '是否匿名',
  `order_id` bigint NULL DEFAULT 0 COMMENT '交易订单编号，关联 TradeOrderDO 的 id 编号',
  `order_item_id` bigint NULL DEFAULT 0 COMMENT '交易订单项编号，关联 TradeOrderItemDO 的 id 编号',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号，关联 ProductSpuDO 的 id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号，关联 ProductSkuDO 的 id 编号',
  `sku_pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `sku_properties` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性数组，JSON 格式 [{propertId: , valueId: }, {propertId: , valueId: }]',
  `visible` bit(1) NULL DEFAULT NULL COMMENT '是否可见，true:显示false:隐藏',
  `scores` tinyint NOT NULL COMMENT '评分星级1-5分',
  `description_scores` tinyint NOT NULL COMMENT '描述星级 1-5 星',
  `benefit_scores` tinyint NOT NULL COMMENT '服务星级 1-5 星',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `pic_urls` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论图片地址数组',
  `reply_status` bit(1) NULL DEFAULT b'0' COMMENT '商家是否回复',
  `reply_user_id` bigint NULL DEFAULT NULL COMMENT '回复管理员编号，关联 AdminUserDO 的 id 编号',
  `reply_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '商家回复时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评论';


-- ----------------------------
-- Table structure for product_favorite
-- ----------------------------
DROP TABLE IF EXISTS `product_favorite`;
CREATE TABLE `product_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品收藏表';



-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`(32) ASC) USING BTREE COMMENT '规格名称索引'
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性项';



-- ----------------------------
-- Table structure for product_property_value
-- ----------------------------
DROP TABLE IF EXISTS `product_property_value`;
CREATE TABLE `product_property_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `property_id` bigint NULL DEFAULT NULL COMMENT '属性项的编号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性值';



-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `spu_id` bigint NOT NULL COMMENT 'spu编号',
  `properties` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性数组，JSON 格式 [{propertId: , valueId: }, {propertId: , valueId: }]',
  `price` int NOT NULL DEFAULT -1 COMMENT '商品价格，单位：分',
  `market_price` int NULL DEFAULT NULL COMMENT '市场价，单位：分',
  `cost_price` int NOT NULL DEFAULT -1 COMMENT '成本价，单位： 分',
  `bar_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'SKU 的条形码',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片地址',
  `stock` int NULL DEFAULT NULL COMMENT '库存',
  `weight` double NULL DEFAULT NULL COMMENT '商品重量，单位：kg 千克',
  `volume` double NULL DEFAULT NULL COMMENT '商品体积，单位：m^3 平米',
  `first_brokerage_price` int NULL DEFAULT NULL COMMENT '一级分销的佣金，单位：分',
  `second_brokerage_price` int NULL DEFAULT NULL COMMENT '二级分销的佣金，单位：分',
  `sales_count` int NULL DEFAULT NULL COMMENT '商品销量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` double(64, 0) NULL DEFAULT NULL COMMENT '更新人',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品sku';



-- ----------------------------
-- Table structure for product_spu
-- ----------------------------
DROP TABLE IF EXISTS `product_spu`;
CREATE TABLE `product_spu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品 SPU 编号，自增',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `keyword` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `introduction` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品简介',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品详情',
  `category_id` bigint NOT NULL COMMENT '商品分类编号',
  `brand_id` int NULL DEFAULT NULL COMMENT '商品品牌编号',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品封面图',
  `slider_pic_urls` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '商品轮播图地址\n 数组，以逗号分隔\n 最多上传15张',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序字段',
  `status` tinyint NOT NULL COMMENT '商品状态: 1 上架（开启） 0 下架（禁用） -1 回收',
  `spec_type` bit(1) NULL DEFAULT NULL COMMENT '规格类型：0 单规格 1 多规格',
  `price` int NOT NULL DEFAULT -1 COMMENT '商品价格，单位使用：分',
  `market_price` int NULL DEFAULT NULL COMMENT '市场价，单位使用：分',
  `cost_price` int NOT NULL DEFAULT -1 COMMENT '成本价，单位： 分',
  `stock` int NOT NULL DEFAULT 0 COMMENT '库存',
  `delivery_types` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配送方式数组',
  `delivery_template_id` bigint NULL DEFAULT NULL COMMENT '物流配置模板编号',
  `give_integral` int NOT NULL DEFAULT 0 COMMENT '赠送积分',
  `sub_commission_type` bit(1) NULL DEFAULT NULL COMMENT '分销类型',
  `sales_count` int NULL DEFAULT 0 COMMENT '商品销量',
  `virtual_sales_count` int NULL DEFAULT 0 COMMENT '虚拟销量',
  `browse_count` int NULL DEFAULT 0 COMMENT '商品点击量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 640 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品spu';



-- ----------------------------
-- Table structure for product_statistics
-- ----------------------------
DROP TABLE IF EXISTS `product_statistics`;
CREATE TABLE `product_statistics`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，主键自增',
  `time` date NOT NULL COMMENT '统计日期',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号',
  `browse_count` int NOT NULL DEFAULT 0 COMMENT '浏览量',
  `browse_user_count` int NOT NULL DEFAULT 0 COMMENT '访客量',
  `favorite_count` int NOT NULL DEFAULT 0 COMMENT '收藏数量',
  `cart_count` int NOT NULL DEFAULT 0 COMMENT '加购数量',
  `order_count` int NOT NULL DEFAULT 0 COMMENT '下单件数',
  `order_pay_count` int NOT NULL DEFAULT 0 COMMENT '支付件数',
  `order_pay_price` int NOT NULL DEFAULT 0 COMMENT '支付金额，单位：分',
  `after_sale_count` int NOT NULL DEFAULT 0 COMMENT '退款件数',
  `after_sale_refund_price` int NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `browse_convert_percent` int NOT NULL DEFAULT 0 COMMENT '访客支付转化率（百分比）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`time` ASC) USING BTREE,
  INDEX `idx_spu_id`(`spu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品统计表';


-- ----------------------------
-- Table structure for promotion_article
-- ----------------------------
DROP TABLE IF EXISTS `promotion_article`;
CREATE TABLE `promotion_article`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章管理编号',
  `category_id` bigint NOT NULL COMMENT '分类编号',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '关联商品编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章标题',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文章作者',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章封面图片地址',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文章简介',
  `browse_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览次数',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `recommend_hot` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否热门(小程序)',
  `recommend_banner` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否轮播图(小程序)',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章内容',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章管理表';


-- ----------------------------
-- Table structure for promotion_article_category
-- ----------------------------
DROP TABLE IF EXISTS `promotion_article_category`;
CREATE TABLE `promotion_article_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章分类编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图标地址',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态',
  `sort` int NOT NULL DEFAULT 99999 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章分类表';


-- ----------------------------
-- Table structure for promotion_banner
-- ----------------------------
DROP TABLE IF EXISTS `promotion_banner`;
CREATE TABLE `promotion_banner`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Banner 编号',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Banner 标题',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片 URL',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '跳转地址',
  `status` tinyint NOT NULL DEFAULT -1 COMMENT '活动状态',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `position` tinyint NOT NULL COMMENT '位置',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `browse_count` int NULL DEFAULT NULL COMMENT 'Banner 点击次数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Banner 广告位';

-- ----------------------------
-- Records of promotion_banner
-- ----------------------------
BEGIN;
INSERT INTO `promotion_banner` (`id`, `title`, `pic_url`, `url`, `status`, `sort`, `position`, `memo`, `browse_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '测试', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/c27824a47a09d504bfefad46ff4660b4d635c05c6f9addc6aef2ce86619c7fcf.jpeg', 'http://www.iocoder.cn', 0, 0, 5, '3232112', NULL, '1', '2023-10-24 20:22:51', '1', '2023-10-24 20:22:51', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_bargain_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_bargain_activity`;
CREATE TABLE `promotion_bargain_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '砍价活动编号',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '砍价活动名称',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动结束时间',
  `status` int NOT NULL DEFAULT 0 COMMENT '活动状态',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `bargain_first_price` int NOT NULL DEFAULT 0 COMMENT '砍价起始价格，单位分',
  `bargain_min_price` int NOT NULL DEFAULT 0 COMMENT '砍价底价，单位：分',
  `stock` int NOT NULL DEFAULT 0 COMMENT '砍价库存',
  `total_stock` int NOT NULL DEFAULT 0 COMMENT '砍价总库存',
  `help_max_count` int NOT NULL DEFAULT 0 COMMENT '砍价人数',
  `bargain_count` int NOT NULL DEFAULT 0 COMMENT '最大帮砍次数',
  `total_limit_count` int NOT NULL DEFAULT 0 COMMENT '总限购数量',
  `random_min_price` int NOT NULL DEFAULT 0 COMMENT '用户每次砍价的最小金额，单位：分',
  `random_max_price` int NOT NULL DEFAULT 0 COMMENT '用户每次砍价的最大金额，单位：分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '砍价活动';



-- ----------------------------
-- Table structure for promotion_bargain_help
-- ----------------------------
DROP TABLE IF EXISTS `promotion_bargain_help`;
CREATE TABLE `promotion_bargain_help`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '砍价助力编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `activity_id` bigint NOT NULL COMMENT '砍价活动名称',
  `record_id` bigint NOT NULL DEFAULT 0 COMMENT '砍价记录编号',
  `reduce_price` int NOT NULL DEFAULT 0 COMMENT '减少砍价，单位：分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '砍价助力表';



-- ----------------------------
-- Table structure for promotion_bargain_record
-- ----------------------------
DROP TABLE IF EXISTS `promotion_bargain_record`;
CREATE TABLE `promotion_bargain_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '砍价记录编号',
  `activity_id` bigint NOT NULL COMMENT '砍价活动名称',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `bargain_first_price` int NOT NULL DEFAULT 0 COMMENT '砍价起始价格，单位：分',
  `bargain_price` int NOT NULL DEFAULT 0 COMMENT '当前砍价，单位：分',
  `status` int NOT NULL DEFAULT 0 COMMENT '砍价状态',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单编号',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '砍价记录表';



-- ----------------------------
-- Table structure for promotion_combination_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_combination_activity`;
CREATE TABLE `promotion_combination_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '拼团名称',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU ID',
  `total_limit_count` int NOT NULL COMMENT '总限购数量',
  `single_limit_count` int NOT NULL COMMENT '单次限购数量',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `user_size` int NULL DEFAULT NULL COMMENT '购买人数',
  `virtual_group` int NOT NULL COMMENT '虚拟成团',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '活动状态：0开启 1关闭',
  `limit_duration` int NOT NULL COMMENT '限制时长（小时）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼团活动';



-- ----------------------------
-- Table structure for promotion_combination_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_combination_product`;
CREATE TABLE `promotion_combination_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `activity_id` bigint NULL DEFAULT NULL COMMENT '拼团活动编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品 SPU 编号',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品 SKU 编号',
  `activity_status` tinyint NOT NULL DEFAULT 0 COMMENT '拼团商品状态',
  `activity_start_time` datetime NOT NULL COMMENT '活动开始时间点',
  `activity_end_time` datetime NOT NULL COMMENT '活动结束时间点',
  `combination_price` int NOT NULL DEFAULT 0 COMMENT '拼团价格，单位分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼团商品';



-- ----------------------------
-- Table structure for promotion_combination_record
-- ----------------------------
DROP TABLE IF EXISTS `promotion_combination_record`;
CREATE TABLE `promotion_combination_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `activity_id` bigint NULL DEFAULT NULL COMMENT '拼团活动编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品 SPU 编号',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品图片',
  `spu_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品 SKU 编号',
  `count` int NULL DEFAULT NULL COMMENT '购买的商品数量',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户编号',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `head_id` bigint NULL DEFAULT NULL COMMENT '团长编号',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单编号',
  `user_size` int NOT NULL COMMENT '可参团人数',
  `user_count` int NOT NULL COMMENT '已参团人数',
  `virtual_group` bit(1) NULL DEFAULT NULL COMMENT '是否虚拟拼团',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '参与状态：1进行中 2已完成 3未完成',
  `combination_price` int NOT NULL COMMENT '拼团商品单价，单位分',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间 (订单付款后开始的时间)',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间（成团时间/失败时间）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼团记录';



-- ----------------------------
-- Table structure for promotion_coupon
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon`;
CREATE TABLE `promotion_coupon`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '优惠劵编号',
  `template_id` bigint NOT NULL COMMENT '优惠劵模板编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠劵名',
  `status` tinyint NOT NULL COMMENT '优惠码状态\n     *\n     * 1-未使用\n     * 2-已使用\n     * 3-已失效',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `take_type` tinyint NOT NULL COMMENT '领取类型\n     *\n     * 1 - 用户主动领取\n     * 2 - 后台自动发放',
  `use_price` int NOT NULL COMMENT '是否设置满多少金额可用，单位：分',
  `valid_start_time` datetime NOT NULL COMMENT '生效开始时间',
  `valid_end_time` datetime NOT NULL COMMENT '生效结束时间',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_scope_values` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品范围编号的数组',
  `discount_type` tinyint NOT NULL COMMENT '折扣类型',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `discount_limit_price` int NULL DEFAULT NULL COMMENT '折扣上限',
  `use_order_id` bigint NULL DEFAULT NULL COMMENT '使用订单号',
  `use_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠劵';



-- ----------------------------
-- Table structure for promotion_coupon_template
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon_template`;
CREATE TABLE `promotion_coupon_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '模板编号，自增唯一。',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠劵名',
  `status` tinyint NOT NULL COMMENT '状态',
  `total_count` int NOT NULL COMMENT '发放数量, -1 - 则表示不限制',
  `take_limit_count` tinyint NOT NULL COMMENT '每人限领个数, -1 - 则表示不限制',
  `take_type` tinyint NOT NULL COMMENT '领取方式',
  `use_price` int NOT NULL COMMENT '是否设置满多少金额可用，单位：分',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_scope_values` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品范围编号的数组',
  `validity_type` tinyint NOT NULL COMMENT '生效日期类型',
  `valid_start_time` datetime NULL DEFAULT NULL COMMENT '固定日期-生效开始时间',
  `valid_end_time` datetime NULL DEFAULT NULL COMMENT '固定日期-生效结束时间',
  `fixed_start_term` int NULL DEFAULT NULL COMMENT '领取日期-开始天数',
  `fixed_end_term` int NULL DEFAULT NULL COMMENT '领取日期-结束天数',
  `discount_type` int NOT NULL COMMENT '优惠类型：1-代金卷；2-折扣卷\n',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `discount_limit_price` int NULL DEFAULT NULL COMMENT '折扣上限，仅在 discount_type 等于 2 时生效',
  `take_count` int NOT NULL DEFAULT 0 COMMENT '领取优惠券的数量',
  `use_count` int NOT NULL DEFAULT 0 COMMENT '使用优惠券的次数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠劵模板';



-- ----------------------------
-- Table structure for promotion_discount_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_discount_activity`;
CREATE TABLE `promotion_discount_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `status` tinyint NOT NULL DEFAULT -1 COMMENT '活动状态',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '限时折扣活动';



-- ----------------------------
-- Table structure for promotion_discount_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_discount_product`;
CREATE TABLE `promotion_discount_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，主键自增',
  `activity_id` bigint NOT NULL COMMENT '活动编号',
  `spu_id` bigint NOT NULL DEFAULT -1 COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `discount_type` int NOT NULL COMMENT '优惠类型\n     *\n     * 1-代金卷\n     * 2-折扣卷',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `activity_status` tinyint NOT NULL DEFAULT 0 COMMENT '秒杀商品状态',
  `activity_start_time` datetime NOT NULL COMMENT '活动开始时间点',
  `activity_end_time` datetime NOT NULL COMMENT '活动结束时间点',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '限时折扣商品\n';



-- ----------------------------
-- Table structure for promotion_diy_page
-- ----------------------------
DROP TABLE IF EXISTS `promotion_diy_page`;
CREATE TABLE `promotion_diy_page`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '装修页面编号',
  `template_id` bigint NULL DEFAULT NULL COMMENT '装修模板编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `preview_pic_urls` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预览图，多个逗号分隔',
  `property` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面属性，JSON 格式',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '装修页面';



-- ----------------------------
-- Table structure for promotion_diy_template
-- ----------------------------
DROP TABLE IF EXISTS `promotion_diy_template`;
CREATE TABLE `promotion_diy_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '装修模板编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名称',
  `used` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否使用',
  `used_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `preview_pic_urls` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预览图',
  `property` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模板属性，JSON 格式',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '装修模板';



-- ----------------------------
-- Table structure for promotion_reward_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_reward_activity`;
CREATE TABLE `promotion_reward_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `status` tinyint NOT NULL DEFAULT -1 COMMENT '活动状态',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `condition_type` tinyint NOT NULL DEFAULT -1 COMMENT '条件类型',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_spu_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 编号的数组',
  `rules` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠规则的数组',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '满减送活动';



-- ----------------------------
-- Table structure for promotion_seckill_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_activity`;
CREATE TABLE `promotion_seckill_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀活动编号',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '秒杀活动商品',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '秒杀活动名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '活动状态',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动结束时间',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `config_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '秒杀时段 id 数组',
  `total_limit_count` int NULL DEFAULT 0 COMMENT '总限购数量',
  `single_limit_count` int NULL DEFAULT 0 COMMENT '单次限够数量',
  `stock` int NULL DEFAULT 0 COMMENT '秒杀库存',
  `total_stock` int NULL DEFAULT 0 COMMENT '秒杀总库存',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀活动';



-- ----------------------------
-- Table structure for promotion_seckill_config
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_config`;
CREATE TABLE `promotion_seckill_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '秒杀时段名称',
  `start_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间点',
  `end_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束时间点',
  `slider_pic_urls` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '秒杀主图',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '活动状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀时段';



-- ----------------------------
-- Table structure for promotion_seckill_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_product`;
CREATE TABLE `promotion_seckill_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀参与商品编号',
  `activity_id` bigint NOT NULL DEFAULT 0 COMMENT '秒杀活动 id',
  `config_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '秒杀时段 id 数组',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '商品 spu_id',
  `sku_id` bigint NOT NULL DEFAULT 0 COMMENT '商品 sku_id',
  `seckill_price` int NOT NULL DEFAULT 0 COMMENT '秒杀金额，单位：分',
  `stock` int NOT NULL DEFAULT 0 COMMENT '秒杀库存',
  `activity_status` tinyint NOT NULL DEFAULT 0 COMMENT '秒杀商品状态',
  `activity_start_time` datetime NOT NULL COMMENT '活动开始时间点',
  `activity_end_time` datetime NOT NULL COMMENT '活动结束时间点',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀参与商品';


-- ----------------------------
-- Table structure for trade_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `trade_after_sale`;
CREATE TABLE `trade_after_sale`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '售后编号',
  `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '售后单号',
  `type` tinyint NULL DEFAULT NULL COMMENT '售后类型',
  `status` int NOT NULL DEFAULT 0 COMMENT '售后状态',
  `way` tinyint NOT NULL COMMENT '售后方式',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `apply_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '申请原因',
  `apply_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '补充描述',
  `apply_pic_urls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '补充凭证图片',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单编号',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单流水号',
  `order_item_Id` bigint UNSIGNED NOT NULL COMMENT '订单项编号',
  `spu_id` bigint UNSIGNED NOT NULL COMMENT '商品 SPU 编号',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint UNSIGNED NOT NULL COMMENT '商品 SKU 编号',
  `properties` json NULL COMMENT '商品属性数组，JSON 格式',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品图片',
  `count` int NOT NULL COMMENT '购买数量',
  `audit_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审批时间',
  `audit_user_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '审批人',
  `audit_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '审批备注',
  `refund_price` int NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `pay_refund_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '支付退款编号',
  `refund_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '退款时间',
  `logistics_id` bigint NULL DEFAULT NULL COMMENT '退货物流公司编号',
  `logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '退货物流单号',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '退货时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `receive_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '收货备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '售后订单';



-- ----------------------------
-- Table structure for trade_after_sale_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_after_sale_log`;
CREATE TABLE `trade_after_sale_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `after_sale_id` bigint NOT NULL COMMENT '售后编号',
  `before_status` tinyint NULL DEFAULT NULL COMMENT '售后状态（之前）',
  `after_status` tinyint NOT NULL COMMENT '售后状态（之后）',
  `operate_type` tinyint NOT NULL COMMENT '操作类型',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '操作明细',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '售后订单日志';



-- ----------------------------
-- Table structure for trade_brokerage_record
-- ----------------------------
DROP TABLE IF EXISTS `trade_brokerage_record`;
CREATE TABLE `trade_brokerage_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '业务编号',
  `biz_type` tinyint NOT NULL DEFAULT 0 COMMENT '业务类型：1-订单，2-提现',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `price` int NOT NULL DEFAULT 0 COMMENT '金额',
  `total_price` int NOT NULL DEFAULT 0 COMMENT '当前总佣金',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '说明',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态：0-待结算，1-已结算，2-已取消',
  `frozen_days` int NOT NULL DEFAULT 0 COMMENT '冻结时间（天）',
  `unfreeze_time` datetime NULL DEFAULT NULL COMMENT '解冻时间',
  `source_user_level` int NOT NULL DEFAULT 0 COMMENT '来源用户等级',
  `source_user_id` bigint NOT NULL DEFAULT 0 COMMENT '来源用户编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE COMMENT '用户编号',
  INDEX `idx_biz`(`biz_type` ASC, `biz_id` ASC) USING BTREE COMMENT '业务',
  INDEX `idx_status`(`status` ASC) USING BTREE COMMENT '状态'
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '佣金记录';


-- ----------------------------
-- Table structure for trade_brokerage_user
-- ----------------------------
DROP TABLE IF EXISTS `trade_brokerage_user`;
CREATE TABLE `trade_brokerage_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `bind_user_id` bigint NULL DEFAULT NULL COMMENT '推广员编号',
  `bind_user_time` datetime NULL DEFAULT NULL COMMENT '推广员绑定时间',
  `brokerage_enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否成为推广员',
  `brokerage_time` datetime NULL DEFAULT NULL COMMENT '成为分销员时间',
  `brokerage_price` int NOT NULL DEFAULT 0 COMMENT '可用佣金',
  `frozen_price` int NOT NULL DEFAULT 0 COMMENT '冻结佣金',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分销用户';


-- ----------------------------
-- Table structure for trade_brokerage_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `trade_brokerage_withdraw`;
CREATE TABLE `trade_brokerage_withdraw`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `price` int NOT NULL DEFAULT 0 COMMENT '提现金额',
  `fee_price` int NOT NULL DEFAULT 0 COMMENT '提现手续费',
  `total_price` int NOT NULL DEFAULT 0 COMMENT '当前总佣金',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '提现类型：1-钱包；2-银行卡；3-微信；4-支付宝',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `account_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '银行名称',
  `bank_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户地址',
  `account_qr_code_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收款码',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态：0-审核中，10-审核通过 20-审核不通过；预留：11 - 提现成功；21-提现失败',
  `audit_reason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核驳回原因',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE COMMENT '用户编号',
  INDEX `idx_audit_status`(`status` ASC) USING BTREE COMMENT '状态'
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '佣金提现';



-- ----------------------------
-- Table structure for trade_cart
-- ----------------------------
DROP TABLE IF EXISTS `trade_cart`;
CREATE TABLE `trade_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，唯一自增。',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `count` int NOT NULL COMMENT '商品购买数量',
  `selected` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否选中',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车的商品信息';



-- ----------------------------
-- Table structure for trade_config
-- ----------------------------
DROP TABLE IF EXISTS `trade_config`;
CREATE TABLE `trade_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `after_sale_refund_reasons` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '售后退款理由',
  `after_sale_return_reasons` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '售后退货理由',
  `delivery_express_free_enabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否启用全场包邮',
  `delivery_express_free_price` int NOT NULL DEFAULT 0 COMMENT '全场包邮的最小金额，单位：分',
  `delivery_pick_up_enabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开启自提',
  `brokerage_enabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否启用分佣',
  `brokerage_enabled_condition` tinyint NOT NULL DEFAULT 1 COMMENT '分佣模式：1-人人分销 2-指定分销',
  `brokerage_bind_mode` tinyint NOT NULL DEFAULT 1 COMMENT '分销关系绑定模式: 1-没有推广人，2-新用户, 3-扫码覆盖',
  `brokerage_poster_urls` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分销海报图地址数组',
  `brokerage_first_percent` int NOT NULL DEFAULT 0 COMMENT '一级返佣比例',
  `brokerage_second_percent` int NOT NULL DEFAULT 0 COMMENT '二级返佣比例',
  `brokerage_withdraw_min_price` int NOT NULL DEFAULT 0 COMMENT '用户提现最低金额',
  `brokerage_withdraw_fee_percent` int NOT NULL DEFAULT 0 COMMENT '提现手续费百分比',
  `brokerage_frozen_days` int NOT NULL DEFAULT 7 COMMENT '佣金冻结时间(天)',
  `brokerage_withdraw_types` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1,2,3,4' COMMENT '提现方式：1-钱包；2-银行卡；3-微信；4-支付宝',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '交易中心配置';



-- ----------------------------
-- Table structure for trade_delivery_express
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express`;
CREATE TABLE `trade_delivery_express`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司名称',
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '快递公司 logo',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递公司';



-- ----------------------------
-- Table structure for trade_delivery_express_template
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template`;
CREATE TABLE `trade_delivery_express_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `charge_mode` tinyint NOT NULL COMMENT '配送计费方式',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板';



-- ----------------------------
-- Table structure for trade_delivery_express_template_charge
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template_charge`;
CREATE TABLE `trade_delivery_express_template_charge`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `template_id` bigint NOT NULL COMMENT '快递运费模板编号',
  `area_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送区域 id',
  `charge_mode` tinyint NOT NULL COMMENT '配送计费方式',
  `start_count` double NOT NULL COMMENT '首件数量',
  `start_price` int NOT NULL COMMENT '起步价，单位：分',
  `extra_count` double NOT NULL COMMENT '续件数量',
  `extra_price` int NOT NULL COMMENT '额外价，单位：分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板计费配置';


-- ----------------------------
-- Table structure for trade_delivery_express_template_free
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template_free`;
CREATE TABLE `trade_delivery_express_template_free`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `template_id` bigint NOT NULL COMMENT '快递运费模板编号',
  `area_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '包邮区域 id',
  `free_price` int NOT NULL COMMENT '包邮金额，单位：分',
  `free_count` int NOT NULL DEFAULT 0 COMMENT '包邮件数,',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板包邮配置';



-- ----------------------------
-- Table structure for trade_delivery_pick_up_store
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_pick_up_store`;
CREATE TABLE `trade_delivery_pick_up_store`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店名称',
  `introduction` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '门店简介',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店手机',
  `area_id` int NOT NULL COMMENT '区域编号',
  `detail_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店详细地址',
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店 logo',
  `opening_time` time NOT NULL COMMENT '营业开始时间',
  `closing_time` time NOT NULL COMMENT '营业结束时间',
  `latitude` double NOT NULL COMMENT '纬度',
  `longitude` double NOT NULL COMMENT '经度',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '门店状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自提门店';



-- ----------------------------
-- Table structure for trade_order
-- ----------------------------
DROP TABLE IF EXISTS `trade_order`;
CREATE TABLE `trade_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单流水号',
  `type` int NOT NULL DEFAULT 0 COMMENT '订单类型',
  `terminal` int NOT NULL COMMENT '订单来源终端',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `user_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户 IP',
  `user_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户备注',
  `status` int NOT NULL DEFAULT 0 COMMENT '订单状态',
  `product_count` int NOT NULL COMMENT '购买的商品数量',
  `cancel_type` int NULL DEFAULT NULL COMMENT '取消类型',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商家备注',
  `comment_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否评价',
  `brokerage_user_id` bigint NULL DEFAULT NULL COMMENT '推广人编号',
  `pay_order_id` bigint NULL DEFAULT NULL COMMENT '支付订单编号',
  `pay_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已支付：[0:未支付 1:已经支付过]',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '订单支付时间',
  `pay_channel_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '支付成功的支付渠道',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '订单完成时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `total_price` int NOT NULL DEFAULT 0 COMMENT '商品原价（总），单位：分',
  `discount_price` int NOT NULL DEFAULT 0 COMMENT '订单优惠（总），单位：分',
  `delivery_price` int NOT NULL DEFAULT 0 COMMENT '运费金额，单位：分',
  `adjust_price` int NOT NULL DEFAULT 0 COMMENT '订单调价（总），单位：分',
  `pay_price` int NOT NULL DEFAULT 0 COMMENT '应付金额（总），单位：分',
  `delivery_type` tinyint NOT NULL COMMENT '配送类型',
  `logistics_id` bigint NULL DEFAULT NULL COMMENT '发货物流公司编号',
  `logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '物流公司单号',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `receiver_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人名称',
  `receiver_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人手机',
  `receiver_area_id` int NULL DEFAULT NULL COMMENT '收件人地区编号',
  `receiver_detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '收件人详细地址',
  `pick_up_store_id` bigint NULL DEFAULT NULL COMMENT '自提门店编号',
  `pick_up_verify_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '自提核销码',
  `refund_status` tinyint NOT NULL DEFAULT 0 COMMENT '售后状态',
  `refund_price` int NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `coupon_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '优惠劵编号',
  `coupon_price` int NOT NULL DEFAULT 0 COMMENT '优惠劵减免金额，单位：分',
  `use_point` int NOT NULL DEFAULT 0 COMMENT '使用的积分',
  `point_price` int NOT NULL DEFAULT 0 COMMENT '积分抵扣的金额',
  `give_point` int NOT NULL DEFAULT 0 COMMENT '赠送的积分',
  `refund_point` int NOT NULL DEFAULT 0 COMMENT '退还的使用的积分',
  `vip_price` int NOT NULL DEFAULT 0 COMMENT 'VIP 减免金额，单位：分',
  `seckill_activity_id` bigint NULL DEFAULT NULL COMMENT '秒杀活动编号',
  `bargain_activity_id` bigint NULL DEFAULT NULL COMMENT '砍价活动编号',
  `bargain_record_id` bigint NULL DEFAULT NULL COMMENT '砍价记录编号',
  `combination_activity_id` bigint NULL DEFAULT NULL COMMENT '拼团活动编号',
  `combination_head_id` bigint NULL DEFAULT NULL COMMENT '拼团团长编号',
  `combination_record_id` bigint NULL DEFAULT NULL COMMENT '拼团记录编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易订单表';



-- ----------------------------
-- Table structure for trade_order_item
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_item`;
CREATE TABLE `trade_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单项编号',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单编号',
  `cart_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '购物车项编号',
  `spu_id` bigint UNSIGNED NOT NULL COMMENT '商品 SPU 编号',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint UNSIGNED NOT NULL COMMENT '商品 SKU 编号',
  `properties` json NULL COMMENT '商品属性数组，JSON 格式',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品图片',
  `count` int NOT NULL COMMENT '购买数量',
  `comment_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否评价',
  `price` int NOT NULL DEFAULT 0 COMMENT '商品原价（单），单位：分',
  `discount_price` int NOT NULL DEFAULT 0 COMMENT '商品级优惠（总），单位：分',
  `delivery_price` int NOT NULL DEFAULT 0 COMMENT '运费金额，单位：分',
  `adjust_price` int NOT NULL DEFAULT 0 COMMENT '订单调价（总），单位：分',
  `pay_price` int NOT NULL DEFAULT 0 COMMENT '子订单实付金额（总），不算主订单分摊金额，单位：分',
  `coupon_price` int NOT NULL DEFAULT 0 COMMENT '优惠劵减免金额，单位：分',
  `point_price` int NOT NULL DEFAULT 0 COMMENT '积分抵扣的金额',
  `use_point` int NOT NULL DEFAULT 0 COMMENT '使用的积分',
  `give_point` int NOT NULL DEFAULT 0 COMMENT '赠送的积分',
  `vip_price` int NOT NULL DEFAULT 0 COMMENT 'VIP 减免金额，单位：分',
  `after_sale_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '售后订单编号',
  `after_sale_status` int NOT NULL DEFAULT 0 COMMENT '售后状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易订单明细表';



-- ----------------------------
-- Table structure for trade_order_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_log`;
CREATE TABLE `trade_order_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '用户类型',
  `order_id` bigint NOT NULL COMMENT '订单号',
  `before_status` tinyint NULL DEFAULT NULL COMMENT '操作前状态',
  `after_status` tinyint NULL DEFAULT NULL COMMENT '操作后状态',
  `operate_type` int NOT NULL DEFAULT 0 COMMENT '操作类型',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作内容',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8686 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '交易订单日志';


-- ----------------------------
-- Table structure for trade_statistics
-- ----------------------------
DROP TABLE IF EXISTS `trade_statistics`;
CREATE TABLE `trade_statistics`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，主键自增',
  `time` datetime NOT NULL COMMENT '统计日期',
  `order_create_count` int NOT NULL DEFAULT 0 COMMENT '创建订单数',
  `order_pay_count` int NOT NULL DEFAULT 0 COMMENT '支付订单商品数',
  `order_pay_price` int NOT NULL DEFAULT 0 COMMENT '总支付金额，单位：分',
  `after_sale_count` int NOT NULL DEFAULT 0 COMMENT '退款订单数',
  `after_sale_refund_price` int NOT NULL DEFAULT 0 COMMENT '总退款金额，单位：分',
  `brokerage_settlement_price` int NOT NULL DEFAULT 0 COMMENT '佣金金额（已结算），单位：分',
  `wallet_pay_price` int NOT NULL DEFAULT 0 COMMENT '总支付金额（余额），单位：分',
  `recharge_pay_count` int NOT NULL DEFAULT 0 COMMENT '充值订单数',
  `recharge_pay_price` int NOT NULL DEFAULT 0 COMMENT '充值金额，单位：分',
  `recharge_refund_count` int NOT NULL DEFAULT 0 COMMENT '充值退款订单数',
  `recharge_refund_price` int NOT NULL DEFAULT 0 COMMENT '充值退款金额，单位：分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trade_statistics_time_index`(`time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '交易统计表';



SET FOREIGN_KEY_CHECKS = 1;
