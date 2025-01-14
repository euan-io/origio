ALTER TABLE `system_oauth2_client`
    ADD COLUMN `oos_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否启用单一登录功能';