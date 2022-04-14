CREATE TABLE `arex_comparison_details_config`
(
    `id`                  bigint(20)    NOT NULL AUTO_INCREMENT COMMENT 'The PK ',
    `path_name`           varchar(500)  NOT NULL COMMENT 'compared for path name',
    `path_value`          varchar(1000) NOT NULL COMMENT 'compared for path value',
    `expiration_type`     int(11)       NOT NULL COMMENT 'The Pinned or Absolute, etc',
    `expiration_date`     datetime      NOT NULL COMMENT 'The date of expiration',
    `decode_type`         varchar(50)            DEFAULT NULL COMMENT 'used decode type before to comparing,eg:gzip,zstd,etc.',
    `decode_prefix`       varchar(50)            DEFAULT NULL COMMENT 'the prefix of value should be skipped before to decode',
    `decode_secret_key`   varchar(1000)          DEFAULT NULL COMMENT 'the secretKey as part of decode',
    `comparison_id`       bigint(20)    NOT NULL COMMENT 'ref value from compares id',
    `datachange_lasttime` timestamp(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'last update time',
    PRIMARY KEY (`id`),
    KEY `idx_comparison_id` (`comparison_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4 COMMENT ='The replay compare details'
