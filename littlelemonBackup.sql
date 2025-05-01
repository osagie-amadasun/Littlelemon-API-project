-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemon
-- ------------------------------------------------------
-- Server version	8.0.41

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Delivery crew'),(1,'Manager');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add order',7,'add_order'),(26,'Can change order',7,'change_order'),(27,'Can delete order',7,'delete_order'),(28,'Can view order',7,'view_order'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add menu item',9,'add_menuitem'),(34,'Can change menu item',9,'change_menuitem'),(35,'Can delete menu item',9,'delete_menuitem'),(36,'Can view menu item',9,'view_menuitem'),(37,'Can add cart',10,'add_cart'),(38,'Can change cart',10,'change_cart'),(39,'Can delete cart',10,'delete_cart'),(40,'Can view cart',10,'view_cart'),(41,'Can add order item',11,'add_orderitem'),(42,'Can change order item',11,'change_orderitem'),(43,'Can delete order item',11,'delete_orderitem'),(44,'Can view order item',11,'view_orderitem'),(45,'Can add Token',12,'add_token'),(46,'Can change Token',12,'change_token'),(47,'Can delete Token',12,'delete_token'),(48,'Can view Token',12,'view_token'),(49,'Can add Token',13,'add_tokenproxy'),(50,'Can change Token',13,'change_tokenproxy'),(51,'Can delete Token',13,'delete_tokenproxy'),(52,'Can view Token',13,'view_tokenproxy');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$QzJIiRiu1RE8cJBQYiAP09$kbmvJEhIrjkC77h5dV8pNAupyvlNEZqJmDZZKxe5rWc=','2025-05-01 15:01:57.633177',1,'osagieamadasun','osagie','amadasun','osagieamadasun123@gmail.com',1,1,'2025-03-24 00:47:34.000000'),(3,'pbkdf2_sha256$870000$yjPq9mzxOKMoUZelgfrI0l$C1AANJZa/vctzrqx9WAriMHeLTqzeDZB08HcaVxtsno=',NULL,0,'isokenamadasun','isoken','amadasun','isokenamadasun@gmail.com',0,1,'2025-03-27 03:46:54.000000'),(4,'pbkdf2_sha256$870000$hdTcdWyXdJ4N8A3DULyQdX$+s2i2mgTzLGZ7kVTItxXMG5o9WxNmX3uyE8uQCCUr6Y=',NULL,0,'samultman','sam','ultman','samultman@gmail.com',0,1,'2025-03-27 03:48:02.000000'),(5,'pbkdf2_sha256$870000$ifGEzc3U39pt4FWzn5JTNn$2PU3KonjJqxN7Qwp1KXawdppkUurjtm/xBCOhy7Qocc=',NULL,0,'johnamadasun','john','amadasun','johnamadasun12@gmail.com',0,1,'2025-03-27 06:11:52.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (10,1,1);
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
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('10d968f329cd38c21d0c8fd8d85604ded6976d21','2025-03-27 04:04:22.174643',3),('3fcce6f94e73bd4f2071139debbba9efb54fc284','2025-03-27 03:22:19.453736',1),('993dbdb5a46cc7e67681ec5d0f95f48f9c3019f8','2025-03-27 04:13:09.577784',4);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-24 11:41:00.636875','1','Manager',1,'[{\"added\": {}}]',3,1),(2,'2025-03-24 11:41:16.112596','2','Delivery crew',1,'[{\"added\": {}}]',3,1),(3,'2025-03-27 00:06:38.828598','1','osagieamadasun',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(4,'2025-03-27 00:07:26.504934','2','isokenamadasun',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(5,'2025-03-27 03:22:19.454272','1','3fcce6f94e73bd4f2071139debbba9efb54fc284',1,'[{\"added\": {}}]',13,1),(6,'2025-03-27 03:46:03.455521','2','isokenamadasun',3,'',4,1),(7,'2025-03-27 03:46:55.264119','3','isokenamadasun',1,'[{\"added\": {}}]',4,1),(8,'2025-03-27 03:48:03.292276','4','samultman',1,'[{\"added\": {}}]',4,1),(9,'2025-03-27 03:49:24.878005','3','isokenamadasun',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(10,'2025-03-27 03:49:52.207964','4','samultman',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(11,'2025-03-27 03:50:02.546638','1','osagieamadasun',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(12,'2025-03-27 03:50:32.546621','1','osagieamadasun',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(13,'2025-04-01 06:01:01.435795','3','isokenamadasun',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(14,'2025-05-01 15:02:17.072714','5','johnamadasun',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'authtoken','token'),(13,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(10,'LittleLemonApp','cart'),(8,'LittleLemonApp','category'),(9,'LittleLemonApp','menuitem'),(7,'LittleLemonApp','order'),(11,'LittleLemonApp','orderitem'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-24 00:45:41.931293'),(2,'auth','0001_initial','2025-03-24 00:45:42.478344'),(3,'admin','0001_initial','2025-03-24 00:45:42.613605'),(4,'admin','0002_logentry_remove_auto_add','2025-03-24 00:45:42.620088'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-24 00:45:42.626882'),(6,'contenttypes','0002_remove_content_type_name','2025-03-24 00:45:42.722090'),(7,'auth','0002_alter_permission_name_max_length','2025-03-24 00:45:42.780516'),(8,'auth','0003_alter_user_email_max_length','2025-03-24 00:45:42.800801'),(9,'auth','0004_alter_user_username_opts','2025-03-24 00:45:42.809498'),(10,'auth','0005_alter_user_last_login_null','2025-03-24 00:45:42.863295'),(11,'auth','0006_require_contenttypes_0002','2025-03-24 00:45:42.866003'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-24 00:45:42.872907'),(13,'auth','0008_alter_user_username_max_length','2025-03-24 00:45:42.935031'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-24 00:45:43.001717'),(15,'auth','0010_alter_group_name_max_length','2025-03-24 00:45:43.020554'),(16,'auth','0011_update_proxy_permissions','2025-03-24 00:45:43.029006'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-24 00:45:43.096096'),(18,'sessions','0001_initial','2025-03-24 00:45:43.128884'),(19,'LittleLemonApp','0001_initial','2025-03-24 01:18:15.672329'),(20,'LittleLemonApp','0002_alter_menuitem_category','2025-03-26 04:42:10.467863'),(21,'authtoken','0001_initial','2025-03-27 03:21:07.624807'),(22,'authtoken','0002_auto_20160226_1747','2025-03-27 03:21:07.653904'),(23,'authtoken','0003_tokenproxy','2025-03-27 03:21:07.657848'),(24,'authtoken','0004_alter_tokenproxy_options','2025-03-27 03:21:07.662799');
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
INSERT INTO `django_session` VALUES ('1g6pb8jyluiltkbshnl63mufv5nuru19','.eJxVjMsOwiAUBf-FtSHA5enSfb-BXF5SNZCUdmX8d9ukC92emTlv4nFbq99GXvycyJVwcvndAsZnbgdID2z3TmNv6zIHeij0pINOPeXX7XT_DiqOutdZKOHQSWVUUEZDMlInDlGAjoJhQbDgTJCSx8IsyxbQspIEBMH2LpLPF7rFNw4:1uAVQD:dC-4P_wJ2Z57nxgmC8wlS4w1OzwwPRbCZtkW7MGNazU','2025-05-15 15:01:57.639072'),('9bvfr85ynqfx39or196j3dl97z11d7db','.eJxVjMsOwiAUBf-FtSHA5enSfb-BXF5SNZCUdmX8d9ukC92emTlv4nFbq99GXvycyJVwcvndAsZnbgdID2z3TmNv6zIHeij0pINOPeXX7XT_DiqOutdZKOHQSWVUUEZDMlInDlGAjoJhQbDgTJCSx8IsyxbQspIEBMH2LpLPF7rFNw4:1txeyl:eovPsHMiwf0jA-3PZcF7eaNpNKTtfqwZzQ6WOeQu3wI','2025-04-10 04:36:31.625686');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `littlelemonapp_cart`
--

DROP TABLE IF EXISTS `littlelemonapp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `littlelemonapp_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `unit_price` decimal(6,2) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `user_id` int NOT NULL,
  `menuitem_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `LittleLemonApp_cart_user_id_menuitem_id_63b84cb0_uniq` (`user_id`,`menuitem_id`),
  KEY `LittleLemonApp_cart_menuitem_id_1d42031f_fk_LittleLem` (`menuitem_id`),
  CONSTRAINT `LittleLemonApp_cart_menuitem_id_1d42031f_fk_LittleLem` FOREIGN KEY (`menuitem_id`) REFERENCES `littlelemonapp_menuitem` (`id`),
  CONSTRAINT `LittleLemonApp_cart_user_id_f03a8ec4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `littlelemonapp_cart_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `littlelemonapp_cart`
--

LOCK TABLES `littlelemonapp_cart` WRITE;
/*!40000 ALTER TABLE `littlelemonapp_cart` DISABLE KEYS */;
INSERT INTO `littlelemonapp_cart` VALUES (1,3,11.99,35.97,1,4),(2,2,15.90,31.80,1,3);
/*!40000 ALTER TABLE `littlelemonapp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `littlelemonapp_category`
--

DROP TABLE IF EXISTS `littlelemonapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `littlelemonapp_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `LittleLemonApp_category_title_97bc03eb` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `littlelemonapp_category`
--

LOCK TABLES `littlelemonapp_category` WRITE;
/*!40000 ALTER TABLE `littlelemonapp_category` DISABLE KEYS */;
INSERT INTO `littlelemonapp_category` VALUES (1,'desserts','Desserts');
/*!40000 ALTER TABLE `littlelemonapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `littlelemonapp_menuitem`
--

DROP TABLE IF EXISTS `littlelemonapp_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `littlelemonapp_menuitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `LittleLemonApp_menuitem_title_da8a465b` (`title`),
  KEY `LittleLemonApp_menuitem_price_06c2b6ac` (`price`),
  KEY `LittleLemonApp_menuitem_featured_712b9fa5` (`featured`),
  KEY `LittleLemonApp_menui_category_id_4af87481_fk_LittleLem` (`category_id`),
  CONSTRAINT `LittleLemonApp_menui_category_id_4af87481_fk_LittleLem` FOREIGN KEY (`category_id`) REFERENCES `littlelemonapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `littlelemonapp_menuitem`
--

LOCK TABLES `littlelemonapp_menuitem` WRITE;
/*!40000 ALTER TABLE `littlelemonapp_menuitem` DISABLE KEYS */;
INSERT INTO `littlelemonapp_menuitem` VALUES (2,'rocky road ice-cream',25.99,1,1),(3,'red velvet cake',15.90,1,1),(4,'sponge cake',11.99,1,1),(5,'macaron',3.59,0,1);
/*!40000 ALTER TABLE `littlelemonapp_menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `littlelemonapp_order`
--

DROP TABLE IF EXISTS `littlelemonapp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `littlelemonapp_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `date` date NOT NULL,
  `delivery_crew_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `LittleLemonApp_order_delivery_crew_id_347e5310_fk_auth_user_id` (`delivery_crew_id`),
  KEY `LittleLemonApp_order_user_id_fa7502d0_fk_auth_user_id` (`user_id`),
  KEY `LittleLemonApp_order_status_79ddb6d9` (`status`),
  KEY `LittleLemonApp_order_date_3c0d8663` (`date`),
  CONSTRAINT `LittleLemonApp_order_delivery_crew_id_347e5310_fk_auth_user_id` FOREIGN KEY (`delivery_crew_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `LittleLemonApp_order_user_id_fa7502d0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `littlelemonapp_order`
--

LOCK TABLES `littlelemonapp_order` WRITE;
/*!40000 ALTER TABLE `littlelemonapp_order` DISABLE KEYS */;
INSERT INTO `littlelemonapp_order` VALUES (1,0,31.80,'2025-04-01',NULL,3),(2,0,25.99,'2025-04-01',NULL,3);
/*!40000 ALTER TABLE `littlelemonapp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `littlelemonapp_orderitem`
--

DROP TABLE IF EXISTS `littlelemonapp_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `littlelemonapp_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` smallint NOT NULL,
  `unit_price` decimal(6,2) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `menuitem_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `LittleLemonApp_orderitem_order_id_menuitem_id_3086ecb6_uniq` (`order_id`,`menuitem_id`),
  KEY `LittleLemonApp_order_menuitem_id_2c725209_fk_LittleLem` (`menuitem_id`),
  CONSTRAINT `LittleLemonApp_order_menuitem_id_2c725209_fk_LittleLem` FOREIGN KEY (`menuitem_id`) REFERENCES `littlelemonapp_menuitem` (`id`),
  CONSTRAINT `LittleLemonApp_order_order_id_be04e1e8_fk_LittleLem` FOREIGN KEY (`order_id`) REFERENCES `littlelemonapp_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `littlelemonapp_orderitem`
--

LOCK TABLES `littlelemonapp_orderitem` WRITE;
/*!40000 ALTER TABLE `littlelemonapp_orderitem` DISABLE KEYS */;
INSERT INTO `littlelemonapp_orderitem` VALUES (1,2,15.90,31.80,3,1),(2,1,25.99,25.99,2,2);
/*!40000 ALTER TABLE `littlelemonapp_orderitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-01 16:09:26
