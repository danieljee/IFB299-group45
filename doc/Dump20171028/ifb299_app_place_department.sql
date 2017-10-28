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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_place_department`
--

LOCK TABLES `app_place_department` WRITE;
/*!40000 ALTER TABLE `app_place_department` DISABLE KEYS */;
INSERT INTO `app_place_department` VALUES (1,2,2),(2,2,3),(3,2,4),(4,2,5),(5,2,6),(6,2,7),(7,3,2),(8,3,3),(9,3,4),(10,3,5),(11,3,6),(12,3,7),(13,4,2),(14,4,3),(15,4,4),(16,4,5),(17,4,6),(18,4,7),(19,5,2),(20,5,3),(21,5,4),(22,5,5),(23,5,6),(24,5,7),(25,6,2),(26,6,3),(27,6,5),(28,6,7),(29,6,8);
/*!40000 ALTER TABLE `app_place_department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-28 18:26:44
