/*
 Navicat MySQL Data Transfer

 Source Server         : connection
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : gongzi

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 29/06/2024 14:16:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add book', 7, 'add_book');
INSERT INTO `auth_permission` VALUES (26, 'Can change book', 7, 'change_book');
INSERT INTO `auth_permission` VALUES (27, 'Can delete book', 7, 'delete_book');
INSERT INTO `auth_permission` VALUES (28, 'Can view book', 7, 'view_book');
INSERT INTO `auth_permission` VALUES (29, 'Can add image', 8, 'add_image');
INSERT INTO `auth_permission` VALUES (30, 'Can change image', 8, 'change_image');
INSERT INTO `auth_permission` VALUES (31, 'Can delete image', 8, 'delete_image');
INSERT INTO `auth_permission` VALUES (32, 'Can view image', 8, 'view_image');
INSERT INTO `auth_permission` VALUES (33, 'Can add department', 9, 'add_department');
INSERT INTO `auth_permission` VALUES (34, 'Can change department', 9, 'change_department');
INSERT INTO `auth_permission` VALUES (35, 'Can delete department', 9, 'delete_department');
INSERT INTO `auth_permission` VALUES (36, 'Can view department', 9, 'view_department');
INSERT INTO `auth_permission` VALUES (37, 'Can add position', 10, 'add_position');
INSERT INTO `auth_permission` VALUES (38, 'Can change position', 10, 'change_position');
INSERT INTO `auth_permission` VALUES (39, 'Can delete position', 10, 'delete_position');
INSERT INTO `auth_permission` VALUES (40, 'Can view position', 10, 'view_position');
INSERT INTO `auth_permission` VALUES (41, 'Can add residence', 11, 'add_residence');
INSERT INTO `auth_permission` VALUES (42, 'Can change residence', 11, 'change_residence');
INSERT INTO `auth_permission` VALUES (43, 'Can delete residence', 11, 'delete_residence');
INSERT INTO `auth_permission` VALUES (44, 'Can view residence', 11, 'view_residence');
INSERT INTO `auth_permission` VALUES (45, 'Can add attendance status', 12, 'add_attendancestatus');
INSERT INTO `auth_permission` VALUES (46, 'Can change attendance status', 12, 'change_attendancestatus');
INSERT INTO `auth_permission` VALUES (47, 'Can delete attendance status', 12, 'delete_attendancestatus');
INSERT INTO `auth_permission` VALUES (48, 'Can view attendance status', 12, 'view_attendancestatus');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$QxJ5jz6N1VSx$8bJJ3ROfVWhMPPSQMbrvbIxjk0RFjpkzEpFvzDV2fSI=', '2024-06-28 22:26:38.988861', 0, 'szn461', '', '', '316562438@qq.com', 1, 1, '2024-06-27 20:05:05.477064');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (12, 'management', 'attendancestatus');
INSERT INTO `django_content_type` VALUES (7, 'management', 'book');
INSERT INTO `django_content_type` VALUES (9, 'management', 'department');
INSERT INTO `django_content_type` VALUES (8, 'management', 'image');
INSERT INTO `django_content_type` VALUES (10, 'management', 'position');
INSERT INTO `django_content_type` VALUES (11, 'management', 'residence');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-06-27 19:40:56.977523');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2024-06-27 19:40:57.042332');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-06-27 19:40:57.244095');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-06-27 19:40:57.284922');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-27 19:40:57.288842');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-06-27 19:40:57.323667');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-06-27 19:40:57.342029');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-06-27 19:40:57.363023');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-06-27 19:40:57.368610');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-06-27 19:40:57.384078');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-06-27 19:40:57.385773');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-27 19:40:57.390572');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-06-27 19:40:57.416168');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-27 19:40:57.446789');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-06-27 19:40:57.472134');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-06-27 19:40:57.479135');
INSERT INTO `django_migrations` VALUES (17, 'management', '0001_initial', '2024-06-27 19:40:57.503477');
INSERT INTO `django_migrations` VALUES (18, 'management', '0002_auto_20240626_2240', '2024-06-27 19:40:57.574532');
INSERT INTO `django_migrations` VALUES (19, 'management', '0003_auto_20240628_0340', '2024-06-27 19:40:57.677167');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2024-06-27 19:40:57.739745');
INSERT INTO `django_migrations` VALUES (21, 'management', '0004_remove_residence_district', '2024-06-27 19:47:24.572409');
INSERT INTO `django_migrations` VALUES (22, 'management', '0005_book_status', '2024-06-27 20:20:05.754147');
INSERT INTO `django_migrations` VALUES (23, 'management', '0006_position_salary', '2024-06-28 20:34:12.871255');
INSERT INTO `django_migrations` VALUES (24, 'management', '0007_remove_book_price', '2024-06-28 20:42:56.459886');
INSERT INTO `django_migrations` VALUES (25, 'management', '0008_auto_20240629_0514', '2024-06-28 21:14:42.313877');
INSERT INTO `django_migrations` VALUES (26, 'management', '0009_auto_20240629_0559', '2024-06-28 21:59:20.449247');
INSERT INTO `django_migrations` VALUES (27, 'management', '0010_auto_20240629_0612', '2024-06-28 22:12:20.062060');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('wi0jmf5fxtozqt7o39zoubzcaus26xup', 'ODNiZWY0MWQ4ODNhOWMyM2U0YzRhYmI3ZGViMGY4MzA5OTUyM2QxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZWFiN2U1YjVkZDI3NTQzZTEyMjk2MDc0ODZmYTkyOGMzNzhlMTczIn0=', '2024-07-12 22:26:38.994367');

-- ----------------------------
-- Table structure for management_attendancestatus
-- ----------------------------
DROP TABLE IF EXISTS `management_attendancestatus`;
CREATE TABLE `management_attendancestatus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `management_attendanc_employee_id_21606c5b_fk_managemen`(`employee_id`) USING BTREE,
  CONSTRAINT `management_attendanc_employee_id_21606c5b_fk_managemen` FOREIGN KEY (`employee_id`) REFERENCES `management_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_attendancestatus
-- ----------------------------
INSERT INTO `management_attendancestatus` VALUES (1, 'ON_DUTY', '2024-01-13', 1);
INSERT INTO `management_attendancestatus` VALUES (2, 'ON_LEAVE', '2024-03-01', 2);
INSERT INTO `management_attendancestatus` VALUES (3, 'ON_BUSINESS', '2024-04-04', 4);
INSERT INTO `management_attendancestatus` VALUES (4, 'ABSENT', '2024-06-01', 3);
INSERT INTO `management_attendancestatus` VALUES (5, 'ON_LEAVE', '2024-06-05', 11);

-- ----------------------------
-- Table structure for management_book
-- ----------------------------
DROP TABLE IF EXISTS `management_book`;
CREATE TABLE `management_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `publish_date` date NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `management_book_category_id_90e16235`(`category_id`) USING BTREE,
  INDEX `management_book_author_id_58bb326c`(`author_id`) USING BTREE,
  CONSTRAINT `management_book_author_id_58bb326c_fk_management_position_id` FOREIGN KEY (`author_id`) REFERENCES `management_position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `management_book_category_id_90e16235_fk_management_department_id` FOREIGN KEY (`category_id`) REFERENCES `management_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_book
-- ----------------------------
INSERT INTO `management_book` VALUES (1, '林俊杰', 5, '2024-06-20', 3, '2024-06-27 20:20:25.972051', 'CP', 1);
INSERT INTO `management_book` VALUES (2, '麻花疼', 3, '2024-06-13', 2, '2024-06-27 20:39:04.591421', 'CY', 2);
INSERT INTO `management_book` VALUES (3, '小刚', 7, '2024-06-07', 4, '2024-06-28 20:39:09.461358', 'LX', 3);
INSERT INTO `management_book` VALUES (4, '沸羊羊', 9, '2024-06-04', 5, '2024-06-28 20:52:02.376318', 'CY', 4);
INSERT INTO `management_book` VALUES (11, '小红', 9, '2023-06-23', 5, '2024-06-28 22:27:27.110214', 'LX', 6);

-- ----------------------------
-- Table structure for management_department
-- ----------------------------
DROP TABLE IF EXISTS `management_department`;
CREATE TABLE `management_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_department
-- ----------------------------
INSERT INTO `management_department` VALUES (1, '管理部');
INSERT INTO `management_department` VALUES (2, '人事部');
INSERT INTO `management_department` VALUES (3, '财务部');
INSERT INTO `management_department` VALUES (4, '安保部');
INSERT INTO `management_department` VALUES (5, '后勤部');
INSERT INTO `management_department` VALUES (6, '其他');

-- ----------------------------
-- Table structure for management_image
-- ----------------------------
DROP TABLE IF EXISTS `management_image`;
CREATE TABLE `management_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `management_image_book_id_c2c4da78_fk_management_book_id`(`book_id`) USING BTREE,
  CONSTRAINT `management_image_book_id_c2c4da78_fk_management_book_id` FOREIGN KEY (`book_id`) REFERENCES `management_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_image
-- ----------------------------
INSERT INTO `management_image` VALUES (1, '林俊杰', '全勤', 'image/2024/06/28/1.jpeg', 1);

-- ----------------------------
-- Table structure for management_position
-- ----------------------------
DROP TABLE IF EXISTS `management_position`;
CREATE TABLE `management_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `salary` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `management_position_department_id_996d8c07_fk_managemen`(`department_id`) USING BTREE,
  CONSTRAINT `management_position_department_id_996d8c07_fk_managemen` FOREIGN KEY (`department_id`) REFERENCES `management_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_position
-- ----------------------------
INSERT INTO `management_position` VALUES (1, '董事长', 1, 20000);
INSERT INTO `management_position` VALUES (2, '总经理', 1, 18000);
INSERT INTO `management_position` VALUES (3, '人事部部长', 2, 15000);
INSERT INTO `management_position` VALUES (4, '人事部职员', 2, 8000);
INSERT INTO `management_position` VALUES (5, '财务部部长', 3, 16000);
INSERT INTO `management_position` VALUES (6, '会计', 3, 8500);
INSERT INTO `management_position` VALUES (7, '保安队长', 4, 6000);
INSERT INTO `management_position` VALUES (8, '保安', 4, 5000);
INSERT INTO `management_position` VALUES (9, '保洁员', 5, 4500);
INSERT INTO `management_position` VALUES (10, '采购员', 5, 5000);
INSERT INTO `management_position` VALUES (11, '实习生', 6, 3000);

-- ----------------------------
-- Table structure for management_residence
-- ----------------------------
DROP TABLE IF EXISTS `management_residence`;
CREATE TABLE `management_residence`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_residence
-- ----------------------------
INSERT INTO `management_residence` VALUES (1, '北京市', '东城区');
INSERT INTO `management_residence` VALUES (2, '北京市', '西城区');
INSERT INTO `management_residence` VALUES (3, '天津市', '和平区');
INSERT INTO `management_residence` VALUES (4, '天津市', '南开区');
INSERT INTO `management_residence` VALUES (5, '陕西省', '西安市');
INSERT INTO `management_residence` VALUES (6, '陕西省', '延安市');
INSERT INTO `management_residence` VALUES (7, '陕西省', '咸阳市');
INSERT INTO `management_residence` VALUES (8, '浙江省', '杭州市');
INSERT INTO `management_residence` VALUES (9, '浙江省', '嘉兴市');

SET FOREIGN_KEY_CHECKS = 1;
