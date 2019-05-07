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
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  `itemName` char(100) NOT NULL,
  `itemColor` char(100) NOT NULL,
  `itemBrand` char(100) NOT NULL,
  `itemStorage` int(11) DEFAULT NULL,
  `itemImage` varbinary(65000) DEFAULT NULL,
  `datePosted` date NOT NULL,
  `lastBidder` char(50) DEFAULT NULL,
  `lastBidPrice` double DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  CONSTRAINT `Item_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `Auction` (`auctionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (1,'iPhone 6','Gold','Apple',64,'/Users/shanepark/Desktop/IMG_0121.jpg','2019-04-23','shanep@google.com',215),(3,'Pixel 3','White','Google',32,'','2019-04-23','Joy',300),(4,'iPhone X','Rose Gold','Apple',256,'','2019-04-23','AC',1000),(5,'Galaxy s10','Black','Samsung',512,'','2019-04-23','shanep@google.com',10),(7,'Galaxy s9+','Blue','Samsung',64,'','2019-04-23',NULL,NULL),(8,'iPhone','Silver','apple',64,'','2019-04-23',NULL,NULL),(9,'iPhone','Silver','Apple',64,'','2019-04-23',NULL,NULL),(10,'iPhone','Silver','Apple',64,'','2019-04-23',NULL,NULL),(11,'iPhone','Silver','Apple',64,'','2019-04-23',NULL,NULL),(12,'iPhone','Black','Apple',1,'','2019-04-23',NULL,NULL),(13,'iPhone','Black','Apple',1,'','2019-04-23',NULL,NULL),(14,'iPhone','Black','Apple',1,'','2019-04-23',NULL,NULL),(15,'iPhone','black','apple',1,'','2019-04-23',NULL,NULL),(16,'iPhone','black','apple',1,'','2019-04-23',NULL,NULL),(17,'iPhone','Silver','Apple',64,'','2019-04-23',NULL,NULL),(18,'iphone 5s','Black','Apple',12,'','2019-04-23',NULL,NULL),(19,'iphone 5s','Black','Apple',12,'','2019-04-23',NULL,NULL),(20,'iPhone','Silver','Apple',64,'','2019-04-23',NULL,NULL),(21,'asd','asdf','asdfg',23,'','2019-04-23',NULL,NULL),(22,'iPhone','Silver','Apple',64,'','2019-04-23',NULL,NULL),(23,'asd','asdf','asdfg',23,'','2019-04-23',NULL,NULL),(24,'asd','asdf','asdfd',23,'','2019-04-23',NULL,NULL),(25,'asdf','asdf','adsf',32,'','2019-04-23',NULL,NULL),(26,'iphone 6','red','apple',32,'','2019-04-23','shanep@google.com',225),(27,'Galaxy S10','Prism White','Samsung',64,'https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/samsung/samsung-galaxy-s10/prism-white/Samsung-Galaxy-S10-Prism-White-1-3x.jpg','2019-04-23',NULL,NULL);
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 23:36:36
