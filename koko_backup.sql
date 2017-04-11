-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: koko
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add bookmark',1,'add_bookmark'),(2,'Can change bookmark',1,'change_bookmark'),(3,'Can delete bookmark',1,'delete_bookmark'),(4,'Can add pinned application',2,'add_pinnedapplication'),(5,'Can change pinned application',2,'change_pinnedapplication'),(6,'Can delete pinned application',2,'delete_pinnedapplication'),(7,'Can add log entry',3,'add_logentry'),(8,'Can change log entry',3,'change_logentry'),(9,'Can delete log entry',3,'delete_logentry'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add group',6,'add_group'),(17,'Can change group',6,'change_group'),(18,'Can delete group',6,'delete_group'),(19,'Can add content type',7,'add_contenttype'),(20,'Can change content type',7,'change_contenttype'),(21,'Can delete content type',7,'delete_contenttype'),(22,'Can add session',8,'add_session'),(23,'Can change session',8,'change_session'),(24,'Can delete session',8,'delete_session'),(25,'Can add Напиток',9,'add_drinkingproduct'),(26,'Can change Напиток',9,'change_drinkingproduct'),(27,'Can delete Напиток',9,'delete_drinkingproduct'),(28,'Can add Картофель',10,'add_potatoproduct'),(29,'Can change Картофель',10,'change_potatoproduct'),(30,'Can delete Картофель',10,'delete_potatoproduct'),(31,'Can add (u\'\\u041e\\u0431\\u044a\\u0451\\u043c\',)',11,'add_productsizes'),(32,'Can change (u\'\\u041e\\u0431\\u044a\\u0451\\u043c\',)',11,'change_productsizes'),(33,'Can delete (u\'\\u041e\\u0431\\u044a\\u0451\\u043c\',)',11,'delete_productsizes'),(34,'Can add Курочка',12,'add_mainproduct'),(35,'Can change Курочка',12,'change_mainproduct'),(36,'Can delete Курочка',12,'delete_mainproduct'),(37,'Can add Салат',13,'add_saladeproduct'),(38,'Can change Салат',13,'change_saladeproduct'),(39,'Can delete Салат',13,'delete_saladeproduct'),(40,'Can add Заказ',14,'add_order'),(41,'Can change Заказ',14,'change_order'),(42,'Can delete Заказ',14,'delete_order'),(43,'Can add Контакты',15,'add_contacts'),(44,'Can change Контакты',15,'change_contacts'),(45,'Can delete Контакты',15,'delete_contacts');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$EkYrMLPH0f88$AZs0ELU6ttnC2E5L+q403EPymcbEvf1/k5UrBUs9sfY=','2016-12-07 06:18:25',1,'administrator','','','administrator@localhost',1,1,'2016-12-01 11:02:36'),(2,'pbkdf2_sha256$30000$p88Yvj4u7fvt$EpFEgD9TFwdccpmq0ziKS5OufU71uCAVCtXRUd1w++Q=',NULL,1,'admin','Виталий','Хе','kokochickenbish@gmail.com',0,1,'2016-12-01 14:37:22'),(3,'pbkdf2_sha256$30000$riLb42M2p2qC$2ah1wkZ3LMD3QyztvTeHJvQRmchE/GI077CP0IGEa1o=','2017-03-28 06:17:59',1,'kokoadmin','','','kokoadmin@localhost',1,1,'2016-12-01 15:16:35'),(4,'pbkdf2_sha256$30000$1O7sWrXKhIe5$SppbHIkCGqBM7YymiIVJNMhfGson77bj/LT52OoC/jI=','2017-03-03 10:39:08',1,'erlan','','','okay11007@gmail.com',1,1,'2016-12-09 14:20:00');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,7);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) NOT NULL,
  `additional_phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `address` varchar(255) NOT NULL,
  `time_of_work` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'0 550 76 00 77','0 704 76 00 77','kokochicken@gmail.com','Чуй 150А, ТЦ \"Бета Сторес 1\"','10:00 - 22:00');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-12-01 12:39:16','1','0703043126, Lenin st. 262',1,'[{\"added\": {}}]',15,1),(2,'2016-12-01 12:39:16','2','0703043126, Lenin st. 262',1,'[{\"added\": {}}]',15,1),(3,'2016-12-01 14:07:31','1','500г - 390 сом',1,'[{\"added\": {}}]',11,1),(4,'2016-12-01 14:07:40','2','250г - 210 сом',1,'[{\"added\": {}}]',11,1),(5,'2016-12-01 14:09:41','1','курица с веропейским соусом',1,'[{\"added\": {}}]',12,1),(6,'2016-12-01 14:10:48','3','500г - 430 сом',1,'[{\"added\": {}}]',11,1),(7,'2016-12-01 14:10:59','4','250г - 240 сом',1,'[{\"added\": {}}]',11,1),(8,'2016-12-01 14:11:08','2','курица сырная',1,'[{\"added\": {}}]',12,1),(9,'2016-12-01 14:14:30','1','Айкол - 0703043126',2,'[{\"changed\": {\"fields\": [\"delivered\"]}}]',14,1),(10,'2016-12-01 14:16:43','2','0550760077, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[{\"changed\": {\"fields\": [\"phone_number\", \"additional_phone_number\", \"email\", \"address\"]}}]',15,1),(11,'2016-12-01 14:17:01','2','0550760077, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[]',15,1),(12,'2016-12-01 14:17:43','1','0550760077, Lenin st. 262',2,'[{\"changed\": {\"fields\": [\"phone_number\", \"additional_phone_number\"]}}]',15,1),(13,'2016-12-01 14:17:46','1','0550760077, Lenin st. 262',2,'[]',15,1),(14,'2016-12-01 14:17:54','1','0550760077, Lenin st. 262',2,'[]',15,1),(15,'2016-12-01 14:18:17','1','0550760077, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[{\"changed\": {\"fields\": [\"email\", \"address\"]}}]',15,1),(16,'2016-12-01 14:18:21','1','0550760077, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[]',15,1),(17,'2016-12-01 14:37:22','2','admin',1,'[{\"added\": {}}]',5,1),(18,'2016-12-01 14:43:24','2','курица сырная',3,'',12,1),(19,'2016-12-01 14:43:24','1','курица с веропейским соусом',3,'',12,1),(20,'2016-12-01 14:49:31','3','Курица. Европейский кляр (Неострый)',1,'[{\"added\": {}}]',12,1),(21,'2016-12-01 14:52:08','4','Курица. Европейский кляр (Острый)',1,'[{\"added\": {}}]',12,1),(22,'2016-12-01 14:53:37','5','Курица. Классический кляр (Неострый)',1,'[{\"added\": {}}]',12,1),(23,'2016-12-01 14:54:18','6','Курица. Классический кляр (Неострый)',1,'[{\"added\": {}}]',12,1),(24,'2016-12-01 14:54:33','6','Курица. Классический кляр (Неострый)',3,'',12,1),(25,'2016-12-01 14:55:26','7','Курица. Классический кляр (Острый)',1,'[{\"added\": {}}]',12,1),(26,'2016-12-01 14:58:57','8','Курица. Соус терияки',1,'[{\"added\": {}}]',12,1),(27,'2016-12-01 15:02:36','9','Курица. Сырный соус',1,'[{\"added\": {}}]',12,1),(28,'2016-12-01 15:03:28','9','Курица. C сыром',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',12,1),(29,'2016-12-01 15:12:18','2','admin',2,'[{\"changed\": {\"fields\": [\"is_superuser\", \"date_joined\"]}}]',5,1),(30,'2016-12-01 15:12:43','2','admin',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"date_joined\"]}}]',5,1),(31,'2016-12-01 15:13:30','2','admin',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',5,1),(32,'2016-12-01 15:20:57','10','Курица. Карий (Неострый)',1,'[{\"added\": {}}]',12,3),(33,'2016-12-01 15:22:45','11','Курица. Карий (Острый)',1,'[{\"added\": {}}]',12,3),(34,'2016-12-01 15:28:41','12','Крыло. Европейский (Неострый)',1,'[{\"added\": {}}]',12,3),(35,'2016-12-01 15:29:22','13','Крыло. Европейский (Острый)',1,'[{\"added\": {}}]',12,3),(36,'2016-12-01 15:36:32','4','Айкол - 0703043126',3,'',14,3),(37,'2016-12-01 15:36:32','3','Айкол - 0703043126',3,'',14,3),(38,'2016-12-01 15:36:33','2','Айкол - 0703043126',3,'',14,3),(39,'2016-12-01 15:36:33','1','Айкол - 0703043126',3,'',14,3),(40,'2016-12-01 15:40:37','1','Чикен сендвич',1,'[{\"added\": {}}]',13,3),(41,'2016-12-01 15:44:17','2','Салат греческий',1,'[{\"added\": {}}]',13,3),(42,'2016-12-01 15:46:36','5','100г - 80 сом',1,'[{\"added\": {}}]',11,3),(43,'2016-12-01 15:46:49','1','Картошка фри',1,'[{\"added\": {}}]',10,3),(44,'2016-12-01 15:48:45','1','Кола 0.5л',1,'[{\"added\": {}}]',9,3),(45,'2016-12-01 15:53:14','1','Кола 0.5л',3,'',9,3),(46,'2016-12-01 15:57:21','14','Крыло. Классический (Неострый)',1,'[{\"added\": {}}]',12,3),(47,'2016-12-05 08:48:35','15','Крыло. Классический (Острый)',1,'[{\"added\": {}}]',12,1),(48,'2016-12-05 08:49:25','15','Крыло. Классический (Острый)',2,'[{\"changed\": {\"fields\": [\"preview\"]}}]',12,1),(49,'2016-12-05 08:57:18','16','Крыло. Соус Терияки',1,'[{\"added\": {}}]',12,1),(50,'2016-12-05 09:04:45','17','Крыло. С сыром',1,'[{\"added\": {}}]',12,1),(51,'2016-12-05 09:07:54','18','Голень. Европейский (Неострый)',1,'[{\"added\": {}}]',12,1),(52,'2016-12-05 09:08:35','19','Голень. Европейский (Острый)',1,'[{\"added\": {}}]',12,1),(53,'2016-12-05 09:12:12','20','Голень. Классический (Неострый)',1,'[{\"added\": {}}]',12,1),(54,'2016-12-05 09:12:45','21','Голень. Классический (Острый)',1,'[{\"added\": {}}]',12,1),(55,'2016-12-05 09:15:15','22','Голень. Терияки',1,'[{\"added\": {}}]',12,1),(56,'2016-12-05 09:18:19','23','Голень. С сыром',1,'[{\"added\": {}}]',12,1),(57,'2016-12-06 16:56:23','24','Филе. Европейский (Неострый)',1,'[{\"added\": {}}]',12,1),(58,'2016-12-06 17:04:21','25','Филе. Европейский (Острый)',1,'[{\"added\": {}}]',12,1),(59,'2016-12-06 17:11:51','3','Салат \"Огурцы + Помидоры\"',1,'[{\"added\": {}}]',13,1),(60,'2016-12-06 17:13:07','4','Мариновыне огурчики',1,'[{\"added\": {}}]',13,1),(61,'2016-12-06 17:15:47','5','Чикен в стакане (кока-  кола + филе)',1,'[{\"added\": {}}]',13,1),(62,'2016-12-06 17:17:06','6','Чикен крем суп (250г)',1,'[{\"added\": {}}]',13,1),(63,'2016-12-06 17:18:10','6','140г - 90 сом',1,'[{\"added\": {}}]',11,1),(64,'2016-12-06 17:18:42','2','Картофель по-деревенски',1,'[{\"added\": {}}]',10,1),(65,'2016-12-06 17:19:51','7','140г - 100 сом',1,'[{\"added\": {}}]',11,1),(66,'2016-12-06 17:19:57','3','Картофельные шарики',1,'[{\"added\": {}}]',10,1),(67,'2016-12-06 17:23:24','8','100г - 90 сом',1,'[{\"added\": {}}]',11,1),(68,'2016-12-06 17:23:30','4','Луковые кольца',1,'[{\"added\": {}}]',10,1),(69,'2016-12-06 17:26:16','2','Кола (0,5)',1,'[{\"added\": {}}]',9,1),(70,'2016-12-06 17:27:27','3','Американо',1,'[{\"added\": {}}]',9,1),(71,'2016-12-06 17:29:09','1','0550760077, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[{\"changed\": {\"fields\": [\"additional_phone_number\"]}}]',15,1),(72,'2016-12-06 17:56:59','2','+ 0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[{\"changed\": {\"fields\": [\"phone_number\", \"additional_phone_number\"]}}]',15,1),(73,'2016-12-06 17:57:10','2','+ 0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',3,'',15,1),(74,'2016-12-06 17:57:26','1','+ 0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[{\"changed\": {\"fields\": [\"phone_number\", \"additional_phone_number\"]}}]',15,1),(75,'2016-12-06 17:58:19','1','0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[{\"changed\": {\"fields\": [\"phone_number\", \"additional_phone_number\"]}}]',15,1),(76,'2016-12-07 14:16:30','15','Крыло. Классический (Острый)',2,'[{\"changed\": {\"fields\": [\"preview\"]}}]',12,3),(77,'2016-12-07 14:39:42','9','250г - 250 сом',1,'[{\"added\": {}}]',11,3),(78,'2016-12-07 14:40:47','26','Филе. Класический (Неострый)',1,'[{\"added\": {}}]',12,3),(79,'2016-12-07 14:42:38','27','Филе. Класический (Острый)',1,'[{\"added\": {}}]',12,3),(80,'2016-12-07 14:43:32','27','Филе. Класический (Острый)',2,'[]',12,3),(81,'2016-12-07 14:44:00','25','Филе. Европейский (Острый)',2,'[]',12,3),(82,'2016-12-07 14:44:18','24','Филе. Европейский (Неострый)',2,'[]',12,3),(83,'2016-12-07 14:45:38','24','Филе. Европейский (Неострый)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',12,3),(84,'2016-12-07 14:47:31','28','Филе. Карий (Неострый)',1,'[{\"added\": {}}]',12,3),(85,'2016-12-07 14:48:36','29','Филе. Карий (Острый)',1,'[{\"added\": {}}]',12,3),(86,'2016-12-07 14:48:48','28','Филе. Карий (Неострый)',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',12,3),(87,'2016-12-07 14:50:46','30','Филе.Терияки',1,'[{\"added\": {}}]',12,3),(88,'2016-12-07 14:52:07','31','Филе. С сыром',1,'[{\"added\": {}}]',12,3),(89,'2016-12-07 14:58:42','10','900г - 770 сом',1,'[{\"added\": {}}]',11,3),(90,'2016-12-07 15:01:12','32','Сет из курицы. Европейский (Неострый)',1,'[{\"added\": {}}]',12,3),(91,'2016-12-07 15:02:58','33','Сет из курицы. Европейский (Острый)',1,'[{\"added\": {}}]',12,3),(92,'2016-12-07 15:03:12','32','Сет из курицы. Европейский (Неострый)',2,'[{\"changed\": {\"fields\": [\"preview\"]}}]',12,3),(93,'2016-12-07 15:06:28','34','Сет из курицы. Классический соус (Неострый)',1,'[{\"added\": {}}]',12,3),(94,'2016-12-07 15:07:14','35','Сет из курицы. Классический соус (Острый)',1,'[{\"added\": {}}]',12,3),(95,'2016-12-07 15:09:43','36','Сет из курицы.Карий (Неострый)',1,'[{\"added\": {}}]',12,3),(96,'2016-12-07 15:12:02','37','Сет из курицы.Карий (Острый)',1,'[{\"added\": {}}]',12,3),(97,'2016-12-07 15:13:45','38','Сет из курицы. Терияки',1,'[{\"added\": {}}]',12,3),(98,'2016-12-07 15:14:44','39','Сет из курицы.Сырный',1,'[{\"added\": {}}]',12,3),(99,'2016-12-07 15:15:21','11','900г - 790 сом',1,'[{\"added\": {}}]',11,3),(100,'2016-12-07 15:15:25','39','Сет из курицы.Сырный',2,'[]',12,3),(101,'2016-12-07 15:18:36','40','Сет из Филе. Европейский (Неострый)',1,'[{\"added\": {}}]',12,3),(102,'2016-12-07 15:19:33','41','Сет из Филе. Европейский (Острый)',1,'[{\"added\": {}}]',12,3),(103,'2016-12-07 15:20:40','42','Сет из Филе. Классический соус (Неострый)',1,'[{\"added\": {}}]',12,3),(104,'2016-12-07 15:21:33','43','Сет из Филе. Классический соус (Острый)',1,'[{\"added\": {}}]',12,3),(105,'2016-12-07 15:23:30','44','Сет из Филе. Карий (Неострый)',1,'[{\"added\": {}}]',12,3),(106,'2016-12-07 15:25:08','45','Сет из Филе. Карий (Острый)',1,'[{\"added\": {}}]',12,3),(107,'2016-12-07 15:26:03','46','Сет из Филе. Терияки',1,'[{\"added\": {}}]',12,3),(108,'2016-12-07 15:26:53','12','900г - 840 сом',1,'[{\"added\": {}}]',11,3),(109,'2016-12-07 15:27:09','47','Сет из Филе. Сырный',1,'[{\"added\": {}}]',12,3),(110,'2016-12-07 17:29:04','5','Чикен в стакане (кока-  кола + филе)',2,'[{\"changed\": {\"fields\": [\"preview\"]}}]',13,3),(111,'2016-12-07 17:54:05','7','Кимпаб',1,'[{\"added\": {}}]',13,3),(112,'2016-12-08 04:20:28','6','Чикен крем суп (180г)',2,'[{\"changed\": {\"fields\": [\"title\", \"description\"]}}]',13,3),(113,'2016-12-08 04:21:39','2','Картофель по-деревенски',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',10,3),(114,'2016-12-08 04:22:16','13','100г - 100 сом',1,'[{\"added\": {}}]',11,3),(115,'2016-12-08 04:22:20','3','Картофельные шарики',2,'[]',10,3),(116,'2016-12-08 04:22:43','4','Луковые кольца',2,'[]',10,3),(117,'2016-12-08 04:24:00','3','Салат \"Огурцы + Помидоры\"',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',13,3),(118,'2016-12-08 04:24:32','4','Мариновыне огурчики',2,'[]',13,3),(119,'2016-12-08 04:26:02','1','Чикен сендвич',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',13,3),(120,'2016-12-08 04:35:24','1','0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[]',15,3),(121,'2016-12-08 04:48:33','8','Хот-Дог',1,'[{\"added\": {}}]',13,3),(122,'2016-12-08 04:54:41','3','Капучино',2,'[{\"changed\": {\"fields\": [\"title\", \"description\"]}}]',9,3),(123,'2016-12-08 04:57:32','4','Sprite 0,5',1,'[{\"added\": {}}]',9,3),(124,'2016-12-08 04:58:40','5','Bonaqua 0,5',1,'[{\"added\": {}}]',9,3),(125,'2016-12-08 05:00:10','6','juice (piko) 0.5',1,'[{\"added\": {}}]',9,3),(126,'2016-12-08 05:01:10','7','Fusetea 0,5',1,'[{\"added\": {}}]',9,3),(127,'2016-12-08 08:57:36','10','fcghh - 954555',3,'',14,3),(128,'2016-12-08 08:57:38','9','Erlan Enazarov - 707330726',3,'',14,3),(129,'2016-12-08 08:57:38','8','test - test',3,'',14,3),(130,'2016-12-08 08:57:38','7','test - test',3,'',14,3),(131,'2016-12-08 08:57:38','6','тест - тест',3,'',14,3),(132,'2016-12-08 08:57:38','5','Екатерина - 0700240690',3,'',14,3),(133,'2016-12-08 11:02:52','11','fcghh - 954555',3,'',14,3),(134,'2016-12-08 11:04:36','5','Чикен в стакане (кока-  кола + филе)',2,'[{\"changed\": {\"fields\": [\"price\"]}}]',13,3),(135,'2016-12-08 12:43:04','12','ntgt - 33456',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(136,'2016-12-08 16:54:04','4','Луковые кольца',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',10,3),(137,'2016-12-09 06:32:49','14','500г - 490 сом',1,'[{\"added\": {}}]',11,3),(138,'2016-12-09 06:33:02','15','250г - 270 сом',1,'[{\"added\": {}}]',11,3),(139,'2016-12-09 06:33:06','31','Филе. С сыром',2,'[]',12,3),(140,'2016-12-10 07:17:32','12','ntgt - 33456',3,'',14,3),(141,'2016-12-10 16:26:55','3','Капучино',2,'[{\"changed\": {\"fields\": [\"preview\"]}}]',9,3),(142,'2016-12-10 16:27:48','3','Капучино',2,'[{\"changed\": {\"fields\": [\"preview\"]}}]',9,3),(143,'2016-12-12 10:58:11','13','иска - 552886555',3,'',14,3),(144,'2016-12-13 10:28:30','8','Кола 1л.',1,'[{\"added\": {}}]',9,3),(145,'2016-12-13 14:47:08','20','khbygv - 85156658',3,'',14,3),(146,'2016-12-13 14:47:08','19','khbygv - 85156658',3,'',14,3),(147,'2016-12-13 14:47:08','18','Вит - 55347',3,'',14,3),(148,'2016-12-13 14:47:08','17','Вит - 55347',3,'',14,3),(149,'2016-12-13 14:47:09','16','Нурила - 0702840958',3,'',14,3),(150,'2016-12-13 14:47:09','15','Ргвлал - Рводв',3,'',14,3),(151,'2016-12-13 14:47:09','14','Ргвлал - Рводв',3,'',14,3),(152,'2016-12-13 15:21:41','22','Ер - 1235',3,'',14,3),(153,'2016-12-13 15:21:41','21','Fhi - 0702840958',3,'',14,3),(154,'2016-12-14 13:17:50','8','Кола 1л.',2,'[{\"changed\": {\"fields\": [\"price\"]}}]',9,3),(155,'2016-12-14 14:41:44','23','Вит - 70085',3,'',14,3),(156,'2016-12-17 12:41:13','24','Чолпон - 0706011019',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(157,'2016-12-17 14:38:26','24','Чолпон - 0706011019',3,'',14,3),(158,'2016-12-21 05:43:49','26','света - 772675728',3,'',14,3),(159,'2016-12-21 05:43:49','25','света - 772675728',3,'',14,3),(160,'2016-12-21 11:10:43','27','Асхат - 777 987 800',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(161,'2016-12-23 14:25:30','27','Асхат - 777 987 800',3,'',14,3),(162,'2016-12-24 13:18:54','28','Валерия - 0550557327',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(163,'2016-12-24 13:19:04','29','ии - ии',3,'',14,3),(164,'2016-12-25 04:53:15','28','Валерия - 0550557327',3,'',14,3),(165,'2016-12-25 15:18:04','31','Эрика - 0700997777',3,'',14,3),(166,'2016-12-25 15:18:14','32','Эрика - 0700997777',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(167,'2016-12-25 15:18:14','30','Maksim Mentus - 0701999913',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(168,'2016-12-26 11:31:50','7','Кимпаб',2,'[{\"changed\": {\"fields\": [\"price\"]}}]',13,3),(169,'2016-12-26 11:32:07','6','Чикен крем суп (180г)',2,'[{\"changed\": {\"fields\": [\"price\"]}}]',13,3),(170,'2016-12-26 12:27:03','33','Фируза - 0550073355',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(171,'2016-12-26 15:21:38','3','Картофельные шарики',3,'',10,3),(172,'2016-12-26 15:21:54','2','Картофель по-деревенски',2,'[]',10,3),(173,'2016-12-27 06:04:24','34','Jika - 0700889394',3,'',14,3),(174,'2016-12-27 06:04:24','33','Фируза - 0550073355',3,'',14,3),(175,'2016-12-27 07:01:20','35','Айзада - 0702885880',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(176,'2016-12-27 14:09:16','37','Азамат - 0554202001',2,'[{\"changed\": {\"fields\": [\"accepted\"]}}]',14,3),(177,'2016-12-27 14:09:17','36','Урмат - 0779007708',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(178,'2016-12-27 14:09:34','36','Урмат - 0779007708',3,'',14,3),(179,'2016-12-27 14:09:34','35','Айзада - 0702885880',3,'',14,3),(180,'2016-12-27 14:09:46','32','Эрика - 0700997777',3,'',14,3),(181,'2016-12-27 14:09:46','30','Maksim Mentus - 0701999913',3,'',14,3),(182,'2016-12-27 15:19:51','37','Азамат - 0554202001',3,'',14,3),(183,'2016-12-28 11:08:36','1','Картошка фри',2,'[]',10,3),(184,'2016-12-28 11:12:08','9','Кимчи',1,'[{\"added\": {}}]',13,3),(185,'2016-12-28 11:15:03','1','Чикен сендвич',2,'[{\"changed\": {\"fields\": [\"description\", \"preview\"]}}]',13,3),(186,'2016-12-29 08:59:50','38','Жасмин - 0552227223',3,'',14,3),(187,'2016-12-30 14:04:06','40','Эльнура - 0706991124',3,'',14,3),(188,'2016-12-30 14:04:06','39','Урмат - 0777010021',3,'',14,3),(189,'2016-12-31 05:04:41','41','Нэриянна - 0555678900',3,'',14,3),(190,'2017-01-03 07:55:22','42','Нэрианна - 0555678900',3,'',14,3),(191,'2017-01-04 09:09:29','43','Айгерим - 0709205127',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(192,'2017-01-04 09:22:33','43','Айгерим - 0709205127',3,'',14,3),(193,'2017-01-06 10:03:07','44','Эльнура - 0555797179',3,'',14,3),(194,'2017-01-06 13:17:31','45','Урмат - 0779007708',3,'',14,3),(195,'2017-01-06 13:29:45','46','vera - 0709952233',3,'',14,3),(196,'2017-01-06 14:08:58','48','Жасмин - +996552227223',3,'',14,3),(197,'2017-01-06 14:08:58','47','Эрика - 0706139999',3,'',14,3),(198,'2017-01-07 10:08:47','49','мархабаткан - 0559909349',3,'',14,3),(199,'2017-01-09 14:27:47','50','kgfdkf - hgskhgskdjf`',1,'[{\"added\": {}}]',14,3),(200,'2017-01-09 14:28:03','50','kgfdkf - hgskhgskdjf`',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(201,'2017-01-09 14:28:53','50','kgfdkf - hgskhgskdjf`',3,'',14,3),(202,'2017-01-09 15:00:57','1','0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[]',15,3),(203,'2017-01-09 15:34:38','1','0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[{\"changed\": {\"fields\": [\"time_of_work\"]}}]',15,3),(204,'2017-01-09 15:35:06','1','0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[]',15,3),(205,'2017-01-09 15:35:07','1','0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[]',15,3),(206,'2017-01-09 15:35:07','1','0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[]',15,3),(207,'2017-01-09 15:35:30','1','0 550 76 00 77, Чуй 150А, ТЦ \"Бета Сторес 1\"',2,'[{\"changed\": {\"fields\": [\"time_of_work\"]}}]',15,3),(208,'2017-01-11 12:20:45','51','ёнг мин - 0778814824',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(209,'2017-01-13 08:00:56','52','Айзада - 0702885880',3,'',14,3),(210,'2017-01-13 08:16:06','51','ёнг мин - 0778814824',3,'',14,3),(211,'2017-01-14 05:37:50','53','Адил - 05500092997',3,'',14,3),(212,'2017-01-14 13:39:31','54','Aziza - 0703333094',3,'',14,3),(213,'2017-01-15 13:32:46','56','Тимур - 0555 508-113',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(214,'2017-01-15 13:32:47','55','Юля - 0702700711',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(215,'2017-01-15 13:55:31','9','Кимчи',3,'',13,3),(216,'2017-01-15 15:18:54','57','Эрика - 0706139999',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(217,'2017-01-16 08:05:48','57','Эрика - 0706139999',3,'',14,3),(218,'2017-01-16 08:05:49','56','Тимур - 0555 508-113',3,'',14,3),(219,'2017-01-16 08:05:49','55','Юля - 0702700711',3,'',14,3),(220,'2017-01-17 06:56:19','59','Диана - 0770297476',3,'',14,3),(221,'2017-01-17 06:56:19','58','Диана - 0770297476',3,'',14,3),(222,'2017-01-18 05:26:26','61','Сабина - 0704766226',3,'',14,3),(223,'2017-01-18 05:26:26','60','Сабина - 0704766226',3,'',14,3),(224,'2017-01-19 13:36:21','62','Чжон Сан Чжин - 0773792274',3,'',14,3),(225,'2017-01-19 14:15:48','63','Бегимай - 0553692693',3,'',14,3),(226,'2017-01-20 08:13:47','65','Саадат - 0555892235',3,'',14,3),(227,'2017-01-20 08:13:47','64','Саадат - 0555892235',3,'',14,3),(228,'2017-01-20 12:27:23','66','Радж - 0702061824',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(229,'2017-01-20 13:44:30','67','Чынгыз - 0771117518',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(230,'2017-01-21 08:11:21','68','София - 0555887575',3,'',14,3),(231,'2017-01-21 08:11:21','67','Чынгыз - 0771117518',3,'',14,3),(232,'2017-01-21 08:11:21','66','Радж - 0702061824',3,'',14,3),(233,'2017-01-22 05:26:47','69','Чынгыз - 0771117518',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(234,'2017-01-22 05:26:56','69','Чынгыз - 0771117518',3,'',14,3),(235,'2017-01-22 09:03:06','70','Юля - 0555 57 77 33',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(236,'2017-01-22 11:22:06','71','Тимур - 0555 508-113',3,'',14,3),(237,'2017-01-22 11:22:06','70','Юля - 0555 57 77 33',3,'',14,3),(238,'2017-01-23 12:54:26','5','Чикен в стакане (кока-  кола + филе)',2,'[{\"changed\": {\"fields\": [\"price\"]}}]',13,3),(239,'2017-01-24 14:57:19','72','Юля - 0702700711',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(240,'2017-01-26 11:31:20','74','Эрика - 0706139999',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(241,'2017-01-26 11:31:20','73','Radj - 0702061824',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(242,'2017-01-27 10:19:29','75','Maksim - 0555905737',2,'[{\"changed\": {\"fields\": [\"accepted\"]}}]',14,3),(243,'2017-01-27 13:47:39','75','Maksim - 0555905737',2,'[{\"changed\": {\"fields\": [\"delivered\"]}}]',14,3),(244,'2017-02-01 04:22:50','76','enosh - 0700062123',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(245,'2017-02-03 13:21:04','76','enosh - 0700062123',3,'',14,3),(246,'2017-02-03 13:21:04','75','Maksim - 0555905737',3,'',14,3),(247,'2017-02-03 13:21:04','74','Эрика - 0706139999',3,'',14,3),(248,'2017-02-03 13:21:04','73','Radj - 0702061824',3,'',14,3),(249,'2017-02-03 13:21:04','72','Юля - 0702700711',3,'',14,3),(250,'2017-02-05 10:12:34','77','Чынгыз - 0771 117 518',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(251,'2017-02-08 06:25:54','77','Чынгыз - 0771 117 518',3,'',14,3),(252,'2017-02-11 05:10:32','78','Чжон Сан Чжин - 0773792274',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(253,'2017-02-12 13:07:01','79','Хезер Фаррелл - 0777478232',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(254,'2017-02-12 14:02:34','80','Saikal - 0555053633',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(255,'2017-02-14 11:40:16','82','Юлия - 0555 57 77 33',3,'',14,3),(256,'2017-02-14 11:40:26','81','Юлия - 0555 57 77 33',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(257,'2017-02-14 12:42:53','83','Гулира - 0550515615',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(258,'2017-02-14 15:12:34','84','михаил - 0700882511',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(259,'2017-02-15 12:36:21','85','Джун Вон - 0555115254',2,'[{\"changed\": {\"fields\": [\"accepted\"]}}]',14,3),(260,'2017-02-15 14:52:41','85','Джун Вон - 0555115254',2,'[{\"changed\": {\"fields\": [\"delivered\"]}}]',14,3),(261,'2017-02-17 11:42:32','86','Чынгыз - 0771 117 518',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(262,'2017-02-19 14:01:33','88','Квон Иёнг Ин - 0772677958',3,'',14,3),(263,'2017-02-19 14:01:33','87','Влад - +996779177338',3,'',14,3),(264,'2017-02-19 14:01:33','86','Чынгыз - 0771 117 518',3,'',14,3),(265,'2017-02-20 11:09:42','85','Джун Вон - 0555115254',3,'',14,3),(266,'2017-02-20 11:09:42','84','михаил - 0700882511',3,'',14,3),(267,'2017-02-20 11:09:42','83','Гулира - 0550515615',3,'',14,3),(268,'2017-02-20 11:09:42','81','Юлия - 0555 57 77 33',3,'',14,3),(269,'2017-02-20 11:09:42','80','Saikal - 0555053633',3,'',14,3),(270,'2017-02-20 11:09:42','79','Хезер Фаррелл - 0777478232',3,'',14,3),(271,'2017-02-20 11:09:43','78','Чжон Сан Чжин - 0773792274',3,'',14,3),(272,'2017-02-23 10:30:08','89','Влад - +996779177338',2,'[{\"changed\": {\"fields\": [\"accepted\"]}}]',14,3),(273,'2017-02-23 11:10:56','89','Влад - +996779177338',3,'',14,3),(274,'2017-02-24 07:24:38','4','Луковые кольца',3,'',10,3),(275,'2017-02-24 07:25:23','1','Картошка фри',2,'[]',10,3),(276,'2017-02-24 07:26:17','3','Капучино',3,'',9,3),(277,'2017-02-24 07:27:37','5','Чикен в стакане (кока-  кола + филе)',2,'[{\"changed\": {\"fields\": [\"price\"]}}]',13,3),(278,'2017-02-24 07:27:52','1','Чикен сендвич',2,'[{\"changed\": {\"fields\": [\"price\"]}}]',13,3),(279,'2017-02-28 13:19:52','90','Алтынай - 0556031370',3,'',14,3),(280,'2017-03-02 16:17:01','91','Кро - 5678',3,'',14,3),(281,'2017-03-03 15:53:14','92','Айсана - 0777009977',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(282,'2017-03-03 15:57:25','92','Айсана - 0777009977',3,'',14,3),(283,'2017-03-10 05:53:58','93','Айзада - 0702885880',3,'',14,3),(284,'2017-03-11 15:46:46','94','Насипа - 0703406644',3,'',14,3),(285,'2017-03-14 05:05:15','95','Чжон Сан Чжин - 0773792274',3,'',14,3),(286,'2017-03-14 14:39:07','96','Малик - 0559004910',3,'',14,3),(287,'2017-03-16 04:43:35','97','Тимур - +996700420099',3,'',14,3),(288,'2017-03-18 10:47:26','98','Карина - 0555305718',3,'',14,3),(289,'2017-03-19 15:38:07','99','Адилет - 0708020600',3,'',14,3),(290,'2017-03-20 12:40:09','100','Аниса - 0555666284',2,'[{\"changed\": {\"fields\": [\"delivered\", \"accepted\"]}}]',14,3),(291,'2017-03-20 12:40:45','100','Аниса - 0555666284',3,'',14,3),(292,'2017-03-20 14:13:46','101','Ао - Проо',3,'',14,3),(293,'2017-03-21 12:48:06','105','Разия - 0772659937',3,'',14,3),(294,'2017-03-21 12:48:06','104','Разия - 0772659937',3,'',14,3),(295,'2017-03-21 12:48:06','103','Разия - 0772659937',3,'',14,3),(296,'2017-03-21 12:48:45','102','Разия - 0772659937',3,'',14,3),(297,'2017-03-21 12:55:04','106','Разия - 0772659937',3,'',14,3),(298,'2017-03-22 05:32:35','107','Квон Иёнг Ин - 0772677958',3,'',14,3),(299,'2017-03-28 15:38:24','108','Чжон Сан Чжин - 0773792274',3,'',14,3),(300,'2017-04-02 04:07:48','2','Картофель по-деревенски',3,'',10,3),(301,'2017-04-03 15:40:51','109','Лиза - 0777466902',3,'',14,3),(302,'2017-04-05 14:52:18','111','Лиза - 0777466902',3,'',14,3),(303,'2017-04-05 14:52:18','110','Айназик - 0700221901',3,'',14,3),(304,'2017-04-10 08:02:30','37','Сет из курицы.Карий (Острый)',3,'',12,3),(305,'2017-04-10 08:02:30','36','Сет из курицы.Карий (Неострый)',3,'',12,3),(306,'2017-04-10 08:03:23','11','Курица. Карий (Острый)',3,'',12,3),(307,'2017-04-10 08:03:23','10','Курица. Карий (Неострый)',3,'',12,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(6,'auth','group'),(4,'auth','permission'),(5,'auth','user'),(7,'contenttypes','contenttype'),(1,'jet','bookmark'),(2,'jet','pinnedapplication'),(15,'koko_models','contacts'),(9,'koko_models','drinkingproduct'),(12,'koko_models','mainproduct'),(14,'koko_models','order'),(10,'koko_models','potatoproduct'),(11,'koko_models','productsizes'),(13,'koko_models','saladeproduct'),(8,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-12-01 10:58:05'),(2,'auth','0001_initial','2016-12-01 10:58:11'),(3,'admin','0001_initial','2016-12-01 10:58:12'),(4,'admin','0002_logentry_remove_auto_add','2016-12-01 10:58:12'),(5,'contenttypes','0002_remove_content_type_name','2016-12-01 10:58:13'),(6,'auth','0002_alter_permission_name_max_length','2016-12-01 10:58:14'),(7,'auth','0003_alter_user_email_max_length','2016-12-01 10:58:15'),(8,'auth','0004_alter_user_username_opts','2016-12-01 10:58:15'),(9,'auth','0005_alter_user_last_login_null','2016-12-01 10:58:17'),(10,'auth','0006_require_contenttypes_0002','2016-12-01 10:58:17'),(11,'auth','0007_alter_validators_add_error_messages','2016-12-01 10:58:17'),(12,'auth','0008_alter_user_username_max_length','2016-12-01 10:58:18'),(13,'jet','0001_initial','2016-12-01 10:58:18'),(14,'jet','0002_delete_userdashboardmodule','2016-12-01 10:58:18'),(15,'koko_models','0001_initial','2016-12-01 10:58:21'),(16,'koko_models','0002_drinkingproduct_potatoproduct_saladeproduct','2016-12-01 10:58:22'),(17,'koko_models','0003_order','2016-12-01 10:58:22'),(18,'koko_models','0004_auto_20161201_0541','2016-12-01 10:58:23'),(19,'koko_models','0005_order_score','2016-12-01 10:58:23'),(20,'sessions','0001_initial','2016-12-01 10:58:24'),(21,'koko_models','0006_contacts','2016-12-01 12:38:26'),(22,'koko_models','0007_order_accepted','2016-12-02 05:36:51'),(23,'koko_models','0008_contacts_time_of_work','2017-01-09 14:59:07');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('14vih9ykg95bhe0m1oisjyscldtac6kp','Y2NlOTBiYTY5ZTA4ZTZlNjM5NDEyYmMzYzRkYTM5NWNkZWYxY2JiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyN2YyYWFlYTJmNWQ5MTQ2NDUxNjZjN2FmNDI1MThhYWIxNDU4YWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-15 11:03:06'),('1td0pak9k9lba2k303sexxx70o3fdirr','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-03-17 10:39:08'),('3hj5z18uws9bmqpdzv4y6z61e5p1y4ms','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-03-04 04:18:53'),('3tgzcg6yfdfcwv5px5kd8cs3dxs4us0c','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-12-24 16:28:27'),('5mf6sqyv4pxb3fcpb1nbz6j30j3qwuvq','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-01-11 10:41:03'),('6xfnu9rjropwdkuj48dx06g67idemykq','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-03-05 12:27:02'),('7ep88tu7c10coqimiwvgwioiydjkcx51','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-12-21 14:13:52'),('7lv32mzucukvgngswu0bo842kzj64sxd','Y2NlOTBiYTY5ZTA4ZTZlNjM5NDEyYmMzYzRkYTM5NWNkZWYxY2JiYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyN2YyYWFlYTJmNWQ5MTQ2NDUxNjZjN2FmNDI1MThhYWIxNDU4YWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-15 12:39:03'),('81klm5666xflyb34b4ywahltph6zer78','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-12-23 14:20:12'),('8j714223a00vqydm39ufnzn3q1w10yey','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-01-05 05:02:46'),('99fht5ylbiqedy90vgh4jw2tumj83iwi','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-12-21 17:25:18'),('dph7ukmbeft93hs4miloajwao01dq2e2','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-12-26 17:31:46'),('f9u6ur5ho440cwe3zpcxxth0vyhp8566','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-01-19 09:09:38'),('fb7z99kg3e89acvg5653y8ghdsnx9wo5','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-03-02 11:32:47'),('gvqnqfyet8keo3axpxkldrd1d7mzfuuy','YzYxNGE5ZjRhOWFmNDA0MWVjZTFiNGQxMDRhNTRjMjc4OWNiY2I4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2MmE3YmI4NzRiN2YwZmM1M2ZmNWRlOTBiZTNlZDdmMmY5N2NlMzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-21 06:18:25'),('hsdsz7lqqvr3asykg2qd59ebhow1qkdk','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-02-14 10:32:04'),('ikeada8llkrnpyu9c0sy4xe0jwmylquk','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-02-02 08:24:22'),('ivemsbnxfitd247s7kau2hk55noi92bc','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-02-25 07:42:39'),('jz0d122hafwtazysba4tak3skno0pxb6','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-03-13 08:57:07'),('l4aep6bwycwt314o52qm0b8zyusoum0x','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-04-11 06:17:59'),('pwluemd5wv2k7oak6por6p9h5kv26r7v','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-03-27 10:51:30'),('r3rtoiryk22d72a8yxnaik46osoc42uw','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-03-13 07:54:22'),('scbxt9wys3rt0xosw0b0ky60oyc4jul3','NzBmZmM3MzQxZWM5YzRmZWE4NGM3YWUyZTRmNDI1MTc2ZGNiNzg3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMDBhNzAyZDBlOGNkMmQyMTUzZDU5ZDdhODQ4NTVhNmNhMGVjNjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-03-05 13:53:58'),('sqnzvlbtn993nlg7gki1lvnasg0lnrx6','YzYxNGE5ZjRhOWFmNDA0MWVjZTFiNGQxMDRhNTRjMjc4OWNiY2I4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2MmE3YmI4NzRiN2YwZmM1M2ZmNWRlOTBiZTNlZDdmMmY5N2NlMzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-20 20:26:53'),('ypp1e9od7xfqit0zw99k0w2wqud3ln4a','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-02-16 10:13:12'),('yrayedcd0ahvmz2i6browqht3bqrpymn','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-03-04 12:03:34'),('zcfims6ofhedcmxmhha8k4werszn4tkr','M2Y3YTNkOTdlYWM5Nzc3OTU0YzQ3ZDBlMTRjNWJkMTE2NmFhODA4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYjI1YTRiNDExODg5ZTRlMjE2ODAyMmJiYmI3NDAwZjljMzJiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-12-15 15:16:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinking_product`
--

DROP TABLE IF EXISTS `drinking_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drinking_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `preview` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinking_product`
--

LOCK TABLES `drinking_product` WRITE;
/*!40000 ALTER TABLE `drinking_product` DISABLE KEYS */;
INSERT INTO `drinking_product` VALUES (2,'Кола (0,5)','Кока-кола','drinking_products/coca_5VLd9wb.jpg',30),(4,'Sprite 0,5','Sprite 0,5','drinking_products/389_sprite-1l.jpg',30),(5,'Bonaqua 0,5','Bonaqua 0,5','drinking_products/hAOxMmif80XrCkC.jpg',20),(6,'juice (piko) 0.5','juice (piko) 0.5','drinking_products/napitok_sokosoderzhawij_piko_pulply_apel_sin_0_5_l_192_192_5_80.jpeg',40),(7,'Fusetea 0,5','Fusetea 0,5','drinking_products/donerlife_fuse.jpg',40),(8,'Кола 1л.','кола','drinking_products/f9a64e3ef5090bc344f5922fcab7939b.jpg',50);
/*!40000 ALTER TABLE `drinking_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_bookmark`
--

DROP TABLE IF EXISTS `jet_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jet_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_bookmark`
--

LOCK TABLES `jet_bookmark` WRITE;
/*!40000 ALTER TABLE `jet_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_pinnedapplication`
--

DROP TABLE IF EXISTS `jet_pinnedapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jet_pinnedapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_pinnedapplication`
--

LOCK TABLES `jet_pinnedapplication` WRITE;
/*!40000 ALTER TABLE `jet_pinnedapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_pinnedapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koko_models_order`
--

DROP TABLE IF EXISTS `koko_models_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koko_models_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `orders` longtext NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `score` double NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koko_models_order`
--

LOCK TABLES `koko_models_order` WRITE;
/*!40000 ALTER TABLE `koko_models_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `koko_models_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_product`
--

DROP TABLE IF EXISTS `main_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `preview` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_product`
--

LOCK TABLES `main_product` WRITE;
/*!40000 ALTER TABLE `main_product` DISABLE KEYS */;
INSERT INTO `main_product` VALUES (3,'Курица. Европейский кляр (Неострый)','Состав: Курица в европейском кляре','main_products/europ.png'),(4,'Курица. Европейский кляр (Острый)','Состав: курица в остром европейском кляре','main_products/europ_VXJ3wGk.png'),(5,'Курица. Классический кляр (Неострый)','Состав: курица в классическом кляре','main_products/classic.png'),(7,'Курица. Классический кляр (Острый)','Состав: курица в остром классическом кляре','main_products/classic_kQVnDgp.png'),(8,'Курица. Соус терияки','Состав: рубленая курица в соусе терияки','main_products/rublenaya_kurochka_v_souse_teriyaki.jpg'),(9,'Курица. C сыром','Состав: рубленая курица с сыром \"Пармезан\"','main_products/cheese.jpg'),(12,'Крыло. Европейский (Неострый)','Состав: Куриные крылышки в европейском кляре','main_products/chiken_krilishki_v_klyare_evro.jpg'),(13,'Крыло. Европейский (Острый)','Состав: куриные крылышки в европейском кляре','main_products/chiken_krilishki_v_klyare_evro_crTXPr6.jpg'),(14,'Крыло. Классический (Неострый)','Состав: Куриные крылышки в классическом кляре.','main_products/16.jpg'),(15,'Крыло. Классический (Острый)','Состав: куриные крылышки в остром классическом кляре','main_products/16_GLPR4A2.jpg'),(16,'Крыло. Соус Терияки','Состав: Куриные крылышки в соусе терияки','main_products/teriyaki.jpg'),(17,'Крыло. С сыром','Состав: Куриные крылышки c сыром','main_products/cheese_ftzfykN.jpg'),(18,'Голень. Европейский (Неострый)','Состав: куринные голени в Европейском кляре','main_products/golen-europ.jpg'),(19,'Голень. Европейский (Острый)','Состав: Куриные голени в остром Европейском кляре','main_products/golen-europ_stPSYbk.jpg'),(20,'Голень. Классический (Неострый)','Состав: Куриные голени в классическом кляре','main_products/legsevrosous.jpg'),(21,'Голень. Классический (Острый)','Состав: Куриные голени в остром классическом кляре','main_products/legsevrosous_KuPtCjv.jpg'),(22,'Голень. Терияки','Состав: Куриные голени в соусе Терияки','main_products/golen-teriyaki.jpg'),(23,'Голень. С сыром','Состав: Куриные голени с сыром','main_products/golen-cheese.jpg'),(24,'Филе. Европейский (Неострый)','Состав: Куриное филе в европейском кляре','main_products/file-europ_WilQvIu.jpg'),(25,'Филе. Европейский (Острый)','Состав: Куриное филе в остром европейском кляре','main_products/file-europ_FSJjIJe.jpg'),(26,'Филе. Класический (Неострый)','Куриное филе в класическом кляре','main_products/3455.jpg'),(27,'Филе. Класический (Острый)','Куриное филе в класическом осторм кляре','main_products/3455_Bedq4l5.jpg'),(28,'Филе. Карий (Неострый)','Филе в неостром соусе карий','main_products/258s.jpg'),(29,'Филе. Карий (Острый)','Филе в остром соусе карий','main_products/258s_sAVXscR.jpg'),(30,'Филе.Терияки','Филе в соусе Терияки','main_products/Other_092014_Chinese_Lemon_Chicken_500x350.jpg'),(31,'Филе. С сыром','Филе с сыром пармезан','main_products/Koko-Buri-Fried-Chicken.jpg'),(32,'Сет из курицы. Европейский (Неострый)','Курица в европейском кляре  +кола 0.3','main_products/europ_PIcxK6G.png'),(33,'Сет из курицы. Европейский (Острый)','Курица в европейском остром кляре. + кола 0.3','main_products/europ_2STDviB.png'),(34,'Сет из курицы. Классический соус (Неострый)','Курица в класическом кляре +кола 0.3','main_products/classic_TJ7Sxso.png'),(35,'Сет из курицы. Классический соус (Острый)','Курица в класическом осторм кляре +кола 0.3','main_products/classic_NJkjSps.png'),(38,'Сет из курицы. Терияки','Курица в соусе терияки +кола 0.3','main_products/Other_092014_Chinese_Lemon_Chicken_500x350_TVGVrxZ.jpg'),(39,'Сет из курицы.Сырный','Курица с сыром пармезан +кола 0.3','main_products/cheese_aIrNtNr.jpg'),(40,'Сет из Филе. Европейский (Неострый)','Филе в европейском кляре +кола 0.3','main_products/348s.jpg'),(41,'Сет из Филе. Европейский (Острый)','Филе в европейском остром кляре. + кола 0.3','main_products/348s_Yg7gSWa.jpg'),(42,'Сет из Филе. Классический соус (Неострый)','Филе в класическом кляре +кола 0.3','main_products/classic_S40CVU9.png'),(43,'Сет из Филе. Классический соус (Острый)','Филе в класическом остром кляре +кола 0.3','main_products/classic_K5s1ucE.png'),(44,'Сет из Филе. Карий (Неострый)','Филе в соусе карий + кола 0.3','main_products/kariy_MYPnzew.png'),(45,'Сет из Филе. Карий (Острый)','Филе в соусе карий острый + кола 0.3','main_products/kariy_dLqSU89.png'),(46,'Сет из Филе. Терияки','Филе в соусе терияки +кола 0.3','main_products/Other_092014_Chinese_Lemon_Chicken_500x350_M6AxS7F.jpg'),(47,'Сет из Филе. Сырный','Филе с сыром пармезан +кола 0.3','main_products/cheese_TgwyV5p.jpg');
/*!40000 ALTER TABLE `main_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_product_sizes`
--

DROP TABLE IF EXISTS `main_product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_product_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mainproduct_id` int(11) NOT NULL,
  `productsizes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_product_sizes_mainproduct_id_22c38813_uniq` (`mainproduct_id`,`productsizes_id`),
  KEY `main_product_sizes_productsizes_id_066bb309_fk_product_sizes_id` (`productsizes_id`),
  CONSTRAINT `main_product_sizes_mainproduct_id_1acd0992_fk_main_product_id` FOREIGN KEY (`mainproduct_id`) REFERENCES `main_product` (`id`),
  CONSTRAINT `main_product_sizes_productsizes_id_066bb309_fk_product_sizes_id` FOREIGN KEY (`productsizes_id`) REFERENCES `product_sizes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_product_sizes`
--

LOCK TABLES `main_product_sizes` WRITE;
/*!40000 ALTER TABLE `main_product_sizes` DISABLE KEYS */;
INSERT INTO `main_product_sizes` VALUES (5,3,1),(6,3,2),(7,4,1),(8,4,2),(9,5,1),(10,5,2),(13,7,1),(14,7,2),(15,8,1),(16,8,2),(17,9,3),(18,9,4),(23,12,1),(24,12,2),(25,13,1),(26,13,2),(27,14,1),(28,14,2),(29,15,1),(30,15,2),(31,16,1),(32,16,2),(33,17,3),(34,17,4),(35,18,1),(36,18,2),(37,19,1),(38,19,2),(39,20,1),(40,20,2),(41,21,1),(42,21,2),(43,22,1),(44,22,2),(45,23,3),(46,23,4),(60,24,3),(59,24,9),(58,25,3),(57,25,9),(52,26,3),(51,26,9),(56,27,3),(55,27,9),(62,28,3),(61,28,9),(64,29,3),(63,29,9),(66,30,3),(65,30,9),(86,31,14),(87,31,15),(69,32,10),(70,33,10),(71,34,10),(72,35,10),(75,38,10),(77,39,11),(78,40,11),(79,41,11),(80,42,11),(81,43,11),(82,44,11),(83,45,11),(84,46,11),(85,47,12);
/*!40000 ALTER TABLE `main_product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potato_product`
--

DROP TABLE IF EXISTS `potato_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potato_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `preview` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potato_product`
--

LOCK TABLES `potato_product` WRITE;
/*!40000 ALTER TABLE `potato_product` DISABLE KEYS */;
INSERT INTO `potato_product` VALUES (1,'Картошка фри','Состав: жареная картошка в масле','potato_products/fri.jpg');
/*!40000 ALTER TABLE `potato_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potato_product_sizes`
--

DROP TABLE IF EXISTS `potato_product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potato_product_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `potatoproduct_id` int(11) NOT NULL,
  `productsizes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `potato_product_sizes_potatoproduct_id_64e1ed2a_uniq` (`potatoproduct_id`,`productsizes_id`),
  KEY `potato_product_size_productsizes_id_80e868b2_fk_product_sizes_id` (`productsizes_id`),
  CONSTRAINT `potato_product_size_productsizes_id_80e868b2_fk_product_sizes_id` FOREIGN KEY (`productsizes_id`) REFERENCES `product_sizes` (`id`),
  CONSTRAINT `potato_product_si_potatoproduct_id_11f5a051_fk_potato_product_id` FOREIGN KEY (`potatoproduct_id`) REFERENCES `potato_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potato_product_sizes`
--

LOCK TABLES `potato_product_sizes` WRITE;
/*!40000 ALTER TABLE `potato_product_sizes` DISABLE KEYS */;
INSERT INTO `potato_product_sizes` VALUES (9,1,7);
/*!40000 ALTER TABLE `potato_product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (1,'500',390),(2,'250',210),(3,'500',430),(4,'250',240),(5,'100',80),(6,'140',90),(7,'140',100),(8,'100',90),(9,'250',250),(10,'900',770),(11,'900',790),(12,'900',840),(13,'100',100),(14,'500',490),(15,'250',270);
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salade_product`
--

DROP TABLE IF EXISTS `salade_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salade_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `preview` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salade_product`
--

LOCK TABLES `salade_product` WRITE;
/*!40000 ALTER TABLE `salade_product` DISABLE KEYS */;
INSERT INTO `salade_product` VALUES (1,'Чикен сендвич','Состав: хлеб, курочка, листья салата, помидор, огурец, майонез, кетчуп.','salade_products/31710-405-336-longer.png',150),(2,'Салат греческий','Состав: помидоры, листья салата, оливки, сыр','salade_products/greek_salade.jpg',150),(3,'Салат \"Огурцы + Помидоры\"','Состав: Огурцы, помидоры.','salade_products/salad.jpeg',120),(4,'Мариновыне огурчики','Состав: Маринованые огурчики','salade_products/ogurec.jpg',40),(5,'Чикен в стакане (кока-  кола + филе)','Состав: кока-кола + филе','salade_products/cup.jpg',99),(6,'Чикен крем суп (180г)','Кремовый Суп.','salade_products/soup.jpg',70),(7,'Кимпаб','Кимпаб с куриным филе в хрустящей панировке и свежими овощами. 8шт.','salade_products/photo_2016-12-08_00-02-13.jpg',120),(8,'Хот-Дог','Куриная сосиска в тесте','salade_products/106615040_corndogs2.jpg',80);
/*!40000 ALTER TABLE `salade_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-11 10:07:15
