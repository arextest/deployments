CREATE TABLE IF NOT EXISTS `replay_run_details`
(
    `id`                     bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `plan_item_id`           bigint(20)   NOT NULL DEFAULT '0' COMMENT '关联plan_item表',
    `operation_id`           bigint(20)   NOT NULL DEFAULT '0' COMMENT '关联接口信息表(replay_taskinfo)',
    `replay_dependence`      varchar(200)          DEFAULT '' COMMENT 'case的数据依赖[(k,v)]',
    `request_message_format` varchar(50)           DEFAULT '' COMMENT '请求报文序列化格式',
    `request_message`        mediumtext   NULL COMMENT '请求报文',
    `record_time`            bigint(20)   NOT NULL DEFAULT '0' COMMENT 'case的录制时间',
    `send_status`            int(11)      NOT NULL DEFAULT '0' COMMENT '初始等待发送=0，发送成功=1，发送失败=2',
    `compare_status`         int(11)      NOT NULL DEFAULT '0' COMMENT '发送成功后等待比对=0，对比无差异=1，对比有差异=2，Case 无效=-1',
    `replayid`               varchar(50)  NOT NULL DEFAULT '' COMMENT 'replayid',
    `datachange_lasttime`    timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    `source_case_id`         varchar(50)  NOT NULL DEFAULT '' COMMENT 'source_case_id',
    `target_case_id`         varchar(50)  NOT NULL DEFAULT '' COMMENT 'target_case_id',
    `consume_group`          varchar(100)          DEFAULT NULL COMMENT 'consume_group',
    `request_headers`        varchar(2000)         DEFAULT NULL COMMENT 'json format as a map',
    `request_method`         varchar(200)          DEFAULT NULL COMMENT 'http post,get etc',
    `request_path`           varchar(2000)         DEFAULT NULL COMMENT 'http path with query vars',
    PRIMARY KEY (`id`),
    KEY `ix_plan_item_id` (`plan_item_id`),
    KEY `ix_operation_id` (`operation_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
    DEFAULT CHARSET = utf8mb4 COMMENT ='The case running details'
