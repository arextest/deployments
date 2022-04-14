CREATE TABLE `replay_plan`
(
    `id`                  bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `plan_name`           varchar(200) NOT NULL DEFAULT '' COMMENT 'plan_name',
    `target_image_id`     bigint(20)   NOT NULL DEFAULT '0' COMMENT '镜像ID',
    `target_image_name`   varchar(200) NOT NULL DEFAULT '' COMMENT '镜像名称',
    `source_env`          varchar(20)  NOT NULL DEFAULT '' COMMENT '基准环境',
    `target_env`          varchar(20)  NOT NULL DEFAULT '' COMMENT '测试环境',
    `source_host`         varchar(200) NOT NULL DEFAULT '' COMMENT '基准服务器',
    `target_host`         varchar(200) NOT NULL DEFAULT '' COMMENT '测试服务器',
    `case_source_type`    int(11)      NOT NULL DEFAULT '0' COMMENT '测试：1/ 生产：0',
    `case_total_count`    int(11)      NOT NULL DEFAULT '0' COMMENT '回放的案例总数',
    `case_source_from`    datetime(3)           DEFAULT NULL COMMENT 'case数据开始时间',
    `case_source_to`      datetime(3)           DEFAULT NULL COMMENT 'case数据截止时间',
    `plan_create_time`    datetime(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '计划开始时间',
    `plan_finish_time`    datetime(3)           DEFAULT NULL COMMENT '计划完成时间',
    `operator`            varchar(50)  NOT NULL DEFAULT '' COMMENT '操作人',
    `appid`               varchar(50)  NOT NULL DEFAULT '' COMMENT 'appid',
    `datachange_lasttime` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    `arex_core_version`   varchar(30)           DEFAULT NULL COMMENT 'arex_core_version',
    `arex_ext_version`    varchar(30)           DEFAULT NULL COMMENT 'arex_ext_version',
    `case_record_version` varchar(30)           DEFAULT NULL COMMENT 'case_record_version',
    PRIMARY KEY (`id`),
    KEY `ix_appid` (`appid`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='回放计划表'
