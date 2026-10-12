-- DBDoc meta database initial schema (MySQL 8.0+)
-- See docs/database.md for the design document.

CREATE TABLE IF NOT EXISTS `ds_datasource` (
    `id`                  BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`                VARCHAR(128) NOT NULL COMMENT '数据源名称',
    `type`                VARCHAR(32)  NOT NULL COMMENT '数据库类型：mysql / postgresql',
    `host`                VARCHAR(255) NOT NULL COMMENT '主机',
    `port`                INT          NOT NULL COMMENT '端口',
    `database_name`       VARCHAR(128) NOT NULL COMMENT '数据库名',
    `username`            VARCHAR(128) NOT NULL COMMENT '用户名',
    `password_encrypted`  VARCHAR(512) NOT NULL COMMENT '加密密码',
    `status`              VARCHAR(32)  NOT NULL DEFAULT 'enabled' COMMENT '状态',
    `created_at`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_ds_datasource_name` (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='数据源';

CREATE TABLE IF NOT EXISTS `meta_table` (
    `id`            BIGINT        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `datasource_id` BIGINT        NOT NULL COMMENT '数据源 ID',
    `table_name`    VARCHAR(128)  NOT NULL COMMENT '表名',
    `table_comment` VARCHAR(1024) NOT NULL DEFAULT '' COMMENT '表注释',
    `engine`        VARCHAR(64)            DEFAULT NULL COMMENT '引擎',
    `charset`       VARCHAR(64)            DEFAULT NULL COMMENT '字符集',
    `created_at`    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_meta_table_ds_table` (`datasource_id`, `table_name`),
    KEY `idx_meta_table_name` (`table_name`),
    CONSTRAINT `fk_meta_table_datasource` FOREIGN KEY (`datasource_id`)
        REFERENCES `ds_datasource` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='表元数据';

CREATE TABLE IF NOT EXISTS `meta_column` (
    `id`               BIGINT        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `table_id`         BIGINT        NOT NULL COMMENT '表 ID',
    `column_name`      VARCHAR(128)  NOT NULL COMMENT '字段名',
    `column_type`      VARCHAR(128)  NOT NULL COMMENT '字段类型',
    `column_comment`   VARCHAR(1024) NOT NULL DEFAULT '' COMMENT '字段注释',
    `nullable`         TINYINT       NOT NULL DEFAULT 1 COMMENT '是否可空：1 是，0 否',
    `default_value`    VARCHAR(512)           DEFAULT NULL COMMENT '默认值',
    `ordinal_position` INT           NOT NULL DEFAULT 0 COMMENT '字段顺序',
    `created_at`       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_meta_column_table_column` (`table_id`, `column_name`),
    KEY `idx_meta_column_name` (`column_name`),
    CONSTRAINT `fk_meta_column_table` FOREIGN KEY (`table_id`)
        REFERENCES `meta_table` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='字段元数据';