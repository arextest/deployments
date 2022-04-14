CREATE TABLE `arex_dynamic_class`
(
    `id`                  bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `app_id`              int(11)      NOT NULL COMMENT 'app id',
    `full_class_name`     varchar(1000)         DEFAULT NULL COMMENT 'full_class_name',
    `method_name`         varchar(500)          DEFAULT NULL COMMENT 'method_name',
    `parameter_types`     varchar(1000)         DEFAULT NULL COMMENT 'parameter_types',
    `datachange_lasttime` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'last update time',
    `key_formula`         varchar(500)          DEFAULT NULL COMMENT 'key_formula',
    `config_type`         int(11)      NOT NULL DEFAULT '0' COMMENT 'config_type',
    PRIMARY KEY (`id`),
    KEY `ix_appid` (`app_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='dynamic class'
