CREATE DATABASE  IF NOT EXISTS `digiledger2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `digiledger2`;
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add contact information',1,'add_contactinformation'),(2,'Can change contact information',1,'change_contactinformation'),(3,'Can delete contact information',1,'delete_contactinformation'),(4,'Can view contact information',1,'view_contactinformation'),(5,'Can add entity type',2,'add_entitytype'),(6,'Can change entity type',2,'change_entitytype'),(7,'Can delete entity type',2,'delete_entitytype'),(8,'Can view entity type',2,'view_entitytype'),(9,'Can add record account',3,'add_recordaccount'),(10,'Can change record account',3,'change_recordaccount'),(11,'Can delete record account',3,'delete_recordaccount'),(12,'Can view record account',3,'view_recordaccount'),(13,'Can add section',4,'add_section'),(14,'Can change section',4,'change_section'),(15,'Can delete section',4,'delete_section'),(16,'Can view section',4,'view_section'),(17,'Can add transaction',5,'add_transaction'),(18,'Can change transaction',5,'change_transaction'),(19,'Can delete transaction',5,'delete_transaction'),(20,'Can view transaction',5,'view_transaction'),(21,'Can add digiledger user',6,'add_digiledgeruser'),(22,'Can change digiledger user',6,'change_digiledgeruser'),(23,'Can delete digiledger user',6,'delete_digiledgeruser'),(24,'Can view digiledger user',6,'view_digiledgeruser'),(25,'Can add login credential',7,'add_logincredential'),(26,'Can change login credential',7,'change_logincredential'),(27,'Can delete login credential',7,'delete_logincredential'),(28,'Can view login credential',7,'view_logincredential'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add question',9,'add_question'),(34,'Can change question',9,'change_question'),(35,'Can delete question',9,'delete_question'),(36,'Can view question',9,'view_question'),(37,'Can add choice',10,'add_choice'),(38,'Can change choice',10,'change_choice'),(39,'Can delete choice',10,'delete_choice'),(40,'Can view choice',10,'view_choice'),(41,'Can add log entry',11,'add_logentry'),(42,'Can change log entry',11,'change_logentry'),(43,'Can delete log entry',11,'delete_logentry'),(44,'Can view log entry',11,'view_logentry'),(45,'Can add permission',12,'add_permission'),(46,'Can change permission',12,'change_permission'),(47,'Can delete permission',12,'delete_permission'),(48,'Can view permission',12,'view_permission'),(49,'Can add group',13,'add_group'),(50,'Can change group',13,'change_group'),(51,'Can delete group',13,'delete_group'),(52,'Can view group',13,'view_group'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add content type',15,'add_contenttype'),(58,'Can change content type',15,'change_contenttype'),(59,'Can delete content type',15,'delete_contenttype'),(60,'Can view content type',15,'view_contenttype'),(61,'Can add session',16,'add_session'),(62,'Can change session',16,'change_session'),(63,'Can delete session',16,'delete_session'),(64,'Can view session',16,'view_session'),(65,'Can add transaction source',17,'add_transactionsource'),(66,'Can change transaction source',17,'change_transactionsource'),(67,'Can delete transaction source',17,'delete_transactionsource'),(68,'Can view transaction source',17,'view_transactionsource');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$7Q9Frb8uc2PcZDMkvv1noq$gh1pDexKvcpZRABFbY+ePI/nT8bIzrT5VREac/60VRM=','2025-04-18 07:40:41.903020',1,'arvey','','','rbey.sicat@gmail.com',1,1,'2025-04-18 07:40:33.679041'),(2,'pbkdf2_sha256$1000000$QqZXXhxDeMS1P1TIdH6e3V$uy7ewmyLlPLmFsYuy0mBBZJIXg3TZ6pCKSn7cN0OmsA=','2025-04-19 13:18:46.309971',1,'qwe','','','sample@gmail.com',1,1,'2025-04-19 02:14:00.552114');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_contactinformation`
--

LOCK TABLES `digiledger_contactinformation` WRITE;
/*!40000 ALTER TABLE `digiledger_contactinformation` DISABLE KEYS */;
INSERT INTO `digiledger_contactinformation` VALUES (6,'march@gmail.com','+639541234586'),(7,'arvey@gmail.com','+639458618970'),(8,'jhude@gmail.com','+639786543890'),(9,'kennethamboya@gmail.com','+639457818690');
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
  KEY `digiledger_digiledge_entity_type_id_6dd93ee7_fk_digiledge` (`entity_type_id`),
  CONSTRAINT `digiledger_digiledge_contact_information__93159cf0_fk_digiledge` FOREIGN KEY (`contact_information_id`) REFERENCES `digiledger_contactinformation` (`id`),
  CONSTRAINT `digiledger_digiledge_entity_type_id_6dd93ee7_fk_digiledge` FOREIGN KEY (`entity_type_id`) REFERENCES `digiledger_entitytype` (`id`),
  CONSTRAINT `digiledger_digiledge_login_credentials_id_5e33f909_fk_digiledge` FOREIGN KEY (`login_credentials_id`) REFERENCES `digiledger_logincredential` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_digiledgeruser`
--

LOCK TABLES `digiledger_digiledgeruser` WRITE;
/*!40000 ALTER TABLE `digiledger_digiledgeruser` DISABLE KEYS */;
INSERT INTO `digiledger_digiledgeruser` VALUES (6,'march_enrico',6,4,6),(7,'arvey',7,4,7),(8,'jhude',8,4,8),(9,'kenneth',9,4,9);
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
INSERT INTO `digiledger_entitytype` VALUES (4,'accountant');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_logincredential`
--

LOCK TABLES `digiledger_logincredential` WRITE;
/*!40000 ALTER TABLE `digiledger_logincredential` DISABLE KEYS */;
INSERT INTO `digiledger_logincredential` VALUES (6,'march','marchpogi'),(7,'arvey','arveypogi'),(8,'jhude','jhudepogi'),(9,'kenneth','kennethpagod');
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
  KEY `digiledger_permissio_entity_type_id_caa484cc_fk_digiledge` (`entity_type_id`),
  CONSTRAINT `digiledger_permissio_entity_type_id_caa484cc_fk_digiledge` FOREIGN KEY (`entity_type_id`) REFERENCES `digiledger_entitytype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_permission`
--

LOCK TABLES `digiledger_permission` WRITE;
/*!40000 ALTER TABLE `digiledger_permission` DISABLE KEYS */;
INSERT INTO `digiledger_permission` VALUES (1,'track_transactions',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_recordaccount`
--

LOCK TABLES `digiledger_recordaccount` WRITE;
/*!40000 ALTER TABLE `digiledger_recordaccount` DISABLE KEYS */;
INSERT INTO `digiledger_recordaccount` VALUES (22,'Accounts Receivable'),(21,'Cash'),(23,'Owner capital');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_section`
--

LOCK TABLES `digiledger_section` WRITE;
/*!40000 ALTER TABLE `digiledger_section` DISABLE KEYS */;
INSERT INTO `digiledger_section` VALUES (1,'General'),(2,'test1');
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
  KEY `digiledger_transacti_entry_by_id_1233f4f5_fk_digiledge` (`ent_by_id`),
  KEY `digiledger_transacti_destination_id_0f76e8fc_fk_digiledge` (`destination_id`),
  CONSTRAINT `digiledger_transacti_destination_id_0f76e8fc_fk_digiledge` FOREIGN KEY (`destination_id`) REFERENCES `digiledger_recordaccount` (`id`),
  CONSTRAINT `digiledger_transacti_ent_by_id_c7c70371_fk_digiledge` FOREIGN KEY (`ent_by_id`) REFERENCES `digiledger_digiledgeruser` (`id`),
  CONSTRAINT `digiledger_transacti_section_id_10afb4cd_fk_digiledge` FOREIGN KEY (`section_id`) REFERENCES `digiledger_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_transaction`
--

LOCK TABLES `digiledger_transaction` WRITE;
/*!40000 ALTER TABLE `digiledger_transaction` DISABLE KEYS */;
INSERT INTO `digiledger_transaction` VALUES (21,'TRN-20250419-001',500.00,'2025-04-19 02:24:09.000000',9,1,21,'customer paid for item purchase'),(22,'TRN-DBT-A03',15000.00,'2025-04-19 02:33:08.000000',8,1,21,'owner invested 15k to the business'),(23,'test1',250.00,'2025-04-19 13:23:44.000000',7,1,21,'testing entry of 250'),(25,'574746',500.00,'2025-04-21 00:31:55.892916',9,1,21,'customer 250 (owner 250)');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digiledger_transactionsource`
--

LOCK TABLES `digiledger_transactionsource` WRITE;
/*!40000 ALTER TABLE `digiledger_transactionsource` DISABLE KEYS */;
INSERT INTO `digiledger_transactionsource` VALUES (1,500.00,22,21),(2,15000.00,23,22),(3,250.00,22,23),(6,250.00,22,25),(7,250.00,21,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-18 07:42:03.506346','1','General',1,'[{\"added\": {}}]',4,1),(2,'2025-04-18 07:43:18.673451','1','jsmith89',1,'[{\"added\": {}}]',7,1),(3,'2025-04-18 07:43:34.104150','1','jsmith89@example.com,+63 917 123 4567',1,'[{\"added\": {}}]',1,1),(4,'2025-04-18 07:43:41.831924','1','Manager',1,'[{\"added\": {}}]',2,1),(5,'2025-04-18 07:43:47.150577','1','John Smith',1,'[{\"added\": {}}]',6,1),(6,'2025-04-18 07:43:57.616125','2','mtaylor22',1,'[{\"added\": {}}]',7,1),(7,'2025-04-18 07:44:07.008731','2','mtaylor22@example.com,+63 927 456 7890',1,'[{\"added\": {}}]',1,1),(8,'2025-04-18 07:44:15.744481','2','Supervisor',1,'[{\"added\": {}}]',2,1),(9,'2025-04-18 07:44:17.909271','2','Megan Taylor',1,'[{\"added\": {}}]',6,1),(10,'2025-04-18 07:44:27.239972','3','rpatel77',1,'[{\"added\": {}}]',7,1),(11,'2025-04-18 07:44:41.082317','3','rpatel77@example.com,+63 998 321 4567',1,'[{\"added\": {}}]',1,1),(12,'2025-04-18 07:44:47.034595','3','Accountant',1,'[{\"added\": {}}]',2,1),(13,'2025-04-18 07:44:48.295708','3','Raj Patel',1,'[{\"added\": {}}]',6,1),(14,'2025-04-18 07:45:08.135533','4','khughes55',1,'[{\"added\": {}}]',7,1),(15,'2025-04-18 07:45:16.310772','4','khughes55@example.com,+63 905 789 1234',1,'[{\"added\": {}}]',1,1),(16,'2025-04-18 07:45:21.724711','4','Karen Hughes',1,'[{\"added\": {}}]',6,1),(17,'2025-04-18 07:45:33.208410','5','dbrown03',1,'[{\"added\": {}}]',7,1),(18,'2025-04-18 07:45:43.887342','5','dbrown03@example.com,+63 917 654 7890',1,'[{\"added\": {}}]',1,1),(19,'2025-04-18 07:45:48.509520','5','David Brown',1,'[{\"added\": {}}]',6,1),(20,'2025-04-18 07:52:48.696614','1','Office Supplies',1,'[{\"added\": {}}]',3,1),(21,'2025-04-18 07:53:47.830739','1','Txn TXN-20250414-001 (Debit) - 12450.00 on 2025-04-13',1,'[{\"added\": {}}]',5,1),(22,'2025-04-18 07:54:18.992883','2','Revenue',1,'[{\"added\": {}}]',3,1),(23,'2025-04-18 07:54:23.799561','2','Txn TXN-20250414-002 (Credit) - 25000.00 on 2025-04-13',1,'[{\"added\": {}}]',5,1),(24,'2025-04-18 07:54:54.015812','3','Utilities Expense',1,'[{\"added\": {}}]',3,1),(25,'2025-04-18 07:55:01.861860','3','Txn TXN-20250414-003 (Debit) - 8300.00 on 2025-04-13',1,'[{\"added\": {}}]',5,1),(26,'2025-04-18 07:55:43.713141','4','Account Receivable',1,'[{\"added\": {}}]',3,1),(27,'2025-04-18 07:56:14.271434','4','Txn TXN-20250414-004 (Credit) - 14780.50 on 2025-04-10',1,'[{\"added\": {}}]',5,1),(28,'2025-04-18 07:56:54.079327','5','Meals & Entertainment',1,'[{\"added\": {}}]',3,1),(29,'2025-04-18 07:56:59.600393','5','Txn TXN-20250414-005 (Debit) - 5600.00 on 2025-04-09',1,'[{\"added\": {}}]',5,1),(30,'2025-04-18 07:58:06.663264','6','Sales Income',1,'[{\"added\": {}}]',3,1),(31,'2025-04-18 07:58:11.477175','6','Txn TXN-20250414-006 (Credit) - 32000.00 on 2025-04-13',1,'[{\"added\": {}}]',5,1),(32,'2025-04-18 07:58:42.399847','7','Travel Expenses',1,'[{\"added\": {}}]',3,1),(33,'2025-04-18 07:58:50.119590','7','Txn TXN-20250414-007 (Debit) - 3920.00 on 2025-04-11',1,'[{\"added\": {}}]',5,1),(34,'2025-04-18 07:59:19.879441','8','Other Income',1,'[{\"added\": {}}]',3,1),(35,'2025-04-18 07:59:23.901635','8','Txn TXN-20250414-008 (Credit) - 11875.00 on 2025-04-13',1,'[{\"added\": {}}]',5,1),(36,'2025-04-18 07:59:43.075447','9','Office Maintenance',1,'[{\"added\": {}}]',3,1),(37,'2025-04-18 07:59:50.293070','9','Txn TXN-20250414-009 (Debit) - 2500.00 on 2025-04-13',1,'[{\"added\": {}}]',5,1),(38,'2025-04-18 08:00:12.712012','10','Professional Services',1,'[{\"added\": {}}]',3,1),(39,'2025-04-18 08:00:17.533501','10','Txn TXN-20250414-010 (Credit) - 9999.99 on 2025-04-13',1,'[{\"added\": {}}]',5,1),(40,'2025-04-18 08:00:39.979705','11','Communication Expense',1,'[{\"added\": {}}]',3,1),(41,'2025-04-18 08:00:44.670013','11','Txn TXN-20250414-011 (Debit) - 6475.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(42,'2025-04-18 08:01:05.658336','12','Interest Income',1,'[{\"added\": {}}]',3,1),(43,'2025-04-18 08:01:10.037898','12','Txn TXN-20250414-012 (Credit) - 18250.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(44,'2025-04-18 08:01:35.040029','13','Training Expense',1,'[{\"added\": {}}]',3,1),(45,'2025-04-18 08:01:37.789946','13','Txn TXN-20250414-013 (Debit) - 4050.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(46,'2025-04-18 08:01:58.305385','14','Investments',1,'[{\"added\": {}}]',3,1),(47,'2025-04-18 08:02:03.365866','14','Txn TXN-20250414-014 (Credit) - 22330.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(48,'2025-04-18 08:02:26.019584','15','Fuel & Transportation',1,'[{\"added\": {}}]',3,1),(49,'2025-04-18 08:02:31.460264','15','Txn TXN-20250414-015 (Debit) - 3600.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(50,'2025-04-18 08:03:05.009839','16','Loan Receivable',1,'[{\"added\": {}}]',3,1),(51,'2025-04-18 08:03:09.144487','16','Txn TXN-20250414-016 (Credit) - 55000.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(52,'2025-04-18 08:03:35.403486','17','Repairs & Maintenance',1,'[{\"added\": {}}]',3,1),(53,'2025-04-18 08:03:44.555776','17','Txn TXN-20250414-017 (Debit) - 7250.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(54,'2025-04-18 08:04:02.052708','18','Service Revenue',1,'[{\"added\": {}}]',3,1),(55,'2025-04-18 08:04:07.217842','18','Txn TXN-20250414-018 (Credit) - 29980.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(56,'2025-04-18 08:04:33.080434','19','Bank Fees',1,'[{\"added\": {}}]',3,1),(57,'2025-04-18 08:04:37.693092','19','Txn TXN-20250414-019 (Debit) - 1800.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(58,'2025-04-18 08:05:05.253509','20','Deferred Revenue',1,'[{\"added\": {}}]',3,1),(59,'2025-04-18 08:05:09.948911','20','Txn TXN-20250414-020 (Credit) - 40700.00 on 2025-04-14',1,'[{\"added\": {}}]',5,1),(60,'2025-04-19 02:16:05.470330','5','DigiledgerUser object (5)',3,'',6,2),(61,'2025-04-19 02:16:05.470330','4','DigiledgerUser object (4)',3,'',6,2),(62,'2025-04-19 02:16:05.470330','3','DigiledgerUser object (3)',3,'',6,2),(63,'2025-04-19 02:16:05.470330','2','DigiledgerUser object (2)',3,'',6,2),(64,'2025-04-19 02:16:05.470330','1','DigiledgerUser object (1)',3,'',6,2),(65,'2025-04-19 02:16:12.870465','5','ContactInformation object (5)',3,'',1,2),(66,'2025-04-19 02:16:12.870465','4','ContactInformation object (4)',3,'',1,2),(67,'2025-04-19 02:16:12.870465','3','ContactInformation object (3)',3,'',1,2),(68,'2025-04-19 02:16:12.870465','2','ContactInformation object (2)',3,'',1,2),(69,'2025-04-19 02:16:12.870465','1','ContactInformation object (1)',3,'',1,2),(70,'2025-04-19 02:16:23.986907','3','EntityType object (3)',3,'',2,2),(71,'2025-04-19 02:16:23.986907','2','EntityType object (2)',3,'',2,2),(72,'2025-04-19 02:16:23.986907','1','EntityType object (1)',3,'',2,2),(73,'2025-04-19 02:16:34.138828','5','LoginCredential object (5)',3,'',7,2),(74,'2025-04-19 02:16:34.138828','4','LoginCredential object (4)',3,'',7,2),(75,'2025-04-19 02:16:34.138828','3','LoginCredential object (3)',3,'',7,2),(76,'2025-04-19 02:16:34.138828','2','LoginCredential object (2)',3,'',7,2),(77,'2025-04-19 02:16:34.138828','1','LoginCredential object (1)',3,'',7,2),(78,'2025-04-19 02:17:09.149318','20','RecordAccount object (20)',3,'',3,2),(79,'2025-04-19 02:17:09.149318','19','RecordAccount object (19)',3,'',3,2),(80,'2025-04-19 02:17:09.149318','18','RecordAccount object (18)',3,'',3,2),(81,'2025-04-19 02:17:09.149318','17','RecordAccount object (17)',3,'',3,2),(82,'2025-04-19 02:17:09.149318','16','RecordAccount object (16)',3,'',3,2),(83,'2025-04-19 02:17:09.149318','15','RecordAccount object (15)',3,'',3,2),(84,'2025-04-19 02:17:09.150318','14','RecordAccount object (14)',3,'',3,2),(85,'2025-04-19 02:17:09.150318','13','RecordAccount object (13)',3,'',3,2),(86,'2025-04-19 02:17:09.150318','12','RecordAccount object (12)',3,'',3,2),(87,'2025-04-19 02:17:09.150318','11','RecordAccount object (11)',3,'',3,2),(88,'2025-04-19 02:17:09.150318','10','RecordAccount object (10)',3,'',3,2),(89,'2025-04-19 02:17:09.150318','9','RecordAccount object (9)',3,'',3,2),(90,'2025-04-19 02:17:09.150318','8','RecordAccount object (8)',3,'',3,2),(91,'2025-04-19 02:17:09.150318','7','RecordAccount object (7)',3,'',3,2),(92,'2025-04-19 02:17:09.150318','6','RecordAccount object (6)',3,'',3,2),(93,'2025-04-19 02:17:09.150318','5','RecordAccount object (5)',3,'',3,2),(94,'2025-04-19 02:17:09.150318','4','RecordAccount object (4)',3,'',3,2),(95,'2025-04-19 02:17:09.150318','3','RecordAccount object (3)',3,'',3,2),(96,'2025-04-19 02:17:09.150318','2','RecordAccount object (2)',3,'',3,2),(97,'2025-04-19 02:17:09.150318','1','RecordAccount object (1)',3,'',3,2),(98,'2025-04-19 02:17:37.893048','4','EntityType object (4)',1,'[{\"added\": {}}]',2,2),(99,'2025-04-19 02:18:46.950690','6','ContactInformation object (6)',1,'[{\"added\": {}}]',1,2),(100,'2025-04-19 02:19:06.309844','6','LoginCredential object (6)',1,'[{\"added\": {}}]',7,2),(101,'2025-04-19 02:19:09.858369','6','DigiledgerUser object (6)',1,'[{\"added\": {}}]',6,2),(102,'2025-04-19 02:19:39.087935','7','ContactInformation object (7)',1,'[{\"added\": {}}]',1,2),(103,'2025-04-19 02:19:49.849738','7','LoginCredential object (7)',1,'[{\"added\": {}}]',7,2),(104,'2025-04-19 02:19:53.970430','7','DigiledgerUser object (7)',1,'[{\"added\": {}}]',6,2),(105,'2025-04-19 02:20:20.521227','8','ContactInformation object (8)',1,'[{\"added\": {}}]',1,2),(106,'2025-04-19 02:20:36.082637','8','LoginCredential object (8)',1,'[{\"added\": {}}]',7,2),(107,'2025-04-19 02:20:40.650105','8','DigiledgerUser object (8)',1,'[{\"added\": {}}]',6,2),(108,'2025-04-19 02:21:07.876393','9','ContactInformation object (9)',1,'[{\"added\": {}}]',1,2),(109,'2025-04-19 02:21:18.471155','9','LoginCredential object (9)',1,'[{\"added\": {}}]',7,2),(110,'2025-04-19 02:21:24.690237','9','DigiledgerUser object (9)',1,'[{\"added\": {}}]',6,2),(111,'2025-04-19 02:21:55.617224','1','Permission object (1)',1,'[{\"added\": {}}]',8,2),(112,'2025-04-19 02:24:41.892304','21','RecordAccount object (21)',1,'[{\"added\": {}}]',3,2),(113,'2025-04-19 02:27:05.208828','22','RecordAccount object (22)',1,'[{\"added\": {}}]',3,2),(114,'2025-04-19 02:27:50.405712','21','Txn TRN-20250419-001 (Debit) - 500 on 2025-04-19',1,'[{\"added\": {}}]',5,2),(115,'2025-04-19 02:57:35.737082','22','Txn TRN-DBT-A03 - 650 on 2025-04-19',1,'[{\"added\": {}}]',5,2),(116,'2025-04-19 09:59:27.698746','2','Section object (2)',1,'[{\"added\": {}}]',4,2),(117,'2025-04-19 10:27:31.986371','21','Txn TRN-20250419-001 - 500.00 on 2025-04-19',2,'[{\"changed\": {\"fields\": [\"Dsc\"]}}]',5,2),(118,'2025-04-19 10:28:28.853419','1','TRN-20250419-001 - Source: RecordAccount object (22)',1,'[{\"added\": {}}]',17,2),(119,'2025-04-19 10:30:48.577608','22','Txn TRN-DBT-A03 - 15000 on 2025-04-19',2,'[{\"changed\": {\"fields\": [\"Mon val\", \"Dsc\"]}}]',5,2),(120,'2025-04-19 10:31:48.809658','23','RecordAccount object (23)',1,'[{\"added\": {}}]',3,2),(121,'2025-04-19 10:31:52.401431','2','TRN-DBT-A03 - Source: RecordAccount object (23)',1,'[{\"added\": {}}]',17,2),(122,'2025-04-19 10:33:56.112938','1','TRN-20250419-001 - Source: RecordAccount object (22)',2,'[]',17,2),(123,'2025-04-19 13:24:58.109196','23','Txn test1 - 250 on 2025-04-19',1,'[{\"added\": {}}]',5,2),(124,'2025-04-19 13:26:33.490245','3','test1 - Source: RecordAccount object (22)',1,'[{\"added\": {}}]',17,2),(125,'2025-04-20 03:31:23.509454','23','Owner capital',2,'[{\"changed\": {\"fields\": [\"Account name\"]}}]',3,2),(126,'2025-04-21 00:29:48.970957','24','Txn 3464 - 500.00 on 2025-04-21 00:29:20',3,'',5,2);
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
INSERT INTO `django_content_type` VALUES (11,'admin','logentry'),(13,'auth','group'),(12,'auth','permission'),(14,'auth','user'),(15,'contenttypes','contenttype'),(1,'digiledger','contactinformation'),(6,'digiledger','digiledgeruser'),(2,'digiledger','entitytype'),(7,'digiledger','logincredential'),(8,'digiledger','permission'),(3,'digiledger','recordaccount'),(4,'digiledger','section'),(5,'digiledger','transaction'),(17,'digiledger','transactionsource'),(10,'polls','choice'),(9,'polls','question'),(16,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-18 07:21:41.085749'),(2,'auth','0001_initial','2025-04-18 07:21:41.768618'),(3,'admin','0001_initial','2025-04-18 07:21:41.933821'),(4,'admin','0002_logentry_remove_auto_add','2025-04-18 07:21:41.941308'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-18 07:21:41.948892'),(6,'contenttypes','0002_remove_content_type_name','2025-04-18 07:21:42.036505'),(7,'auth','0002_alter_permission_name_max_length','2025-04-18 07:21:42.116890'),(8,'auth','0003_alter_user_email_max_length','2025-04-18 07:21:42.142571'),(9,'auth','0004_alter_user_username_opts','2025-04-18 07:21:42.149984'),(10,'auth','0005_alter_user_last_login_null','2025-04-18 07:21:42.216208'),(11,'auth','0006_require_contenttypes_0002','2025-04-18 07:21:42.219470'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-18 07:21:42.226016'),(13,'auth','0008_alter_user_username_max_length','2025-04-18 07:21:42.305184'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-18 07:21:42.381343'),(15,'auth','0010_alter_group_name_max_length','2025-04-18 07:21:42.398828'),(16,'auth','0011_update_proxy_permissions','2025-04-18 07:21:42.406774'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-18 07:21:42.505062'),(18,'digiledger','0001_initial','2025-04-18 07:21:42.928016'),(19,'digiledger','0002_recordaccount_section_transaction','2025-04-18 07:21:43.250456'),(20,'digiledger','0003_rename_digiledgerusers_digiledgeruser_and_more','2025-04-18 07:21:43.532495'),(21,'polls','0001_initial','2025-04-18 07:21:43.630585'),(22,'sessions','0001_initial','2025-04-18 07:21:43.666454'),(23,'digiledger','0002_rename_entry_by_transaction_ent_by_and_more','2025-04-19 01:45:51.459872'),(24,'digiledger','0003_remove_transaction_side','2025-04-19 02:28:36.176893'),(25,'digiledger','0004_transaction_dsc','2025-04-19 03:53:37.552284'),(26,'digiledger','0005_remove_transaction_source','2025-04-19 05:34:25.935543'),(27,'digiledger','0006_transactionsource','2025-04-19 05:39:23.980933');
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
INSERT INTO `django_session` VALUES ('6o7mml0w1qoucw317hr20xlqmcu04p8t','.eJxVjksKAjEQBe-StYT8xk5cuvcMQ6fTOqOSQDJZiXeXwIC6fVUU7yVm7Nsy98Z1XpM4CSMOv1tEenAeIN0x34qkkre6RjkUudMmLyXx87y7f4EF2zKynogUsJ4gKuuJFViIfGVF3pIJk0XtJq9I6xQQICiNyOTIgTfuOF5Rr5Xz9v0a3h99UT6W:1u6f36:WledU5L06l8A0Yb1q67oJCA2ULM4Y6NPorCenOQSJ5s','2025-05-05 00:30:12.499609'),('chr5m6v2hbhrwbaol3rpqa41pr496fl9','.eJxVzMEOwiAQBNB_4WxIF4SyHr37DWRhQaqGJqU9Gf9dmvSg15k38xaetrX4raXFTywuAsTpNwsUn6nuBT-o3mcZ57ouU5A7kUfb5G3m9Loe9u-gUCt9bYAUMjkHNkfkDDpFRUMIWaOz9kzjiN2AC91kw3pQYLI1qCEpdFp8vuPBN1I:1u5gL3:KRDIOtAJQZrkkWGGoRrl6b2fpR9CFd6Yh3tXy2fc780','2025-05-02 07:40:41.907086'),('m0qltlgsw883mhzy3esjpj1oq00r7igj','.eJxVjMsOwiAQAP-FsyE8XfDovd9AlmWVqqFJaU_GfzckPeh1ZjJvkXDfato7r2ku4iKMOP2yjPTkNkR5YLsvkpa2rXOWI5GH7XJaCr-uR_s3qNjr2AYiUsDaQ1Y2ECuwkPnGioIlE71F7XxQpHWJCBCVRmRy5CAYdzbi8wXetTdm:1u5xih:kB0f53-cg3hh1KqKFVN3I7rV-ianFzlonfpNrpeEhEw','2025-05-03 02:14:15.994236');
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

-- Dump completed on 2025-04-21  8:39:42
