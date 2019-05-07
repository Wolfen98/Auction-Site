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
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bid` (
  `bidNumber` int(11) NOT NULL AUTO_INCREMENT,
  `secretUpperLimit` double DEFAULT NULL,
  `buyerEmailAddr` char(50) DEFAULT NULL,
  `auctionID` int(11) DEFAULT NULL,
  `bidAmount` double NOT NULL,
  PRIMARY KEY (`bidNumber`),
  KEY `buyerEmailAddr` (`buyerEmailAddr`),
  KEY `auctionID` (`auctionID`),
  CONSTRAINT `Bid_ibfk_1` FOREIGN KEY (`buyerEmailAddr`) REFERENCES `User` (`emailAddr`) ON DELETE CASCADE,
  CONSTRAINT `Bid_ibfk_2` FOREIGN KEY (`auctionID`) REFERENCES `Auction` (`auctionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bid`
--

LOCK TABLES `Bid` WRITE;
/*!40000 ALTER TABLE `Bid` DISABLE KEYS */;
INSERT INTO `Bid` VALUES (1,NULL,'shanep@google.com',1,100),(2,NULL,'shanep@google.com',1,100),(4,NULL,'shanep@google.com',1,100),(5,NULL,'shanep@google.com',1,100),(6,NULL,'shanep@google.com',1,80),(7,NULL,'shanep@google.com',1,100),(8,500,'shanep@google.com',1,100),(10,NULL,'shanep@google.com',3,100),(11,700,'shanep@google.com',3,100),(12,NULL,'shanep@google.com',1,216),(13,NULL,'shanep@google.com',1,215),(14,NULL,'shanep@google.com',1,215),(15,NULL,'shanep@google.com',1,215),(16,NULL,'shanep@google.com',5,10),(17,NULL,'shanep@google.com',26,225),(18,NULL,'john1234@gmail.com',1,23),(19,400,'shanep@google.com',1,200),(20,NULL,'john1234@gmail.com',1,25),(21,NULL,'john1234@gmail.com',1,25),(22,NULL,'john1234@gmail.com',1,27),(23,NULL,'john1234@gmail.com',10,3),(24,500,'shanep@google.com',1,300),(25,100,'shanep@google.com',5,100),(26,100,'shanep@google.com',10,100);
/*!40000 ALTER TABLE `Bid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 23:36:37
