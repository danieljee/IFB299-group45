DROP TABLE IF EXISTS `app_category`;
CREATE TABLE `app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `app_category` WRITE;
INSERT INTO `app_category` VALUES (1,'college'),(2,'library'),(3,'industry'),(4,'hotel'),(5,'zoo'),(6,'museum'),(7,'restaurant'),(8,'mall'),(9,'park');
UNLOCK TABLES;

DROP TABLE IF EXISTS `app_city`;
CREATE TABLE `app_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_city_state_id_1840ad3e_fk_app_state_id` (`state_id`),
  CONSTRAINT `app_city_state_id_1840ad3e_fk_app_state_id` FOREIGN KEY (`state_id`) REFERENCES `app_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `app_city` WRITE;
INSERT INTO `app_city` VALUES (1,'Brisbane',1);
UNLOCK TABLES;

DROP TABLE IF EXISTS `app_place`;
CREATE TABLE `app_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `postcode` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `category_id_id` int(11) NOT NULL,
  `city_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_place_category_id_id_e6df9021_fk_app_category_id` (`category_id_id`),
  KEY `app_place_city_id_id_b8962c5a_fk_app_city_id` (`city_id_id`),
  CONSTRAINT `app_place_category_id_id_e6df9021_fk_app_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `app_category` (`id`),
  CONSTRAINT `app_place_city_id_id_b8962c5a_fk_app_city_id` FOREIGN KEY (`city_id_id`) REFERENCES `app_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

LOCK TABLES `app_place` WRITE;
INSERT INTO `app_place` VALUES (1,'QUT Gardens Point Campus','2 George St, Brisbane','askqut@qut.edu.au',4000,'2017-10-05 10:15:43.000000',1,1),(2,'QUT Kelvin Grove Campus','Victoria Park Rd, Kelvin Grove','askqut@qut.edu.au',4059,'2017-10-05 10:16:43.000000',1,1),(3,'Griffith University Nathan Campus','170 Kessels Rd, Nathan','ithelp@griffith.edu.au',4111,'2017-10-05 10:17:29.000000',1,1),(4,'The University of Queensland','St Lucia','askus@library.uq.edu.au',4072,'2017-10-05 10:17:56.000000',1,1),(5,'Tafe Queesnland Brisbane','66 Ernest St, South Brisbane','brisbane@tafe.qld.edu.au',4101,'2017-10-05 10:18:28.000000',1,1),(6,'Mt Ommaney Library','Mt Ommaney Shopping Centre, 171 Dandenong Rd, Mount Ommaney','mto@brisbane.qld.gov.au',4074,'2017-10-05 10:19:39.000000',2,1),(7,'Inala Library','Inala Civic Centre Inala, Corsair Ave, Brisbane','ina@brisbane.qld.gov.au',4077,'2017-10-05 10:20:18.000000',2,1),(8,'Corinda Library','641 Oxley Rd, Brisbane','cda@brisbane.qld.gov.au',4075,'2017-10-05 10:21:01.000000',2,1),(9,'Chermside Library','375 Hamilton Rd, Chermside','cde@brisbane.qld.gov.au',4032,'2017-10-05 10:21:34.000000',2,1),(10,'Carindale Library','1151 Creek Rd, Carindale','cnl@brisbane.qld.gov.au',4152,'2017-10-05 10:22:01.000000',2,1),(11,'Comtech Industries','76 Ebbern St, Brisbane','comtech@ComtechIndustriesInc.com',4076,'2017-10-05 10:22:46.000000',3,1),(12,'Nicet Industries','6/135 Wickham Terrace, Brisbane City','sales@nicetind.com',4000,'2017-10-05 10:23:20.000000',3,1),(13,'ALS','7 Brisbane Rd, Riverview','customer.support@alsglobal.com',4303,'2017-10-05 10:23:50.000000',3,1),(14,'Magic Door Industries Pty LTD','4 Devlan St, Mansfield','sales.qld@mdi.com.au',4122,'2017-10-05 10:24:30.000000',3,1),(15,'All Cool Industries','10/239 George St, Brisbane City','service@allcool.com.au',4000,'2017-10-05 10:25:00.000000',3,1),(16,'Ibis Styles Brisbane Elizabeth Street','40 Elizabeth St, Brisbane City','H8835@accor.com',4000,'2017-10-05 10:25:40.000000',4,1),(17,'Prince of Wales Hotel','1154 Sandgate Rd, Nundah','prince.of.wales.hotel@alhgroup.com.au',4012,'2017-10-05 10:26:13.000000',4,1),(18,'Hotel Grand Chancellor Brisbane','23 Leichhardt St, Brisbane City','reservations@hgcbrisbane.com.au',4000,'2017-10-05 10:26:46.000000',4,1),(19,'The Point Brisbane - Hotel','21 Lambert St, Kangaroo Point','reservations@thepointbrisbane.com.au',4169,'2017-10-05 10:27:09.000000',4,1),(20,'Treasury Casino & Hotel Brisbane','159 William St, Brisbane City','brtcswitchboard@star.com.au',4000,'2017-10-05 10:27:31.000000',4,1),(21,'Brisbane City Botanic Gardens','Alice St, Brisbane City','botanicgardens@brisbane.qld.gov.au',4000,'2017-10-05 10:28:29.000000',9,1),(22,'Roma Street Parkland','1 Parkland Blvd, Brisbane City','rsp@cityparklands.com.au',4000,'2017-10-05 10:28:51.000000',9,1),(23,'Brisbane Botanic Gardens, Mount Coot-tha','152 Mount Coot Tha Rd, Mount Coot-Tha','botanicgardens@brisbane.qld.gov.au',4066,'2017-10-05 10:29:36.000000',9,1),(24,'Queens Gardens Brisbane','144 George St, Brisbane City','queensgardens@brisbane.qld.gov.au',4000,'2017-10-05 10:32:39.000000',9,1),(25,'Epicurious Garden','Formal Gardens, Clem Jones Promenade near South Bank 3 Ferry Terminal','info@south-bank.net.au',4000,'2017-10-05 10:33:20.000000',9,1),(26,'Lone Pine Koala Sanctuary','708 Jesmond Rd, Fig Tree Pocket','service@koala.net',4069,'2017-10-05 10:34:04.000000',5,1),(27,'Australia Zoo','1638 Steve Irwin Way, Beerwah','info@australiazoo.com.au',4519,'2017-10-05 10:34:29.000000',5,1),(28,'David Fleay Wildlife Park','Loman Lane, Burleigh Heads','falys@wildlife.net',4220,'2017-10-05 10:35:25.000000',5,1),(29,'Currumbin Wildlife Sanctuary','28 Tomewin St, Currumbin','enquiries@cws.org.au',4223,'2017-10-05 10:35:48.000000',5,1),(30,'Ipswich Nature Centre','Queens Park, Goleby Ave, Ipswich','council@ipswich.qld.gov.au',4305,'2017-10-05 10:36:14.000000',5,1),(31,'QUT Art Museum','2 George St, Brisbane City','artmuseum@qut.edu.au',4000,'2017-10-05 10:36:46.000000',6,1),(32,'MacArthur Museum Brisbane','MacArthur Chambers, 201 Edward St, Brisbane City','info@mmb.org.au',4000,'2017-10-05 10:37:15.000000',6,1),(33,'Museum of Brisbane','City Hall, 64 Adelaide St, Brisbane City','info@museumofbrisbane.com.au',4000,'2017-10-05 10:37:33.000000',6,1),(34,'Queensland Museum & Science Centre','Grey St & Melbourne St, South Brisbane','media@qm.qld.gov.au',4101,'2017-10-05 10:38:11.000000',6,1),(35,'Queensland Maritime Museum','412 Stanley St, South Brisbane','info@maritimemuseum.com.au',4101,'2017-10-05 10:38:32.000000',6,1),(36,'Stokehouse Q','Sidon St, South Brisbane QLD','info@stokehouseq.com.au',4101,'2017-10-05 10:38:55.000000',7,1),(37,'Asana by Pete Evans','80 Albert St, Brisbane City','reservations.brisbane@capribyfraser.com',4000,'2017-10-05 10:39:13.000000',7,1),(38,'Ahmets Turkish Restaurant','10/168 Grey St, South Brisbane','bookings@ahmets.com',4101,'2017-10-05 10:39:42.000000',7,1),(39,'Port Office Dining Room','40 Edward St, Brisbane City','dining@portofficehotel.com.au',4000,'2017-10-05 10:40:12.000000',7,1),(40,'Malt Dining','28 Market St, Brisbane City','enquiries@maltdining.com.au',4000,'2017-10-05 10:40:40.000000',7,1),(41,'Queen Street Mall','Queen Street mall, Queen St, Brisbane City','qsm@brisbanemarketing.com.au',4000,'2017-10-05 10:41:01.000000',8,1),(42,'Brisbane Arcade','160 Queen St, Brisbane City','info@bne.mcgees.com.au',4000,'2017-10-05 10:41:19.000000',8,1),(43,'Indooroopilly Shopping Centre','322 Moggill Rd, Indooroopilly','info@indooroopillyshopping.com.au',4068,'2017-10-05 10:42:01.000000',8,1),(44,'Sunnybank Plaza','Mains Rd & McCullough St, Sunnybank','sunnybankplaza@retailfirst.com.au',4109,'2017-10-05 10:42:27.000000',8,1),(45,'Bellbowrie Shopping Plaza','37 Birkin Rd, Bellbowrie','bellbowrieshoppingplaza@iinet.net.au',4070,'2017-10-05 10:43:01.000000',8,1);
UNLOCK TABLES;

DROP TABLE IF EXISTS `app_savedplace`;
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

LOCK TABLES `app_savedplace` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `app_state`;
CREATE TABLE `app_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `app_state` WRITE;
INSERT INTO `app_state` VALUES (1,'Queensland');
UNLOCK TABLES;

DROP TABLE IF EXISTS `app_userprofile`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `app_userprofile` WRITE;
INSERT INTO `app_userprofile` VALUES (1,40637827,'73 Some Rd',4000,'BUSINESSMAN',1);
UNLOCK TABLES;

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_group` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_group_permissions` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
INSERT INTO `auth_permission` VALUES (1,'Can add user profile',1,'add_userprofile'),(2,'Can change user profile',1,'change_userprofile'),(3,'Can delete user profile',1,'delete_userprofile'),(4,'Can add state',2,'add_state'),(5,'Can change state',2,'change_state'),(6,'Can delete state',2,'delete_state'),(7,'Can add category',3,'add_category'),(8,'Can change category',3,'change_category'),(9,'Can delete category',3,'delete_category'),(10,'Can add city',4,'add_city'),(11,'Can change city',4,'change_city'),(12,'Can delete city',4,'delete_city'),(13,'Can add place',5,'add_place'),(14,'Can change place',5,'change_place'),(15,'Can delete place',5,'delete_place'),(16,'Can add saved place',6,'add_savedplace'),(17,'Can change saved place',6,'change_savedplace'),(18,'Can delete saved place',6,'delete_savedplace'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add permission',8,'add_permission'),(23,'Can change permission',8,'change_permission'),(24,'Can delete permission',8,'delete_permission'),(25,'Can add group',9,'add_group'),(26,'Can change group',9,'change_group'),(27,'Can delete group',9,'delete_group'),(28,'Can add user',10,'add_user'),(29,'Can change user',10,'change_user'),(30,'Can delete user',10,'delete_user'),(31,'Can add content type',11,'add_contenttype'),(32,'Can change content type',11,'change_contenttype'),(33,'Can delete content type',11,'delete_contenttype'),(34,'Can add session',12,'add_session'),(35,'Can change session',12,'change_session'),(36,'Can delete session',12,'delete_session');
UNLOCK TABLES;

DROP TABLE IF EXISTS `auth_user`;
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


LOCK TABLES `auth_user` WRITE;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$2DyrbkV57wH2$Udaf93nfnlqo2SQ3iTD97CxRTneWihbid1YeIoQ+z7w=','2017-10-05 02:40:43.000000',1,'admin','Dave','Chow','example@example.com',1,1,'2017-10-05 02:40:09.000000');
UNLOCK TABLES;

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user_groups` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user_user_permissions` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `django_admin_log`;
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(3,'app','category'),(4,'app','city'),(5,'app','place'),(6,'app','savedplace'),(2,'app','state'),(1,'app','userprofile'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(11,'contenttypes','contenttype'),(12,'sessions','session');
UNLOCK TABLES;

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

LOCK TABLES `django_migrations` WRITE;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-25 08:18:02.751801'),(2,'auth','0001_initial','2017-09-25 08:18:04.345737'),(3,'admin','0001_initial','2017-09-25 08:18:04.743046'),(4,'admin','0002_logentry_remove_auto_add','2017-09-25 08:18:04.774296'),(5,'app','0001_initial','2017-09-25 08:18:05.955402'),(6,'contenttypes','0002_remove_content_type_name','2017-09-25 08:18:06.264037'),(7,'auth','0002_alter_permission_name_max_length','2017-09-25 08:18:06.482761'),(8,'auth','0003_alter_user_email_max_length','2017-09-25 08:18:06.670269'),(9,'auth','0004_alter_user_username_opts','2017-09-25 08:18:06.732764'),(10,'auth','0005_alter_user_last_login_null','2017-09-25 08:18:07.018741'),(11,'auth','0006_require_contenttypes_0002','2017-09-25 08:18:07.018741'),(12,'auth','0007_alter_validators_add_error_messages','2017-09-25 08:18:07.065612'),(13,'auth','0008_alter_user_username_max_length','2017-09-25 08:18:07.237488'),(14,'sessions','0001_initial','2017-09-25 08:18:07.409391'),(15,'app','0002_auto_20171005_1242','2017-10-05 02:42:56.989662');
UNLOCK TABLES;

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
