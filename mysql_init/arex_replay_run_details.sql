CREATE TABLE IF NOT EXISTS `arex_replay_run_details`
(
    `id`                     bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'pk',
    `plan_item_id`           bigint(20)   NOT NULL DEFAULT '0' COMMENT 'the id ref plan item ',
    `operation_id`           bigint(20)   NOT NULL DEFAULT '0' COMMENT 'ref from service operation id',
    `replay_dependence`      varchar(200)          DEFAULT '' COMMENT 'dependence[(k,v)]',
    `request_message_format` varchar(50)           DEFAULT '' COMMENT 'The content type',
    `request_message`        mediumtext   NULL COMMENT 'message content',
    `record_time`            bigint(20)   NOT NULL DEFAULT '0' COMMENT 'recorded time',
    `send_status`            int(11)      NOT NULL DEFAULT '0' COMMENT 'init =0，success=1，failure=2',
    `compare_status`         int(11)      NOT NULL DEFAULT '0' COMMENT '',
    `record_id`              varchar(50)  NOT NULL DEFAULT '' COMMENT 'record id',
    `datachange_lasttime`    timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
        COMMENT 'last update time',
    `source_case_id`         varchar(50)  NOT NULL DEFAULT '' COMMENT 'source replay result id',
    `target_case_id`         varchar(50)  NOT NULL DEFAULT '' COMMENT 'target replay result id',
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
