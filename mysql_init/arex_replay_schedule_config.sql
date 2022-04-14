CREATE TABLE `arex_replay_schedule_config`
(
    `app_id`              varchar(50)  NOT NULL COMMENT 'app_id',
    `offset_days`         int(11)      NOT NULL COMMENT 'how many cases should be fetched to replay',
    `send_max_qps`        int(11)      NOT NULL COMMENT 'limited size to send',
    `target_env`          varchar(50)  NOT NULL COMMENT 'default running env',
    `datachange_lasttime` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'last update time',
    PRIMARY KEY (`app_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='replay for schedule config'
