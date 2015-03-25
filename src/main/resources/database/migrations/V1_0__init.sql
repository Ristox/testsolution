CREATE DATABASE  IF NOT EXISTS `hibnatedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hibnatedb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: hibnatedb
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `occupation` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Paul','Pinge','Elektrik'),(2,'Andrus','Amper','Vanemelektrik'),(3,'Voldemar','Volt','Jõuahelate elektrik'),(6,'Eino','Ekseptsion','Programmeerija'),(7,'Peter','Polymorphism','Java developer'),(8,'Michael','Maven','Software Project Manager'),(9,'Kalle','Keerukus','Tarkvaradisainer'),(10,'Peep','Epee','vehkleja'),(11,'Hillar','Hüpe','kergejõustiklane'),(30,'Rünno-Robert','Reaalaeg','Reaalajaprogrammeerija'),(31,'Mannu','Mannukas','osakonna juhataja'),(32,'Kannu','Kannukas','jaoskonna juhataja'),(34,'Pauno','Pellakas','Koristaja'),(35,'Mihkel','Metall','Rööpameister'),(36,'Õie','Kannike','Bioloog'),(37,'Vilja','Põllumaa','Põllumajandusinsener'),(38,'Viljar','Rikaspõld','Teraviljadirektor'),(40,'Robert','Raud','Keevitaja'),(41,'Mauno','Mannakas','Töötu'),(42,'Tinnu','Tinunn','Jootja'),(43,'Joonas','Tina','Jootja'),(44,'Toivo','Kamper','Elektroonik');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'Realtime Solutions Inc','Tallinn'),(2,'Eesti Energia AS','Tallinn'),(3,'Vanemuine OÜ','Tartu'),(4,'Enron Inc','New York'),(6,'Baaba Jagaa MTÜ','Pärnu-Jaagupi'),(7,'Metsalooma-loomad Varjupaik MTÜ','Võru'),(9,'EVR','Tallinn'),(10,'Põlva Pagarid OÜ','Põlva'),(14,'BurksiMaailm OÜ','Viljandi'),(15,'BurgeRollo AS','Tartu'),(19,'PõlluAgri AS','Jõgeva'),(21,'Bagaak','Kabaak');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teammembers`
--

DROP TABLE IF EXISTS `teammembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teammembers` (
  `team` int(10) unsigned NOT NULL,
  `member` int(10) unsigned NOT NULL,
  PRIMARY KEY (`team`,`member`),
  KEY `fk_team_idx` (`team`),
  KEY `fk_member_idx` (`member`),
  CONSTRAINT `fk_member` FOREIGN KEY (`member`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_team` FOREIGN KEY (`team`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teammembers`
--

LOCK TABLES `teammembers` WRITE;
/*!40000 ALTER TABLE `teammembers` DISABLE KEYS */;
INSERT INTO `teammembers` VALUES (1,9),(1,30),(3,7),(3,9),(4,6),(4,9),(5,43),(5,44),(6,31),(6,32),(8,9),(8,10),(9,1),(9,2),(9,3),(9,9),(9,35),(10,10),(10,11),(10,31),(10,34),(13,7),(13,9),(13,10),(16,35),(16,40),(18,6),(18,7),(18,8),(18,9),(18,30),(19,3),(20,31),(20,32),(20,43),(20,44),(21,34),(22,36),(22,37),(22,38),(22,43),(24,42),(24,43),(24,44);
/*!40000 ALTER TABLE `teammembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `rating` int(10) unsigned DEFAULT '0',
  `organization` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_organization_idx` (`organization`),
  CONSTRAINT `fk_organization` FOREIGN KEY (`organization`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'SardMikroProgrammeerijad',5,1),(3,'Ässad 2',8,1),(4,'Ässad 1',5,1),(5,'Pupujukud',8,4),(6,'Põhjakihi Direktorid',7,4),(7,'Suured Naised',8,3),(8,'Väiksed Mehed',9,3),(9,'Kõrgepinge Taluvusega Poisid',5,2),(10,'DraamaQueeniPoisid',6,3),(12,'PankRotid ',5,4),(13,'Real-Time-Machine Development Group',9,1),(16,'Rööpakeevitajad',9,9),(17,'Liiprisaagijad',5,9),(18,'Reaalajaprogrammeerijad',8,9),(19,'Raudtee Elektrikud',7,9),(20,'Bagaak Kabaak',9,6),(21,'Eriti Lahedad Pihvid',7,14),(22,'Agri Eksperdid',7,19),(24,'Tinutajad',4,4);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-24 23:22:58
