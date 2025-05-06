-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: digiledger2
-- ------------------------------------------------------
-- Server version	8.4.0

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add contact information',1,'add_contactinformation'),(2,'Can change contact information',1,'change_contactinformation'),(3,'Can delete contact information',1,'delete_contactinformation'),(4,'Can view contact information',1,'view_contactinformation'),(5,'Can add entity type',2,'add_entitytype'),(6,'Can change entity type',2,'change_entitytype'),(7,'Can delete entity type',2,'delete_entitytype'),(8,'Can view entity type',2,'view_entitytype'),(9,'Can add login credential',3,'add_logincredential'),(10,'Can change login credential',3,'change_logincredential'),(11,'Can delete login credential',3,'delete_logincredential'),(12,'Can view login credential',3,'view_logincredential'),(13,'Can add record account',4,'add_recordaccount'),(14,'Can change record account',4,'change_recordaccount'),(15,'Can delete record account',4,'delete_recordaccount'),(16,'Can view record account',4,'view_recordaccount'),(17,'Can add section',5,'add_section'),(18,'Can change section',5,'change_section'),(19,'Can delete section',5,'delete_section'),(20,'Can view section',5,'view_section'),(21,'Can add digiledger user',6,'add_digiledgeruser'),(22,'Can change digiledger user',6,'change_digiledgeruser'),(23,'Can delete digiledger user',6,'delete_digiledgeruser'),(24,'Can view digiledger user',6,'view_digiledgeruser'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add transaction',8,'add_transaction'),(30,'Can change transaction',8,'change_transaction'),(31,'Can delete transaction',8,'delete_transaction'),(32,'Can view transaction',8,'view_transaction'),(33,'Can add transaction source',9,'add_transactionsource'),(34,'Can change transaction source',9,'change_transactionsource'),(35,'Can delete transaction source',9,'delete_transactionsource'),(36,'Can view transaction source',9,'view_transactionsource'),(37,'Can add question',10,'add_question'),(38,'Can change question',10,'change_question'),(39,'Can delete question',10,'delete_question'),(40,'Can view question',10,'view_question'),(41,'Can add choice',11,'add_choice'),(42,'Can change choice',11,'change_choice'),(43,'Can delete choice',11,'delete_choice'),(44,'Can view choice',11,'view_choice'),(45,'Can add log entry',12,'add_logentry'),(46,'Can change log entry',12,'change_logentry'),(47,'Can delete log entry',12,'delete_logentry'),(48,'Can view log entry',12,'view_logentry'),(49,'Can add permission',13,'add_permission'),(50,'Can change permission',13,'change_permission'),(51,'Can delete permission',13,'delete_permission'),(52,'Can view permission',13,'view_permission'),(53,'Can add group',14,'add_group'),(54,'Can change group',14,'change_group'),(55,'Can delete group',14,'delete_group'),(56,'Can view group',14,'view_group'),(57,'Can add user',15,'add_user'),(58,'Can change user',15,'change_user'),(59,'Can delete user',15,'delete_user'),(60,'Can view user',15,'view_user'),(61,'Can add content type',16,'add_contenttype'),(62,'Can change content type',16,'change_contenttype'),(63,'Can delete content type',16,'delete_contenttype'),(64,'Can view content type',16,'view_contenttype'),(65,'Can add session',17,'add_session'),(66,'Can change session',17,'change_session'),(67,'Can delete session',17,'delete_session'),(68,'Can view session',17,'view_session');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$aI2VnaLYf1jcKU0Kfois7l$1gpL5cQ1WUkBJ35cRostvgVV+VDOiu2p5v6Xis4St28=','2025-05-06 04:43:39.104638',1,'qwer','','','',1,1,'2025-05-06 04:43:04.904531');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_contactinformation`
--

LOCK TABLES `digiledger_contactinformation` WRITE;
/*!40000 ALTER TABLE `digiledger_contactinformation` DISABLE KEYS */;
INSERT INTO `digiledger_contactinformation` VALUES (1,'email@site.com','09123456789');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_digiledgeruser`
--

LOCK TABLES `digiledger_digiledgeruser` WRITE;
/*!40000 ALTER TABLE `digiledger_digiledgeruser` DISABLE KEYS */;
INSERT INTO `digiledger_digiledgeruser` VALUES (1,'arvey',1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_entitytype`
--

LOCK TABLES `digiledger_entitytype` WRITE;
/*!40000 ALTER TABLE `digiledger_entitytype` DISABLE KEYS */;
INSERT INTO `digiledger_entitytype` VALUES (1,'admin');
/*!40000 ALTER TABLE `digiledger_entitytype` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_logincredential`
--

LOCK TABLES `digiledger_logincredential` WRITE;
/*!40000 ALTER TABLE `digiledger_logincredential` DISABLE KEYS */;
INSERT INTO `digiledger_logincredential` VALUES (1,'arvey','arveypogi');
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
  `perm_name` varchar(255) NOT NULL,
  `entity_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `digiledger_permissio_entity_type_id_6d4e62c7_fk_digiledge` (`entity_type_id`),
  CONSTRAINT `digiledger_permissio_entity_type_id_6d4e62c7_fk_digiledge` FOREIGN KEY (`entity_type_id`) REFERENCES `digiledger_entitytype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_permission`
--

LOCK TABLES `digiledger_permission` WRITE;
/*!40000 ALTER TABLE `digiledger_permission` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_recordaccount`
--

LOCK TABLES `digiledger_recordaccount` WRITE;
/*!40000 ALTER TABLE `digiledger_recordaccount` DISABLE KEYS */;
INSERT INTO `digiledger_recordaccount` VALUES (11,'Account Payable'),(9,'Account Receivable'),(10,'Advertising Expense'),(1,'Cash'),(3,'Equipment Expense'),(12,'Food Expense'),(2,'Owner Capital'),(4,'Permit Expense'),(5,'Rent Expense'),(8,'Service Expense'),(6,'Supplies Expense'),(7,'Utilities Expense');
/*!40000 ALTER TABLE `digiledger_recordaccount` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_transaction`
--

LOCK TABLES `digiledger_transaction` WRITE;
/*!40000 ALTER TABLE `digiledger_transaction` DISABLE KEYS */;
INSERT INTO `digiledger_transaction` VALUES (1,'121',200000.00,'2025-05-06 05:00:40.282032',1,1,1,'Invested cash and equipment'),(2,'122',30000.00,'2025-05-06 05:01:46.188093',1,1,3,'Invested for equipment'),(3,'123',5000.00,'2025-05-06 05:03:14.531891',1,1,4,'Paid business permit'),(4,'124',10000.00,'2025-05-06 05:05:53.468212',1,1,5,'Paid rent'),(5,'125',20000.00,'2025-05-06 05:06:32.505601',1,1,5,'Deposit'),(6,'126',5600.00,'2025-05-06 05:07:55.885595',1,1,6,'Purchased supplies'),(7,'127',2500.00,'2025-05-06 05:08:58.040750',1,1,7,'Air-conditioning'),(8,'128',16800.00,'2025-05-06 05:10:08.501766',1,1,1,'Investment'),(9,'129',28000.00,'2025-05-06 05:11:23.404870',1,1,3,'Purchased office tables, cabinets, sofa, and chairs'),(10,'130',22400.00,'2025-05-06 05:13:51.202040',1,1,8,'Billed land for surveying services'),(11,'131',30000.00,'2025-05-06 05:15:36.903152',1,1,3,'Purchased computer'),(12,'132',10000.00,'2025-05-06 05:16:17.480616',1,1,3,'Purchased printer'),(13,'133',16800.00,'2025-05-06 05:18:04.317985',1,1,1,'Provided surveying services'),(14,'134',6720.00,'2025-05-06 05:19:59.042658',1,1,10,'Sent check for advertising'),(15,'135',50000.00,'2025-05-06 05:21:08.984219',1,1,3,'Purchased additional equipment'),(16,'136',16200.00,'2025-05-06 05:22:43.853176',1,1,9,'Provided surveying services'),(17,'137',13440.00,'2025-05-06 05:24:01.249845',1,1,3,'Purchased surveying equipment'),(18,'138',2000.00,'2025-05-06 05:26:06.544077',1,1,11,'Reimbursed gasoline during the week'),(19,'139',11200.00,'2025-05-06 05:27:48.246103',1,1,1,'Rendered another service'),(20,'140',22400.00,'2025-05-06 05:30:16.868222',1,1,1,'Collected amount due'),(21,'141',2500.00,'2025-05-06 05:33:17.652323',1,1,12,'Paid lunch for a client'),(22,'321',2000.00,'2025-05-06 08:04:12.310127',1,1,11,'nagutang 2k');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_transactionsource`
--

LOCK TABLES `digiledger_transactionsource` WRITE;
/*!40000 ALTER TABLE `digiledger_transactionsource` DISABLE KEYS */;
INSERT INTO `digiledger_transactionsource` VALUES (1,200000.00,2,1),(2,30000.00,2,2),(3,5000.00,1,3),(4,10000.00,1,4),(5,20000.00,1,5),(6,5600.00,1,6),(7,2500.00,1,7),(8,16800.00,2,8),(9,28000.00,1,9),(10,22400.00,1,10),(11,30000.00,1,11),(12,10000.00,1,12),(13,16800.00,9,13),(14,6720.00,1,14),(15,50000.00,1,15),(16,16200.00,1,16),(17,13440.00,1,17),(18,2000.00,1,18),(19,11200.00,9,19),(20,22400.00,9,20),(21,2500.00,1,21),(22,500.00,6,22),(23,1500.00,7,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-06 04:44:08.258851','1','admin',1,'[{\"added\": {}}]',2,1),(2,'2025-05-06 04:44:16.337519','1','arvey',1,'[{\"added\": {}}]',3,1),(3,'2025-05-06 04:44:32.017725','1','arvey',2,'[]',3,1),(4,'2025-05-06 04:44:35.032730','1','arvey',2,'[]',3,1),(5,'2025-05-06 04:45:15.024778','1','email@site.com',1,'[{\"added\": {}}]',1,1),(6,'2025-05-06 04:45:18.558958','1','arvey',1,'[{\"added\": {}}]',6,1),(7,'2025-05-06 04:55:49.302030','1','General',1,'[{\"added\": {}}]',5,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'admin','logentry'),(14,'auth','group'),(13,'auth','permission'),(15,'auth','user'),(16,'contenttypes','contenttype'),(1,'digiledger','contactinformation'),(6,'digiledger','digiledgeruser'),(2,'digiledger','entitytype'),(3,'digiledger','logincredential'),(7,'digiledger','permission'),(4,'digiledger','recordaccount'),(5,'digiledger','section'),(8,'digiledger','transaction'),(9,'digiledger','transactionsource'),(11,'polls','choice'),(10,'polls','question'),(17,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'digiledger','0001_initial','2025-05-06 04:38:53.804791'),(2,'digiledger','0002_rename_entry_by_transaction_ent_by_and_more','2025-05-06 04:38:54.376857'),(3,'digiledger','0003_remove_transaction_side','2025-05-06 04:38:54.404906'),(4,'digiledger','0004_transaction_dsc','2025-05-06 04:38:54.443557'),(5,'digiledger','0005_remove_transaction_source','2025-05-06 04:38:54.537131'),(6,'digiledger','0006_transactionsource','2025-05-06 04:38:54.725166'),(7,'contenttypes','0001_initial','2025-05-06 04:42:04.515159'),(8,'auth','0001_initial','2025-05-06 04:42:05.315584'),(9,'admin','0001_initial','2025-05-06 04:42:05.527099'),(10,'admin','0002_logentry_remove_auto_add','2025-05-06 04:42:05.537533'),(11,'admin','0003_logentry_add_action_flag_choices','2025-05-06 04:42:05.549610'),(12,'contenttypes','0002_remove_content_type_name','2025-05-06 04:42:05.669716'),(13,'auth','0002_alter_permission_name_max_length','2025-05-06 04:42:05.757536'),(14,'auth','0003_alter_user_email_max_length','2025-05-06 04:42:05.787958'),(15,'auth','0004_alter_user_username_opts','2025-05-06 04:42:05.797040'),(16,'auth','0005_alter_user_last_login_null','2025-05-06 04:42:05.877746'),(17,'auth','0006_require_contenttypes_0002','2025-05-06 04:42:05.881119'),(18,'auth','0007_alter_validators_add_error_messages','2025-05-06 04:42:05.890146'),(19,'auth','0008_alter_user_username_max_length','2025-05-06 04:42:05.981053'),(20,'auth','0009_alter_user_last_name_max_length','2025-05-06 04:42:06.064442'),(21,'auth','0010_alter_group_name_max_length','2025-05-06 04:42:06.091935'),(22,'auth','0011_update_proxy_permissions','2025-05-06 04:42:06.109718'),(23,'auth','0012_alter_user_first_name_max_length','2025-05-06 04:42:06.192542'),(24,'polls','0001_initial','2025-05-06 04:42:06.310738'),(25,'sessions','0001_initial','2025-05-06 04:42:06.405759');
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
INSERT INTO `django_session` VALUES ('v7js688avbc9h7raeaewgauzc82ftj2e','.eJxVjs0KwjAQhN8lZwnd_JF49O4zhO3uxlYlhbQ9ie9uCwX1Ot_Mx7xUxnUZ8jpLyyOrswJ1-s16pIfUHfAd623SNNWljb3eK_qgs75OLM_L0f0TDDgP29oY56SXFIJJqRRHAgVsCp5MsKGgNRFN6pi9iVEioLAH31lGdgSWNimtrUldvl_h_QF26j7N:1uCD4d:Z3PFW5wE3Kii_K3SpVLKgEGI2N1WQXYKyhPhv1-Tncg','2025-05-20 07:50:43.319961');
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

-- Dump completed on 2025-05-06 16:09:18
