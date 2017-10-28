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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_place`
--

LOCK TABLES `app_place` WRITE;
/*!40000 ALTER TABLE `app_place` DISABLE KEYS */;
INSERT INTO `app_place` VALUES (1,'Mt Ommaney Library','Mt Ommaney Shopping Centre (171 Dandenong Rd, Mount Ommaney)','mto@brisbane.qld.gov.au',4074,34077010,'2017-10-21 09:52:07.000000',1,1,NULL),(2,'QUT Gardens Point Campus','2 George St, Brisbane City','askqut@qut.edu.au',4000,NULL,'2017-10-23 13:33:11.000000',5,1,NULL),(3,'QUT Kelvin Grove Campus','Victoria Park Rd, Kelvin Grove','askqut@qut.edu.au',4059,NULL,'2017-10-23 13:33:58.000000',5,1,NULL),(4,'Griffith University Nathan Campus','170 Kessels Rd, Nathan','ithelp@griffith.edu.au',4111,NULL,'2017-10-23 13:34:44.000000',5,1,NULL),(5,'The University of Queensland','St Lucia','askus@library.uq.edu.au',4072,NULL,'2017-10-23 13:35:45.000000',5,1,NULL),(6,'Tafe Queensland Brisbane','66 Ernest St, South Brisbane','brisbane@tafe.qld.edu.au',4101,NULL,'2017-10-23 13:36:39.000000',5,1,NULL),(7,'Inala Library','Inala Civic Centre Inala, Corsair Ave','ina@brisbane.qld.gov.au',4077,34032205,'2017-10-23 13:51:07.000000',1,1,NULL),(8,'Corinda Library','641 Oxley Rd','cda@brisbane.qld.gov.au',4075,34077701,'2017-10-23 13:52:08.000000',1,1,NULL),(9,'Chermside Library','375 Hamilton Rd, Chermside','cde@brisbane.qld.gov.au',4032,34037200,'2017-10-23 13:52:49.000000',1,1,NULL),(10,'Carindale Library','1151 Creek Rd, Carindale','cnl@brisbane.qld.gov.au',4152,34071490,'2017-10-23 13:53:34.000000',1,1,NULL),(11,'Comtech Industries','76 Ebbern St','comtech@ComtechIndustriesInc.com',4076,NULL,'2017-10-23 13:54:54.000000',4,1,2),(12,'Nicet Industries','6/135 Wickham Terrace','sales@nicetind.com',4000,NULL,'2017-10-23 13:55:55.000000',4,1,3),(13,'ALS','7 Brisbane Rd, Riverview','customer.support@alsglobal.com',4303,NULL,'2017-10-23 13:56:36.000000',4,1,4),(14,'Magic Door Industries Pty LTD','4 Devlan St, Mansfield','sales.qld@mdi.com.au',4122,NULL,'2017-10-23 13:57:05.000000',4,1,5),(15,'All Cool Industries','10/239 George St, Brisbane City','service@allcool.com.au',4000,NULL,'2017-10-23 13:57:37.000000',4,1,6),(16,'Ibis Styles Brisbane Elizabeth Street','40 Elizabeth St, Brisbane City','H8835@accor.com',4000,33379000,'2017-10-23 13:58:19.000000',8,1,NULL),(17,'Prince of Wales Hotel','1154 Sandgate Rd, Nundah','prince.of.wales.hotel@alhgroup.com.au',4012,32668077,'2017-10-23 13:59:01.000000',8,1,NULL),(18,'Hotel Grand Chancellor Brisbane','23 Leichhardt St, Brisbane City','reservations@hgcbrisbane.com.au',4000,38314055,'2017-10-23 13:59:45.000000',8,1,NULL),(19,'The Point Brisbane','21 Lambert St, Kangaroo Point','reservations@thepointbrisbane.com.au',4169,32400888,'2017-10-23 14:00:33.000000',8,1,NULL),(20,'Treasury Casino & Hotel Brisbane','159 William St, Brisbane City','brtcswitchboard@star.com.au',4000,33068888,'2017-10-23 14:01:08.000000',8,1,NULL),(21,'Brisbane City Botanic Gardens','Alice St, Brisbane City','botanicgardens@brisbane.qld.gov.au',4000,34038888,'2017-10-23 14:01:46.000000',6,1,NULL),(22,'Roma Street Parkland','1 Parkland Blvd, Brisbane City','rsp@cityparklands.com.au',4000,1300137468,'2017-10-23 14:02:28.000000',6,1,NULL),(23,'Brisbane Botanic Gardens, Mount Coot-tha','152 Mount Coot Tha Rd, Mount Coot-Tha','botanicgardens@brisbane.qld.gov.au',4066,34032535,'2017-10-23 14:03:08.000000',6,1,NULL),(24,'Queens Gardens Brisbane','144 George St, Brisbane City','queensgarden@brisbane.com.au',4000,34038888,'2017-10-23 14:04:17.000000',6,1,NULL),(25,'Epicurious Garden','Formal Gardens, Clem Jones Promenade near South Bank 3 Ferry Terminal','info@south-bank.net.au',4101,31566366,'2017-10-23 14:05:30.000000',6,1,NULL),(26,'Lone Pine Koala Sanctuary','708 Jesmond Rd, Fig Tree Pocket','service@koala.net',4069,33781366,'2017-10-23 14:06:19.000000',3,1,NULL),(27,'Australia Zoo','1638 Steve Irwin Way, Beerwah','info@australiazoo.com.au',4519,54362000,'2017-10-23 14:06:59.000000',3,1,NULL),(28,'David Fleay Wildlife Park','Loman Lane, Burleigh Heads','davidfleaywildlifepark@zoo.com.au',4220,56692051,'2017-10-23 14:07:37.000000',3,1,NULL),(29,'Currumbin Wildlife Sanctuary','28 Tomewin St, Currumbin','enquiries@cws.org.au',4223,55341266,'2017-10-23 14:08:10.000000',3,1,NULL),(30,'Ipswich Nature Centre','Queens Park, Goleby Ave, Ipswich','council@ipswich.qld.gov.au',4305,38106666,'2017-10-23 14:08:49.000000',3,1,NULL),(31,'QUT Art Museum','2 George St, Brisbane City','artmuseum@qut.edu.au',4000,31385370,'2017-10-23 14:09:27.000000',7,1,NULL),(32,'MacArthur Museum Brisbane','MacArthur Chambers, 201 Edward St, Brisbane City','info@mmb.org.au',4000,32117052,'2017-10-23 14:10:11.000000',7,1,NULL),(33,'Museum of Brisbane','City Hall, 64 Adelaide St, Brisbane City','info@museumofbrisbane.com.au',4000,33390800,'2017-10-23 14:10:52.000000',7,1,NULL),(34,'Queensland Museum & Science Centre','Grey St & Melbourne St, South Brisbane','media@qm.qld.gov.au',4101,38407555,'2017-10-23 14:11:32.000000',7,1,NULL),(35,'Queensland Maritime Museum','412 Stanley St, South Brisbane','info@maritimemuseum.com.au',4101,38445361,'2017-10-23 14:12:10.000000',7,1,NULL),(36,'Stokehouse Q','Sidon St, South Brisbane','info@stokehouseq.com.au',4101,30200600,'2017-10-23 14:12:54.000000',2,1,NULL),(37,'Asana by Pete Evans','80 Albert St, Brisbane City','reservations.brisbane@capribyfraser.com',4000,30130088,'2017-10-23 14:13:37.000000',2,1,NULL),(38,'Ahmets Turkish Restaurant','10/168 Grey St, South Brisbane','bookings@ahmets.com',4101,38466699,'2017-10-23 14:14:12.000000',2,1,NULL),(39,'Port Office Dining Room','40 Edward St, Brisbane City','dining@portofficehotel.com.au',4000,30034700,'2017-10-23 14:14:44.000000',2,1,NULL),(40,'Malt Dining','28 Market St, Brisbane City','enquiries@maltdining.com.au',4000,32364855,'2017-10-23 14:15:19.000000',2,1,NULL),(41,'Queen Street Mall','Queen Street Mall, Queen St, Brisbane City','qsm@brisbanemarketing.com.au',4000,30066290,'2017-10-23 14:16:03.000000',9,1,NULL),(42,'Brisbane Arcade','160 Queen St, Brisbane City','info@bne.mcgees.com.au',4000,32319777,'2017-10-23 14:16:43.000000',9,1,NULL),(43,'Indooroopilly Shopping Centre','322 Moggill Rd, Indooroopilly','info@indooroopillyshopping.com.au',4068,33784022,'2017-10-23 14:17:20.000000',9,1,NULL),(44,'Sunnybank Plaza','Mains Rd & McCullough St, Sunnybank','sunnybankplaza@retailfirst.com.au',4109,33457500,'2017-10-23 14:18:01.000000',9,1,NULL),(45,'Bellbowrie Shopping Plaza','37 Birkin Rd, Bellbowrie','bellbowrieshoppingplaza@iinet.net.au',4070,32029392,'2017-10-23 14:18:45.000000',9,1,NULL);
/*!40000 ALTER TABLE `app_place` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-28 18:26:41
