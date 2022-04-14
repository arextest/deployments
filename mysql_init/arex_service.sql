CREATE TABLE `arex_service`
(
    `id`                  bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `app_id`              varchar(50)  NOT NULL COMMENT 'The app Id',
    `service_key`         varchar(200) NOT NULL COMMENT 'The service Key',
    `service_name`        varchar(200) NOT NULL COMMENT 'The name',
    `status`              int(11)      NOT NULL COMMENT 'disabled or enabled or replay suspend',
    `datachange_lasttime` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'last update time',
    PRIMARY KEY (`id`),
    KEY `idx_app_id` (`app_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='The Arex app provider services'
