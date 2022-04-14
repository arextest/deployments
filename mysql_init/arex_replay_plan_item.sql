CREATE TABLE `arex_replay_plan_item`
(
    `id`                    bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'PK',
    `plan_id`               bigint(20)   NOT NULL DEFAULT '0' COMMENT 'id of plan',
    `operation_id`          bigint(20)   NOT NULL DEFAULT '0' COMMENT 'id from arex_service_operation',
    `app_id`                varchar(50)  NOT NULL DEFAULT '' COMMENT 'appId',
    `replay_status`         int(11)      NOT NULL DEFAULT '0' COMMENT 'waiting=0，running=1，finish=2',
    `replay_begin_time`     datetime(3)           DEFAULT NULL COMMENT 'begin time',
    `replay_finish_time`    datetime(3)           DEFAULT NULL COMMENT 'end time',
    `datachange_createtime` datetime(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT 'createTime',
    `replay_case_count`     int(11)      NOT NULL DEFAULT '0' COMMENT 'the count of operation',
    `datachange_lasttime`   timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'change time',
    PRIMARY KEY (`id`),
    KEY `ix_plan_id` (`plan_id`),
    KEY `ix_operation_id` (`operation_id`),
    KEY `ix_appid` (`app_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='The replay operation items'
