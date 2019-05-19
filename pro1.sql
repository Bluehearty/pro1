-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: pro1
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 用户',7,'add_user'),(26,'Can change 用户',7,'change_user'),(27,'Can delete 用户',7,'delete_user'),(28,'Can view 用户',7,'view_user'),(29,'Can add blog tyepe',8,'add_blogtyepe'),(30,'Can change blog tyepe',8,'change_blogtyepe'),(31,'Can delete blog tyepe',8,'delete_blogtyepe'),(32,'Can view blog tyepe',8,'view_blogtyepe'),(33,'Can add blog',9,'add_blog'),(34,'Can change blog',9,'change_blog'),(35,'Can delete blog',9,'delete_blog'),(36,'Can view blog',9,'view_blog'),(37,'Can add blog type',10,'add_blogtype'),(38,'Can change blog type',10,'change_blogtype'),(39,'Can delete blog type',10,'delete_blogtype'),(40,'Can view blog type',10,'view_blogtype');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$x9ccxEVui1Qs$WcOLyyWZOlP4Sc0gJtPiF2T8nf4IsqD2fH+MBGdHfMU=','2019-05-14 10:27:40.408237',1,'admin','','','1195074058@qq.com',1,1,'2019-05-14 10:24:58.012609');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `up_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `blog_type_id` int(11) NOT NULL,
  `read_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtyepe_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtyepe_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (1,'第一篇文章','第一篇文章','2019-05-14 12:26:15.898845','2019-05-16 16:08:30.853660',1,2,3),(2,'blog1','xx','2019-05-16 02:53:23.667226','2019-05-16 02:53:23.677270',1,1,0),(3,'blog2','xx','2019-05-16 02:53:23.687252','2019-05-19 08:00:41.054850',1,1,1),(4,'blog3','xx','2019-05-16 02:53:23.727224','2019-05-16 02:53:23.727224',1,1,0),(5,'blog4','xx','2019-05-16 02:53:23.767309','2019-05-16 16:13:53.213982',1,1,1),(6,'blog5','xx','2019-05-16 02:53:23.797439','2019-05-16 02:53:23.797439',1,1,0),(7,'blog6','xx','2019-05-16 02:53:23.817436','2019-05-16 02:53:23.817436',1,1,0),(8,'blog7','xx','2019-05-16 02:53:23.837439','2019-05-16 02:53:23.837439',1,1,0),(9,'blog8','xx','2019-05-16 02:53:23.847430','2019-05-16 02:53:23.847430',1,1,0),(10,'blog9','xx','2019-05-16 02:53:23.857420','2019-05-16 02:53:23.857420',1,1,0),(11,'blog10','xx','2019-05-16 02:53:23.877407','2019-05-16 02:53:23.877407',1,1,0),(12,'blog11','xx','2019-05-16 02:53:23.887225','2019-05-16 02:53:23.887225',1,1,0),(13,'blog12','xx','2019-05-16 02:53:23.897425','2019-05-16 02:53:23.897425',1,1,0),(14,'blog13','xx','2019-05-16 02:53:23.917441','2019-05-16 02:53:23.917441',1,1,0),(15,'blog14','xx','2019-05-16 02:53:23.927419','2019-05-16 02:53:23.927419',1,1,0),(16,'blog15','xx','2019-05-16 02:53:23.947441','2019-05-16 02:53:23.947441',1,1,0),(17,'blog16','xx','2019-05-16 02:53:23.957425','2019-05-16 02:53:23.957425',1,1,0),(18,'blog17','xx','2019-05-16 02:53:23.967432','2019-05-16 02:53:23.967432',1,1,0),(19,'blog18','xx','2019-05-16 02:53:23.987415','2019-05-16 02:53:23.987415',1,1,0),(20,'blog19','xx','2019-05-16 02:53:23.997432','2019-05-16 02:53:23.997432',1,1,0),(21,'blog20','xx','2019-05-16 02:53:24.007225','2019-05-16 02:53:24.007225',1,1,0),(22,'blog21','xx','2019-05-16 02:53:24.027252','2019-05-16 02:53:24.027252',1,1,0),(23,'blog22','xx','2019-05-16 02:53:24.037253','2019-05-16 02:53:24.037253',1,1,0),(24,'blog23','xx','2019-05-16 02:53:24.047437','2019-05-16 02:53:24.047437',1,1,0),(25,'blog24','xx','2019-05-16 02:53:24.057431','2019-05-16 02:53:24.057431',1,1,0),(26,'blog25','xx','2019-05-16 02:53:24.067428','2019-05-16 02:53:24.067428',1,1,0),(27,'blog26','xx','2019-05-16 02:53:24.087260','2019-05-16 02:53:24.087260',1,1,0),(28,'blog27','xx','2019-05-16 02:53:24.087260','2019-05-16 02:53:24.087260',1,1,0),(29,'blog28','xx','2019-05-16 02:53:24.107436','2019-05-16 02:53:24.107436',1,1,0),(30,'blog29','xx','2019-05-16 02:53:24.117225','2019-05-16 02:53:24.117225',1,1,0),(31,'blog30','xx','2019-05-16 02:53:24.127258','2019-05-16 02:53:24.127258',1,1,0),(32,'钢铁是怎样炼成的','方便面空白名恐怖讷河','2019-05-16 07:38:28.968668','2019-05-16 16:09:01.930690',1,3,1);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'Django'),(2,'随笔'),(3,'感悟'),(4,'旅行');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-14 12:24:36.305633','1','Django',1,'[{\"added\": {}}]',8,1),(2,'2019-05-14 12:24:40.484458','2','随笔',1,'[{\"added\": {}}]',8,1),(3,'2019-05-14 12:24:47.834802','3','感悟',1,'[{\"added\": {}}]',8,1),(4,'2019-05-14 12:26:15.904802','1','<Blog: 第一篇文章>',1,'[{\"added\": {}}]',9,1),(5,'2019-05-16 02:06:43.829034','4','旅行',1,'[{\"added\": {}}]',10,1),(6,'2019-05-16 07:38:28.970662','32','<title: 钢铁是怎样炼成的>',1,'[{\"added\": {}}]',9,1);
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'blog','blog'),(8,'blog','blogtyepe'),(10,'blog','blogtype'),(5,'contenttypes','contenttype'),(7,'front','user'),(6,'sessions','session');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-21 10:11:35.754717'),(2,'auth','0001_initial','2019-04-21 10:11:36.438887'),(3,'admin','0001_initial','2019-04-21 10:11:36.597493'),(4,'admin','0002_logentry_remove_auto_add','2019-04-21 10:11:36.608466'),(5,'admin','0003_logentry_add_action_flag_choices','2019-04-21 10:11:36.620403'),(6,'contenttypes','0002_remove_content_type_name','2019-04-21 10:11:36.744071'),(7,'auth','0002_alter_permission_name_max_length','2019-04-21 10:11:36.808930'),(8,'auth','0003_alter_user_email_max_length','2019-04-21 10:11:36.888739'),(9,'auth','0004_alter_user_username_opts','2019-04-21 10:11:36.899677'),(10,'auth','0005_alter_user_last_login_null','2019-04-21 10:11:36.957523'),(11,'auth','0006_require_contenttypes_0002','2019-04-21 10:11:36.963519'),(12,'auth','0007_alter_validators_add_error_messages','2019-04-21 10:11:36.974509'),(13,'auth','0008_alter_user_username_max_length','2019-04-21 10:11:37.035314'),(14,'auth','0009_alter_user_last_name_max_length','2019-04-21 10:11:37.105127'),(15,'front','0001_initial','2019-04-21 10:11:37.156989'),(16,'sessions','0001_initial','2019-04-21 10:11:37.205858'),(17,'blog','0001_initial','2019-05-14 12:02:16.267575'),(18,'blog','0002_auto_20190516_2356','2019-05-16 15:56:29.705304');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('19uej8bao71cyf6dj1kaxkg3eekipqq7','YzdiNzYxYjE5ZTQ1Njg5MjhmZjE5MWQ5NTkxNGIyZGMyOTcwNjQ2NDp7ImlzX2xvZ2luIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMGMyOWM4N2E5YjIxNzZmODJiMzE1ZWRiM2M3YWI4MDY5MmY5MDM5MSIsInVzZXJfbW9iaWxlIjoiMTczNTgzMDgyMjUiLCJ1c2VyX25hbWUiOiJcdTUyMDZcdTRlYWJcdTczM2YiLCJwYXNzd29yZCI6IjExIn0=','2019-05-28 15:53:43.430819'),('c9gqelkdptdu6m7ccf1gilwuywiso9bu','ZjcxZjBiZGQzZWI4YjZjMWY4OTVlZTE5NjY5MzkxNjMzN2RkMWUxNjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX21vYmlsZSI6IjE3MzU4MzA4MjI1IiwidXNlcl9uYW1lIjoiXHU1MjA2XHU0ZWFiXHU3MzNmIiwicGFzc3dvcmQiOiIxMSJ9','2019-05-25 07:02:58.015506'),('gk8kd9nm1hzh0va07pnltdxlh0unrrta','ZjcxZjBiZGQzZWI4YjZjMWY4OTVlZTE5NjY5MzkxNjMzN2RkMWUxNjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX21vYmlsZSI6IjE3MzU4MzA4MjI1IiwidXNlcl9uYW1lIjoiXHU1MjA2XHU0ZWFiXHU3MzNmIiwicGFzc3dvcmQiOiIxMSJ9','2019-05-25 06:37:21.660532'),('th5tvzoisuupz7krdit6w7jursavz739','ODZmYmNhNjgyNTliZTM3MTM5YzUzMGI0YWE3MDgwZDY3NGQyYWEwNzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX21vYmlsZSI6IjEyMzEyMzEyMyIsInVzZXJfbmFtZSI6InRlc3QxIn0=','2019-05-12 11:09:31.781513'),('wt8hcpiy7jsgmt6yfcx2hu0cbekifj5z','ZjcxZjBiZGQzZWI4YjZjMWY4OTVlZTE5NjY5MzkxNjMzN2RkMWUxNjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX21vYmlsZSI6IjE3MzU4MzA4MjI1IiwidXNlcl9uYW1lIjoiXHU1MjA2XHU0ZWFiXHU3MzNmIiwicGFzc3dvcmQiOiIxMSJ9','2019-05-25 06:42:08.044990');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `front_user`
--

DROP TABLE IF EXISTS `front_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `front_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `password` varchar(16) NOT NULL,
  `name` varchar(10) NOT NULL,
  `area` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `QQ` varchar(11) NOT NULL,
  `WX` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `tb` varchar(15) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tb` (`tb`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `front_user`
--

LOCK TABLES `front_user` WRITE;
/*!40000 ALTER TABLE `front_user` DISABLE KEYS */;
INSERT INTO `front_user` VALUES (1,'123123123','123123123','test1','北京市 朝阳区','万达广场','123123123','123123123','123123123@qq.','123123123','2019-04-21 10:51:34.125000'),(2,'111222333','123123123','test2','上海市静安区','万达广场','111222333','111222333','111222333@qq.com','111222333','2019-04-21 11:01:21.267178'),(8,'17358308225','11','分享猿','安徽省  合肥市','万达广场附近','1195074058','17358308225','1195074058@qq.com','飞猪侠2304','2019-04-22 06:47:13.960314'),(11,'456456465','123123123','test3','安徽省  合肥市','万达广场','1195074058','17358308225','456456456@qq.com','456456465','2019-04-22 07:00:18.051631'),(12,'789789789','789789789','test4','浙江省 杭州市','西湖区','789789789','789789789','789789789@qq.com','789789789','2019-04-22 07:01:30.862627'),(16,'123123465','123123465','test6','安徽省  合肥市','万达广场','123123465','123123465','123123465@qq.com','123123465','2019-04-28 11:40:39.823229');
/*!40000 ALTER TABLE `front_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 17:43:28
