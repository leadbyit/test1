CREATE DATABASE  IF NOT EXISTS `pharmacy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pharmacy`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pharmacy
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `AgencyID` int(11) NOT NULL AUTO_INCREMENT,
  `AgencyName` varchar(400) DEFAULT NULL,
  `TIN` varchar(100) DEFAULT NULL,
  `ContactName` varchar(200) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `Address` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`AgencyID`),
  UNIQUE KEY `TIN_UNIQUE` (`TIN`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Details of the Agencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'abc','55555555555','abc_ower','nandyal','9866486048','gdhsekjhkjwehukew f'),(2,'Sai','11111111111','Charan Sai','Nandyal','9866486048','19/178');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `BillID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) DEFAULT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `DoctorName` varchar(100) DEFAULT NULL,
  `TotalAmount` decimal(10,0) DEFAULT NULL,
  `BillDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_drugs`
--

DROP TABLE IF EXISTS `bill_drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_drugs` (
  `BillID` int(11) NOT NULL,
  `DrugID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPrice` decimal(10,0) DEFAULT NULL,
  `MfdDate` datetime DEFAULT NULL,
  `ExpDate` datetime DEFAULT NULL,
  `BatchId` varchar(100) DEFAULT NULL,
  `ScheduleNo` varchar(10) DEFAULT NULL,
  KEY `BillDrugs_Bill_idx` (`BillID`),
  KEY `BillDrugs_Drug_idx` (`DrugID`),
  CONSTRAINT `BillDrugs_Bill` FOREIGN KEY (`BillID`) REFERENCES `bill` (`BillID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BillDrugs_Drug` FOREIGN KEY (`DrugID`) REFERENCES `drug` (`DrugId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_drugs`
--

LOCK TABLES `bill_drugs` WRITE;
/*!40000 ALTER TABLE `bill_drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Priority` int(11) NOT NULL DEFAULT '5',
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'cust1','1544','2015-12-12 00:00:00','jjsdjskdj',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_drugs`
--

DROP TABLE IF EXISTS `customer_drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_drugs` (
  `CustomerID` int(11) NOT NULL,
  `DrugID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Discount` decimal(10,0) DEFAULT NULL,
  KEY `DRUG_idx` (`DrugID`),
  KEY `CUSTOMER_idx` (`CustomerID`),
  CONSTRAINT `CUSTOMER` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DRUG` FOREIGN KEY (`DrugID`) REFERENCES `drug` (`DrugId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_drugs`
--

LOCK TABLES `customer_drugs` WRITE;
/*!40000 ALTER TABLE `customer_drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorName` varchar(100) DEFAULT NULL,
  `HospitalID` int(11) NOT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `ResidenceNumber` varchar(45) DEFAULT NULL,
  `Designation` varchar(45) DEFAULT NULL,
  `PractitionerID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `Hospital_idx` (`HospitalID`),
  CONSTRAINT `Hospital` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`HospitalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug` (
  `DrugId` int(11) NOT NULL AUTO_INCREMENT,
  `DrugName` varchar(100) DEFAULT NULL,
  `Dosage` varchar(45) DEFAULT NULL,
  `Manufacturer` varchar(100) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Drug_Entry_Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DrugId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (1,'Acetaminophen','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(2,'Adderall','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(3,'Alprazolam','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(4,'Amitriptyline','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(5,'Amlodipine','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(6,'Amoxicillin','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(7,'Ativan','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(8,'Atorvastatin','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(9,'Azithromycin','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(10,'Ciprofloxacin','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(11,'Citalopram','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(12,'Clindamycin','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(13,'Clonazepam','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(14,'Codeine','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(15,'Cyclobenzaprine','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(16,'Cymbalta','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(17,'Doxycycline','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(18,'Gabapentin','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(19,'Hydrochlorothiazide','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(20,'Ibuprofen','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(21,'Lexapro','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(22,'Lisinopril','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(23,'Loratadine','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(24,'Lorazepam','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(25,'Losartan','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(26,'Lyrica','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(27,'Meloxicam','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(28,'Metformin','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(29,'Metoprolol','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(30,'Naproxen','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(31,'Omeprazole','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(32,'Oxycodone','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(33,'Pantoprazole','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(34,'Prednisone','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(35,'Tramadol','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(36,'Trazodone','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(37,'Viagra','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(38,'Wellbutrin','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(39,'Xanax','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(40,'Zoloft','160 mg','VALEANT','Used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers.',2,100,'2015-12-20 00:00:00'),(41,'colpal','as per physician','manufacturer','description',10,100,'2016-01-10 00:00:00');
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `HospitalID` int(11) NOT NULL AUTO_INCREMENT,
  `HospitalName` varchar(100) DEFAULT NULL,
  `HospitalAddress` varchar(200) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'hosp1','dsajkdhkjsahd','4465887');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `InvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `AgencyID` int(11) DEFAULT NULL,
  `InvoiceNumber` varchar(45) DEFAULT NULL,
  `InvoiceDate` datetime DEFAULT NULL,
  `InvoiceAmount` decimal(10,0) DEFAULT NULL,
  `AgentName` varchar(45) DEFAULT NULL,
  `CREATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Balance` decimal(10,0) DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`InvoiceID`),
  KEY `agency_idx` (`AgencyID`),
  CONSTRAINT `agency` FOREIGN KEY (`AgencyID`) REFERENCES `agency` (`AgencyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,1,'1','2015-12-12 00:00:00',454,'agent1','2015-12-12 00:00:00',454,'2015-12-12 00:00:00');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_drugs`
--

DROP TABLE IF EXISTS `invoice_drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_drugs` (
  `InvoiceID` int(11) DEFAULT NULL,
  `DrugID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL DEFAULT '1',
  `MfdDate` datetime DEFAULT NULL,
  `ExpDate` datetime DEFAULT NULL,
  `UnitCost` decimal(10,0) DEFAULT NULL,
  `UnitSellingPrice` decimal(10,0) DEFAULT NULL,
  `Offer` decimal(10,0) DEFAULT NULL,
  `Offer_Description` varchar(100) DEFAULT NULL,
  `BatchId` varchar(100) DEFAULT NULL,
  `MFR` varchar(100) DEFAULT NULL,
  KEY `invdrg_idx` (`InvoiceID`),
  KEY `invdrg_idx1` (`DrugID`),
  CONSTRAINT `invoice_drug` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `invoice_drug1` FOREIGN KEY (`DrugID`) REFERENCES `drug` (`DrugId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_drugs`
--

LOCK TABLES `invoice_drugs` WRITE;
/*!40000 ALTER TABLE `invoice_drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pharmacy'
--

--
-- Dumping routines for database 'pharmacy'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-17 20:00:04
