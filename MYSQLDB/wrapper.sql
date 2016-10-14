-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ff4j
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `FF4J_CUSTOM_PROPERTIES`
--

DROP TABLE IF EXISTS `FF4J_CUSTOM_PROPERTIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF4J_CUSTOM_PROPERTIES` (
  `PROPERTY_ID` varchar(100) NOT NULL,
  `CLAZZ` varchar(255) NOT NULL,
  `CURRENTVALUE` varchar(255) DEFAULT NULL,
  `FIXEDVALUES` varchar(1000) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `FEAT_UID` varchar(100) NOT NULL,
  PRIMARY KEY (`PROPERTY_ID`,`FEAT_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF4J_CUSTOM_PROPERTIES`
--

LOCK TABLES `FF4J_CUSTOM_PROPERTIES` WRITE;
/*!40000 ALTER TABLE `FF4J_CUSTOM_PROPERTIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `FF4J_CUSTOM_PROPERTIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF4J_FEATURES`
--

DROP TABLE IF EXISTS `FF4J_FEATURES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF4J_FEATURES` (
  `FEAT_UID` varchar(100) NOT NULL,
  `ENABLE` int(11) NOT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `STRATEGY` varchar(1000) DEFAULT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `GROUPNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FEAT_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF4J_FEATURES`
--

LOCK TABLES `FF4J_FEATURES` WRITE;
/*!40000 ALTER TABLE `FF4J_FEATURES` DISABLE KEYS */;
INSERT INTO `FF4J_FEATURES` VALUES ('bankstatement',1,'for bank statement',NULL,NULL,'ADMIN'),('Test1',1,'just for testing purpose','org.ff4j.strategy.ReleaseDateFlipStrategy','releaseDate=2016-10-11-19:16','users');
/*!40000 ALTER TABLE `FF4J_FEATURES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF4J_ROLES`
--

DROP TABLE IF EXISTS `FF4J_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF4J_ROLES` (
  `FEAT_UID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`FEAT_UID`,`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF4J_ROLES`
--

LOCK TABLES `FF4J_ROLES` WRITE;
/*!40000 ALTER TABLE `FF4J_ROLES` DISABLE KEYS */;
INSERT INTO `FF4J_ROLES` VALUES ('bankstatement','ROLE_ADMIN');
/*!40000 ALTER TABLE `FF4J_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF4J_USERS`
--

DROP TABLE IF EXISTS `FF4J_USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF4J_USERS` (
  `username` varchar(45) NOT NULL,
  `password` varchar(450) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF4J_USERS`
--

LOCK TABLES `FF4J_USERS` WRITE;
/*!40000 ALTER TABLE `FF4J_USERS` DISABLE KEYS */;
INSERT INTO `FF4J_USERS` VALUES ('ashish','ashish@123',1),('robert','robert@123',1);
/*!40000 ALTER TABLE `FF4J_USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FF4J_USER_ROLES`
--

DROP TABLE IF EXISTS `FF4J_USER_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FF4J_USER_ROLES` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `ROLE` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`ROLE`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `FF4J_USERS` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FF4J_USER_ROLES`
--

LOCK TABLES `FF4J_USER_ROLES` WRITE;
/*!40000 ALTER TABLE `FF4J_USER_ROLES` DISABLE KEYS */;
INSERT INTO `FF4J_USER_ROLES` VALUES (2,'ashish','ROLE_ADMIN'),(1,'ashish','ROLE_USER'),(3,'robert','ROLE_USER');
/*!40000 ALTER TABLE `FF4J_USER_ROLES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-11 19:33:49
