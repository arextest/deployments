CREATE TABLE `arex_record_service_config`
(
    `app_id`                      varchar(50)  NOT NULL COMMENT 'the appId',
    `sample_rate`                 int(11)      NOT NULL COMMENT 'The sample rate means for in 100 seconds should be occurred the number of records.',
    `exclude_dependent_operation` varchar(2000)         DEFAULT NULL COMMENT 'All the dependent operation should be skipped when recording.',
    `exclude_dependent_service`   varchar(2000)         DEFAULT NULL COMMENT 'All the dependent services should be skipped when recording.',
    `exclude_operation`           varchar(2000)         DEFAULT NULL COMMENT 'skip record the operations',
    `include_operation`           varchar(2000)         DEFAULT NULL COMMENT 'The main entrys operation should be recording it.',
    `include_service`             varchar(2000)         DEFAULT NULL COMMENT 'he main entrys service should be recorded it.',
    `datachange_lasttime`         timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
        COMMENT 'last update time',
    `allow_day_of_weeks`          int(11)      NOT NULL COMMENT 'Bit flag composed of bits that indicate which {@link java.time.DayOfWeek}s are enabled to recording.',
    `allow_time_of_day_from`      varchar(10)  NOT NULL COMMENT 'HH:mm example: 00:01',
    `allow_time_of_day_to`        varchar(10)  NOT NULL COMMENT 'HH:mm example: 23:59',
    PRIMARY KEY (`app_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='How to recording for a appIds service'
