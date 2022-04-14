CREATE TABLE `arex_service_operation`
(
    `id`                  bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `service_id`          bigint(20)   NOT NULL COMMENT 'FK from arex_service''s id',
    `app_id`              varchar(50)  NOT NULL COMMENT 'The appId',
    `operation_type`      int(11)      NOT NULL COMMENT 'Q message , web api ,etc.',
    `recorded_case_count` int(11)      NOT NULL COMMENT 'the count of per day',
    `status`              int(11)      NOT NULL COMMENT 'Bit flag composed of bits that suspend or disable ,etc.',
    `operation_name`      varchar(200) NOT NULL COMMENT 'the name of operation',
    `datachange_lasttime` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'last update time',
    PRIMARY KEY (`id`),
    KEY `idx_service_id` (`service_id`),
    KEY `idx_app_id` (`app_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='The all operations provider from service'
