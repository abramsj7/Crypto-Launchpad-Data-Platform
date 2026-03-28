-- MySQL dump 10.13  Distrib 9.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: cryptolaunchpad
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `associated_with`
--

DROP TABLE IF EXISTS `associated_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associated_with` (
  `ProjectID` int NOT NULL,
  `InvestorID` int NOT NULL,
  PRIMARY KEY (`ProjectID`,`InvestorID`),
  KEY `InvestorID` (`InvestorID`),
  CONSTRAINT `associated_with_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`),
  CONSTRAINT `associated_with_ibfk_2` FOREIGN KEY (`InvestorID`) REFERENCES `investor` (`InvestorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associated_with`
--

LOCK TABLES `associated_with` WRITE;
/*!40000 ALTER TABLE `associated_with` DISABLE KEYS */;
INSERT INTO `associated_with` VALUES (9103,9401),(9103,9402),(9103,9403);
/*!40000 ALTER TABLE `associated_with` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_event`
--

DROP TABLE IF EXISTS `has_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has_event` (
  `ProjectID` int NOT NULL,
  `LaunchEventID` int NOT NULL,
  PRIMARY KEY (`ProjectID`,`LaunchEventID`),
  KEY `LaunchEventID` (`LaunchEventID`),
  CONSTRAINT `has_event_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`),
  CONSTRAINT `has_event_ibfk_2` FOREIGN KEY (`LaunchEventID`) REFERENCES `launch_event` (`LaunchEventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_event`
--

LOCK TABLES `has_event` WRITE;
/*!40000 ALTER TABLE `has_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `has_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosts` (
  `PlatformID` int NOT NULL,
  `LaunchEventID` int NOT NULL,
  PRIMARY KEY (`PlatformID`,`LaunchEventID`),
  KEY `LaunchEventID` (`LaunchEventID`),
  CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`PlatformID`) REFERENCES `platform` (`PlatformID`),
  CONSTRAINT `hosts_ibfk_2` FOREIGN KEY (`LaunchEventID`) REFERENCES `launch_event` (`LaunchEventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investment`
--

DROP TABLE IF EXISTS `investment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investment` (
  `InvestorID` int NOT NULL,
  `TokenID` int NOT NULL,
  `Amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`InvestorID`,`TokenID`),
  KEY `TokenID` (`TokenID`),
  KEY `idx_investment_investor` (`InvestorID`),
  CONSTRAINT `investment_ibfk_1` FOREIGN KEY (`InvestorID`) REFERENCES `investor` (`InvestorID`),
  CONSTRAINT `investment_ibfk_2` FOREIGN KEY (`TokenID`) REFERENCES `token` (`TokenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investment`
--

LOCK TABLES `investment` WRITE;
/*!40000 ALTER TABLE `investment` DISABLE KEYS */;
/*!40000 ALTER TABLE `investment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investor`
--

DROP TABLE IF EXISTS `investor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investor` (
  `InvestorID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `investor_type` enum('VC','Angel','Launchpad','Exchange','Other') DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`InvestorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investor`
--

LOCK TABLES `investor` WRITE;
/*!40000 ALTER TABLE `investor` DISABLE KEYS */;
INSERT INTO `investor` VALUES (9401,'Marshland Capital','VC','VC',NULL),(9402,'Magnus Capital','VC','VC',NULL),(9403,'Valaran Capital','VC','VC',NULL);
/*!40000 ALTER TABLE `investor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `launch_event`
--

DROP TABLE IF EXISTS `launch_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `launch_event` (
  `LaunchEventID` int NOT NULL,
  `TokenID` int DEFAULT NULL,
  `PlatformID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `AmountRaised` decimal(15,2) DEFAULT NULL,
  `tge_date` date DEFAULT NULL,
  `raise_amount_usd` decimal(18,2) DEFAULT NULL,
  `initial_mc_usd` decimal(18,2) DEFAULT NULL,
  `vesting` text,
  `tge_price_usd` decimal(18,8) DEFAULT NULL,
  `roi_3m_x` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`LaunchEventID`),
  KEY `TokenID` (`TokenID`),
  KEY `PlatformID` (`PlatformID`),
  CONSTRAINT `launch_event_ibfk_1` FOREIGN KEY (`TokenID`) REFERENCES `token` (`TokenID`),
  CONSTRAINT `launch_event_ibfk_2` FOREIGN KEY (`PlatformID`) REFERENCES `platform` (`PlatformID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `launch_event`
--

LOCK TABLES `launch_event` WRITE;
/*!40000 ALTER TABLE `launch_event` DISABLE KEYS */;
INSERT INTO `launch_event` VALUES (9301,9201,9001,NULL,NULL,'2024-01-25',3000000.00,9000000.00,'20% TGE, 12m linear',0.01500000,NULL),(9302,9202,9002,NULL,NULL,'2024-05-28',500000.00,20000000.00,'10% TGE, linear 24 months',0.03000000,NULL),(9303,9203,9002,NULL,NULL,'2024-06-15',1200000.00,15000000.00,'15% TGE, 12m linear',0.05000000,NULL);
/*!40000 ALTER TABLE `launch_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform` (
  `PlatformID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`PlatformID`),
  UNIQUE KEY `uq_platform_slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (9001,'Binance Launchpad','Launchpad','binance-test'),(9002,'DAO Maker','Launchpad','daomaker-test'),(9003,'Seedify.fund','Launchpad','seedify-test');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `ProjectID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Chain` enum('Ethereum','Solana','Polygon','Avalanche') DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `sector` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (9101,'AltLayer','Ethereum','Infrastructure','https://altlayer.io','AI'),(9102,'SuiPad','Ethereum','Infrastructure','https://suipad.xyz','Launchpad'),(9103,'LaunchX','Ethereum','Infrastructure','https://launchx.io','Launchpad');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_investment`
--

DROP TABLE IF EXISTS `stg_investment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_investment` (
  `InvestorID` int NOT NULL,
  `TokenID` int NOT NULL,
  `Amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`InvestorID`,`TokenID`),
  KEY `TokenID` (`TokenID`),
  KEY `idx_investment_investor` (`InvestorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_investment`
--

LOCK TABLES `stg_investment` WRITE;
/*!40000 ALTER TABLE `stg_investment` DISABLE KEYS */;
/*!40000 ALTER TABLE `stg_investment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_investor`
--

DROP TABLE IF EXISTS `stg_investor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_investor` (
  `InvestorID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `investor_type` enum('VC','Angel','Launchpad','Exchange','Other') DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`InvestorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_investor`
--

LOCK TABLES `stg_investor` WRITE;
/*!40000 ALTER TABLE `stg_investor` DISABLE KEYS */;
/*!40000 ALTER TABLE `stg_investor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_launch_event`
--

DROP TABLE IF EXISTS `stg_launch_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_launch_event` (
  `LaunchEventID` int NOT NULL,
  `TokenID` int DEFAULT NULL,
  `PlatformID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `AmountRaised` decimal(15,2) DEFAULT NULL,
  `tge_date` date DEFAULT NULL,
  `raise_amount_usd` decimal(18,2) DEFAULT NULL,
  `initial_mc_usd` decimal(18,2) DEFAULT NULL,
  `vesting` text,
  `tge_price_usd` decimal(18,8) DEFAULT NULL,
  `roi_3m_x` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`LaunchEventID`),
  KEY `TokenID` (`TokenID`),
  KEY `PlatformID` (`PlatformID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_launch_event`
--

LOCK TABLES `stg_launch_event` WRITE;
/*!40000 ALTER TABLE `stg_launch_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `stg_launch_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_platform`
--

DROP TABLE IF EXISTS `stg_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_platform` (
  `PlatformID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PlatformID`),
  UNIQUE KEY `uq_platform_slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_platform`
--

LOCK TABLES `stg_platform` WRITE;
/*!40000 ALTER TABLE `stg_platform` DISABLE KEYS */;
/*!40000 ALTER TABLE `stg_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_project`
--

DROP TABLE IF EXISTS `stg_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_project` (
  `ProjectID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Chain` enum('Ethereum','Solana','Polygon','Avalanche') DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `sector` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_project`
--

LOCK TABLES `stg_project` WRITE;
/*!40000 ALTER TABLE `stg_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `stg_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_token`
--

DROP TABLE IF EXISTS `stg_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_token` (
  `TokenID` int NOT NULL,
  `ProjectID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Symbol` varchar(10) DEFAULT NULL,
  `MaxSupply` bigint DEFAULT NULL,
  `chain` varchar(32) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `launch_price` decimal(18,8) DEFAULT NULL,
  `current_price` decimal(18,8) DEFAULT NULL,
  `ath_price` decimal(18,8) DEFAULT NULL,
  `coingecko_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`TokenID`),
  UNIQUE KEY `uq_token_coingecko` (`coingecko_id`),
  KEY `ProjectID` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_token`
--

LOCK TABLES `stg_token` WRITE;
/*!40000 ALTER TABLE `stg_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `stg_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `TokenID` int NOT NULL,
  `ProjectID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Symbol` varchar(10) DEFAULT NULL,
  `MaxSupply` bigint DEFAULT NULL,
  `chain` varchar(32) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `launch_price` decimal(18,8) DEFAULT NULL,
  `current_price` decimal(18,8) DEFAULT NULL,
  `ath_price` decimal(18,8) DEFAULT NULL,
  `coingecko_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`TokenID`),
  UNIQUE KEY `uq_token_coingecko` (`coingecko_id`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (9201,9101,'AltLayer','ALT',10000000000,'Ethereum','AI',0.01500000,NULL,NULL,'altlayer-test'),(9202,9102,'SuiPad','SUIP',1000000000,'Ethereum','Launchpad',0.03000000,NULL,NULL,'suipad-test'),(9203,9103,'LaunchX','LNCHX',1000000000,'Ethereum','Launchpad',0.05000000,NULL,NULL,'launchx-test');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_token_roi`
--

DROP TABLE IF EXISTS `vw_token_roi`;
/*!50001 DROP VIEW IF EXISTS `vw_token_roi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_token_roi` AS SELECT 
 1 AS `TokenID`,
 1 AS `Name`,
 1 AS `Symbol`,
 1 AS `chain`,
 1 AS `category`,
 1 AS `PlatformID`,
 1 AS `tge_date`,
 1 AS `tge_price_usd`,
 1 AS `current_price`,
 1 AS `roi_current_x`,
 1 AS `ath_price`,
 1 AS `roi_ath_x`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_token_roi`
--

/*!50001 DROP VIEW IF EXISTS `vw_token_roi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_token_roi` AS select `t`.`TokenID` AS `TokenID`,`t`.`Name` AS `Name`,`t`.`Symbol` AS `Symbol`,`t`.`chain` AS `chain`,`t`.`category` AS `category`,`le`.`PlatformID` AS `PlatformID`,`le`.`tge_date` AS `tge_date`,`le`.`tge_price_usd` AS `tge_price_usd`,`t`.`current_price` AS `current_price`,(case when ((`le`.`tge_price_usd` is null) or (`le`.`tge_price_usd` = 0)) then NULL else round((`t`.`current_price` / `le`.`tge_price_usd`),3) end) AS `roi_current_x`,`t`.`ath_price` AS `ath_price`,(case when ((`le`.`tge_price_usd` is null) or (`le`.`tge_price_usd` = 0)) then NULL else round((`t`.`ath_price` / `le`.`tge_price_usd`),3) end) AS `roi_ath_x` from (`token` `t` left join `launch_event` `le` on((`le`.`TokenID` = `t`.`TokenID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-28 12:34:11
