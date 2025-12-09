-- MySQL dump 10.13  Distrib 8.4.0, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_database
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB-0+deb13u1

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
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_id` varchar(250) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,'t59sbpe0rrfci1r24g582kdqnbdivhka','2025-12-04'),(2,'m6ihxizql0aozhy5enr5671oa7xjv2zl','2025-12-04'),(3,'780qumcicb8us2k1x8pflcke48k85ceg','2025-12-05'),(4,'s645pn5e3xol0b2v7v7mrubhtz12fce5','2025-12-05'),(5,'lbfkwmhgnjr1bzsdkc232u1revcxygdl','2025-12-05'),(6,'jr8h5dxxlp80k57edh7drsx2sezoyili','2025-12-05'),(7,'hf8np870835l8elhod7qolz8x5qnvm24','2025-12-07');
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartItem`
--

DROP TABLE IF EXISTS `CartItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartItem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CartItem_cart_id_dded4aaa_fk_Cart_id` (`cart_id`),
  KEY `CartItem_product_id_733636f4_fk_EcommerceProducts_products_id` (`product_id`),
  CONSTRAINT `CartItem_cart_id_dded4aaa_fk_Cart_id` FOREIGN KEY (`cart_id`) REFERENCES `Cart` (`id`),
  CONSTRAINT `CartItem_product_id_733636f4_fk_EcommerceProducts_products_id` FOREIGN KEY (`product_id`) REFERENCES `EcommerceProducts_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartItem`
--

LOCK TABLES `CartItem` WRITE;
/*!40000 ALTER TABLE `CartItem` DISABLE KEYS */;
INSERT INTO `CartItem` VALUES (13,1,1,3,3),(14,5,1,4,2),(15,1,1,5,4);
/*!40000 ALTER TABLE `CartItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EcommerceProducts_browsinghistory`
--

DROP TABLE IF EXISTS `EcommerceProducts_browsinghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EcommerceProducts_browsinghistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `viewed_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EcommerceProducts_br_product_id_2c568b63_fk_Ecommerce` (`product_id`),
  KEY `EcommerceProducts_br_user_id_f2f04c19_fk_auth_user` (`user_id`),
  CONSTRAINT `EcommerceProducts_br_product_id_2c568b63_fk_Ecommerce` FOREIGN KEY (`product_id`) REFERENCES `EcommerceProducts_products` (`id`),
  CONSTRAINT `EcommerceProducts_br_user_id_f2f04c19_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EcommerceProducts_browsinghistory`
--

LOCK TABLES `EcommerceProducts_browsinghistory` WRITE;
/*!40000 ALTER TABLE `EcommerceProducts_browsinghistory` DISABLE KEYS */;
INSERT INTO `EcommerceProducts_browsinghistory` VALUES (1,'2025-12-03 14:46:02.634116',5,2),(2,'2025-12-05 02:23:23.088839',2,2),(3,'2025-12-04 08:17:58.532311',6,2),(4,'2025-12-05 02:31:44.534965',3,2),(5,'2025-12-02 06:19:49.810478',12,2),(6,'2025-12-02 06:35:00.033879',11,2),(7,'2025-12-04 01:45:42.064847',4,2),(8,'2025-12-05 02:32:33.835169',7,2),(9,'2025-12-03 14:46:07.536140',16,2),(10,'2025-12-03 14:45:54.753883',14,2),(11,'2025-12-04 08:08:08.224211',2,6),(12,'2025-12-04 08:08:36.754097',5,6);
/*!40000 ALTER TABLE `EcommerceProducts_browsinghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EcommerceProducts_categories`
--

DROP TABLE IF EXISTS `EcommerceProducts_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EcommerceProducts_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EcommerceProducts_ca_parent_id_438578e1_fk_Ecommerce` (`parent_id`),
  CONSTRAINT `EcommerceProducts_ca_parent_id_438578e1_fk_Ecommerce` FOREIGN KEY (`parent_id`) REFERENCES `EcommerceProducts_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EcommerceProducts_categories`
--

LOCK TABLES `EcommerceProducts_categories` WRITE;
/*!40000 ALTER TABLE `EcommerceProducts_categories` DISABLE KEYS */;
INSERT INTO `EcommerceProducts_categories` VALUES (2,'Laptops',NULL),(3,'Accessories',NULL),(4,'Mobiles',NULL),(5,'Cameras',3),(6,'Headphones and Earbuds',3);
/*!40000 ALTER TABLE `EcommerceProducts_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EcommerceProducts_products`
--

DROP TABLE IF EXISTS `EcommerceProducts_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EcommerceProducts_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EcommerceProducts_pr_category_id_333a2ebc_fk_Ecommerce` (`category_id`),
  CONSTRAINT `EcommerceProducts_pr_category_id_333a2ebc_fk_Ecommerce` FOREIGN KEY (`category_id`) REFERENCES `EcommerceProducts_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EcommerceProducts_products`
--

LOCK TABLES `EcommerceProducts_products` WRITE;
/*!40000 ALTER TABLE `EcommerceProducts_products` DISABLE KEYS */;
INSERT INTO `EcommerceProducts_products` VALUES (2,'Acer Aspire Go 15',24999.00,'Acer Aspire Go 15 is a lightweight, budget-friendly laptop built for smooth everyday computing and reliable performance.','uploads/product/Acer_Aspire_Go_15.png',2),(3,'Apple MacBook Air (M4, 13-inch)',29999.00,'Apple MacBook Air (M4, 13-inch) is an ultra-thin, powerful laptop delivering fast performance, long battery life, and smooth macOS integration — ideal for students, creatives, and everyday work.','uploads/product/Apple_MacBook_Air_M4_13inch.png',2),(4,'ASUS 2025 14‑inch Core i5',34999.00,'ASUS 2025 14-inch Core i5 Laptop is a compact, budget-friendly machine offering efficient everyday performance and portability for students and light workloads.','uploads/product/ASUS_2025_14_inch_Core_i5_Laptop.png',2),(5,'Samsung Galaxy A56 5G',22999.00,'A mid-range 5G smartphone with a large 6.7″ Super AMOLED 120 Hz display, 50 MP triple-lens camera, 5000 mAh battery and 45 W fast-charging for balanced performance and long battery life.','uploads/product/Samsung_Galaxy_A56_5G.png',4),(6,'realme C71 2025 Smartphone',6990.00,'realme C71 2025 Smartphone is an affordable entry-level phone providing essential smartphone functions — calling, messaging, browsing, and light apps — at a budget-friendly price.','uploads/product/realme_C71_2025_Smartphone.png',4),(7,'Canon EOS 80D',69998.00,'A powerful, mid-range DSLR camera perfect for enthusiasts seeking professional-quality photos and videos.','uploads/product/Canon_EOS_80D.png',5),(8,'Canon EOS 600D',72499.00,'An older but reliable entry-level DSLR, great for beginners starting their photography journey.','uploads/product/Canon_EOS_600D.png',5),(9,'Canon EOS Rebel T7',30998.00,'A user-friendly DSLR that offers excellent image quality and easy sharing, ideal for casual photographers.','uploads/product/Canon_EOS_Rebel_T7.png',5),(10,'Canon EOS 2000D',30998.00,'A straightforward, entry-level DSLR camera designed for capturing and sharing everyday moments with high detail.','uploads/product/Canon_EOS_2000D.png',5),(11,'Canon EOS 4000D',44599.00,'An affordable entry-level DSLR, offering the quality of a Canon camera for those on a tight budget.','uploads/product/Canon_EOS_4000D.png',5),(12,'LG Gram Thin',36999.00,'An incredibly lightweight and long-lasting laptop, offering premium portability without compromising screen size or performance.','uploads/product/LG_Gram_Thin_15.6-inch.png',2),(13,'JBL Tune 660NC',2499.00,'On-ear wireless headphones featuring active noise cancellation for immersive, distraction-free listening on the go.','uploads/product/Jbl_Tune_660nc.png',6),(14,'Google Pixel 7a',34999.00,'The best-value phone from Google, offering flagship-level camera performance and smart features at an accessible price point.','uploads/product/Google_Pixel_7a_6.1-inch.png',4),(15,'Poco M4 Pro',9999.00,'A budget-friendly smartphone with a vibrant AMOLED display and a large battery, delivering excellent value for everyday use.','uploads/product/Poco_M4_Pro_6.43-inch.png',2),(16,'Google Pixel 6 Pro 5G',29999.00,'Google\'s premium flagship, featuring an advanced camera system, powerful Tensor chip, and seamless Android experience with 5G speed.','uploads/product/Google_Pixel_6_Pro_5G_6.7-inch.png',4),(17,'Samsung Galaxy A53 5G',15999.00,'A popular mid-range smartphone known for its brilliant AMOLED display, versatile camera, and reliable 5G performance.','uploads/product/Samsung__Galaxy_A53_5G_6.5-inch.png',4),(18,'Asus Zenbook 14',32999.00,'An elegant and thin laptop built for productivity, combining a stunning OLED display with robust performance.','uploads/product/Asus_Zenbook_14_14-inch.png',2),(19,'Lenovo V15 G4',29999.00,'A practical and reliable business laptop designed to handle daily tasks efficiently, offering great value for small businesses and students.','uploads/product/Lenovo_V15_G4_IRU_15.6-inch.png',2),(20,'Philips H6509',999.00,'over-ear wireless headphones with noise cancellation and long battery life. They deliver clear sound with deep bass and are comfortable for all-day use.','uploads/product/PHILIPS_H6509.png',6),(21,'Sony WXHB700',2999.00,'Wireless on-ear headphones with “Extra Bass” boosted sound and up to 30 hours battery life, giving punchy lows and comfortable all-day listening.','uploads/product/Sony_WHXB700.png',6),(22,'Presonus Eris HD10BT',1999.00,'Over-ear Bluetooth headphones with active noise cancelling. Great for studio-quality sound and everyday listening','uploads/product/Presonus_Eris_Hd10bt_1.57-inch.png',6);
/*!40000 ALTER TABLE `EcommerceProducts_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add person',7,'add_person'),(26,'Can change person',7,'change_person'),(27,'Can delete person',7,'delete_person'),(28,'Can view person',7,'view_person'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add customer',9,'add_customer'),(34,'Can change customer',9,'change_customer'),(35,'Can delete customer',9,'delete_customer'),(36,'Can view customer',9,'view_customer'),(37,'Can add orders',10,'add_orders'),(38,'Can change orders',10,'change_orders'),(39,'Can delete orders',10,'delete_orders'),(40,'Can view orders',10,'view_orders'),(41,'Can add categories',11,'add_categories'),(42,'Can change categories',11,'change_categories'),(43,'Can delete categories',11,'delete_categories'),(44,'Can view categories',11,'view_categories'),(45,'Can add products',12,'add_products'),(46,'Can change products',12,'change_products'),(47,'Can delete products',12,'delete_products'),(48,'Can view products',12,'view_products'),(49,'Can add browsing history',13,'add_browsinghistory'),(50,'Can change browsing history',13,'change_browsinghistory'),(51,'Can delete browsing history',13,'delete_browsinghistory'),(52,'Can view browsing history',13,'view_browsinghistory'),(53,'Can add cart',14,'add_cart'),(54,'Can change cart',14,'change_cart'),(55,'Can delete cart',14,'delete_cart'),(56,'Can view cart',14,'view_cart'),(57,'Can add cart item',15,'add_cartitem'),(58,'Can change cart item',15,'change_cartitem'),(59,'Can delete cart item',15,'delete_cartitem'),(60,'Can view cart item',15,'view_cartitem'),(61,'Can add order item',16,'add_orderitem'),(62,'Can change order item',16,'change_orderitem'),(63,'Can delete order item',16,'delete_orderitem'),(64,'Can view order item',16,'view_orderitem'),(65,'Can add Order',17,'add_order'),(66,'Can change Order',17,'change_order'),(67,'Can delete Order',17,'delete_order'),(68,'Can view Order',17,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$AqMSFIzOWO4JG4oFannZ8n$52lasOlyzJXrYiUUViNglvJe5nnjKzhpYuMd52N0AtE=','2025-11-27 17:01:28.973553',1,'ecommerceadmin','','','tomulinangelo24@gmail.com',1,1,'2025-10-23 12:59:10.494072'),(2,'pbkdf2_sha256$1000000$oTziB7WcGYONij7Rj7c0l1$hkyJcLsqPxtlDHD95n9pY1X2u4AAYNCviYqisOlu4sY=','2025-12-07 04:39:26.102651',1,'hk','','','Angelo@gmail.com',1,1,'2025-11-04 16:00:30.540453'),(3,'pbkdf2_sha256$1000000$MwxxC65PzAQTmYQp7p0nDk$ZV8ju8DZ0DSozR/IgQk1HR+ZKddL95vebl53BzOsB5k=','2025-11-28 04:02:37.391583',0,'HKM','Angelo','Tomulin','tomulinangelo24@gmail.com',0,1,'2025-11-28 04:02:36.493247'),(4,'pbkdf2_sha256$1000000$9dZAWW5BCoNRgiljOhJsbY$eaDbS1ngPUHo8b2H8ChNE9PBLke/GIyiF7aDiBT5g10=','2025-11-28 04:12:51.303776',0,'Angelogs','ANGELO','TOMULIN','tomulinangelo24@gmail.com',0,1,'2025-11-28 04:12:50.390451'),(5,'pbkdf2_sha256$1000000$ndSRnCGfQz22rxcWQoKzvu$sU/qm51GBWOZcicF3+Lmr8AfrRhtZfmVjTyrJxZEVWI=','2025-11-28 04:19:17.544288',0,'AngeloTomulin','Angelo','Tomulin','tomulinangelo24@gmail.com',0,1,'2025-11-28 04:19:16.603103'),(6,'pbkdf2_sha256$1000000$bgr3NIr3ShVN8KtjP8YbPH$GiZAtJwZNJiG+Q2SzFi9EYnNmTnHT16cNG9QLp3CJQ4=','2025-12-04 08:07:52.752597',0,'Angelo24','angelo','tomulin','angelotomulin24@gmail.com',0,1,'2025-12-04 08:07:51.486428'),(7,'pbkdf2_sha256$1000000$lBNd5dzNy2px48dFugdEHm$iH7mmrqcYh1UG+DtG5zJYu44FJFzYnGJNp1uEk7MwSw=','2025-12-05 02:31:09.841579',0,'Angelogs24','Angelo','Tomulin','Angelotomulin24@gmail.com',0,1,'2025-12-05 02:31:08.510468');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-10-23 14:28:26.584803','1','Gadgets',1,'[{\"added\": {}}]',11,1),(2,'2025-10-23 14:54:04.071501','1','Google Pixel 6 Pro',1,'[{\"added\": {}}]',12,1),(3,'2025-11-04 16:02:42.250215','1','Angelo@gmail.com12345678',1,'[{\"added\": {}}]',8,1),(4,'2025-11-30 11:47:27.467148','1','Gadgets',3,'',11,2),(5,'2025-11-30 11:47:40.626546','2','Laptops',1,'[{\"added\": {}}]',11,2),(6,'2025-11-30 11:48:01.518561','3','Accessories',1,'[{\"added\": {}}]',11,2),(7,'2025-11-30 11:48:07.506728','4','Mobiles',1,'[{\"added\": {}}]',11,2),(8,'2025-12-01 06:34:18.990459','2','Acer Aspire Go 15',1,'[{\"added\": {}}]',12,2),(9,'2025-12-01 06:48:53.656538','3','Apple MacBook Air (M4, 13-inch)',1,'[{\"added\": {}}]',12,2),(10,'2025-12-01 06:50:59.735048','4','ASUS 2025 14‑inch Core i5 Laptop',1,'[{\"added\": {}}]',12,2),(11,'2025-12-01 06:56:24.314601','5','Samsung Galaxy A56 5G',1,'[{\"added\": {}}]',12,2),(12,'2025-12-01 13:54:43.266324','6','realme C71 2025 Smartphone',1,'[{\"added\": {}}]',12,2),(13,'2025-12-02 05:18:20.566872','5','Accessories -> Cameras',1,'[{\"added\": {}}]',11,2),(14,'2025-12-02 05:19:21.814339','7','Canon EOS 80D',1,'[{\"added\": {}}]',12,2),(15,'2025-12-02 05:20:37.170415','8','Canon EOS 600D',1,'[{\"added\": {}}]',12,2),(16,'2025-12-02 05:22:11.468972','9','Canon EOS Rebel T7',1,'[{\"added\": {}}]',12,2),(17,'2025-12-02 05:22:52.046179','10','Canon EOS 2000D',1,'[{\"added\": {}}]',12,2),(18,'2025-12-02 05:26:23.343321','11','Canon EOS 4000D',1,'[{\"added\": {}}]',12,2),(19,'2025-12-02 05:36:23.422536','6','Accessories -> Headphones and Earbuds',1,'[{\"added\": {}}]',11,2),(20,'2025-12-02 05:41:28.572272','12','LG Gram Thin',1,'[{\"added\": {}}]',12,2),(21,'2025-12-02 05:42:23.429827','13','BL Tune 660NC',1,'[{\"added\": {}}]',12,2),(22,'2025-12-02 05:43:02.143269','14','Google Pixel 7a',1,'[{\"added\": {}}]',12,2),(23,'2025-12-02 05:43:41.064911','15','Poco M4 Pro',1,'[{\"added\": {}}]',12,2),(24,'2025-12-02 05:44:11.218215','16','Google Pixel 6 Pro 5G',1,'[{\"added\": {}}]',12,2),(25,'2025-12-02 05:44:38.730942','17','Samsung Galaxy A53 5G',1,'[{\"added\": {}}]',12,2),(26,'2025-12-02 05:46:47.565623','18','Asus Zenbook 14',1,'[{\"added\": {}}]',12,2),(27,'2025-12-02 05:47:37.745269','19','Lenovo V15 G4',1,'[{\"added\": {}}]',12,2),(28,'2025-12-02 05:52:28.827085','19','Lenovo V15 G4',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,2),(29,'2025-12-02 05:52:48.563745','18','Asus Zenbook 14',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,2),(30,'2025-12-02 05:53:03.069189','17','Samsung Galaxy A53 5G',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,2),(31,'2025-12-02 05:53:10.971029','16','Google Pixel 6 Pro 5G',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,2),(32,'2025-12-02 05:53:23.022914','15','Poco M4 Pro',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,2),(33,'2025-12-02 05:53:59.259014','14','Google Pixel 7a',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,2),(34,'2025-12-02 05:54:23.335490','13','BL Tune 660NC',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,2),(35,'2025-12-02 05:54:33.481099','13','JBL Tune 660NC',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',12,2),(36,'2025-12-02 05:54:39.040406','12','LG Gram Thin',2,'[]',12,2),(37,'2025-12-02 06:03:19.875424','20','Philips H6509',1,'[{\"added\": {}}]',12,2),(38,'2025-12-02 06:04:55.958980','21','Sony WXHB700',1,'[{\"added\": {}}]',12,2),(39,'2025-12-02 06:05:09.978951','21','Sony WXHB700',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',12,2),(40,'2025-12-02 06:06:54.585176','22','Presonus Eris HD10BT',1,'[{\"added\": {}}]',12,2),(41,'2025-12-02 06:11:07.755639','12','LG Gram Thin',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',12,2),(42,'2025-12-02 06:12:03.651142','13','JBL Tune 660NC',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',12,2),(43,'2025-12-04 00:20:45.887312','4','ASUS 2025 14‑inch Core i5',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',12,2),(44,'2025-12-04 02:38:36.913564','3','Order 3',3,'',17,2),(45,'2025-12-04 02:38:59.323924','4','Order 4',3,'',17,2),(46,'2025-12-04 02:38:59.323968','2','Order 2',3,'',17,2),(47,'2025-12-04 02:38:59.323989','1','Order 1',3,'',17,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'ecommerce_cart','cart'),(15,'ecommerce_cart','cartitem'),(17,'ecommerce_orders','order'),(16,'ecommerce_orders','orderitem'),(13,'EcommerceProducts','browsinghistory'),(11,'EcommerceProducts','categories'),(10,'EcommerceProducts','orders'),(12,'EcommerceProducts','products'),(6,'sessions','session'),(9,'users','customer'),(7,'users','person'),(8,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-10-21 03:25:38.824199'),(2,'auth','0001_initial','2025-10-21 03:25:39.178129'),(3,'admin','0001_initial','2025-10-21 03:25:39.254402'),(4,'admin','0002_logentry_remove_auto_add','2025-10-21 03:25:39.267154'),(5,'admin','0003_logentry_add_action_flag_choices','2025-10-21 03:25:39.281553'),(6,'contenttypes','0002_remove_content_type_name','2025-10-21 03:25:39.352231'),(7,'auth','0002_alter_permission_name_max_length','2025-10-21 03:25:39.386466'),(8,'auth','0003_alter_user_email_max_length','2025-10-21 03:25:39.415407'),(9,'auth','0004_alter_user_username_opts','2025-10-21 03:25:39.428727'),(10,'auth','0005_alter_user_last_login_null','2025-10-21 03:25:39.469961'),(11,'auth','0006_require_contenttypes_0002','2025-10-21 03:25:39.472561'),(12,'auth','0007_alter_validators_add_error_messages','2025-10-21 03:25:39.485809'),(13,'auth','0008_alter_user_username_max_length','2025-10-21 03:25:39.514480'),(14,'auth','0009_alter_user_last_name_max_length','2025-10-21 03:25:39.541715'),(15,'auth','0010_alter_group_name_max_length','2025-10-21 03:25:39.575783'),(16,'auth','0011_update_proxy_permissions','2025-10-21 03:25:39.589603'),(17,'auth','0012_alter_user_first_name_max_length','2025-10-21 03:25:39.618422'),(18,'sessions','0001_initial','2025-10-21 03:25:39.651312'),(19,'users','0001_initial','2025-10-21 03:25:39.677459'),(20,'users','0002_customer_delete_person','2025-10-23 14:09:00.956942'),(21,'EcommerceProducts','0001_initial','2025-10-23 14:25:55.110628'),(22,'EcommerceProducts','0002_browsinghistory','2025-12-01 13:48:54.041883'),(23,'EcommerceProducts','0003_alter_categories_options_categories_parent','2025-12-01 14:43:59.434882'),(24,'EcommerceProducts','0004_alter_products_description','2025-12-02 06:14:27.642504'),(25,'ecommerce_cart','0001_initial','2025-12-04 01:02:31.865340'),(26,'ecommerce_orders','0001_initial','2025-12-04 02:06:48.724542'),(27,'EcommerceProducts','0005_delete_orders','2025-12-04 02:33:56.780794'),(28,'ecommerce_orders','0002_order_status','2025-12-04 02:40:20.856012');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3wlb9b5xitdbn2tkth2trf4ur76xxw9i','.eJxVjMEOwiAQRP-FsyFAlxI8evcbyC6wUjWQlPbU-O-2SQ96nHlvZhMB16WEtec5TElchRGX344wvnI9QHpifTQZW13mieShyJN2eW8pv2-n-3dQsJd9TYwGyCkEMn7U2WZm7aL3BpO1aFixAh7IIVjAIeWk9wgDMCCzHcXnC_1QOIc:1vQJ0D:MxXRxyFnQ-HQsgdx9Y9N7xSrh78M2Ctt9PiBmeOrPj8','2025-12-16 05:32:41.465261');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_orders_order`
--

DROP TABLE IF EXISTS `ecommerce_orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_orders_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `order_notes` longtext DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_orders_order`
--

LOCK TABLES `ecommerce_orders_order` WRITE;
/*!40000 ALTER TABLE `ecommerce_orders_order` DISABLE KEYS */;
INSERT INTO `ecommerce_orders_order` VALUES (5,'asd','s',NULL,'ssda@gmail.com','ss','s','s','s','s','s','2025-12-04 02:48:38.155611','2025-12-04 02:48:53.805542',0,'COD','Received'),(6,'angelo','tomulin',NULL,'angelo@gmail.com','09126887213','123 avenue','San Pablo','Philippines','4000','pakibilis','2025-12-04 08:10:34.919189','2025-12-04 08:10:50.509098',0,'COD','Received'),(7,'Angelo','Tomulin',NULL,'tomulinangelo24@gmail.com','09812041190','Purok 1','San Pablo','Philippines','4000','Angelo','2025-12-05 02:42:35.639516','2025-12-05 02:42:52.211617',0,'COD','Received'),(8,'angelo','tomulin',NULL,'tomulinangelo24@gmail.com','09812041190','123','san pablo','philippines','4000','angelo','2025-12-07 04:40:47.379775','2025-12-07 04:40:47.379842',0,'COD','Pending');
/*!40000 ALTER TABLE `ecommerce_orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_orders_orderitem`
--

DROP TABLE IF EXISTS `ecommerce_orders_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_orders_orderitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL CHECK (`quantity` >= 0),
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_orders_ord_order_id_0d639673_fk_ecommerce` (`order_id`),
  KEY `ecommerce_orders_ord_product_id_1c35eb53_fk_Ecommerce` (`product_id`),
  CONSTRAINT `ecommerce_orders_ord_order_id_0d639673_fk_ecommerce` FOREIGN KEY (`order_id`) REFERENCES `ecommerce_orders_order` (`id`),
  CONSTRAINT `ecommerce_orders_ord_product_id_1c35eb53_fk_Ecommerce` FOREIGN KEY (`product_id`) REFERENCES `EcommerceProducts_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_orders_orderitem`
--

LOCK TABLES `ecommerce_orders_orderitem` WRITE;
/*!40000 ALTER TABLE `ecommerce_orders_orderitem` DISABLE KEYS */;
INSERT INTO `ecommerce_orders_orderitem` VALUES (6,29999.00,1,5,3),(7,69998.00,1,6,7),(8,22999.00,1,6,5),(9,69998.00,1,7,7),(10,6990.00,1,7,6),(11,69998.00,1,8,7),(12,22999.00,1,8,5);
/*!40000 ALTER TABLE `ecommerce_orders_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customer`
--

DROP TABLE IF EXISTS `users_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(70) NOT NULL,
  `last_name` varchar(70) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customer`
--

LOCK TABLES `users_customer` WRITE;
/*!40000 ALTER TABLE `users_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'Angelo@gmail.com','12345678');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce_database'
--

--
-- Dumping routines for database 'ecommerce_database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-09 11:45:56
