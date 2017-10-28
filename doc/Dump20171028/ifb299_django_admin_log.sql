-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ifb299
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-10-21 09:51:52.125441','1','queensland',1,'[{\"added\": {}}]',3,1),(2,'2017-10-21 09:51:54.875654','1','brisbane',1,'[{\"added\": {}}]',1,1),(3,'2017-10-21 09:52:03.017443','1','library',1,'[{\"added\": {}}]',6,1),(4,'2017-10-21 09:52:09.298984','1','Mt Ommaney Library',1,'[{\"added\": {}}]',8,1),(5,'2017-10-22 03:46:02.112812','2','adminSusan',1,'[{\"added\": {}}]',11,1),(6,'2017-10-22 12:39:48.630960','1','business',1,'[{\"added\": {}}]',5,1),(7,'2017-10-22 12:40:11.810653','1','business 1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',5,1),(8,'2017-10-22 12:42:17.076464','1','merp',1,'[{\"added\": {}}]',2,1),(9,'2017-10-22 12:42:27.132769','1','merp1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',2,1),(10,'2017-10-22 12:44:26.781271','1','queensland',2,'[]',3,1),(11,'2017-10-22 12:44:36.894048','1','queensland',2,'[]',3,1),(12,'2017-10-22 12:44:47.931924','2','new south wales',1,'[{\"added\": {}}]',3,1),(13,'2017-10-23 13:22:53.941544','2','restaurant',1,'[{\"added\": {}}]',6,1),(14,'2017-10-23 13:22:57.812002','3','zoo',1,'[{\"added\": {}}]',6,1),(15,'2017-10-23 13:23:04.192600','4','industry',1,'[{\"added\": {}}]',6,1),(16,'2017-10-23 13:23:10.036385','5','college',1,'[{\"added\": {}}]',6,1),(17,'2017-10-23 13:23:22.782824','6','park',1,'[{\"added\": {}}]',6,1),(18,'2017-10-23 13:23:27.004084','7','museum',1,'[{\"added\": {}}]',6,1),(19,'2017-10-23 13:23:31.966853','8','hotel',1,'[{\"added\": {}}]',6,1),(20,'2017-10-23 13:24:36.737318','9','mall',1,'[{\"added\": {}}]',6,1),(21,'2017-10-23 13:29:23.403236','2','business',1,'[{\"added\": {}}]',5,1),(22,'2017-10-23 13:29:36.956384','3','creative industries',1,'[{\"added\": {}}]',5,1),(23,'2017-10-23 13:29:43.437877','4','education',1,'[{\"added\": {}}]',5,1),(24,'2017-10-23 13:29:48.528079','5','health',1,'[{\"added\": {}}]',5,1),(25,'2017-10-23 13:29:52.286373','6','law',1,'[{\"added\": {}}]',5,1),(26,'2017-10-23 13:30:02.566739','7','science and engineering',1,'[{\"added\": {}}]',5,1),(27,'2017-10-23 13:30:08.801529','8','hospitality',1,'[{\"added\": {}}]',5,1),(28,'2017-10-23 13:30:38.142333','2','automotive',1,'[{\"added\": {}}]',2,1),(29,'2017-10-23 13:31:01.051281','3','plastic injection moulding',1,'[{\"added\": {}}]',2,1),(30,'2017-10-23 13:31:08.323802','4','industrial services',1,'[{\"added\": {}}]',2,1),(31,'2017-10-23 13:31:13.854761','5','electric doors',1,'[{\"added\": {}}]',2,1),(32,'2017-10-23 13:31:20.631431','6','air conditioning',1,'[{\"added\": {}}]',2,1),(33,'2017-10-23 13:33:13.351098','2','QUT Gardens Point Campus',1,'[{\"added\": {}}]',8,1),(34,'2017-10-23 13:33:59.802495','3','QUT Kelvin Grove Campus',1,'[{\"added\": {}}]',8,1),(35,'2017-10-23 13:34:46.566792','4','Griffith University Nathan Campus',1,'[{\"added\": {}}]',8,1),(36,'2017-10-23 13:35:47.805521','5','The University of Queensland',1,'[{\"added\": {}}]',8,1),(37,'2017-10-23 13:36:41.102788','6','Tafe Queensland Brisbane',1,'[{\"added\": {}}]',8,1),(38,'2017-10-23 13:37:18.212895','1','business 1',3,'',5,1),(39,'2017-10-23 13:51:09.293443','7','Inala Library',1,'[{\"added\": {}}]',8,1),(40,'2017-10-23 13:52:09.755679','8','Corinda Library',1,'[{\"added\": {}}]',8,1),(41,'2017-10-23 13:52:51.557012','9','Chermside Library',1,'[{\"added\": {}}]',8,1),(42,'2017-10-23 13:53:35.760809','10','Carindale Library',1,'[{\"added\": {}}]',8,1),(43,'2017-10-23 13:54:04.356605','8','Corinda Library',2,'[{\"changed\": {\"fields\": [\"postcode\", \"phone_number\"]}}]',8,1),(44,'2017-10-23 13:54:55.800850','11','Comtech Industries',1,'[{\"added\": {}}]',8,1),(45,'2017-10-23 13:55:56.789735','12','Nicet Industries',1,'[{\"added\": {}}]',8,1),(46,'2017-10-23 13:56:37.788062','13','ALS',1,'[{\"added\": {}}]',8,1),(47,'2017-10-23 13:57:06.951590','14','Magic Door Industries Pty LTD',1,'[{\"added\": {}}]',8,1),(48,'2017-10-23 13:57:39.417389','15','All Cool Industries',1,'[{\"added\": {}}]',8,1),(49,'2017-10-23 13:58:20.697516','16','Ibis Styles Brisbane Elizabeth Street',1,'[{\"added\": {}}]',8,1),(50,'2017-10-23 13:59:03.511882','17','Prince of Wales Hotel',1,'[{\"added\": {}}]',8,1),(51,'2017-10-23 13:59:46.636934','18','Hotel Grand Chancellor Brisbane',1,'[{\"added\": {}}]',8,1),(52,'2017-10-23 14:00:35.605940','19','The Point Brisbane',1,'[{\"added\": {}}]',8,1),(53,'2017-10-23 14:01:09.751441','20','Treasury Casino & Hotel Brisbane',1,'[{\"added\": {}}]',8,1),(54,'2017-10-23 14:01:47.507464','21','Brisbane City Botanic Gardens',1,'[{\"added\": {}}]',8,1),(55,'2017-10-23 14:02:29.921399','22','Roma Street Parkland',1,'[{\"added\": {}}]',8,1),(56,'2017-10-23 14:03:35.338065','23','Brisbane Botanic Gardens, Mount Coot-tha',1,'[{\"added\": {}}]',8,1),(57,'2017-10-23 14:04:19.129976','24','Queens Gardens Brisbane',1,'[{\"added\": {}}]',8,1),(58,'2017-10-23 14:05:31.815267','25','Epicurious Garden',1,'[{\"added\": {}}]',8,1),(59,'2017-10-23 14:06:22.406838','26','Lone Pine Koala Sanctuary',1,'[{\"added\": {}}]',8,1),(60,'2017-10-23 14:07:00.427531','27','Australia Zoo',1,'[{\"added\": {}}]',8,1),(61,'2017-10-23 14:07:38.722321','28','David Fleay Wildlife Park',1,'[{\"added\": {}}]',8,1),(62,'2017-10-23 14:08:11.585551','29','Currumbin Wildlife Sanctuary',1,'[{\"added\": {}}]',8,1),(63,'2017-10-23 14:08:51.210601','30','Ipswich Nature Centre',1,'[{\"added\": {}}]',8,1),(64,'2017-10-23 14:09:28.878431','31','QUT Art Museum',1,'[{\"added\": {}}]',8,1),(65,'2017-10-23 14:10:12.811546','32','MacArthur Museum Brisbane',1,'[{\"added\": {}}]',8,1),(66,'2017-10-23 14:10:53.951426','33','Museum of Brisbane',1,'[{\"added\": {}}]',8,1),(67,'2017-10-23 14:11:34.112977','34','Queensland Museum & Science Centre',1,'[{\"added\": {}}]',8,1),(68,'2017-10-23 14:12:11.610831','35','Queensland Maritime Museum',1,'[{\"added\": {}}]',8,1),(69,'2017-10-23 14:12:55.981046','36','Stokehouse Q',1,'[{\"added\": {}}]',8,1),(70,'2017-10-23 14:13:39.222490','37','Asana by Pete Evans',1,'[{\"added\": {}}]',8,1),(71,'2017-10-23 14:14:13.387534','38','Ahmets Turkish Restaurant',1,'[{\"added\": {}}]',8,1),(72,'2017-10-23 14:14:46.238916','39','Port Office Dining Room',1,'[{\"added\": {}}]',8,1),(73,'2017-10-23 14:15:20.730514','40','Malt Dining',1,'[{\"added\": {}}]',8,1),(74,'2017-10-23 14:16:05.267011','41','Queen Street Mall',1,'[{\"added\": {}}]',8,1),(75,'2017-10-23 14:16:44.968518','42','Brisbane Arcade',1,'[{\"added\": {}}]',8,1),(76,'2017-10-23 14:17:22.412216','43','Indooroopilly Shopping Centre',1,'[{\"added\": {}}]',8,1),(77,'2017-10-23 14:18:03.093223','44','Sunnybank Plaza',1,'[{\"added\": {}}]',8,1),(78,'2017-10-23 14:18:46.963435','45','Bellbowrie Shopping Plaza',1,'[{\"added\": {}}]',8,1),(79,'2017-10-23 14:19:10.058795','44','Sunnybank Plaza',2,'[{\"changed\": {\"fields\": [\"category_id\"]}}]',8,1),(80,'2017-10-23 14:21:57.655867','43','Indooroopilly Shopping Centre',2,'[{\"changed\": {\"fields\": [\"category_id\"]}}]',8,1),(81,'2017-10-24 05:43:11.171975','2','adminSusan',2,'[{\"changed\": {\"fields\": [\"is_superuser\"]}}]',11,1),(82,'2017-10-24 05:43:27.953687','2','adminSusan',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-28 18:26:38
