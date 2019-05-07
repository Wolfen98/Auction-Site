CREATE DATABASE  IF NOT EXISTS `BuyMe` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `BuyMe`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: cs336db.cx9k6zmt06ff.us-east-2.rds.amazonaws.com    Database: BuyMe
-- ------------------------------------------------------
-- Server version	5.6.40-log

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
-- Table structure for table `Auction`
--

DROP TABLE IF EXISTS `Auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auction` (
  `auctionID` int(11) NOT NULL AUTO_INCREMENT,
  `winner` char(50) DEFAULT NULL,
  `sellerEmailAddr` char(50) NOT NULL DEFAULT '',
  `buyerEmailAddr` char(50) DEFAULT NULL,
  `closingDateTime` datetime NOT NULL,
  `hiddenMin` double DEFAULT NULL,
  `startingBidPrice` double NOT NULL,
  `bidIncrement` double NOT NULL,
  PRIMARY KEY (`auctionID`,`sellerEmailAddr`),
  KEY `sellerEmailAddr` (`sellerEmailAddr`),
  KEY `buyerEmailAddr` (`buyerEmailAddr`),
  CONSTRAINT `Auction_ibfk_1` FOREIGN KEY (`sellerEmailAddr`) REFERENCES `User` (`emailAddr`) ON DELETE CASCADE,
  CONSTRAINT `Auction_ibfk_2` FOREIGN KEY (`buyerEmailAddr`) REFERENCES `User` (`emailAddr`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auction`
--

LOCK TABLES `Auction` WRITE;
/*!40000 ALTER TABLE `Auction` DISABLE KEYS */;
INSERT INTO `Auction` VALUES (1,NULL,'shanepark@gmail.com',NULL,'2019-04-23 10:00:00',300,0,15),(3,NULL,'shanepark@gmail.com',NULL,'2019-04-23 10:00:00',0,0,0),(4,NULL,'shanepark@gmail.com',NULL,'2019-04-23 12:00:00',750,0,0),(5,NULL,'shanepark@gmail.com',NULL,'2019-04-23 12:00:00',-1,0,0),(7,NULL,'shanep@google.com',NULL,'2019-04-23 17:00:00',650,100,5),(8,NULL,'john1234@gmail.com',NULL,'2019-11-11 11:22:00',-1,100,5),(9,NULL,'admin98@gmail.com',NULL,'1111-11-11 11:11:11',-1,100,5),(10,NULL,'admin98@gmail.com',NULL,'0201-04-23 06:56:00',-1,100,5),(11,NULL,'admin98@gmail.com',NULL,'0201-04-23 06:56:00',-1,100,6),(12,NULL,'admin98@gmail.com',NULL,'2019-04-23 07:04:00',-1,0,1),(13,NULL,'admin98@gmail.com',NULL,'2019-04-23 07:04:00',-1,0,1),(14,NULL,'admin98@gmail.com',NULL,'2019-04-23 11:11:11',-1,2,2),(15,NULL,'admin98@gmail.com',NULL,'2019-04-23 11:11:11',-1,2,2),(16,NULL,'admin98@gmail.com',NULL,'2019-04-23 11:11:11',-1,2,2),(17,NULL,'admin98@gmail.com',NULL,'2019-04-23 11:11:11',-1,2,2),(18,NULL,'admin@buyme.com',NULL,'2019-04-25 13:00:00',200,120,50),(19,NULL,'admin@buyme.com',NULL,'2019-04-25 13:00:00',200,120,50),(20,NULL,'admin98@gmail.com',NULL,'2019-04-23 11:11:11',-1,3,3),(21,NULL,'john1234@gmail.com',NULL,'2019-04-23 10:00:00',45,32,12),(22,NULL,'admin98@gmail.com',NULL,'2019-04-23 11:11:11',-1,2,2),(23,NULL,'john1234@gmail.com',NULL,'2019-04-23 10:00:00',45,32,12),(24,NULL,'john1234@gmail.com',NULL,'2019-04-23 10:00:00',234,23,23),(25,NULL,'shanep@google.com',NULL,'2019-04-23 20:00:00',-1,32,10),(26,NULL,'admin@buyme.com',NULL,'2019-04-23 10:00:00',300,200,25),(27,NULL,'shanep@google.com',NULL,'2019-04-23 11:30:00',1000,500,10);
/*!40000 ALTER TABLE `Auction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 23:36:33
