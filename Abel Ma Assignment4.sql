-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: united_helpers
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerid` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL,
  PRIMARY KEY (`volunteerid`,`taskCode`),
  KEY `taskCode` (`taskCode`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`volunteerid`) REFERENCES `volunteer` (`volunteerid`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,1,'2025-03-01 09:00:00','2025-03-01 17:00:00'),(1,2,'2025-03-05 09:00:00','2025-03-05 18:00:00'),(1,7,'2025-03-10 10:00:00','2025-03-10 17:00:00'),(2,1,'2025-03-01 08:00:00','2025-03-01 17:00:00'),(2,2,'2025-03-05 08:30:00','2025-03-05 18:00:00'),(2,3,'2025-03-07 09:00:00','2025-03-07 17:00:00'),(2,7,'2025-03-10 09:00:00','2025-03-10 17:00:00'),(2,8,'2025-03-11 08:00:00','2025-03-11 17:00:00'),(3,1,'2025-03-01 09:00:00','2025-03-01 16:00:00'),(3,3,'2025-03-07 10:00:00','2025-03-07 17:00:00'),(4,2,'2025-03-05 09:00:00','2025-03-05 17:00:00'),(5,3,'2025-03-07 09:00:00','2025-03-07 16:00:00'),(6,7,'2025-03-10 09:30:00','2025-03-10 17:00:00'),(7,8,'2025-03-11 08:30:00','2025-03-11 16:30:00'),(8,9,'2025-03-12 09:00:00','2025-03-12 17:00:00'),(9,10,'2025-03-13 10:00:00','2025-03-13 18:00:00'),(10,1,'2025-03-01 09:00:00','2025-03-01 17:00:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(300) NOT NULL,
  `itemValue` decimal(10,2) NOT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Baby Formula',15.50,1000),(2,'Canned Food',4.50,4000),(3,'Bandages',1.20,10000),(4,'Pain Reliver',7.80,2500),(5,'Compressed Biscuits',3.60,5000),(6,'Bottled Water',1.10,20000),(7,'Toys',9.90,600),(8,'Diapers',12.50,1200),(9,'Antiseptic Wipes',2.40,7000),(10,'Gauze Pads',1.50,6000);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageid` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeid` int NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` decimal(6,2) NOT NULL,
  PRIMARY KEY (`packageid`),
  KEY `packageTypeid` (`packageTypeid`),
  KEY `taskCode` (`taskCode`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`packageTypeid`) REFERENCES `package_type` (`packageTypeid`),
  CONSTRAINT `package_ibfk_2` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,1,'2025-03-01',12.50),(2,1,1,'2025-03-02',13.20),(3,1,1,'2025-03-03',12.80),(4,2,2,'2025-03-05',8.30),(5,2,2,'2025-03-06',9.10),(6,3,3,'2025-03-07',11.40),(7,3,3,'2025-03-08',12.00),(8,7,1,'2025-03-10',13.10),(9,8,2,'2025-03-11',9.25),(10,9,3,'2025-03-12',10.00);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemid` int NOT NULL,
  `packageid` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemid`,`packageid`),
  KEY `packageid` (`packageid`),
  CONSTRAINT `package_contents_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemID`),
  CONSTRAINT `package_contents_ibfk_2` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,6,10),(1,7,15),(2,1,20),(2,3,15),(3,4,100),(3,9,90),(4,4,50),(5,1,50),(5,2,60),(5,3,55),(5,8,70),(6,1,30),(6,2,25),(6,8,35),(7,6,5),(7,7,10),(7,10,8),(8,6,20),(8,10,25),(9,4,40),(9,5,60),(10,5,80),(10,9,70);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeid` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`packageTypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'Food'),(2,'Basic Medical'),(3,'Child Care');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListid` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(50) NOT NULL,
  `packingListDescription` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`packingListid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Medical Support','prepare for: bandages,pain relivers,antiseptic wipes,Gauze Pads'),(2,'Food Supply','Emergency food supply: compressed biscuits, bottled water, canned beef'),(3,'Child Care','Prepare child care essentials: toys, baby formula, diaper');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListid` int DEFAULT NULL,
  `taskTypeid` int NOT NULL,
  `taskStatusid` int NOT NULL,
  `taskDescription` varchar(500) NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `packingListid` (`packingListid`),
  KEY `taskTypeid` (`taskTypeid`),
  KEY `taskStatusid` (`taskStatusid`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`packingListid`) REFERENCES `packing_list` (`packingListid`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`taskTypeid`) REFERENCES `taskType` (`taskTypeid`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`taskStatusid`) REFERENCES `taskStatus` (`taskStatusid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,2,1,1,'Prepare 5000 food packages for hurricane relief'),(2,1,1,2,'Assemble 3000 medical kits for emergency shelters'),(3,3,1,2,'Prepare 2000 child-care packages for displaced families'),(4,NULL,2,2,'Answer disaster hotline calls and provide assistance'),(5,NULL,2,3,'Coordinate volunteer schedules for next week'),(6,NULL,3,2,'Deliver relief packages to local distribution centers'),(7,2,1,1,'Pack additional 1500 food packages for new affected area'),(8,1,1,1,'Prepare 500 medical supply kits for field hospitals'),(9,3,1,1,'Assemble 1000 baby care packages for shelters'),(10,NULL,3,1,'Transport medical supplies to remote clinics');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskStatus`
--

DROP TABLE IF EXISTS `taskStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskStatus` (
  `taskStatusid` int NOT NULL,
  `taskstatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskStatus`
--

LOCK TABLES `taskStatus` WRITE;
/*!40000 ALTER TABLE `taskStatus` DISABLE KEYS */;
INSERT INTO `taskStatus` VALUES (1,'Open'),(2,'Ongoing'),(3,'Completed'),(4,'Cancelled');
/*!40000 ALTER TABLE `taskStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskType`
--

DROP TABLE IF EXISTS `taskType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskType` (
  `taskTypeid` int NOT NULL,
  `taskTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskTypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskType`
--

LOCK TABLES `taskType` WRITE;
/*!40000 ALTER TABLE `taskType` DISABLE KEYS */;
INSERT INTO `taskType` VALUES (1,'Packing'),(2,'Delivery'),(3,'Recurring');
/*!40000 ALTER TABLE `taskType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerid` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(50) NOT NULL,
  `volunteerAddress` varchar(300) DEFAULT NULL,
  `volunteerTelephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`volunteerid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Abel Ma','309 fifth avenue, Manhattan, NY','9296894927'),(2,'Rainie Yi','181 Mercer Street, Manhattan, NY','9296874031'),(3,'Sarah Liu','181 Mercer Street, Manhattan, NY','92948326403'),(4,'Allen Guo','252 South Street,Manhattan, NY','92943312495'),(5,'Florence Wang','309 fifth avenue, Manhattan, NY','92965042383'),(6,'Emma Wang','1 MetroTech center, Brooklyn,NY','9296832407'),(7,'Lisa Bai','5350 Toscana Way, La Jolla, CA','6195452369'),(8,'Jimbo Yu','450 West 42nd Street, Manhattan,NY','9296824001'),(9,'Bodie Li','201 Park Ave S, Manhattan,NY','92963045677'),(10,'Rachel Wan','123 Main St,New Jersey,NY','9296533844');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-16  1:20:35
