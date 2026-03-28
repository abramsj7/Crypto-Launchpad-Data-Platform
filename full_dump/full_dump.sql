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
INSERT INTO `investor` VALUES (1,'Mcconnell Group','VC',NULL,NULL),(2,'Long-Murray','Influencer',NULL,NULL),(3,'Vaughn and Sons','VC',NULL,NULL),(4,'Holmes Ltd','DAO',NULL,NULL),(5,'Day, Adkins and Williams','Influencer',NULL,NULL),(6,'Ayala, Scott and Mcclure','VC',NULL,NULL),(7,'Cruz Inc','Influencer',NULL,NULL),(8,'Morgan, Garcia and Hawkins','Influencer',NULL,NULL),(9,'Navarro, Johnson and Padilla','DAO',NULL,NULL),(10,'Collins, Johnson and Daniels','Angel',NULL,NULL),(11,'Wright, Orozco and Cox','Angel',NULL,NULL),(12,'Strong, Frye and Davis','Influencer',NULL,NULL),(13,'Conrad LLC','Influencer',NULL,NULL),(14,'Moore PLC','Angel',NULL,NULL),(15,'Jackson and Sons','DAO',NULL,NULL),(16,'Bennett LLC','VC',NULL,NULL),(17,'Quinn Inc','Angel',NULL,NULL),(18,'Myers, Hensley and Horne','Influencer',NULL,NULL),(19,'Roy, Peterson and Meyers','Angel',NULL,NULL),(20,'Collins-Jones','Influencer',NULL,NULL),(21,'Mullins-Mckenzie','VC',NULL,NULL),(22,'Rangel Inc','Influencer',NULL,NULL),(23,'Molina-King','Angel',NULL,NULL),(24,'Lewis, Barton and Smith','DAO',NULL,NULL),(25,'Black, Lambert and Williams','Influencer',NULL,NULL),(26,'Leonard-Holden','VC',NULL,NULL),(27,'Rowe Group','DAO',NULL,NULL),(28,'Cook Inc','DAO',NULL,NULL),(29,'Lee and Sons','VC',NULL,NULL),(30,'Jackson, Velez and Newton','DAO',NULL,NULL),(31,'Preston, Powell and Hester','DAO',NULL,NULL),(32,'Thomas, Nelson and Lang','Influencer',NULL,NULL),(33,'Richardson PLC','DAO',NULL,NULL),(34,'Dillon, Thomas and Torres','DAO',NULL,NULL),(35,'Robinson Inc','Angel',NULL,NULL),(36,'Sullivan Inc','Influencer',NULL,NULL),(37,'Smith-Anderson','VC',NULL,NULL),(38,'Rose-Singh','Angel',NULL,NULL),(39,'Wiggins, Daniels and Baker','VC',NULL,NULL),(40,'Cannon-Reed','VC',NULL,NULL),(41,'Morgan, Holder and Gallegos','Influencer',NULL,NULL),(42,'Cowan LLC','Influencer',NULL,NULL),(43,'Thomas-Dorsey','DAO',NULL,NULL),(44,'Smith-Jackson','DAO',NULL,NULL),(45,'Roman Inc','Influencer',NULL,NULL),(46,'Clements, Schmidt and Young','Angel',NULL,NULL),(47,'Carter-Murillo','Angel',NULL,NULL),(48,'Horton, Savage and Deleon','VC',NULL,NULL),(49,'Lamb Group','VC',NULL,NULL),(50,'Cox, Mcpherson and Greene','Influencer',NULL,NULL),(51,'Nielsen-Douglas','Angel',NULL,NULL),(52,'Brown-Walter','Influencer',NULL,NULL),(53,'Cole-Buchanan','VC',NULL,NULL),(54,'Robinson-Gonzalez','DAO',NULL,NULL),(55,'Lloyd, Nguyen and Stone','DAO',NULL,NULL),(56,'Crosby Group','DAO',NULL,NULL),(57,'Randall, Thomas and Henderson','DAO',NULL,NULL),(58,'Lewis LLC','Angel',NULL,NULL),(59,'Phillips PLC','Angel',NULL,NULL),(60,'Burton LLC','DAO',NULL,NULL),(61,'Mcintyre, Phillips and Hinton','Angel',NULL,NULL),(62,'Smith-Macias','DAO',NULL,NULL),(63,'Smith Group','Influencer',NULL,NULL),(64,'Mendoza-Jones','Influencer',NULL,NULL),(65,'Hill, Williams and Thomas','Influencer',NULL,NULL),(66,'Cook LLC','Angel',NULL,NULL),(67,'Thomas Inc','Influencer',NULL,NULL),(68,'Noble PLC','VC',NULL,NULL),(69,'English, Daugherty and Mcdonald','Influencer',NULL,NULL),(70,'Esparza PLC','Influencer',NULL,NULL),(71,'Gonzalez, Munoz and Hunter','VC',NULL,NULL),(72,'Smith PLC','Angel',NULL,NULL),(73,'Gross-Gonzalez','Influencer',NULL,NULL),(74,'Navarro, Long and Conley','Angel',NULL,NULL),(75,'Meza-Lawrence','Influencer',NULL,NULL),(76,'Herman-Allen','VC',NULL,NULL),(77,'Bryant, Roberts and Miranda','VC',NULL,NULL),(78,'Harris, Cole and Perez','VC',NULL,NULL),(79,'Kirk, Stevenson and Callahan','DAO',NULL,NULL),(80,'Higgins-Smith','Angel',NULL,NULL),(81,'Shields, Guzman and Hernandez','Angel',NULL,NULL),(82,'Rhodes Ltd','DAO',NULL,NULL),(83,'Smith, Glenn and Jones','Angel',NULL,NULL),(84,'Koch PLC','Angel',NULL,NULL),(85,'Barr Ltd','DAO',NULL,NULL),(86,'King, Barnett and Russell','Angel',NULL,NULL),(87,'Harris, Davis and Brown','Influencer',NULL,NULL),(88,'Sanders-Sullivan','VC',NULL,NULL),(89,'Morrison LLC','DAO',NULL,NULL),(90,'Ford, Walker and Cruz','VC',NULL,NULL),(91,'Wilson and Sons','Angel',NULL,NULL),(92,'Graham-Cannon','VC',NULL,NULL),(93,'Bird-York','Angel',NULL,NULL),(94,'Wells Inc','VC',NULL,NULL),(95,'Smith, Alexander and Stevenson','Influencer',NULL,NULL),(96,'Williams-Larsen','DAO',NULL,NULL),(97,'Brennan-Simon','VC',NULL,NULL),(98,'Shaw, Richardson and Phillips','Angel',NULL,NULL),(99,'Ramos PLC','VC',NULL,NULL),(100,'Kerr-Walter','VC',NULL,NULL),(101,'Nichols Inc','Influencer',NULL,NULL),(102,'Smith, Gonzales and Boone','Influencer',NULL,NULL),(103,'Rose-Hughes','VC',NULL,NULL),(104,'Golden, Lane and Torres','Angel',NULL,NULL),(105,'Hernandez, Parks and Gonzalez','Angel',NULL,NULL),(106,'Lopez-Thornton','VC',NULL,NULL),(107,'Macdonald-Patterson','Influencer',NULL,NULL),(108,'Kim Inc','DAO',NULL,NULL),(109,'Payne and Sons','DAO',NULL,NULL),(110,'Hall, Torres and Horton','Angel',NULL,NULL),(111,'Stevens, Hopkins and Mills','DAO',NULL,NULL),(112,'Porter-Johnson','Influencer',NULL,NULL),(113,'Mclaughlin-Mathis','DAO',NULL,NULL),(114,'Webb, Garcia and Jones','Angel',NULL,NULL),(115,'Pope and Sons','Angel',NULL,NULL),(116,'Quinn, Mullen and Myers','Angel',NULL,NULL),(117,'Ramirez Group','Influencer',NULL,NULL),(118,'Roman and Sons','VC',NULL,NULL),(119,'Gutierrez, Gonzalez and Johnson','DAO',NULL,NULL),(120,'Collins LLC','Angel',NULL,NULL),(121,'Bartlett Group','Influencer',NULL,NULL),(122,'Aguirre, Moreno and Fleming','Angel',NULL,NULL),(123,'Ball, Sharp and Johnson','DAO',NULL,NULL),(124,'Sanchez Ltd','Influencer',NULL,NULL),(125,'Kennedy Inc','DAO',NULL,NULL),(126,'Giles, Peters and Rodriguez','Influencer',NULL,NULL),(127,'Jones and Sons','VC',NULL,NULL),(128,'Juarez LLC','DAO',NULL,NULL),(129,'Sullivan Ltd','Influencer',NULL,NULL),(130,'Hernandez-Green','Influencer',NULL,NULL),(131,'Brown Group','DAO',NULL,NULL),(132,'Murphy, Tate and Elliott','Influencer',NULL,NULL),(133,'Gibson-Lin','VC',NULL,NULL),(134,'Ruiz Group','Angel',NULL,NULL),(135,'Gregory, Hernandez and Clark','Angel',NULL,NULL),(136,'Fleming, Lambert and Davila','VC',NULL,NULL),(137,'Kelley Inc','DAO',NULL,NULL),(138,'Baldwin, Thomas and Patel','Angel',NULL,NULL),(139,'Taylor and Sons','VC',NULL,NULL),(140,'Patton-Anderson','Influencer',NULL,NULL),(141,'Sexton LLC','VC',NULL,NULL),(142,'Johnson-Olson','Influencer',NULL,NULL),(143,'Harrell-Park','Influencer',NULL,NULL),(144,'Thomas Inc','DAO',NULL,NULL),(145,'Ramirez, Bowman and Thomas','VC',NULL,NULL),(146,'Smith-Skinner','VC',NULL,NULL),(147,'Stewart Inc','VC',NULL,NULL),(148,'Gonzalez, Martinez and Hampton','Influencer',NULL,NULL),(149,'West, Walker and Frazier','VC',NULL,NULL),(150,'Garcia PLC','DAO',NULL,NULL),(151,'Clayton PLC','Influencer',NULL,NULL),(152,'Wiley Ltd','Influencer',NULL,NULL),(153,'Rodriguez Group','Influencer',NULL,NULL),(154,'Cooper and Sons','VC',NULL,NULL),(155,'Smith LLC','Influencer',NULL,NULL),(156,'Buckley and Sons','Angel',NULL,NULL),(157,'Rogers, Holt and Meadows','Influencer',NULL,NULL),(158,'White-Walker','Angel',NULL,NULL),(159,'Wagner, Collins and Stephenson','VC',NULL,NULL),(160,'Russell Ltd','Angel',NULL,NULL),(161,'White Ltd','Angel',NULL,NULL),(162,'Yates, Taylor and Gordon','VC',NULL,NULL),(163,'Bush, Saunders and Brady','Angel',NULL,NULL),(164,'Phillips, Hendricks and Wright','Angel',NULL,NULL),(165,'Bridges-Chang','Angel',NULL,NULL),(166,'Lawrence-Vincent','Angel',NULL,NULL),(167,'Klein-Moore','Angel',NULL,NULL),(168,'Gibson-Cross','Influencer',NULL,NULL),(169,'Larsen PLC','VC',NULL,NULL),(170,'Morris, Bradley and Hall','VC',NULL,NULL),(171,'Cole-Cortez','DAO',NULL,NULL),(172,'Francis, Adams and Bautista','Influencer',NULL,NULL),(173,'Kaiser and Sons','VC',NULL,NULL),(174,'Jones, Fox and Schwartz','VC',NULL,NULL),(175,'Gordon, Bautista and Gonzales','Angel',NULL,NULL),(176,'Campbell, Baker and Ramirez','Influencer',NULL,NULL),(177,'Gray-Hudson','Angel',NULL,NULL),(178,'Gilmore-Wilson','Influencer',NULL,NULL),(179,'Holt, Arellano and Smith','Angel',NULL,NULL),(180,'Barber PLC','Influencer',NULL,NULL),(181,'Wilson, Proctor and Young','VC',NULL,NULL),(182,'Mcdonald-Walsh','Angel',NULL,NULL),(183,'Chambers-Bryan','Influencer',NULL,NULL),(184,'Parker PLC','Angel',NULL,NULL),(185,'Clark Ltd','VC',NULL,NULL),(186,'Taylor Group','Influencer',NULL,NULL),(187,'Allen, Burgess and Scott','Angel',NULL,NULL),(188,'Phillips-Carter','Influencer',NULL,NULL),(189,'Blackburn, Rose and Rodriguez','VC',NULL,NULL),(190,'Benson, Cooper and Smith','VC',NULL,NULL),(191,'Atkinson, Walker and Hernandez','DAO',NULL,NULL),(192,'Weeks, Morrow and Jones','Influencer',NULL,NULL),(193,'Johnson-Banks','VC',NULL,NULL),(194,'Mclaughlin Group','Influencer',NULL,NULL),(195,'Powers-Harris','Influencer',NULL,NULL),(196,'Webb-Gonzalez','Angel',NULL,NULL),(197,'Swanson, Jones and Marquez','VC',NULL,NULL),(198,'Buck PLC','DAO',NULL,NULL),(199,'Moore and Sons','Angel',NULL,NULL),(200,'Mckay, Baker and Green','Influencer',NULL,NULL),(201,'Nebula Capital','VC',NULL,NULL),(202,'Billy Madison','VC',NULL,NULL),(203,'Billy Madison','Angel',NULL,NULL),(204,'Billy Madison','DAO',NULL,NULL);
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
INSERT INTO `launch_event` VALUES (40001,30001,1002,NULL,NULL,'2024-05-28',2500000.00,15000000.00,'10% TGE, 3m cliff, 24m linear',0.05000000,NULL),(40003,30001,1001,NULL,NULL,'2024-01-25',3000000.00,9000000.00,'20% TGE, 12m linear',0.01500000,NULL);
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
INSERT INTO `platform` VALUES (1001,'Binance Launchpad','Launchpad','binance'),(1002,'DAO Maker','Launchpad','daomaker'),(1003,'Seedify.fund','Launchpad','seedify');
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
INSERT INTO `project` VALUES (20001,'Example Project','Ethereum',NULL,'https://example.org','AI'),(20002,'PixelVerse','Ethereum',NULL,'https://pixelverse.xyz','Gaming'),(20003,'AltLayer','Ethereum',NULL,'https://altlayer.io','AI');
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
INSERT INTO `stg_launch_event` VALUES (40001,30001,1001,NULL,NULL,'2024-07-15',2500000.00,15000000.00,'10% TGE, 3m cliff, 36m linear',0.05000000,NULL),(40002,30002,1002,NULL,NULL,'2024-05-28',500000.00,20000000.00,'10% TGE, linear 24 months',0.03000000,NULL),(40003,30001,1001,NULL,NULL,'2024-01-25',3000000.00,9000000.00,'20% TGE, 12m linear',0.01500000,NULL);
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
INSERT INTO `stg_platform` VALUES (1001,'Binance Launchpad','Launchpad','binance'),(1002,'DAO Maker','Launchpad','daomaker'),(1003,'Seedify.fund','Launchpad','seedify');
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
INSERT INTO `stg_project` VALUES (20001,'Example Project','Ethereum',NULL,'https://example.org','AI'),(20002,'PixelVerse','Ethereum',NULL,'https://pixelverse.xyz','Gaming'),(20003,'AltLayer','Ethereum',NULL,'https://altlayer.io','AI');
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
INSERT INTO `stg_token` VALUES (30001,20001,'Example Token','EXM',1000000000,'Ethereum','AI',0.05000000,NULL,NULL,'example-token'),(30002,20002,'PixelVerse','PIXEL',5000000000,'Ethereum','Gaming',0.03000000,NULL,NULL,'pixelverse'),(30003,20003,'AltLayer','ALT',10000000000,'Ethereum','AI',0.01500000,NULL,NULL,'altlayer');
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
INSERT INTO `token` VALUES (30001,20001,'AltLayer','ALT',10000000000,'Ethereum','AI',0.01500000,NULL,NULL,'altlayer'),(30002,20002,'PixelVerse','PIXEL',5000000000,'Ethereum','Gaming',0.03000000,NULL,NULL,'pixelverse');
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

-- Dump completed on 2026-03-28 11:15:06
