CREATE TABLE `arex_app`
(
    `app_id`               varchar(50)  NOT NULL COMMENT 'the appId',
    `agent_version`        varchar(50)  NOT NULL COMMENT 'agent_version',
    `agent_ext_version`    varchar(50)  NOT NULL COMMENT 'agent_ext_version',
    `app_name`             varchar(500) NOT NULL COMMENT 'app_name',
    `app_description`      varchar(500) NOT NULL COMMENT 'app_description',
    `app_owner`            varchar(50)  NOT NULL COMMENT 'app_owner',
    `bu_organization_name` varchar(100) NOT NULL COMMENT 'bu_organization_name',
    `recorded_case_count`  int(11)      NOT NULL COMMENT 'count for per day',
    `bu_organization_id`   varchar(50)  NOT NULL COMMENT 'bu_organization_id',
    `group_name`           varchar(500) NOT NULL COMMENT 'The name of the apps team name',
    `group_id`             varchar(50)  NOT NULL COMMENT 'group_id',
    `status`               int(11)      NOT NULL COMMENT 'Bit flag composed of bits that indicate suspend replay or disabled record,etc',
    `datachange_lasttime`  timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT
        'last update time',
    `features`             int(11)      NOT NULL COMMENT 'Bit flag composed of bits that indicate which FeatureTypes are enabled.',
    `category`             varchar(50)  NOT NULL COMMENT 'The app category type,eg: java_web_service or nodeJs_Web_service ',
    PRIMARY KEY (`app_id`),
    KEY `ix_DataChange_LastTime` (`datachange_lasttime`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='a description for an application'
