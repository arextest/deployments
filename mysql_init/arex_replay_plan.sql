CREATE TABLE `arex_replay_plan`
(
    `id`                  bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `plan_name`           varchar(200) NOT NULL DEFAULT '' COMMENT 'plan_name',
    `target_image_id`     bigint(20)   NOT NULL DEFAULT '0' COMMENT 'target_image_id',
    `target_image_name`   varchar(200) NOT NULL DEFAULT '' COMMENT 'target_image_name',
    `source_env`          varchar(20)  NOT NULL DEFAULT '' COMMENT 'source_env',
    `target_env`          varchar(20)  NOT NULL DEFAULT '' COMMENT 'target_env',
    `source_host`         varchar(200) NOT NULL DEFAULT '' COMMENT 'source_host',
    `target_host`         varchar(200) NOT NULL DEFAULT '' COMMENT 'target_host',
    `case_source_type`    int(11)      NOT NULL DEFAULT '0' COMMENT 'Test：1/ Pro：0',
    `case_total_count`    int(11)      NOT NULL DEFAULT '0' COMMENT 'how many items should be replay',
    `case_source_from`    datetime(3)           DEFAULT NULL COMMENT 'fetch case begin time',
    `case_source_to`      datetime(3)           DEFAULT NULL COMMENT 'fetch case end time',
    `plan_create_time`    datetime(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'send replay begin time',
    `plan_finish_time`    datetime(3)           DEFAULT NULL COMMENT 'send replay end time',
    `operator`            varchar(50)  NOT NULL DEFAULT '' COMMENT 'who create the plan',
    `app_id`              varchar(50)  NOT NULL DEFAULT '' COMMENT 'app_id',
    `datachange_lasttime` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'lastUpdateTime',
    `arex_core_version`   varchar(30)           DEFAULT NULL COMMENT 'arex_core_version',
    `arex_ext_version`    varchar(30)           DEFAULT NULL COMMENT 'arex_ext_version',
    `case_record_version` varchar(30)           DEFAULT NULL COMMENT 'case_record_version',
    PRIMARY KEY (`id`),
    KEY `ix_app_id` (`app_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='replay schedule info'
