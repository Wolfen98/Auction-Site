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
-- Table structure for table `salesReport`
--

DROP TABLE IF EXISTS `salesReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesReport` (
  `salesReportID` int(11) NOT NULL AUTO_INCREMENT,
  `totalEarning` double DEFAULT NULL,
  `earningsPerItem` double DEFAULT NULL,
  `earningsPerItemType` double DEFAULT NULL,
  `earningsPerEndUser` double DEFAULT NULL,
  `bestSellingItem` char(50) DEFAULT NULL,
  `bestBuyers` char(50) DEFAULT NULL,
  `adminUsername` char(50) DEFAULT NULL,
  `adminEmailAddr` char(50) DEFAULT NULL,
  PRIMARY KEY (`salesReportID`),
  KEY `adminUsername` (`adminUsername`,`adminEmailAddr`),
  CONSTRAINT `salesReport_ibfk_1` FOREIGN KEY (`adminUsername`, `adminEmailAddr`) REFERENCES `Admin` (`username`, `emailAddr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesReport`
--

LOCK TABLES `salesReport` WRITE;
/*!40000 ALTER TABLE `salesReport` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesReport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 23:36:39
