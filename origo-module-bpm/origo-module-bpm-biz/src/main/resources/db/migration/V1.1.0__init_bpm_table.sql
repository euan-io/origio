CREATE TABLE `bpm_category`  (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类编号',
                                 `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分类名',
                                 `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分类标志',
                                 `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类描述',
                                 `status` tinyint NULL DEFAULT NULL COMMENT '分类状态',
                                 `sort` int NULL DEFAULT NULL COMMENT '分类排序',
                                 `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                 `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'BPM 流程分类';

-- ----------------------------
-- Records of bpm_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bpm_form
-- ----------------------------
CREATE TABLE `bpm_form`  (
                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单名',
                             `status` tinyint NOT NULL COMMENT '开启状态',
                             `conf` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单的配置',
                             `fields` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表单项的数组',
                             `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                             `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                             `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'BPM 表单定义表';

-- ----------------------------
-- Records of bpm_form
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bpm_oa_leave
-- ----------------------------
CREATE TABLE `bpm_oa_leave`  (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '请假表单主键',
                                 `user_id` bigint NOT NULL COMMENT '申请人的用户编号',
                                 `type` tinyint NOT NULL COMMENT '请假类型',
                                 `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请假原因',
                                 `start_time` datetime NOT NULL COMMENT '开始时间',
                                 `end_time` datetime NOT NULL COMMENT '结束时间',
                                 `day` tinyint NOT NULL COMMENT '请假天数',
                                 `status` tinyint NOT NULL COMMENT '审批结果',
                                 `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程实例的编号',
                                 `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                 `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OA 请假申请表';

-- ----------------------------
-- Records of bpm_oa_leave
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bpm_process_definition_info
-- ----------------------------
CREATE TABLE `bpm_process_definition_info`  (
                                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                                `process_definition_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程定义的编号',
                                                `model_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程模型的编号',
                                                `icon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
                                                `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
                                                `form_type` tinyint NOT NULL COMMENT '表单类型',
                                                `form_id` bigint NULL DEFAULT NULL COMMENT '表单编号',
                                                `form_conf` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表单的配置',
                                                `form_fields` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表单项的数组',
                                                `form_custom_create_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自定义表单的提交路径',
                                                `form_custom_view_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自定义表单的查看路径',
                                                `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
                                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
                                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                                `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
                                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'BPM 流程定义的信息表';

-- ----------------------------
-- Table structure for bpm_process_expression
-- ----------------------------
CREATE TABLE `bpm_process_expression`  (
                                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                           `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表达式名字',
                                           `status` tinyint NOT NULL COMMENT '表达式状态',
                                           `expression` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表达式',
                                           `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
                                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
                                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                           `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'BPM 流程表达式表';

-- ----------------------------
-- Records of bpm_process_expression
-- ----------------------------
BEGIN;
INSERT INTO `bpm_process_expression` (`id`, `name`, `status`, `expression`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (116, '测试表达式', 0, 'cn.iocoder.yudao.module.bpm.framework.flowable.core.listener.demo.exection.DemoDelegateClassExecutionListener', '1', '2024-03-23 15:13:20', '1', '2024-03-09 22:37:51', b'1', 1);
INSERT INTO `bpm_process_expression` (`id`, `name`, `status`, `expression`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (118, '测试任务监听器', 0, 'cn.iocoder.yudao.module.bpm.framework.flowable.core.listener.demo.task.DemoDelegateClassTaskListener', '1', '2024-03-23 19:13:15', '1', '2024-03-09 22:36:44', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for bpm_process_instance_copy
-- ----------------------------
CREATE TABLE `bpm_process_instance_copy`  (
                                              `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                              `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户编号，被抄送人',
                                              `start_user_id` bigint NOT NULL DEFAULT 0 COMMENT '发起流程的用户编号',
                                              `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '流程实例的id',
                                              `process_instance_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '流程实例的名字',
                                              `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程定义的分类',
                                              `task_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发起抄送的任务编号',
                                              `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务的名字',
                                              `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                              `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
                                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'BPM 流程实例抄送表';

-- ----------------------------
-- Records of bpm_process_instance_copy
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bpm_process_listener
-- ----------------------------
CREATE TABLE `bpm_process_listener`  (
                                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                         `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '监听器名字',
                                         `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '监听器类型',
                                         `status` tinyint NOT NULL COMMENT '监听器状态',
                                         `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '监听事件',
                                         `value_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '监听器值类型',
                                         `value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '监听器值',
                                         `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                         `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'BPM 流程监听器表';

-- ----------------------------
-- Records of bpm_process_listener
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bpm_user_group
-- ----------------------------
CREATE TABLE `bpm_user_group`  (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                   `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组名',
                                   `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
                                   `user_ids` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '成员编号数组',
                                   `status` tinyint NOT NULL COMMENT '状态（0正常 1停用）',
                                   `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                   `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'BPM 用户组表';

-- ----------------------------
-- Records of bpm_user_group
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
