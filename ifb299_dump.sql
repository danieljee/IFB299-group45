-- MySQL dump 10.13  Distrib 5.7.17, for Win32 (AMD64)
--
-- Host: localhost    Database: ifb299
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_category`
--

DROP TABLE IF EXISTS `app_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_category`
--

LOCK TABLES `app_category` WRITE;
/*!40000 ALTER TABLE `app_category` DISABLE KEYS */;
INSERT INTO `app_category` VALUES (1,'College');
/*!40000 ALTER TABLE `app_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_city`
--

DROP TABLE IF EXISTS `app_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_city_d5582625` (`state_id`),
  CONSTRAINT `app_city_state_id_1840ad3e_fk_app_state_id` FOREIGN KEY (`state_id`) REFERENCES `app_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_city`
--

LOCK TABLES `app_city` WRITE;
/*!40000 ALTER TABLE `app_city` DISABLE KEYS */;
INSERT INTO `app_city` VALUES (1,'Brisbane',1);
/*!40000 ALTER TABLE `app_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_department`
--

DROP TABLE IF EXISTS `app_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_department`
--

LOCK TABLES `app_department` WRITE;
/*!40000 ALTER TABLE `app_department` DISABLE KEYS */;
INSERT INTO `app_department` VALUES (1,'department1'),(2,'department2');
/*!40000 ALTER TABLE `app_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_industry`
--

DROP TABLE IF EXISTS `app_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_industry`
--

LOCK TABLES `app_industry` WRITE;
/*!40000 ALTER TABLE `app_industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_place`
--

DROP TABLE IF EXISTS `app_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `postcode` int(11) NOT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `category_id_id` int(11) NOT NULL,
  `city_id_id` int(11) NOT NULL,
  `industry_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_place_category_id_id_e6df9021_fk_app_category_id` (`category_id_id`),
  KEY `app_place_city_id_id_b8962c5a_fk_app_city_id` (`city_id_id`),
  KEY `app_place_industry_id_cc40a4af_fk_app_industry_id` (`industry_id`),
  CONSTRAINT `app_place_category_id_id_e6df9021_fk_app_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `app_category` (`id`),
  CONSTRAINT `app_place_city_id_id_b8962c5a_fk_app_city_id` FOREIGN KEY (`city_id_id`) REFERENCES `app_city` (`id`),
  CONSTRAINT `app_place_industry_id_cc40a4af_fk_app_industry_id` FOREIGN KEY (`industry_id`) REFERENCES `app_industry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_place`
--

LOCK TABLES `app_place` WRITE;
/*!40000 ALTER TABLE `app_place` DISABLE KEYS */;
INSERT INTO `app_place` VALUES (1,'awef','awonefaowenfoin','aawef@awefoin.com',123,NULL,'2017-10-02 11:13:14.000000',1,1,NULL);
/*!40000 ALTER TABLE `app_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_place_department`
--

DROP TABLE IF EXISTS `app_place_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_place_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_place_department_place_id_e0240d3a_uniq` (`place_id`,`department_id`),
  KEY `app_place_department_department_id_53950fe8_fk_app_department_id` (`department_id`),
  CONSTRAINT `app_place_department_department_id_53950fe8_fk_app_department_id` FOREIGN KEY (`department_id`) REFERENCES `app_department` (`id`),
  CONSTRAINT `app_place_department_place_id_d6b408db_fk_app_place_id` FOREIGN KEY (`place_id`) REFERENCES `app_place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_place_department`
--

LOCK TABLES `app_place_department` WRITE;
/*!40000 ALTER TABLE `app_place_department` DISABLE KEYS */;
INSERT INTO `app_place_department` VALUES (1,1,2);
/*!40000 ALTER TABLE `app_place_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_savedplace`
--

DROP TABLE IF EXISTS `app_savedplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_savedplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_savedplace_place_id_b38b3896_fk_app_place_id` (`place_id`),
  KEY `app_savedplace_user_id_4d6656df_fk_auth_user_id` (`user_id`),
  CONSTRAINT `app_savedplace_place_id_b38b3896_fk_app_place_id` FOREIGN KEY (`place_id`) REFERENCES `app_place` (`id`),
  CONSTRAINT `app_savedplace_user_id_4d6656df_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_savedplace`
--

LOCK TABLES `app_savedplace` WRITE;
/*!40000 ALTER TABLE `app_savedplace` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_savedplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_state`
--

DROP TABLE IF EXISTS `app_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_state`
--

LOCK TABLES `app_state` WRITE;
/*!40000 ALTER TABLE `app_state` DISABLE KEYS */;
INSERT INTO `app_state` VALUES (1,'QLD');
/*!40000 ALTER TABLE `app_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_userprofile`
--

DROP TABLE IF EXISTS `app_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `app_userprofile_user_id_370bd89d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_userprofile`
--

LOCK TABLES `app_userprofile` WRITE;
/*!40000 ALTER TABLE `app_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add state',1,'add_state'),(2,'Can change state',1,'change_state'),(3,'Can delete state',1,'delete_state'),(4,'Can add user profile',2,'add_userprofile'),(5,'Can change user profile',2,'change_userprofile'),(6,'Can delete user profile',2,'delete_userprofile'),(7,'Can add place',3,'add_place'),(8,'Can change place',3,'change_place'),(9,'Can delete place',3,'delete_place'),(10,'Can add department',4,'add_department'),(11,'Can change department',4,'change_department'),(12,'Can delete department',4,'delete_department'),(13,'Can add industry',5,'add_industry'),(14,'Can change industry',5,'change_industry'),(15,'Can delete industry',5,'delete_industry'),(16,'Can add city',6,'add_city'),(17,'Can change city',6,'change_city'),(18,'Can delete city',6,'delete_city'),(19,'Can add saved place',7,'add_savedplace'),(20,'Can change saved place',7,'change_savedplace'),(21,'Can delete saved place',7,'delete_savedplace'),(22,'Can add category',8,'add_category'),(23,'Can change category',8,'change_category'),(24,'Can delete category',8,'delete_category'),(25,'Can add log entry',9,'add_logentry'),(26,'Can change log entry',9,'change_logentry'),(27,'Can delete log entry',9,'delete_logentry'),(28,'Can add user',10,'add_user'),(29,'Can change user',10,'change_user'),(30,'Can delete user',10,'delete_user'),(31,'Can add group',11,'add_group'),(32,'Can change group',11,'change_group'),(33,'Can delete group',11,'delete_group'),(34,'Can add permission',12,'add_permission'),(35,'Can change permission',12,'change_permission'),(36,'Can delete permission',12,'delete_permission'),(37,'Can add content type',13,'add_contenttype'),(38,'Can change content type',13,'change_contenttype'),(39,'Can delete content type',13,'delete_contenttype'),(40,'Can add session',14,'add_session'),(41,'Can change session',14,'change_session'),(42,'Can delete session',14,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$kgVOFrb2Ro6a$V+jwGbRGEAI8R+8Xdgd75qJ37wSCk2tsyLq5n8y5PZ0=','2017-10-02 11:03:34.304283',1,'admin','','','a@b.com',1,1,'2017-10-02 11:03:20.286071');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-10-02 11:03:47.853298','1','department1',1,'[{\"added\": {}}]',4,1),(2,'2017-10-02 11:03:52.635620','2','department2',1,'[{\"added\": {}}]',4,1),(3,'2017-10-02 11:04:06.455408','1','QLD',1,'[{\"added\": {}}]',1,1),(4,'2017-10-02 11:04:08.496970','1','Brisbane',1,'[{\"added\": {}}]',6,1),(5,'2017-10-02 11:13:08.331630','1','College',1,'[{\"added\": {}}]',8,1),(6,'2017-10-02 11:13:15.956626','1','awef',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'admin','logentry'),(8,'app','category'),(6,'app','city'),(4,'app','department'),(5,'app','industry'),(3,'app','place'),(7,'app','savedplace'),(1,'app','state'),(2,'app','userprofile'),(11,'auth','group'),(12,'auth','permission'),(10,'auth','user'),(13,'contenttypes','contenttype'),(14,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-10-02 11:02:14.987617'),(2,'auth','0001_initial','2017-10-02 11:02:24.342977'),(3,'admin','0001_initial','2017-10-02 11:02:26.480871'),(4,'admin','0002_logentry_remove_auto_add','2017-10-02 11:02:26.574607'),(5,'app','0001_initial','2017-10-02 11:02:39.216098'),(6,'contenttypes','0002_remove_content_type_name','2017-10-02 11:02:41.344014'),(7,'auth','0002_alter_permission_name_max_length','2017-10-02 11:02:42.359166'),(8,'auth','0003_alter_user_email_max_length','2017-10-02 11:02:43.296714'),(9,'auth','0004_alter_user_username_opts','2017-10-02 11:02:43.437347'),(10,'auth','0005_alter_user_last_login_null','2017-10-02 11:02:44.219675'),(11,'auth','0006_require_contenttypes_0002','2017-10-02 11:02:44.297878'),(12,'auth','0007_alter_validators_add_error_messages','2017-10-02 11:02:44.422834'),(13,'auth','0008_alter_user_username_max_length','2017-10-02 11:02:45.540616'),(14,'sessions','0001_initial','2017-10-02 11:02:46.250012');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5eohnc6kr0brbsm1oljdqe2rj7y7gmaf','MTBmNzI1YWNmY2E2YTgyMThkZjE3NzliMDllNGU3NzM1MDViZDZhZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTRhZWVmZGFjZjYyNTdkOGRlMDc5MzY0N2Y2NjI2OTkyMzZmOTA1In0=','2017-10-16 11:03:34.372393');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-04 10:49:24
