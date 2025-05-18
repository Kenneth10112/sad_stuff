-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: digiledger2
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add contact information',1,'add_contactinformation'),(2,'Can change contact information',1,'change_contactinformation'),(3,'Can delete contact information',1,'delete_contactinformation'),(4,'Can view contact information',1,'view_contactinformation'),(5,'Can add entity type',2,'add_entitytype'),(6,'Can change entity type',2,'change_entitytype'),(7,'Can delete entity type',2,'delete_entitytype'),(8,'Can view entity type',2,'view_entitytype'),(9,'Can add login credential',3,'add_logincredential'),(10,'Can change login credential',3,'change_logincredential'),(11,'Can delete login credential',3,'delete_logincredential'),(12,'Can view login credential',3,'view_logincredential'),(13,'Can add record account',4,'add_recordaccount'),(14,'Can change record account',4,'change_recordaccount'),(15,'Can delete record account',4,'delete_recordaccount'),(16,'Can view record account',4,'view_recordaccount'),(17,'Can add section',5,'add_section'),(18,'Can change section',5,'change_section'),(19,'Can delete section',5,'delete_section'),(20,'Can view section',5,'view_section'),(21,'Can add digiledger user',6,'add_digiledgeruser'),(22,'Can change digiledger user',6,'change_digiledgeruser'),(23,'Can delete digiledger user',6,'delete_digiledgeruser'),(24,'Can view digiledger user',6,'view_digiledgeruser'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add transaction',8,'add_transaction'),(30,'Can change transaction',8,'change_transaction'),(31,'Can delete transaction',8,'delete_transaction'),(32,'Can view transaction',8,'view_transaction'),(33,'Can add transaction source',9,'add_transactionsource'),(34,'Can change transaction source',9,'change_transactionsource'),(35,'Can delete transaction source',9,'delete_transactionsource'),(36,'Can view transaction source',9,'view_transactionsource'),(37,'Can add question',10,'add_question'),(38,'Can change question',10,'change_question'),(39,'Can delete question',10,'delete_question'),(40,'Can view question',10,'view_question'),(41,'Can add choice',11,'add_choice'),(42,'Can change choice',11,'change_choice'),(43,'Can delete choice',11,'delete_choice'),(44,'Can view choice',11,'view_choice'),(45,'Can add log entry',12,'add_logentry'),(46,'Can change log entry',12,'change_logentry'),(47,'Can delete log entry',12,'delete_logentry'),(48,'Can view log entry',12,'view_logentry'),(49,'Can add permission',13,'add_permission'),(50,'Can change permission',13,'change_permission'),(51,'Can delete permission',13,'delete_permission'),(52,'Can view permission',13,'view_permission'),(53,'Can add group',14,'add_group'),(54,'Can change group',14,'change_group'),(55,'Can delete group',14,'delete_group'),(56,'Can view group',14,'view_group'),(57,'Can add user',15,'add_user'),(58,'Can change user',15,'change_user'),(59,'Can delete user',15,'delete_user'),(60,'Can view user',15,'view_user'),(61,'Can add content type',16,'add_contenttype'),(62,'Can change content type',16,'change_contenttype'),(63,'Can delete content type',16,'delete_contenttype'),(64,'Can view content type',16,'view_contenttype'),(65,'Can add session',17,'add_session'),(66,'Can change session',17,'change_session'),(67,'Can delete session',17,'delete_session'),(68,'Can view session',17,'view_session'),(69,'Can add record account group',18,'add_recordaccountgroup'),(70,'Can change record account group',18,'change_recordaccountgroup'),(71,'Can delete record account group',18,'delete_recordaccountgroup'),(72,'Can view record account group',18,'view_recordaccountgroup'),(73,'Can add record statement group',19,'add_recordstatementgroup'),(74,'Can change record statement group',19,'change_recordstatementgroup'),(75,'Can delete record statement group',19,'delete_recordstatementgroup'),(76,'Can view record statement group',19,'view_recordstatementgroup'),(77,'Can add record type',20,'add_recordtype'),(78,'Can change record type',20,'change_recordtype'),(79,'Can delete record type',20,'delete_recordtype'),(80,'Can view record type',20,'view_recordtype'),(81,'Can add integrated systems',21,'add_integratedsystems'),(82,'Can change integrated systems',21,'change_integratedsystems'),(83,'Can delete integrated systems',21,'delete_integratedsystems'),(84,'Can view integrated systems',21,'view_integratedsystems'),(85,'Can add integrated system',21,'add_integratedsystem'),(86,'Can change integrated system',21,'change_integratedsystem'),(87,'Can delete integrated system',21,'delete_integratedsystem'),(88,'Can view integrated system',21,'view_integratedsystem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$aI2VnaLYf1jcKU0Kfois7l$1gpL5cQ1WUkBJ35cRostvgVV+VDOiu2p5v6Xis4St28=','2025-05-18 04:04:25.706328',1,'qwer','','','',1,1,'2025-05-06 04:43:04.904531');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_contactinformation`
--

DROP TABLE IF EXISTS `digiledger_contactinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_contactinformation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_contactinformation`
--

LOCK TABLES `digiledger_contactinformation` WRITE;
/*!40000 ALTER TABLE `digiledger_contactinformation` DISABLE KEYS */;
INSERT INTO `digiledger_contactinformation` VALUES (1,'email@site.com','09123456789'),(2,'kennethamboya101@gmail.com','+639457818690');
/*!40000 ALTER TABLE `digiledger_contactinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_digiledgeruser`
--

DROP TABLE IF EXISTS `digiledger_digiledgeruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_digiledgeruser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_information_id` bigint NOT NULL,
  `entity_type_id` bigint NOT NULL,
  `login_credentials_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_information_id` (`contact_information_id`),
  UNIQUE KEY `login_credentials_id` (`login_credentials_id`),
  KEY `digiledger_digiledge_entity_type_id_7cdd3e4c_fk_digiledge` (`entity_type_id`),
  CONSTRAINT `digiledger_digiledge_contact_information__5f8b6ec5_fk_digiledge` FOREIGN KEY (`contact_information_id`) REFERENCES `digiledger_contactinformation` (`id`),
  CONSTRAINT `digiledger_digiledge_entity_type_id_7cdd3e4c_fk_digiledge` FOREIGN KEY (`entity_type_id`) REFERENCES `digiledger_entitytype` (`id`),
  CONSTRAINT `digiledger_digiledge_login_credentials_id_5e33f909_fk_digiledge` FOREIGN KEY (`login_credentials_id`) REFERENCES `digiledger_logincredential` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_digiledgeruser`
--

LOCK TABLES `digiledger_digiledgeruser` WRITE;
/*!40000 ALTER TABLE `digiledger_digiledgeruser` DISABLE KEYS */;
INSERT INTO `digiledger_digiledgeruser` VALUES (1,'arvey',1,1,1),(2,'kenneth',2,2,2);
/*!40000 ALTER TABLE `digiledger_digiledgeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_entitytype`
--

DROP TABLE IF EXISTS `digiledger_entitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_entitytype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_name` (`entity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_entitytype`
--

LOCK TABLES `digiledger_entitytype` WRITE;
/*!40000 ALTER TABLE `digiledger_entitytype` DISABLE KEYS */;
INSERT INTO `digiledger_entitytype` VALUES (1,'Admin'),(2,'Cashier'),(3,'Manager'),(4,'Owner');
/*!40000 ALTER TABLE `digiledger_entitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_integratedsystem`
--

DROP TABLE IF EXISTS `digiledger_integratedsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_integratedsystem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sysName` varchar(255) NOT NULL,
  `url_link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_integratedsystem`
--

LOCK TABLES `digiledger_integratedsystem` WRITE;
/*!40000 ALTER TABLE `digiledger_integratedsystem` DISABLE KEYS */;
INSERT INTO `digiledger_integratedsystem` VALUES (1,'Point of Sale','digiledger:dashboard'),(2,'Digiledger','digiledger:dashboard'),(3,'Expense Management System','digiledger:dashboard');
/*!40000 ALTER TABLE `digiledger_integratedsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_logincredential`
--

DROP TABLE IF EXISTS `digiledger_logincredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_logincredential` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_logincredential`
--

LOCK TABLES `digiledger_logincredential` WRITE;
/*!40000 ALTER TABLE `digiledger_logincredential` DISABLE KEYS */;
INSERT INTO `digiledger_logincredential` VALUES (1,'arvey','arveypogi'),(2,'kenneth','amboya');
/*!40000 ALTER TABLE `digiledger_logincredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_permission`
--

DROP TABLE IF EXISTS `digiledger_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_type_id` bigint NOT NULL,
  `system_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `digiledger_permissio_entity_type_id_6d4e62c7_fk_digiledge` (`entity_type_id`),
  KEY `digiledger_permissio_system_id_3bd4db81_fk_digiledge` (`system_id`),
  CONSTRAINT `digiledger_permissio_entity_type_id_6d4e62c7_fk_digiledge` FOREIGN KEY (`entity_type_id`) REFERENCES `digiledger_entitytype` (`id`),
  CONSTRAINT `digiledger_permissio_system_id_3bd4db81_fk_digiledge` FOREIGN KEY (`system_id`) REFERENCES `digiledger_integratedsystem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_permission`
--

LOCK TABLES `digiledger_permission` WRITE;
/*!40000 ALTER TABLE `digiledger_permission` DISABLE KEYS */;
INSERT INTO `digiledger_permission` VALUES (3,1,1),(4,1,2),(7,3,1),(8,3,2),(9,3,3),(10,4,3),(11,4,2),(12,4,1),(13,1,3);
/*!40000 ALTER TABLE `digiledger_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_recordaccount`
--

DROP TABLE IF EXISTS `digiledger_recordaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_recordaccount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL,
  `record_type_id` bigint NOT NULL,
  `statement_group_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_name` (`account_name`),
  KEY `digiledger_recordacc_record_type_id_a9ae8cb6_fk_digiledge` (`record_type_id`),
  KEY `digiledger_recordacc_statement_group_id_46574c50_fk_digiledge` (`statement_group_id`),
  CONSTRAINT `digiledger_recordacc_record_type_id_a9ae8cb6_fk_digiledge` FOREIGN KEY (`record_type_id`) REFERENCES `digiledger_recordtype` (`id`),
  CONSTRAINT `digiledger_recordacc_statement_group_id_46574c50_fk_digiledge` FOREIGN KEY (`statement_group_id`) REFERENCES `digiledger_recordstatementgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_recordaccount`
--

LOCK TABLES `digiledger_recordaccount` WRITE;
/*!40000 ALTER TABLE `digiledger_recordaccount` DISABLE KEYS */;
INSERT INTO `digiledger_recordaccount` VALUES (13,'Cash',3,1),(14,'Accounts Receivable',3,1),(15,'Inventory',3,1),(16,'Prepaid Expenses',3,1),(17,'Land, Buildings, and Equipment',3,1),(18,'Accounts Payable',4,1),(19,'Notes Payable',4,1),(20,'Wages Payable',4,1),(21,'Common Stock',5,1),(22,'Retained Earnings',5,1),(23,'Sales revenue',6,2),(24,'Service fee',6,2),(25,'Salaries Expense',2,2),(26,'Rent Expense',2,2),(28,'Cost of Goods Sold',2,2);
/*!40000 ALTER TABLE `digiledger_recordaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_recordstatementgroup`
--

DROP TABLE IF EXISTS `digiledger_recordstatementgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_recordstatementgroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_recordstatementgroup`
--

LOCK TABLES `digiledger_recordstatementgroup` WRITE;
/*!40000 ALTER TABLE `digiledger_recordstatementgroup` DISABLE KEYS */;
INSERT INTO `digiledger_recordstatementgroup` VALUES (1,'Balance Sheet'),(3,'Cash Flow'),(2,'Income Statement'),(4,'Others');
/*!40000 ALTER TABLE `digiledger_recordstatementgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_recordtype`
--

DROP TABLE IF EXISTS `digiledger_recordtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_recordtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_recordtype`
--

LOCK TABLES `digiledger_recordtype` WRITE;
/*!40000 ALTER TABLE `digiledger_recordtype` DISABLE KEYS */;
INSERT INTO `digiledger_recordtype` VALUES (3,'Assets'),(5,'Equity'),(2,'Expenses'),(4,'Liabilities'),(6,'Revenue');
/*!40000 ALTER TABLE `digiledger_recordtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_section`
--

DROP TABLE IF EXISTS `digiledger_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_section` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_name` (`section_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_section`
--

LOCK TABLES `digiledger_section` WRITE;
/*!40000 ALTER TABLE `digiledger_section` DISABLE KEYS */;
INSERT INTO `digiledger_section` VALUES (1,'General');
/*!40000 ALTER TABLE `digiledger_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_transaction`
--

DROP TABLE IF EXISTS `digiledger_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(255) NOT NULL,
  `mon_val` decimal(10,2) NOT NULL,
  `ent_date` datetime(6) NOT NULL,
  `ent_by_id` bigint DEFAULT NULL,
  `section_id` bigint NOT NULL,
  `destination_id` bigint NOT NULL,
  `dsc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_id` (`ref_id`),
  KEY `digiledger_transacti_section_id_10afb4cd_fk_digiledge` (`section_id`),
  KEY `digiledger_transacti_ent_by_id_c7c70371_fk_digiledge` (`ent_by_id`),
  KEY `digiledger_transacti_destination_id_0f76e8fc_fk_digiledge` (`destination_id`),
  CONSTRAINT `digiledger_transacti_destination_id_0f76e8fc_fk_digiledge` FOREIGN KEY (`destination_id`) REFERENCES `digiledger_recordaccount` (`id`),
  CONSTRAINT `digiledger_transacti_ent_by_id_c7c70371_fk_digiledge` FOREIGN KEY (`ent_by_id`) REFERENCES `digiledger_digiledgeruser` (`id`),
  CONSTRAINT `digiledger_transacti_section_id_10afb4cd_fk_digiledge` FOREIGN KEY (`section_id`) REFERENCES `digiledger_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_transaction`
--

LOCK TABLES `digiledger_transaction` WRITE;
/*!40000 ALTER TABLE `digiledger_transaction` DISABLE KEYS */;
INSERT INTO `digiledger_transaction` VALUES (26,'1',5000.00,'2025-05-17 13:35:58.586109',1,1,13,'Owner\'s investment'),(27,'2',1000.00,'2025-05-17 13:37:12.081214',1,1,15,'Purchased Supplies on Credit'),(30,'3',500.00,'2025-05-17 14:23:10.718697',1,1,26,'paid for a month of rent'),(31,'4',800.00,'2025-05-17 14:25:10.087165',1,1,13,'Received cash for services'),(33,'5',1800.00,'2025-05-17 14:26:26.646345',1,1,13,'Received cash for craft sales'),(34,'6',1200.00,'2025-05-17 14:27:11.189278',1,1,28,'Cost of crafts sold'),(36,'7',500.00,'2025-05-17 14:38:08.805541',1,1,17,'Partial cash payment for equipment'),(37,'8',1500.00,'2025-05-17 14:40:20.952430',1,1,17,'Long-term debt for equipment'),(38,'9',300.00,'2025-05-17 14:41:55.794587',1,1,18,'Partial payment to Crafty Suppliers'),(39,'10',600.00,'2025-05-17 14:42:32.773710',1,1,14,'Services provided on credit'),(40,'11',800.00,'2025-05-17 14:43:11.939073',1,1,25,'Paid salaries for first half of June'),(41,'12',400.00,'2025-05-17 14:43:50.741205',1,1,13,'Received cash from client on account'),(42,'13',150.00,'2025-05-17 14:46:32.007949',1,1,16,'Paid for three months of advertising in advance'),(43,'14',50.00,'2025-05-17 14:48:20.152517',1,1,20,'Wages incurred but not yet paid'),(44,'15',1500.00,'2025-05-17 14:54:47.546279',1,1,14,'Crafts sold on credit'),(45,'16',900.00,'2025-05-17 14:55:34.507816',1,1,28,'Cost of crafts sold on credit'),(47,'17',1100.00,'2025-05-17 15:13:20.341243',1,1,15,'restock');
/*!40000 ALTER TABLE `digiledger_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digiledger_transactionsource`
--

DROP TABLE IF EXISTS `digiledger_transactionsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digiledger_transactionsource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mon_val` decimal(10,2) NOT NULL,
  `source_account_id` bigint NOT NULL,
  `transaction_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `digiledger_transactionso_transaction_id_source_ac_3fc13604_uniq` (`transaction_id`,`source_account_id`),
  KEY `digiledger_transacti_source_account_id_f06ba54f_fk_digiledge` (`source_account_id`),
  CONSTRAINT `digiledger_transacti_source_account_id_f06ba54f_fk_digiledge` FOREIGN KEY (`source_account_id`) REFERENCES `digiledger_recordaccount` (`id`),
  CONSTRAINT `digiledger_transacti_transaction_id_a77ae880_fk_digiledge` FOREIGN KEY (`transaction_id`) REFERENCES `digiledger_transaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_transactionsource`
--

LOCK TABLES `digiledger_transactionsource` WRITE;
/*!40000 ALTER TABLE `digiledger_transactionsource` DISABLE KEYS */;
INSERT INTO `digiledger_transactionsource` VALUES (27,5000.00,21,26),(28,1000.00,18,27),(31,500.00,13,30),(32,800.00,24,31),(33,1800.00,23,33),(34,1200.00,15,34),(35,500.00,13,36),(36,1500.00,19,37),(37,300.00,13,38),(38,600.00,24,39),(39,800.00,13,40),(40,400.00,14,41),(41,150.00,13,42),(42,50.00,25,43),(43,1500.00,23,44),(44,900.00,15,45),(45,1100.00,13,47);
/*!40000 ALTER TABLE `digiledger_transactionsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-06 04:44:08.258851','1','admin',1,'[{\"added\": {}}]',2,1),(2,'2025-05-06 04:44:16.337519','1','arvey',1,'[{\"added\": {}}]',3,1),(3,'2025-05-06 04:44:32.017725','1','arvey',2,'[]',3,1),(4,'2025-05-06 04:44:35.032730','1','arvey',2,'[]',3,1),(5,'2025-05-06 04:45:15.024778','1','email@site.com',1,'[{\"added\": {}}]',1,1),(6,'2025-05-06 04:45:18.558958','1','arvey',1,'[{\"added\": {}}]',6,1),(7,'2025-05-06 04:55:49.302030','1','General',1,'[{\"added\": {}}]',5,1),(8,'2025-05-11 13:35:41.848372','1','Assets',1,'[{\"added\": {}}]',18,1),(9,'2025-05-11 13:35:55.606848','2','Dividends',1,'[{\"added\": {}}]',18,1),(10,'2025-05-11 13:36:02.246057','3','Expenses',1,'[{\"added\": {}}]',18,1),(11,'2025-05-11 13:36:10.203585','4','Liabilities',1,'[{\"added\": {}}]',18,1),(12,'2025-05-11 13:36:17.214103','5','Equity',1,'[{\"added\": {}}]',18,1),(13,'2025-05-11 13:36:27.299892','6','Revenue',1,'[{\"added\": {}}]',18,1),(14,'2025-05-11 13:51:53.659441','12','Food Expense',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(15,'2025-05-11 13:52:02.406880','11','Account Payable',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(16,'2025-05-11 13:52:06.609616','10','Advertising Expense',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(17,'2025-05-11 13:56:34.709878','9','Account Receivable',2,'[]',4,1),(18,'2025-05-11 13:56:38.575907','8','Service Expense',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(19,'2025-05-11 13:56:44.934908','7','Utilities Expense',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(20,'2025-05-11 13:57:11.199162','6','Supplies Expense',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(21,'2025-05-11 13:57:13.874580','7','Utilities Expense',2,'[]',4,1),(22,'2025-05-11 13:57:18.212329','5','Rent Expense',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(23,'2025-05-11 13:57:22.455161','4','Permit Expense',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(24,'2025-05-11 13:57:27.887136','3','Equipment Expense',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(25,'2025-05-11 13:58:50.293266','2','Owner Capital',2,'[{\"changed\": {\"fields\": [\"Account group\"]}}]',4,1),(26,'2025-05-13 10:56:00.403485','1','Dividends',1,'[{\"added\": {}}]',20,1),(27,'2025-05-13 10:57:53.115550','2','Expenses',1,'[{\"added\": {}}]',20,1),(28,'2025-05-13 10:58:47.075820','3','Assets',1,'[{\"added\": {}}]',20,1),(29,'2025-05-13 10:58:56.310781','4','Liabilities',1,'[{\"added\": {}}]',20,1),(30,'2025-05-13 10:59:07.391273','5','Equity',1,'[{\"added\": {}}]',20,1),(31,'2025-05-13 10:59:12.323109','6','Revenue',1,'[{\"added\": {}}]',20,1),(32,'2025-05-13 11:02:49.637479','1','Balance Sheet',1,'[{\"added\": {}}]',19,1),(33,'2025-05-13 11:03:14.326590','2','Income Statement',1,'[{\"added\": {}}]',19,1),(34,'2025-05-13 11:03:46.913559','3','Cash Flow',1,'[{\"added\": {}}]',19,1),(35,'2025-05-13 12:33:11.592314','12','Food Expense',2,'[{\"changed\": {\"fields\": [\"Record type\"]}}]',4,1),(36,'2025-05-13 12:33:16.370463','11','Account Payable',2,'[{\"changed\": {\"fields\": [\"Record type\"]}}]',4,1),(37,'2025-05-13 12:33:26.479269','10','Advertising Expense',2,'[]',4,1),(38,'2025-05-16 04:57:02.826928','12','Food Expense',3,'',4,1),(39,'2025-05-16 04:57:02.826928','11','Account Payable',3,'',4,1),(40,'2025-05-16 04:57:02.826928','10','Advertising Expense',3,'',4,1),(41,'2025-05-16 04:57:02.826928','9','Account Receivable',3,'',4,1),(42,'2025-05-16 04:57:02.826928','8','Service Expense',3,'',4,1),(43,'2025-05-16 04:57:02.826928','7','Utilities Expense',3,'',4,1),(44,'2025-05-16 04:57:02.826928','6','Supplies Expense',3,'',4,1),(45,'2025-05-16 04:57:02.826928','5','Rent Expense',3,'',4,1),(46,'2025-05-16 04:57:02.826928','4','Permit Expense',3,'',4,1),(47,'2025-05-16 04:57:02.826928','3','Equipment Expense',3,'',4,1),(48,'2025-05-16 04:57:02.826928','2','Owner Capital',3,'',4,1),(49,'2025-05-16 04:57:02.826928','1','Cash',3,'',4,1),(50,'2025-05-16 05:49:12.599367','1','Dividends',3,'',20,1),(51,'2025-05-16 09:45:17.394467','13','Cash',1,'[{\"added\": {}}]',4,1),(52,'2025-05-16 09:45:35.674709','14','Accounts Receivable',1,'[{\"added\": {}}]',4,1),(53,'2025-05-16 09:45:54.457715','15','Supplies',1,'[{\"added\": {}}]',4,1),(54,'2025-05-16 09:46:07.931414','16','Prepaid Expenses',1,'[{\"added\": {}}]',4,1),(55,'2025-05-16 09:46:54.743587','17','Land, Buildings, and Equipment',1,'[{\"added\": {}}]',4,1),(56,'2025-05-16 09:47:35.955780','18','Accounts Payable',1,'[{\"added\": {}}]',4,1),(57,'2025-05-16 09:51:12.181431','19','Notes Payable',1,'[{\"added\": {}}]',4,1),(58,'2025-05-16 11:49:51.465333','20','Wages Payable',1,'[{\"added\": {}}]',4,1),(59,'2025-05-16 12:52:22.956551','21','Common Stock',1,'[{\"added\": {}}]',4,1),(60,'2025-05-16 12:52:47.764105','22','Retained Earnings',1,'[{\"added\": {}}]',4,1),(61,'2025-05-16 12:57:08.924530','4','Others',1,'[{\"added\": {}}]',19,1),(62,'2025-05-16 12:58:46.845913','23','Sales revenue',1,'[{\"added\": {}}]',4,1),(63,'2025-05-16 12:59:08.276311','24','Service fee',1,'[{\"added\": {}}]',4,1),(64,'2025-05-16 12:59:42.955763','25','Salaries Expense',1,'[{\"added\": {}}]',4,1),(65,'2025-05-16 12:59:54.786251','26','Rent Expense',1,'[{\"added\": {}}]',4,1),(66,'2025-05-16 13:00:20.398637','27','Depreciation Expense',1,'[{\"added\": {}}]',4,1),(67,'2025-05-17 13:33:37.222227','27','Depreciation Expense',3,'',4,1),(68,'2025-05-17 13:33:51.605545','25','Txn 3 - 2000.00 on 2025-05-17 05:55:28',3,'',8,1),(69,'2025-05-17 13:33:51.605545','24','Txn 2 - 5000.00 on 2025-05-17 05:55:03',3,'',8,1),(70,'2025-05-17 13:33:51.605545','23','Txn 1 - 12323.00 on 2025-05-17 05:53:52',3,'',8,1),(71,'2025-05-17 13:56:49.885302','29','Txn 4 - 800.00 on 2025-05-17 13:40:40',3,'',8,1),(72,'2025-05-17 13:56:49.885302','28','Txn 3 - 500.00 on 2025-05-17 13:39:32',3,'',8,1),(73,'2025-05-17 14:19:46.086417','15','Inventory',2,'[{\"changed\": {\"fields\": [\"Account name\"]}}]',4,1),(74,'2025-05-17 14:20:53.759167','28','Cost of Goods Sold',1,'[{\"added\": {}}]',4,1),(75,'2025-05-18 04:37:07.072267','2','Cashier',1,'[{\"added\": {}}]',2,1),(76,'2025-05-18 04:37:29.412947','3','Manager',1,'[{\"added\": {}}]',2,1),(77,'2025-05-18 04:37:41.361115','4','Owner',1,'[{\"added\": {}}]',2,1),(78,'2025-05-18 04:37:47.899177','1','Admin',2,'[{\"changed\": {\"fields\": [\"Entity name\"]}}]',2,1),(79,'2025-05-18 05:06:58.432729','1','IntegratedSystem object (1)',1,'[{\"added\": {}}]',21,1),(80,'2025-05-18 05:08:24.180555','2','IntegratedSystem object (2)',1,'[{\"added\": {}}]',21,1),(81,'2025-05-18 05:09:34.831854','3','IntegratedSystem object (3)',1,'[{\"added\": {}}]',21,1),(82,'2025-05-18 05:10:14.225224','1','Point of Sale',2,'[{\"changed\": {\"fields\": [\"SysName\"]}}]',21,1),(83,'2025-05-18 05:10:25.519492','3','Expense Management System',2,'[{\"changed\": {\"fields\": [\"SysName\"]}}]',21,1),(84,'2025-05-18 05:15:19.444732','3','Ent: Admin Sys: Point of Sale',1,'[{\"added\": {}}]',7,1),(85,'2025-05-18 05:15:23.331314','4','Ent: Admin Sys: Digiledger',1,'[{\"added\": {}}]',7,1),(86,'2025-05-18 05:15:26.235915','5','Ent: Admin Sys: Expense Management System',1,'[{\"added\": {}}]',7,1),(87,'2025-05-18 05:15:29.190125','6','Ent: Cashier Sys: Point of Sale',1,'[{\"added\": {}}]',7,1),(88,'2025-05-18 05:15:32.095343','7','Ent: Manager Sys: Point of Sale',1,'[{\"added\": {}}]',7,1),(89,'2025-05-18 05:15:35.276914','8','Ent: Manager Sys: Digiledger',1,'[{\"added\": {}}]',7,1),(90,'2025-05-18 05:15:39.785086','9','Ent: Manager Sys: Expense Management System',1,'[{\"added\": {}}]',7,1),(91,'2025-05-18 05:15:49.705381','10','Ent: Owner Sys: Expense Management System',1,'[{\"added\": {}}]',7,1),(92,'2025-05-18 05:15:56.360341','11','Ent: Owner Sys: Digiledger',1,'[{\"added\": {}}]',7,1),(93,'2025-05-18 05:16:02.654937','12','Ent: Owner Sys: Point of Sale',1,'[{\"added\": {}}]',7,1),(94,'2025-05-18 05:51:00.885055','2','kenneth',1,'[{\"added\": {}}]',3,1),(95,'2025-05-18 05:51:19.878994','2','kennethamboya101@gmail.com',1,'[{\"added\": {}}]',1,1),(96,'2025-05-18 05:51:36.386978','2','kenneth',1,'[{\"added\": {}}]',6,1),(97,'2025-05-18 05:54:33.545039','2','kenneth',2,'[]',6,1),(98,'2025-05-18 06:28:29.324420','2','Digiledger',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(99,'2025-05-18 06:30:38.020482','2','Digiledger',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(100,'2025-05-18 06:32:02.637484','2','Digiledger',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(101,'2025-05-18 06:32:36.299343','2','Digiledger',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(102,'2025-05-18 06:44:56.857815','2','Digiledger',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(103,'2025-05-18 06:50:25.779191','2','Digiledger',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(104,'2025-05-18 07:22:44.239363','2','Digiledger',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(105,'2025-05-18 07:22:48.202867','3','Expense Management System',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(106,'2025-05-18 07:22:51.341936','1','Point of Sale',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(107,'2025-05-18 07:27:55.994366','2','Digiledger',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(108,'2025-05-18 07:28:03.079734','3','Expense Management System',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(109,'2025-05-18 07:28:07.076958','1','Point of Sale',2,'[{\"changed\": {\"fields\": [\"Url link\"]}}]',21,1),(110,'2025-05-18 07:34:50.580699','5','Ent: Admin Sys: Expense Management System',3,'',7,1),(111,'2025-05-18 07:36:31.752300','13','Ent: Admin Sys: Expense Management System',1,'[{\"added\": {}}]',7,1),(112,'2025-05-18 07:37:05.328957','14','Ent: Cashier Sys: Expense Management System',1,'[{\"added\": {}}]',7,1),(113,'2025-05-18 07:37:21.267018','14','Ent: Cashier Sys: Expense Management System',3,'',7,1),(114,'2025-05-18 07:40:27.139916','6','Ent: Cashier Sys: Point of Sale',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'admin','logentry'),(14,'auth','group'),(13,'auth','permission'),(15,'auth','user'),(16,'contenttypes','contenttype'),(1,'digiledger','contactinformation'),(6,'digiledger','digiledgeruser'),(2,'digiledger','entitytype'),(21,'digiledger','integratedsystem'),(3,'digiledger','logincredential'),(7,'digiledger','permission'),(4,'digiledger','recordaccount'),(18,'digiledger','recordaccountgroup'),(19,'digiledger','recordstatementgroup'),(20,'digiledger','recordtype'),(5,'digiledger','section'),(8,'digiledger','transaction'),(9,'digiledger','transactionsource'),(11,'polls','choice'),(10,'polls','question'),(17,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'digiledger','0001_initial','2025-05-06 04:38:53.804791'),(2,'digiledger','0002_rename_entry_by_transaction_ent_by_and_more','2025-05-06 04:38:54.376857'),(3,'digiledger','0003_remove_transaction_side','2025-05-06 04:38:54.404906'),(4,'digiledger','0004_transaction_dsc','2025-05-06 04:38:54.443557'),(5,'digiledger','0005_remove_transaction_source','2025-05-06 04:38:54.537131'),(6,'digiledger','0006_transactionsource','2025-05-06 04:38:54.725166'),(7,'contenttypes','0001_initial','2025-05-06 04:42:04.515159'),(8,'auth','0001_initial','2025-05-06 04:42:05.315584'),(9,'admin','0001_initial','2025-05-06 04:42:05.527099'),(10,'admin','0002_logentry_remove_auto_add','2025-05-06 04:42:05.537533'),(11,'admin','0003_logentry_add_action_flag_choices','2025-05-06 04:42:05.549610'),(12,'contenttypes','0002_remove_content_type_name','2025-05-06 04:42:05.669716'),(13,'auth','0002_alter_permission_name_max_length','2025-05-06 04:42:05.757536'),(14,'auth','0003_alter_user_email_max_length','2025-05-06 04:42:05.787958'),(15,'auth','0004_alter_user_username_opts','2025-05-06 04:42:05.797040'),(16,'auth','0005_alter_user_last_login_null','2025-05-06 04:42:05.877746'),(17,'auth','0006_require_contenttypes_0002','2025-05-06 04:42:05.881119'),(18,'auth','0007_alter_validators_add_error_messages','2025-05-06 04:42:05.890146'),(19,'auth','0008_alter_user_username_max_length','2025-05-06 04:42:05.981053'),(20,'auth','0009_alter_user_last_name_max_length','2025-05-06 04:42:06.064442'),(21,'auth','0010_alter_group_name_max_length','2025-05-06 04:42:06.091935'),(22,'auth','0011_update_proxy_permissions','2025-05-06 04:42:06.109718'),(23,'auth','0012_alter_user_first_name_max_length','2025-05-06 04:42:06.192542'),(24,'polls','0001_initial','2025-05-06 04:42:06.310738'),(25,'sessions','0001_initial','2025-05-06 04:42:06.405759'),(26,'digiledger','0007_recordaccountgroup','2025-05-11 13:34:21.798975'),(27,'digiledger','0008_recordaccount_account_group','2025-05-11 13:51:15.203047'),(28,'digiledger','0009_remove_recordaccount_account_group_and_more','2025-05-13 09:58:19.965935'),(29,'digiledger','0010_recordstatementgroup_recordtype','2025-05-13 10:53:24.390554'),(30,'digiledger','0011_recordaccount_record_type_and_more','2025-05-13 11:12:26.137137'),(31,'digiledger','0012_permission_link','2025-05-18 04:32:18.405641'),(32,'digiledger','0013_integratedsystems_remove_permission_link_and_more','2025-05-18 04:40:52.421451'),(33,'digiledger','0014_rename_perm_name_integratedsystems_sysname_and_more','2025-05-18 05:00:24.276252'),(34,'digiledger','0015_rename_integratedsystems_integratedsystem','2025-05-18 05:05:44.445684'),(35,'digiledger','0016_permission_system','2025-05-18 05:11:53.445634');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('79t055o29d28fyssrluibn7cb2e07x18','eyJjdXJyZW50X3VzZXJfaWQiOjF9:1uGGlo:y-U0AsIW3zF_u-kmCi4Jhzvg8b3zJPWAAeOp0DThDwY','2025-05-31 12:36:04.516231'),('he5ov6kyfz3h8s6id7dz1is1b0fyye6y','eyJjdXJyZW50X3VzZXJfaWQiOjF9:1uEQ7C:elHTlOjqvStNERy2Ov3GHWoWFDiRtQ7Y4TuTaGQkKMo','2025-05-26 10:10:30.783498'),('hswfbi86ykwj9xaywlib3jwsb0bky9kq','eyJjdXJyZW50X3VzZXJfaWQiOjF9:1uFVUA:jXGD1sewo9P-sQR1NYBGuxE-li0r-G8paUAQr5a3Rns','2025-05-29 10:06:42.622511'),('isej2kwnhgsmtzim1mxg1lcju3ecsc2m','eyJjdXJyZW50X3VzZXJfaWQiOjF9:1uGJmT:HmLchdmECV0WHWDRRc-eSylsNsBaELCqS-zbqxpsLfw','2025-05-31 15:48:57.499360'),('nffaa5k5bkugp2hxcqhwe7061xonx7qs','.eJxVjEsKwzAMBe_idTGR_MHusvueISiS3PSDA06yKr17GwiUbGfmvbfhtTWtS7_O2vq7mDOcTE_rMv6JAXNgA_FT6ybkQfU2WZ7q0u6D3RK729leJ9HXZW8PByPN42-N6L0OmmPEnEvxrFDA5RgYo4uFHCbC3IkETEkTkEqA0Dkh8QyOzecL7po-zQ:1uGIMb:EBQoaa3slB7g3Qk03NKQ4irS98mWuwZISss2UcBu9wg','2025-05-31 14:18:09.692363'),('oc4gchxy0mbc0ofi3kccd8bl1wii7hal','.eJxVjEsKwzAMBe_idTGR_MHusvueISiS3PSDA06yKr17GwiUbGfmvbfhtTWtS7_O2vq7mDOcTE_rMv6JAXNgA_FT6ybkQfU2WZ7q0u6D3RK729leJ9HXZW8PByPN42-N6L0OmmPEnEvxrFDA5RgYo4uFHCbC3IkETEkTkEqA0Dkh8QyOzecL7po-zQ:1uGHg1:_X2GJ3k3PpIiOQ9Dq9EZxlqVDLdhRfJzO9kSlOB18_k','2025-05-31 13:34:09.712851'),('p2r9m5qbc9w3uq4n3fcwk698janlz2lo','.eJxVjs0KwjAQhN8lZwnd_JF49O4zhO3uxlYlhbQ9ie9uCwX1Ot_Mx7xUxnUZ8jpLyyOrswJ1-s16pIfUHfAd623SNNWljb3eK_qgs75OLM_L0f0TDDgP29oY56SXFIJJqRRHAgVsCp5MsKGgNRFN6pi9iVEioLAH31lGdgSWNimtrUldvl_h_QF26j7N:1uFV5u:fzgIrbFLty4Ano3sIhjSwuHR3fqqu30VRVIKSGA5bfI','2025-05-29 09:41:38.712291'),('u5quejkaj7gimch391c94dqpmst3ppo8','.eJxVjEsKwzAMBe_idTGR_MHusvueISiS3PSDA06yKr17GwiUbGfmvbfhtTWtS7_O2vq7mDOcTE_rMv6JAXNgA_FT6ybkQfU2WZ7q0u6D3RK729leJ9HXZW8PByPN42-N6L0OmmPEnEvxrFDA5RgYo4uFHCbC3IkETEkTkEqA0Dkh8QyOzecL7po-zQ:1uGE1e:traXqXM1nOPy9-R1OmXsq8Guyr8XNdDmjNRB6_lzOsw','2025-05-31 09:40:14.946075'),('v7js688avbc9h7raeaewgauzc82ftj2e','.eJxVjs0KwjAQhN8lZwnd_JF49O4zhO3uxlYlhbQ9ie9uCwX1Ot_Mx7xUxnUZ8jpLyyOrswJ1-s16pIfUHfAd623SNNWljb3eK_qgs75OLM_L0f0TDDgP29oY56SXFIJJqRRHAgVsCp5MsKGgNRFN6pi9iVEioLAH31lGdgSWNimtrUldvl_h_QF26j7N:1uCD4d:Z3PFW5wE3Kii_K3SpVLKgEGI2N1WQXYKyhPhv1-Tncg','2025-05-20 07:50:43.319961'),('ylnksjjad8wo2noyhv52yg0h83svru26','.eJxVjMsKgzAQRf8l6xLM5EHSZff9hjDOTKptiRB1Jf33VhCK23POvZuitTWpS15naXlkdYWLyrguw58oo06sR3pJ3QU_sT4mTVNd2tjrPdGHnfV9YnnfjvZ0MOA8_NYAzkkvKQRIqRRHYoqxKXiCYENBCxEhdcweYpRoUNgb31lGdmQsqc8X70Y-zg:1uGYZv:mrznNf9mt-Vbfma8skrusmsJM12cke3p5-Wf0ULCxt8','2025-06-01 07:36:59.976448');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_choice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`),
  CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_question`
--

DROP TABLE IF EXISTS `polls_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_question`
--

LOCK TABLES `polls_question` WRITE;
/*!40000 ALTER TABLE `polls_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 20:44:25
