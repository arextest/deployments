CREATE TABLE `arex_comparison_config`
(
    `id`                  bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'PK id',
    `app_id`              varchar(50)           DEFAULT NULL COMMENT 'The appId',
    `operation_id`        bigint(20)            DEFAULT NULL COMMENT 'ref the replay taskId',
    `category_type`       int(11)      NOT NULL COMMENT 'A path should be ignored or the service type should be ignored,etc.',
    `datachange_lasttime` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'last update time',
    PRIMARY KEY (`id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 31
  DEFAULT CHARSET = utf8mb4 COMMENT ='replay compare category config'
