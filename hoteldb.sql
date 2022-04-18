-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1,	'Administrator'),
(2,	'User');

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1,	1,	1),
(2,	1,	2),
(3,	1,	3),
(4,	1,	4),
(5,	1,	5),
(6,	1,	6),
(7,	1,	7),
(8,	1,	8),
(9,	1,	9),
(10,	1,	10),
(11,	1,	11),
(12,	1,	12),
(13,	1,	13),
(14,	1,	14),
(15,	1,	15),
(16,	1,	16),
(17,	1,	17),
(18,	1,	18),
(19,	1,	19),
(20,	1,	20),
(21,	1,	21),
(22,	1,	22),
(23,	1,	23),
(24,	1,	24),
(25,	1,	25),
(26,	1,	26),
(27,	1,	27),
(28,	1,	28),
(32,	1,	29),
(33,	1,	30),
(34,	1,	31),
(29,	1,	32),
(30,	1,	33),
(31,	1,	34),
(35,	1,	35),
(36,	1,	36),
(37,	1,	37),
(38,	1,	38),
(39,	1,	39),
(40,	1,	40),
(41,	1,	41),
(42,	1,	42),
(43,	1,	43),
(44,	1,	44),
(45,	1,	45),
(46,	1,	46),
(47,	1,	47),
(48,	1,	48);

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1,	'Can add log entry',	1,	'add_logentry'),
(2,	'Can change log entry',	1,	'change_logentry'),
(3,	'Can delete log entry',	1,	'delete_logentry'),
(4,	'Can view log entry',	1,	'view_logentry'),
(5,	'Can add permission',	2,	'add_permission'),
(6,	'Can change permission',	2,	'change_permission'),
(7,	'Can delete permission',	2,	'delete_permission'),
(8,	'Can view permission',	2,	'view_permission'),
(9,	'Can add group',	3,	'add_group'),
(10,	'Can change group',	3,	'change_group'),
(11,	'Can delete group',	3,	'delete_group'),
(12,	'Can view group',	3,	'view_group'),
(13,	'Can add user',	4,	'add_user'),
(14,	'Can change user',	4,	'change_user'),
(15,	'Can delete user',	4,	'delete_user'),
(16,	'Can view user',	4,	'view_user'),
(17,	'Can add content type',	5,	'add_contenttype'),
(18,	'Can change content type',	5,	'change_contenttype'),
(19,	'Can delete content type',	5,	'delete_contenttype'),
(20,	'Can view content type',	5,	'view_contenttype'),
(21,	'Can add session',	6,	'add_session'),
(22,	'Can change session',	6,	'change_session'),
(23,	'Can delete session',	6,	'delete_session'),
(24,	'Can view session',	6,	'view_session'),
(25,	'Can add user details',	7,	'add_userdetails'),
(26,	'Can change user details',	7,	'change_userdetails'),
(27,	'Can delete user details',	7,	'delete_userdetails'),
(28,	'Can view user details',	7,	'view_userdetails'),
(29,	'Admin Permission',	7,	'admin_permisions'),
(30,	'User Permission',	7,	'user_permisions'),
(31,	'Can add category',	8,	'add_category'),
(32,	'Can change category',	8,	'change_category'),
(33,	'Can delete category',	8,	'delete_category'),
(34,	'Can view category',	8,	'view_category'),
(35,	'Admin Permission',	8,	'admin_permisions'),
(36,	'User Permission',	8,	'user_prmission'),
(37,	'Can add sub category',	9,	'add_subcategory'),
(38,	'Can change sub category',	9,	'change_subcategory'),
(39,	'Can delete sub category',	9,	'delete_subcategory'),
(40,	'Can view sub category',	9,	'view_subcategory'),
(41,	'Admin Permission',	9,	'admin_permisions'),
(42,	'User Permission',	9,	'user_prmission'),
(43,	'Can add rooms',	10,	'add_rooms'),
(44,	'Can change rooms',	10,	'change_rooms'),
(45,	'Can delete rooms',	10,	'delete_rooms'),
(46,	'Can view rooms',	10,	'view_rooms'),
(47,	'Admin Permission',	10,	'admin_permisions'),
(48,	'User Permission',	10,	'user_prmission'),
(49,	'Can add order',	11,	'add_order'),
(50,	'Can change order',	11,	'change_order'),
(51,	'Can delete order',	11,	'delete_order'),
(52,	'Can view order',	11,	'view_order'),
(53,	'Can add line item',	12,	'add_lineitem'),
(54,	'Can change line item',	12,	'change_lineitem'),
(55,	'Can delete line item',	12,	'delete_lineitem'),
(56,	'Can view line item',	12,	'view_lineitem'),
(57,	'Can add booking',	13,	'add_booking'),
(58,	'Can change booking',	13,	'change_booking'),
(59,	'Can delete booking',	13,	'delete_booking'),
(60,	'Can view booking',	13,	'view_booking');

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1,	'pbkdf2_sha256$320000$nJYz53hztiFpKE4T1mo6rO$kXOvxir2vfUHTCHbCQ25zAfhJL455PqwXtT+9eflKcw=',	NULL,	0,	'ammini',	'ammukuty',	'k',	'kammu@gmail.com',	0,	1,	'2022-04-11 08:52:16.254555'),
(2,	'pbkdf2_sha256$320000$BJhoxdgpNutAY3gnCgBrYX$7q/syXHT56KQUJjXxd0fUEsPeXowoC63p49diaG+K4k=',	NULL,	0,	'zavosyx',	'Desirae',	'Landry',	'kufegode@mailinator.com',	0,	1,	'2022-04-11 08:54:09.681344'),
(19,	'pbkdf2_sha256$320000$3pFehG0uzAz58frrvUwFrs$/tEd36t8AIKW/8U34MYsmOkbjnLZGwr5LTDOFHC87Nk=',	NULL,	0,	'begyges',	'Priscilla',	'Keith',	'luwa@mailinator.com',	0,	1,	'2022-04-11 09:49:38.217165'),
(20,	'pbkdf2_sha256$320000$gy1SczhL6o204FBmkYUH2w$YPyJdgM4S/byOd8WHZkjRnXXphksE7Lk/XreFo7CiMA=',	NULL,	0,	'mefykazidy',	'Donovan',	'Cunningham',	'quroda@mailinator.com',	0,	1,	'2022-04-11 09:51:10.362709'),
(21,	'pbkdf2_sha256$320000$VAaWUOwpODLqjBV2w0QOd3$qwV4ctGG2tPSpiqLVoXYOEiD5yo8NdXAi978qPWc/EA=',	NULL,	0,	'bykufet',	'Abra',	'Little',	'dubirunago@mailinator.com',	0,	1,	'2022-04-11 09:53:02.203537'),
(22,	'pbkdf2_sha256$320000$jLRLvo5TldzdDjg2lKONxB$AHWwmGkbb9pmNkpcCj31EN8XXrv/WwwwsotEIeUq01g=',	NULL,	0,	'qutiqywa',	'April',	'Mueller',	'gycebani@mailinator.com',	0,	1,	'2022-04-11 09:54:41.071035'),
(23,	'pbkdf2_sha256$320000$W25P6ajMmefGKT77mUL6J4$v0XPEIZESPKtSxNfWx8UiI42ut/Nj0KpYUu7LYw7ZIc=',	NULL,	0,	'pipita',	'Melodie',	'Short',	'kurewyb@mailinator.com',	0,	1,	'2022-04-11 09:55:49.097338'),
(24,	'pbkdf2_sha256$320000$mmBDv9dY2acYbIJAAR7er4$EBIZWVmSlMb0o1r7DbujI6EE+wXXugNJ4NjusBa6u/w=',	NULL,	0,	'zejuqe',	'Daquan',	'Christensen',	'ficof@mailinator.com',	0,	1,	'2022-04-11 10:05:39.063386'),
(25,	'pbkdf2_sha256$320000$uEfdB2FucUgpNLpmEtSaQO$zPMPymBR5NBZSihL66YiMZ+BSTqRaGm9HZiSGPLN2Io=',	'2022-04-17 04:19:07.000000',	0,	'Keerthi@123',	'Keerthi',	'k',	'Keerthi@gmail.com',	0,	1,	'2022-04-11 10:07:17.000000'),
(26,	'pbkdf2_sha256$320000$pLjown1CxLY7HqknWOdYD2$tS9yGcYWk8k1Tf+zrePs2ytEjvrif2CKolGGXHHmW/k=',	'2022-04-18 07:17:19.939222',	1,	'hotel',	'',	'',	'sss@gmail.com',	1,	1,	'2022-04-11 10:10:22.476371'),
(27,	'pbkdf2_sha256$320000$P8nGbSwc2CTRGgNTjBV4SZ$+PfdC7MyMi+JazagUulqpFHiq1BDlIEPaRiAk3lx0/Q=',	'2022-04-18 06:07:50.521773',	1,	'Sreeja@2000',	'Sreeja',	'm',	'sree1234567@yopmail.com',	1,	1,	'2022-04-11 15:40:07.000000'),
(28,	'pbkdf2_sha256$320000$UaMiPSnsKsm1wSGAQkK2nv$31G8zb0ZmfgMZv/e1nGPfhJrA7OWMG7sKrpRzKSnokk=',	'2022-04-18 06:03:07.114194',	0,	'Arya@123',	'Arya',	'A',	'arya@123gmail.com',	0,	1,	'2022-04-18 04:36:12.863618');

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(3,	25,	2),
(5,	27,	1),
(4,	27,	2),
(6,	28,	2);

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(37,	27,	1),
(38,	27,	2),
(39,	27,	3),
(40,	27,	4),
(41,	27,	5),
(42,	27,	6),
(43,	27,	7),
(44,	27,	8),
(45,	27,	9),
(46,	27,	10),
(47,	27,	11),
(48,	27,	12),
(49,	27,	13),
(50,	27,	14),
(51,	27,	15),
(52,	27,	16),
(53,	27,	17),
(54,	27,	18),
(55,	27,	19),
(56,	27,	20),
(57,	27,	21),
(58,	27,	22),
(59,	27,	23),
(60,	27,	24),
(61,	27,	25),
(62,	27,	26),
(63,	27,	27),
(64,	27,	28),
(65,	27,	29),
(66,	27,	30),
(67,	27,	31),
(68,	27,	32),
(69,	27,	33),
(70,	27,	34),
(71,	27,	35),
(72,	27,	36),
(73,	27,	37),
(74,	27,	38),
(75,	27,	39),
(76,	27,	40),
(77,	27,	41),
(78,	27,	42),
(79,	27,	43),
(80,	27,	44),
(81,	27,	45),
(82,	27,	46),
(83,	27,	47),
(84,	27,	48),
(85,	27,	49),
(86,	27,	50),
(87,	27,	51),
(88,	27,	52),
(89,	27,	53),
(90,	27,	54),
(91,	27,	55),
(92,	27,	56),
(93,	27,	57),
(94,	27,	58),
(95,	27,	59),
(96,	27,	60);

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1,	'2022-04-11 10:11:34.744302',	'1',	'Administrator',	1,	'[{\"added\": {}}]',	3,	26),
(2,	'2022-04-11 10:11:54.164977',	'2',	'User',	1,	'[{\"added\": {}}]',	3,	26),
(3,	'2022-04-11 10:12:37.283179',	'25',	'Keerthi@123',	2,	'[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]',	4,	26),
(4,	'2022-04-11 10:57:38.442937',	'1',	'Administrator',	2,	'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',	3,	26),
(5,	'2022-04-11 11:01:19.103635',	'1',	'Administrator',	2,	'[]',	3,	26),
(6,	'2022-04-11 11:01:43.164110',	'25',	'Keerthi@123',	2,	'[{\"changed\": {\"fields\": [\"Groups\"]}}]',	4,	26),
(7,	'2022-04-11 14:19:20.632579',	'25',	'Keerthi@123',	2,	'[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]',	4,	26),
(8,	'2022-04-11 14:54:28.963821',	'1',	'Administrator',	2,	'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',	3,	26),
(9,	'2022-04-11 15:36:52.656963',	'1',	'Administrator',	2,	'[]',	3,	26),
(10,	'2022-04-12 04:53:15.779129',	'1',	'Administrator',	2,	'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',	3,	26),
(11,	'2022-04-17 11:56:52.113317',	'25',	'Keerthi@123',	2,	'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',	4,	26),
(12,	'2022-04-17 12:28:19.170152',	'25',	'Keerthi@123',	2,	'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',	4,	26),
(13,	'2022-04-17 12:28:30.529788',	'27',	'Sreeja@2000',	2,	'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',	4,	26),
(14,	'2022-04-17 12:28:48.343661',	'27',	'Sreeja@2000',	2,	'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',	4,	26),
(15,	'2022-04-17 12:29:00.942718',	'25',	'Keerthi@123',	2,	'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',	4,	26),
(16,	'2022-04-18 04:47:27.125779',	'27',	'Sreeja@2000',	2,	'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',	4,	27);

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1,	'admin',	'logentry'),
(3,	'auth',	'group'),
(2,	'auth',	'permission'),
(4,	'auth',	'user'),
(5,	'contenttypes',	'contenttype'),
(13,	'room_management',	'booking'),
(8,	'room_management',	'category'),
(12,	'room_management',	'lineitem'),
(11,	'room_management',	'order'),
(10,	'room_management',	'rooms'),
(9,	'room_management',	'subcategory'),
(6,	'sessions',	'session'),
(7,	'user',	'userdetails');

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1,	'contenttypes',	'0001_initial',	'2022-04-11 07:33:04.174939'),
(2,	'auth',	'0001_initial',	'2022-04-11 07:33:06.387157'),
(3,	'admin',	'0001_initial',	'2022-04-11 07:33:06.922936'),
(4,	'admin',	'0002_logentry_remove_auto_add',	'2022-04-11 07:33:06.964928'),
(5,	'admin',	'0003_logentry_add_action_flag_choices',	'2022-04-11 07:33:06.984940'),
(6,	'contenttypes',	'0002_remove_content_type_name',	'2022-04-11 07:33:07.301158'),
(7,	'auth',	'0002_alter_permission_name_max_length',	'2022-04-11 07:33:07.532187'),
(8,	'auth',	'0003_alter_user_email_max_length',	'2022-04-11 07:33:07.602256'),
(9,	'auth',	'0004_alter_user_username_opts',	'2022-04-11 07:33:07.648231'),
(10,	'auth',	'0005_alter_user_last_login_null',	'2022-04-11 07:33:07.792507'),
(11,	'auth',	'0006_require_contenttypes_0002',	'2022-04-11 07:33:07.808066'),
(12,	'auth',	'0007_alter_validators_add_error_messages',	'2022-04-11 07:33:07.821784'),
(13,	'auth',	'0008_alter_user_username_max_length',	'2022-04-11 07:33:08.006070'),
(14,	'auth',	'0009_alter_user_last_name_max_length',	'2022-04-11 07:33:08.241944'),
(15,	'auth',	'0010_alter_group_name_max_length',	'2022-04-11 07:33:08.285737'),
(16,	'auth',	'0011_update_proxy_permissions',	'2022-04-11 07:33:08.327148'),
(17,	'auth',	'0012_alter_user_first_name_max_length',	'2022-04-11 07:33:08.504207'),
(18,	'sessions',	'0001_initial',	'2022-04-11 07:33:08.676259'),
(19,	'user',	'0001_initial',	'2022-04-11 07:33:08.973741'),
(20,	'user',	'0002_alter_userdetails_date_of_birth',	'2022-04-11 09:54:13.756115'),
(21,	'user',	'0003_alter_userdetails_date_of_birth',	'2022-04-11 09:55:28.560432'),
(22,	'user',	'0004_alter_userdetails_options',	'2022-04-11 10:18:27.127162'),
(23,	'room_management',	'0001_initial',	'2022-04-11 10:46:37.044378'),
(24,	'room_management',	'0002_alter_category_options',	'2022-04-11 14:14:58.870897'),
(25,	'user',	'0005_alter_userdetails_options',	'2022-04-11 14:14:58.892319'),
(26,	'room_management',	'0003_subcategory',	'2022-04-11 14:39:37.671237'),
(27,	'room_management',	'0004_rooms',	'2022-04-12 04:50:31.353662'),
(28,	'room_management',	'0005_alter_rooms_options',	'2022-04-12 04:52:36.196343'),
(29,	'room_management',	'0006_order',	'2022-04-12 14:00:20.324842'),
(30,	'room_management',	'0007_lineitem',	'2022-04-13 09:14:30.959176'),
(31,	'room_management',	'0008_booking',	'2022-04-13 14:27:48.927295'),
(33,	'room_management',	'0009_remove_lineitem_room_number_id_id_lineitem_room_numb',	'2022-04-14 17:20:08.511479'),
(34,	'room_management',	'0010_booking_order_id_alter_lineitem_order_id',	'2022-04-15 07:34:39.641696');

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('w5vfee2xcvi70awckn1ew3ujnwvzebc9',	'.eJxVjDEOwjAMRe-SGUV1rLiBkZ0zVHbikAJKpaadKu4OlTrA-t97fzMDr0sZ1qbzMCZzMY7M6XcUjk-tO0kPrvfJxqku8yh2V-xBm71NSV_Xw_07KNzKt0bPXceZxEGPkiOCZiIXxQOkSB2ERERZMJBijxDOwj6DOFUAQm_eHwXUN8M:1ngLdP:aCdEs6pTK052DC9ED10SlgAm4TyQd9O5jq6sUKtfmoA',	'2022-05-02 07:17:19.948104');

DROP TABLE IF EXISTS `room_management_booking`;
CREATE TABLE `room_management_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `starting_date` datetime(6) NOT NULL,
  `ending_Date` datetime(6) NOT NULL,
  `status` varchar(255) NOT NULL,
  `room_number_id` bigint NOT NULL,
  `user_id_id` int NOT NULL,
  `order_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_management_book_room_number_id_ccdbf11a_fk_room_mana` (`room_number_id`),
  KEY `room_management_booking_user_id_id_f6d5a4e5_fk_auth_user_id` (`user_id_id`),
  KEY `room_management_book_order_id_id_3b925710_fk_room_mana` (`order_id_id`),
  CONSTRAINT `room_management_book_order_id_id_3b925710_fk_room_mana` FOREIGN KEY (`order_id_id`) REFERENCES `room_management_order` (`id`),
  CONSTRAINT `room_management_book_room_number_id_ccdbf11a_fk_room_mana` FOREIGN KEY (`room_number_id`) REFERENCES `room_management_rooms` (`id`),
  CONSTRAINT `room_management_booking_user_id_id_f6d5a4e5_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `room_management_booking` (`id`, `price`, `starting_date`, `ending_Date`, `status`, `room_number_id`, `user_id_id`, `order_id_id`) VALUES
(36,	18000,	'2022-04-01 00:00:00.000000',	'2022-04-04 00:00:00.000000',	'Completed',	16,	27,	76),
(37,	4700,	'2022-04-02 00:00:00.000000',	'2022-04-04 00:00:00.000000',	'Completed',	12,	28,	77),
(38,	6000,	'2022-04-10 00:00:00.000000',	'2022-04-15 00:00:00.000000',	'Completed',	9,	28,	78);

DROP TABLE IF EXISTS `room_management_category`;
CREATE TABLE `room_management_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `room_management_category` (`id`, `name`) VALUES
(1,	'AC'),
(4,	'Non Ac');

DROP TABLE IF EXISTS `room_management_lineitem`;
CREATE TABLE `room_management_lineitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `order_id_id` bigint NOT NULL,
  `room_numb_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_management_line_order_id_id_b27411c6_fk_room_mana` (`order_id_id`),
  KEY `room_management_line_room_numb_id_1a3ec8b3_fk_room_mana` (`room_numb_id`),
  CONSTRAINT `room_management_line_order_id_id_b27411c6_fk_room_mana` FOREIGN KEY (`order_id_id`) REFERENCES `room_management_order` (`id`),
  CONSTRAINT `room_management_line_room_numb_id_1a3ec8b3_fk_room_mana` FOREIGN KEY (`room_numb_id`) REFERENCES `room_management_rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `room_management_lineitem` (`id`, `category`, `price`, `order_id_id`, `room_numb_id`) VALUES
(69,	'Purchasing',	6000,	76,	16),
(70,	'Purchasing',	2350,	77,	12),
(71,	'Purchasing',	1200,	78,	9);

DROP TABLE IF EXISTS `room_management_order`;
CREATE TABLE `room_management_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `status` varchar(255) NOT NULL,
  `order_total` int NOT NULL,
  `user_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_management_order_user_id_id_2ebe3e3f_fk_auth_user_id` (`user_id_id`),
  CONSTRAINT `room_management_order_user_id_id_2ebe3e3f_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `room_management_order` (`id`, `order_date`, `updated_date`, `status`, `order_total`, `user_id_id`) VALUES
(76,	'2022-04-18 05:29:37.668831',	'2022-04-18 05:29:37.668839',	'Completed',	18000,	27),
(77,	'2022-04-18 05:38:04.370045',	'2022-04-18 05:38:04.370049',	'Completed',	4700,	28),
(78,	'2022-04-18 06:05:21.698180',	'2022-04-18 06:05:21.698207',	'Completed',	6000,	28);

DROP TABLE IF EXISTS `room_management_rooms`;
CREATE TABLE `room_management_rooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_number` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `occupaid` tinyint(1) NOT NULL,
  `caregory_id` bigint NOT NULL,
  `subcategory_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_management_room_caregory_id_8d23aa53_fk_room_mana` (`caregory_id`),
  KEY `room_management_room_subcategory_id_c4078919_fk_room_mana` (`subcategory_id`),
  CONSTRAINT `room_management_room_caregory_id_8d23aa53_fk_room_mana` FOREIGN KEY (`caregory_id`) REFERENCES `room_management_category` (`id`),
  CONSTRAINT `room_management_room_subcategory_id_c4078919_fk_room_mana` FOREIGN KEY (`subcategory_id`) REFERENCES `room_management_subcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `room_management_rooms` (`id`, `room_number`, `description`, `price`, `image`, `occupaid`, `caregory_id`, `subcategory_id`) VALUES
(9,	1,	'Richard McClintock, a Latin scholar from Hampden-Sydney College, is credited with discovering the source behind the ubiquitous filler text. In seeing a sample of lorem ipsum, his interest was piqued by consectetur—a genuine, albeit rare, Latin word. Consu',	1200,	'rooms/nonacsingleroom1.jpeg',	0,	4,	1),
(10,	2,	'It\'s difficult to find examples of lorem ipsum in use before Letraset made it popular as a dummy text in the 1960s, although McClintock says he remembers coming across the lorem ipsum passage in a book of old metal type samples. So far he hasn\'t relocated',	1498,	'rooms/nonacsigleroom2.jpeg',	0,	4,	1),
(11,	3,	'As an alternative theory, (and because Latin scholars do this sort of thing) someone tracked down a 1914 Latin edition of De Finibus which challenges McClintock\'s 15th century claims and suggests that the dawn of lorem ipsum was as recent as the 20th cent',	2500,	'rooms/acsingleroom1.jpeg',	0,	1,	1),
(12,	4,	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam. Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis. Donec a dui et dui fringil',	2350,	'rooms/acsingleroom2.jpeg',	0,	1,	1),
(13,	5,	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam. Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis. Donec a dui et dui fringil',	4499,	'rooms/nonacdoubleroom1.jpeg',	0,	4,	2),
(14,	6,	'What I find remarkable is that this text has been the industry\'s standard dummy text ever since some printer in the 1500s took a galley of type and scrambled it to make a type specimen book; it has survived not only four centuries of letter-by-letter rese',	4699,	'rooms/nonacdoubleroom2.jpeg',	0,	4,	2),
(15,	7,	'What I find remarkable is that this text has been the industry\'s standard dummy text ever since some printer in the 1500s took a galley of type and scrambled it to make a type specimen book; it has survived not only four centuries of letter-by-letter rese',	5700,	'rooms/acdoubleroom.jpeg',	0,	1,	2),
(16,	8,	'Richard McClintock, a Latin scholar from Hampden-Sydney College, is credited with discovering the source behind the ubiquitous filler text. In seeing a sample of lorem ipsum, his interest was piqued by consectetur—a genuine, albeit rare, Latin word. Consu',	6000,	'rooms/acdoubleroom2.jpeg',	0,	1,	2),
(17,	9,	'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has su',	1600,	'rooms/nonacsigleroom2_FX7oqAZ.jpeg',	0,	4,	1);

DROP TABLE IF EXISTS `room_management_subcategory`;
CREATE TABLE `room_management_subcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `capacit` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `room_management_subcategory` (`id`, `name`, `capacit`) VALUES
(1,	'single room',	1),
(2,	'Double Room',	2);

DROP TABLE IF EXISTS `user_userdetails`;
CREATE TABLE `user_userdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `place` varchar(30) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `uid_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_userdetails_uid_id_4f4984d8_fk_auth_user_id` (`uid_id`),
  CONSTRAINT `user_userdetails_uid_id_4f4984d8_fk_auth_user_id` FOREIGN KEY (`uid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user_userdetails` (`id`, `phone_number`, `place`, `gender`, `date_of_birth`, `uid_id`) VALUES
(1,	'1709055864',	'Ut suscipit sint ut',	'M',	NULL,	23),
(2,	'5624364517',	'Sit quia molestias l',	'M',	NULL,	24),
(3,	'8136860287',	'Palakkd',	'F',	NULL,	25),
(4,	'8123546784',	'Palakkd',	'F',	NULL,	27),
(5,	'8236789704',	'Palakkd',	'F',	NULL,	28);

-- 2022-04-18 07:19:13
