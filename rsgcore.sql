CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'Anticheat',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL COLLATE 'utf8mb3_general_ci',
  `skin` VARCHAR(8000) NOT NULL COLLATE 'utf8mb3_general_ci',
  `clothes` VARCHAR(8000) NOT NULL COLLATE 'utf8mb4_general_ci',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playeroutfit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
  `name` VARCHAR(255) NOT NULL COLLATE 'utf8mb3_general_ci',
  `clothes` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `stashitems` (`stash`, `items`) VALUES
('lawtrashcan', '[]');

CREATE TABLE IF NOT EXISTS `telegrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `sendername` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `sentDate` varchar(25) NOT NULL,
  `message` varchar(455) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `birdstatus` TINYINT(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_horses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stable` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `horseid` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `horse` varchar(50) DEFAULT NULL,
  `dirt` int(11) DEFAULT 0,
  `horsexp` int(11) DEFAULT 0,
  `saddle` varchar(50) DEFAULT '0',
  `blanket` varchar(50) DEFAULT '0',
  `saddlebag` varchar(50) DEFAULT '0',
  `bedroll` varchar(50) DEFAULT '0',
  `horn` varchar(50) DEFAULT '0',
  `stirrup` varchar(50) DEFAULT '0',
  `mane` varchar(50) DEFAULT '0',
  `tail` varchar(50) DEFAULT '0',
  `mask` varchar(50) DEFAULT '0',
  `mustache` varchar(50) DEFAULT '0',
  `gender` varchar(11) NOT NULL,
  `wild` varchar(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `born` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_weapons` (
    `id` int NOT NULL AUTO_INCREMENT,
    `serial` varchar(16) NOT NULL,
    `citizenid` varchar(9) NOT NULL,
    `components` varchar(4096) NOT NULL DEFAULT '{}',
    `components_before` varchar(4096) NOT NULL DEFAULT '{}',
    `ammo` int(3) NOT NULL DEFAULT 0,
    `ammo_express` int(3) NOT NULL DEFAULT 0,
    `ammo_express_explosive` int(3) NOT NULL DEFAULT 0,
    `ammo_high_velocity` int(3) NOT NULL DEFAULT 0,
    `ammo_split_point` int(3) NOT NULL DEFAULT 0,
    `ammo_buckshot_incendiary` int(3) NOT NULL DEFAULT 0,
    `ammo_slug` int(3) NOT NULL DEFAULT 0,
    `ammo_slug_explosive` int(3) NOT NULL DEFAULT 0,
    `ammo_tranquilizer` int(3) NOT NULL DEFAULT 0,
    `ammo_fire` int(3) NOT NULL DEFAULT 0,
    `ammo_poison` int(3) NOT NULL DEFAULT 0,
    `ammo_dynamite` int(3) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `address_book` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`citizenid` VARCHAR(50) NOT NULL,
`name`  VARCHAR(50) NOT NULL,
`owner`  VARCHAR(50) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `management_funds` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`job_name` VARCHAR(50) NOT NULL,
`amount`  INT(100) NOT NULL,
`type` ENUM('boss','gang') NOT NULL DEFAULT 'boss',
PRIMARY KEY (`id`),
UNIQUE KEY `job_name` (`job_name`),
KEY `type` (`type`)
);

INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('vallaw', 0, 'boss'),
('rholaw', 0, 'boss'),
('blklaw', 0, 'boss'),
('strlaw', 0, 'boss'),
('stdenlaw', 0, 'boss'),
('medic', 0, 'boss');

CREATE TABLE IF NOT EXISTS `favorites_animations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `favorites` longtext DEFAULT ('[]') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
