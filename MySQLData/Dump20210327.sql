-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testdb3
-- ------------------------------------------------------
-- Server version	8.0.23

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
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add customer',7,'add_customer'),(26,'Can change customer',7,'change_customer'),(27,'Can delete customer',7,'delete_customer'),(28,'Can view customer',7,'view_customer'),(29,'Can add author',8,'add_author'),(30,'Can change author',8,'change_author'),(31,'Can delete author',8,'delete_author'),(32,'Can view author',8,'view_author'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add product',10,'add_product'),(38,'Can change product',10,'change_product'),(39,'Can delete product',10,'delete_product'),(40,'Can view product',10,'view_product'),(41,'Can add genre',9,'add_genre'),(42,'Can change genre',9,'change_genre'),(43,'Can delete genre',9,'delete_genre'),(44,'Can view genre',9,'view_genre'),(45,'Can add author_books',11,'add_author_books'),(46,'Can change author_books',11,'change_author_books'),(47,'Can delete author_books',11,'delete_author_books'),(48,'Can view author_books',11,'view_author_books'),(49,'Can add cart',12,'add_cart'),(50,'Can change cart',12,'change_cart'),(51,'Can delete cart',12,'delete_cart'),(52,'Can view cart',12,'view_cart'),(53,'Can add cart product',13,'add_cartproduct'),(54,'Can change cart product',13,'change_cartproduct'),(55,'Can delete cart product',13,'delete_cartproduct'),(56,'Can view cart product',13,'view_cartproduct');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$AMHGo4g3xlyp$GKGXIgjqgv2T8kk4O9ltpvridq67pPxc3hVx7nMAxbo=','2021-02-24 15:22:27.640630',1,'peter','','','',1,1,'2021-02-24 04:10:46.278712'),(2,'pbkdf2_sha256$216000$JyAIr0A20tU3$PtUjTt+xdQ3XQFtIPVUW5HpRMW4phkhNOoMubWOqQPY=','2021-03-13 01:46:36.233766',1,'sean','','','sharb010@fiu.edu',1,1,'2021-02-26 01:14:21.108477');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `bookstore_author`
--

DROP TABLE IF EXISTS `bookstore_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstore_author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `biography` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookstore_author_first_name_92ca680d` (`first_name`),
  KEY `bookstore_author_last_name_593978e4` (`last_name`),
  KEY `bookstore_author_id_806ceb67_idx` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_author`
--

LOCK TABLES `bookstore_author` WRITE;
/*!40000 ALTER TABLE `bookstore_author` DISABLE KEYS */;
INSERT INTO `bookstore_author` VALUES (1,'Richard','Bach','2021-02-24 04:46:46.954026','Richard David Bach is an American writer widely known as the author of some of the 1970s\' biggest sellers, including Jonathan Livingston Seagull and Illusions: The Adventures of a Reluctant Messiah. Bach has written numerous works of fiction, and also non-fiction flight-related titles'),(2,'Jeffrey','Archer','2021-03-14 23:34:28.355666','Jeffrey Howard Archer, Baron Archer of Weston-super-Mare is an English novelist, former politician, convicted perjurer, and peer of the realm. Before becoming an author, Archer was a Member of Parliament, but did not seek re-election after a financial scandal that left him almost bankrupt.'),(3,'Dan','Brown','2021-02-24 04:46:46.954026','Daniel Gerhard Brown is an American author best known for his thriller novels, including the Robert Langdon novels Angels & Demons, The Da Vinci Code, The Lost Symbol, Inferno and Origin. His novels are treasure hunts that usually take place over a period of 24 hours.'),(4,'Albert','Camus','2021-02-24 04:46:46.954026','Albert Camus was a French philosopher, author, and journalist. He won the Nobel Prize in Literature at the age of 44 in 1957, the second-youngest recipient in history. His works include The Stranger, The Plague, The Myth of Sisyphus, The Fall, and The Rebel. Camus was born in Algeria to French Pieds Noirs parents.'),(5,'Fritjof','Capra','2021-02-24 04:46:46.954026','Fritjof Capra is an Austrian-born American physicist, systems theorist and deep ecologist. In 1995, he became a founding director of the Center for Ecoliteracy in Berkeley, California. He is on the faculty of Schumacher College.'),(6,'Michael','Crichton','2021-02-24 04:46:46.954026','John Michael Crichton was an American author and filmmaker. His books have sold over 200 million copies worldwide, and over a dozen have been adapted into films. His literary works are usually within the science fiction, techno-thriller, and medical fiction genres, and heavily feature technology'),(7,'William','Dalrymple','2021-02-24 04:46:46.954026','William Dalrymple FRAS FRSL FRGS FRSE is a Scottish historian and writer, art historian and curator, as well as a broadcaster and critic.'),(8,'Siddhartha','Deb','2021-02-24 04:46:46.954026','Siddhartha Deb is an Indian author who was born in Meghalaya and grew up in Shillong in northeastern India. He was educated in India and at Columbia University, US. Deb began his career in journalism as a sports journalist in Calcutta in 1994 before moving to Delhi to continue regular journalism until 1998.'),(9,'P L','Deshpande','2021-02-24 04:46:46.954026','Purushottam Laxman Deshpande, popularly known by his initials or as P. L. Deshpande, was a Marathi writer and humorist from Maharashtra, India. He was also an accomplished film and stage actor, script writer, author, composer, musician, singer and orator.'),(10,'Sunita','Deshpande','2021-02-24 04:46:46.954026','Sunita Deshpande was a Marathi writer from Maharashtra, India. She was fondly called \"Sunitabai\"'),(11,'Fyodor','Dostoevsky','2021-02-24 04:46:46.954026','Fyodor Mikhailovich Dostoevsky, sometimes transliterated as Dostoyevsky, was a Russian novelist, philosopher, short story writer, essayist, and journalist.'),(12,'Arthur Conan','Doyle','2021-02-24 04:46:46.954026','Arthur Conan Doyle was born on 22 May 1859 in Edinburgh into a prosperous Irish family. He trained as a doctor, gaining his degree from Edinburgh University in 1881. He worked as a surgeon on a whaling boat and also as a medical officer on a steamer travelling between Liverpool and West Africa.'),(13,'Peter','Drucker','2021-02-24 04:46:46.954026','Peter Ferdinand Drucker was an Austrian management consultant, educator, and author, whose writings contributed to the philosophical and practical foundations of the modern business corporation.'),(14,'Bob','Dylan','2021-02-24 04:46:46.954026','Bob Dylan is an American singer-songwriter, author and visual artist. Widely regarded as one of the greatest songwriters, Dylan has been a major figure in popular culture for more than 50 years'),(15,'Abraham','Eraly','2021-02-24 04:46:46.954026','Abraham Eraly was an Indian writer of history, a teacher, and the founder of Chennai-based magazine Aside.'),(16,'Robert','Fisk','2021-02-24 04:46:46.954026','Robert Fisk was a writer and journalist who held British and Irish citizenship. During his career he developed strong views, and was especially critical of United States foreign policy in the Middle East and the Israeli governments treatment of Palestinians.'),(17,'Ken','Follett','2021-03-14 23:36:21.830693','Kenneth Martin Follett, CBE, FRSL is a Welsh author of thrillers and historical novels who has sold more than 160 million copies of his works. Many of his books have achieved high ranking on best seller lists.'),(18,'Frederick','Forsyth','2021-02-24 04:46:46.954026','Frederick McCarthy Forsyth CBE is an English novelist and journalist. He is best known for thrillers such as The Day of the Jackal, The Odessa File, The Fourth Protocol, The Dogs of War, The Devils Alternative, The Fist of God, Icon, The Veteran, Avenger, The Afghan, The Cobra and The Kill List.'),(19,'Sanjay','Garg','2021-02-24 04:46:46.954026','Amitav Ghosh is an Indian writer and the winner of the 54th Jnanpith award, best known for his work in English fiction.'),(20,'Amitav','Ghosh','2021-02-24 04:46:46.954026','hello'),(21,'Richard','Gordon','2021-02-24 04:46:46.954026','Richard Francis Gordon Jr. was an American naval officer and aviator, test pilot, and NASA astronaut, and an American football executive. He was one of 24 people to have flown to the Moon, as the command module pilot of the 1969 Apollo 12 mission which orbited the Moon 45 times.'),(22,'John','Grisham','2021-02-24 04:46:46.954026','John Ray Grisham Jr. is an American novelist, attorney, politician, and activist, best known for his popular legal thrillers. His books have been translated into 42 languages and published worldwide.');
/*!40000 ALTER TABLE `bookstore_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_author_books`
--

DROP TABLE IF EXISTS `bookstore_author_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstore_author_books` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_author_books`
--

LOCK TABLES `bookstore_author_books` WRITE;
/*!40000 ALTER TABLE `bookstore_author_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookstore_author_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_cart`
--

DROP TABLE IF EXISTS `bookstore_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstore_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookstore_cart_customer_id_10c455bb_fk_users_customer_id` (`customer_id`),
  CONSTRAINT `bookstore_cart_customer_id_10c455bb_fk_users_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `users_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_cart`
--

LOCK TABLES `bookstore_cart` WRITE;
/*!40000 ALTER TABLE `bookstore_cart` DISABLE KEYS */;
INSERT INTO `bookstore_cart` VALUES (1,20.00,'2021-03-24 03:08:37.590981',NULL);
/*!40000 ALTER TABLE `bookstore_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_cartproduct`
--

DROP TABLE IF EXISTS `bookstore_cartproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstore_cartproduct` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rate` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `subtotal` int unsigned NOT NULL,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookstore_cartproduct_cart_id_b32d5673_fk_bookstore_cart_id` (`cart_id`),
  KEY `bookstore_cartproduc_product_id_98f31fa0_fk_bookstore` (`product_id`),
  CONSTRAINT `bookstore_cartproduc_product_id_98f31fa0_fk_bookstore` FOREIGN KEY (`product_id`) REFERENCES `bookstore_product` (`id`),
  CONSTRAINT `bookstore_cartproduct_cart_id_b32d5673_fk_bookstore_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `bookstore_cart` (`id`),
  CONSTRAINT `bookstore_cartproduct_chk_1` CHECK ((`rate` >= 0)),
  CONSTRAINT `bookstore_cartproduct_chk_2` CHECK ((`quantity` >= 0)),
  CONSTRAINT `bookstore_cartproduct_chk_3` CHECK ((`subtotal` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_cartproduct`
--

LOCK TABLES `bookstore_cartproduct` WRITE;
/*!40000 ALTER TABLE `bookstore_cartproduct` DISABLE KEYS */;
INSERT INTO `bookstore_cartproduct` VALUES (1,10,1,10,1,14),(2,10,1,10,1,6);
/*!40000 ALTER TABLE `bookstore_cartproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_genre`
--

DROP TABLE IF EXISTS `bookstore_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstore_genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `bookstore_category_name_3cf73cbf` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_genre`
--

LOCK TABLES `bookstore_genre` WRITE;
/*!40000 ALTER TABLE `bookstore_genre` DISABLE KEYS */;
INSERT INTO `bookstore_genre` VALUES (1,'Fiction','fiction'),(2,'Non Fiction','non-fiction');
/*!40000 ALTER TABLE `bookstore_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_product`
--

DROP TABLE IF EXISTS `bookstore_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstore_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `image3` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `release_date` datetime(6) DEFAULT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookstore_product_author_id_d2412986_fk_bookstore_author_id` (`author_id`),
  KEY `bookstore_product_name_b172cffb` (`name`),
  KEY `bookstore_product_slug_e5675381` (`slug`),
  KEY `bookstore_product_publisher_07594889` (`publisher`),
  KEY `bookstore_product_id_slug_df77cc26_idx` (`id`,`slug`),
  KEY `bookstore_product_genre_id_8e153f17_fk_bookstore_genre_id` (`genre_id`),
  CONSTRAINT `bookstore_product_author_id_d2412986_fk_bookstore_author_id` FOREIGN KEY (`author_id`) REFERENCES `bookstore_author` (`id`),
  CONSTRAINT `bookstore_product_genre_id_8e153f17_fk_bookstore_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `bookstore_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_product`
--

LOCK TABLES `bookstore_product` WRITE;
/*!40000 ALTER TABLE `bookstore_product` DISABLE KEYS */;
INSERT INTO `bookstore_product` VALUES (1,'False Impressions','false-impressions','media/False_Impressions_1.png','products/2021/02/24/False_Impressions_2.png','','Pan','1995-02-24 06:02:35.000000','False Impression is a mystery novel by English author Jeffrey Archer, first published in February 2005 by Macmillan. The novel was published in several countries.',10.00,'2021-02-24 05:59:58.000000','2021-03-13 15:08:16.027773',2,1),(2,'A Prisoner of Birth','prisoner-birth','media/A_Prisoner_Of_Birth.jpg','','','Pan','2008-02-24 06:05:44.000000','A Prisoner of Birth is a mystery novel by English author Jeffrey Archer, first published on 6 March 2008 by Macmillan. This book is a contemporary retelling of Dumas\'s 1844 novel The Count of Monte Cristo. The novel saw Archer return to the first place in the fiction best-seller list for the first time in a decade.',10.00,'2021-02-24 06:05:09.000000','2021-03-13 19:27:35.004588',2,1),(3,'One','One','media/One.jpg','','','Dell','1988-01-01 06:05:44.000000','The author Richard and his wife Leslie have come under a spell of quantum physics. As a result, they find themselves in an alternate world, existing in different incarnations at the same time. First it is as if they were themselves, but living sixteen years in the past, on the day that they first met. In this alternate version of their lives they do not wed, and neither finds the happiness that they\'ve achieved in their actual life. In another universe they find a world without war, where both Leslie and Richard are pilots in nonviolent war games. In a trip to the past they meet Attila the Hun. In another world they meet a saint who has discovered the meaning of life, but immediately burns the evidence, knowing that it would only cause division and ultimately, holy war. They meet the spirit who gives Richard his writing inspiration. They travel to a world where Richard is a bitter, dying man; a world where Leslie has left Richard; and a world where Leslie has died in a plane crash and Richard contemplates suicide.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 00:23:41.253241',1,2),(4,'Angels & Demons','Angels_and_Demons','media/Angels_And_Demons.JPG','','','Random House','2000-05-01 06:05:44.000000','Angels & Demons is a 2000 bestselling mystery-thriller novel written by American author Dan Brown and published by Pocket Books and then by Corgi Books. The novel introduces the character Robert Langdon, who recurs as the protagonist of Brown\'s subsequent novels. Angels & Demons shares many stylistic literary elements with its sequels, such as conspiracies of secret societies, a single-day time frame, and the Catholic Church. Ancient history, architecture, and symbology are also heavily referenced throughout the book. A film adaptation was released on May 15, 2009.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 00:26:50.849720',3,1),(5,'The Outsider','The_Outsider','media/The_Outsider.jpg','','','Penguin','1942-01-01 06:05:44.000000','is a 1942 novella by French author Albert Camus. Its theme and outlook are often cited as examples of Camus\' philosophy, absurdism coupled with existentialism, though Camus personally rejected the latter label. The title character is Meursault, an indifferent French Algerian described as \"a citizen of France domiciled in North Africa, a man of the Mediterranean, an homme du midi yet one who hardly partakes of the traditional Mediterranean culture.\"[2] He attends his mother\'s funeral. Weeks later, he kills an Arab man in French Algiers, who was involved in a conflict with one of Meursault\'s neighbors. Meursault is tried and sentenced to death. The story is divided into two parts, presenting Meursault\'s first-person narrative view before and after the murder, respectively.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 00:42:22.833325',4,1),(6,'Uncommon Wisdom','Uncommon_Wisdom','media/Uncommon_Wisdom.jpg','','','Fontana','1987-01-01 06:05:44.000000','Fusing modern science and Eastern mysticism, Fritjof Capra took the intellectual world by storm with the publication of his hugely influential The Tao of Physics.\r\n\r\nNow, in Uncommon Wisdom, he charts the cultural, scientific and philosophical landmarks behind that intellectual odyssey through his conversations with some quite remarkable people: with Werner Heisenberg he explodes the myths of atomic physics, and searches for spiritual freedom alongside J. Krishnamurti; he pinpoints the nature of mental illness with R.D. Laing, and of ecological principles with E.F. Schumacher and Hazel Henderson, while Indira Gandhi stimulates his understanding of feminism in traditional Indian society.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 00:45:18.788019',5,2),(7,'Jurassic Park','Jurassic_Park','media/Jurassic_Park.jpg','','','Random House','1990-11-20 06:05:44.000000','Jurassic Park is a 1990 science fiction novel written by Michael Crichton. A cautionary tale about genetic engineering, it presents the collapse of an amusement park showcasing genetically re-created dinosaurs to illustrate the mathematical concept of chaos theory and its real world implications. A sequel titled The Lost World, also written by Crichton, was published in 1995. In 1997, both novels were re-published as a single book titled Michael Crichton\'s Jurassic World.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 00:46:35.520585',6,1),(8,'The Last Mughal','The_Last_Mughal','media/The_Last_Mughal.jpg','','','Penguin','2006-01-01 06:05:44.000000','The book, Dalrymple\'s sixth, and his second to reflect his long love affair with the city of Delhi, won praise for its use of \"The Mutiny Papers\", which included previously ignored Indian accounts of the events of 1857. He worked on these documents in association with the Urdu scholar Mahmood Farooqui.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 00:49:01.303106',7,2),(9,'Beyond the Three Seas','Beyond_the_Three_Seas','media/Beyond_The_Three_Seas.jpg','','','Random House','2007-01-01 06:05:44.000000','Many of the European travelers that visited Mughal India left behind enthralling accounts of their experiences beyond the three seas is a collection of the best of these writings, starting from the mid fifteenth century and spanning two hundred years there are stories of hunting with the emperor Akbar and his blindfolded panthers; of being stripped penniless in Surat and fleeing from angry in Bengal in the middle of the night; descriptions of the Mughal roadside',10.00,'2021-02-24 06:05:09.000000','2021-03-23 00:54:01.736600',7,2),(10,'The Beautiful and the Damned','The_Beautiful_and_the_Damned','media/The_Beautiful_And_The_Damned.jpg','','','Penguin','2012-09-18 06:05:44.000000','The Beautiful and the Damned examines India\'s many contradictions through various individual and extraordinary perspectives. With lyrical and commanding prose, Deb introduces the reader to an unforgettable group of Indians, including a Gatsby-like mogul in Delhi whose hobby is producing big-budget gangster films that no one sees; a wiry, dusty farmer named Gopeti whose village is plagued by suicides and was the epicenter of a riot; and a sad-eyed waitress named Esther who has set aside her dual degrees in biochemistry and botany to serve Coca-Cola to arms dealers at an upscale hotel called Shangri La.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 00:56:26.072685',8,2),(11,'Asami Asami','Asami_Asami','media/Asami_Asami.jpg','','','Mauj','1964-01-01 06:05:44.000000','This is the autobiography of a clerk who unknowingly flows from Tulshi Vrindavan to the cactus pot. Much of it has already come from various magazines. Mainly from the Diwali issue of \'Diwali\', two episodes \'Asa Mi Asami\' and then \'Punha Mi Punha Me\' were published. The protagonist of this fictional autobiography has been in my mind for many years. He peeks through various articles.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:01:01.705020',9,1),(12,'Radiowaril Bhashane & Shrutika','Radiowaril_Bhashane_Shrutika','media/Radiowaril.jpg','','','Mauj','2016-01-01 06:05:44.000000','Radiovaril Bhashane Ani Shrutika- Part 1 by P L Deshpande The Book contains 27 of his speeches on various subjects of talks delivered on All India Radio on current topics post independence of the country. Most of the speeches have been depicted by a sketch on the topic. He has written so as bring the laughter and the lighter side of life but talks being sad part of life also. In the Annexure to this book, Seven articles in English which make interesting reading. It is worth reading Book for all.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:05:56.175342',9,2),(13,'Gun Gayin Awadi','Gun_Gayin_Awadi','media/Gun_Gayin_Awadi.jpg','','','Mauj','1975-01-01 06:05:44.000000','Gun Gayin Avadi is a collection of life sketches by the author. Gun Gain Avadi is written by P L Deshpande.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:10:45.192300',9,2),(14,'Aghal Paghal','Aghal_Paghal','media/Aghal_Paghal.jpg','','','Mauj','1998-01-01 06:05:44.000000','A collection of selected humorous articles on bridges',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:14:13.891677',9,2),(15,'Ahe Manohar Tari','Ahe_Manohar_Tari','media/Ahe_Manohar_Tari.jpg','','','Mauj','1990-01-01 06:05:44.000000','The book reveals some beautiful memories related to P.L. and Acharya Atre, the makings of drama and books of P.L. Deshpande, The idea of starting \"P.L.Deshpande Foundation\", and their relationship.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:20:31.913776',10,2),(16,'Crime and Punishment','Crime_and_Punishment','media/Crime_And_Punishment.jpg','','','Penguin','1866-01-01 06:05:44.000000','Crime and Punishment focuses on the mental anguish and moral dilemmas of Rodion Raskolnikov, an impoverished ex-student in Saint Petersburg who formulates a plan to kill an unscrupulous pawnbroker for her money. Before the killing, Raskolnikov believes that with the money he could liberate himself from poverty and go on to perform great deeds. However, once it is done he finds himself racked with confusion, paranoia, and disgust for his actions. His justifications disintegrate completely as he struggles with guilt and horror and confronts the real-world consequences of his deed.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:25:22.433870',11,1),(17,'The Complete Sherlock Holmes Vol I','The_Complete_Sherlock_Holmes_Vol_I','media/Sherlock_Holmes_1.jpg','','','Random House','2003-09-01 06:05:44.000000','Eccentric, arrogant, and ingenious, Sherlock Holmes remains the world\'s most popular and influential fictional detective. In four novels and fifty-six short stories, Holmes with his trusted friend Dr. Watson, steps from his comfortable quarters at 221B Baker Street into the swirling fog of London. Combining detailed observation with brilliant deduction, Holmes rescues the innocent, confounds the guilty, and solves the most perplexing puzzles crime has to offer.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:31:27.259648',12,1),(18,'The Complete Sherlock Holmes Vol II','The_Complete_Sherlock_Holmes_Vol_II','media/Sherlock_Holmes_2.jpg','','','Random House','1986-11-01 06:05:44.000000','Sherlock Holmes The Complete Novels and Stories Volume II. Since his first appearance in Beeton’s Christmas Annual in 1887, Sir Arthur Conan Doyle’s Sherlock Holmes has been one of the most beloved fictional characters ever created. Now, in two paperback volumes, Bantam presents all fifty-six short stories and four novels featuring Conan Doyle’s classic hero–a truly complete collection of Sherlock Holmes’s adventures in crime! Volume II begins with The Hound of the Baskervilles, a haunting novel of murder on eerie Grimpen Moor, which has rightly earned its reputation as the finest murder mystery ever written. The Valley of Fear matches Holmes against his archenemy, the master of imaginative crime, Professor Moriarty. In addition, the loyal Dr. Watson has faithfully recorded Holmes’s feats of extraordinary detection in such famous cases as the thrilling The Adventure of the Red Circle and the twelve baffling adventures from The Case Book of Sherlock Holmes. Conan Doyle’s incomparable tales bring to life a Victorian England of horse-drawn cabs, fogs, and the famous lodgings at 221B Baker Street, where for more than forty years Sherlock Holmes earned his undisputed reputation as the greatest fictional detective of all time.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:35:18.319616',12,1),(19,'The Age of Discontuinity','The_Age_of_Discontuinity','media/The_Age_Of_Discontinuity.jpg','','','Random House','1969-01-01 06:05:44.000000','The Age of Discontinuity: Guidelines to Our Changing Society describes the discontinuities that are changing the structure and the meaning of economy, politics, and society. Major discontinuities exist in four areas: the knowledge technologies; changes in the world\'s economy; a society of organizations; and the knowledge society.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:36:36.661237',13,2),(20,'Dylan on Dylan','Dylan_on_Dylan','media/Dylan_On_Dylan.jpg','','','Random House','2018-05-01 06:05:44.000000','Dylan on Dylan is an authoritative, chronologically arranged anthology of interviews, speeches, and press conferences, as well as excerpts from more than eighty additional Q&As spanning Dylan’s entire career—from 1961 through 2016. The majority have not been previously anthologized and some have never before appeared in print. The material comes from renowned media outlets like Rolling Stone and TV\'s 60 Minutes and from obscure periodicals like Minnesota Daily, a student newspaper at Dylan’s alma mater. Interviewers include some of the top writers of our time, such as Jonathan Lethem, Douglas Brinkley, and Mikal Gilmore, as well as musicians like Pete Seeger and Happy Traum. Introductions put each piece in context and, in many cases, include the interviewer’s reminiscences about the encounter.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:37:49.839421',14,2),(21,'The Age of Wrath','The_Age_of_Wrath','media/The_Age_Of_Wrath.jpg','','','Penguin','2015-04-01 06:05:44.000000','The Delhi Sultanate period (1206-1526) is commonly portrayed as an age of chaos and violence-of plundering kings, turbulent dynasties, and the aggressive imposition of Islam on India. But it was also the era that saw the creation of a pan-Indian empire, on the foundations of which the Mughals and the British later built their own Indian empires. The encounter between Islam and Hinduism also transformed, among other things, India s architecture, literature, music and food. Abraham Eraly brings this fascinating period vividly alive, combining erudition with powerful storytelling, and analysis with anecdote.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:39:11.316752',15,2),(22,'The Pillars of the Earth','The_Pillars_of_the_Earth','media/The_Pillars_Of_Earth.jpg','','','Harper Collins','1989-01-01 06:05:44.000000','The Pillars of the Earth is a historical novel by Welsh author Ken Follett published in 1989 about the building of a cathedral in the fictional town of Kingsbridge, England. Set in the 12th century, the novel covers the time between the sinking of the White Ship and the murder of Thomas Becket, but focuses primarily on the Anarchy. The book traces the development of Gothic architecture out of the preceding Romanesque architecture, and the fortunes of the Kingsbridge priory and village against the backdrop of historical events of the time.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:41:17.626930',17,2),(23,'The Veteran','The_Veteran','media/The_Veteran.jpg','','','Random House','2001-01-01 06:05:44.000000','The Veteran is a short story collection by British author Frederick Forsyth. The book was first published on 8 September 2001, through Thomas Dunne Books and includes five of Forsyth\'s short stories. This is the second short story collection by the author, following the release of his 1982 collection, No Comebacks.',10.00,'2021-02-24 06:05:09.000000','2021-03-23 01:43:00.948205',18,1);
/*!40000 ALTER TABLE `bookstore_product` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-24 04:46:46.955088','1','Richard Bach',1,'[{\"added\": {}}]',8,1),(2,'2021-02-24 05:17:27.722822','1','Fiction',1,'[{\"added\": {}}]',9,1),(3,'2021-02-24 05:17:31.738442','2','Non Fiction',1,'[{\"added\": {}}]',9,1),(4,'2021-02-24 05:24:42.984836','22','Grisham John',3,'',8,1),(5,'2021-02-24 05:24:42.988077','21','Gordon Richard',3,'',8,1),(6,'2021-02-24 05:24:42.989210','20','Ghosh Amitav',3,'',8,1),(7,'2021-02-24 05:24:42.990259','19','Garg Sanjay',3,'',8,1),(8,'2021-02-24 05:24:42.991392','18','Forsyth Frederick',3,'',8,1),(9,'2021-02-24 05:24:42.992307','17','Follett Ken',3,'',8,1),(10,'2021-02-24 05:24:42.993284','16','Fisk Robert',3,'',8,1),(11,'2021-02-24 05:24:42.994153','15','Eraly Abraham',3,'',8,1),(12,'2021-02-24 05:24:42.995137','14','Dylan Bob',3,'',8,1),(13,'2021-02-24 05:24:42.996111','13','Drucker Peter',3,'',8,1),(14,'2021-02-24 05:24:42.997229','12','Doyle Arthur Conan',3,'',8,1),(15,'2021-02-24 05:24:42.998231','11','Dostoevsky Fyodor',3,'',8,1),(16,'2021-02-24 05:24:42.999225','10','Deshpande Sunita',3,'',8,1),(17,'2021-02-24 05:24:43.000101','9','Deshpande P L',3,'',8,1),(18,'2021-02-24 05:24:43.001077','8','Deb Siddhartha',3,'',8,1),(19,'2021-02-24 05:24:43.002051','7','Dalrymple William',3,'',8,1),(20,'2021-02-24 05:24:43.003008','6','Crichton Michael',3,'',8,1),(21,'2021-02-24 05:24:43.004007','5','Capra Fritjof',3,'',8,1),(22,'2021-02-24 05:24:43.004842','4','Camus Albert',3,'',8,1),(23,'2021-02-24 05:24:43.005830','3','Brown Dan',3,'',8,1),(24,'2021-02-24 06:03:25.201106','1','False Impressions',1,'[{\"added\": {}}]',10,1),(25,'2021-02-24 06:06:12.322037','2','A Prisoner of Birth',1,'[{\"added\": {}}]',10,1),(26,'2021-02-24 14:44:44.504139','3','Update1',3,'',10,1),(27,'2021-02-24 14:44:44.508401','12','Update10',3,'',10,1),(28,'2021-02-24 14:44:44.509354','13','Update11',3,'',10,1),(29,'2021-02-24 14:44:44.510315','14','Update12',3,'',10,1),(30,'2021-02-24 14:44:44.511225','15','Update13',3,'',10,1),(31,'2021-02-24 14:44:44.512315','16','Update14',3,'',10,1),(32,'2021-02-24 14:44:44.513342','17','Update15',3,'',10,1),(33,'2021-02-24 14:44:44.514302','18','Update16',3,'',10,1),(34,'2021-02-24 14:44:44.515549','19','Update17',3,'',10,1),(35,'2021-02-24 14:44:44.516538','20','Update18',3,'',10,1),(36,'2021-02-24 14:44:44.517620','21','Update19',3,'',10,1),(37,'2021-02-24 14:44:44.518663','4','Update2',3,'',10,1),(38,'2021-02-24 14:44:44.519559','22','Update20',3,'',10,1),(39,'2021-02-24 14:44:44.520438','23','Update21',3,'',10,1),(40,'2021-02-24 14:44:44.521384','5','Update3',3,'',10,1),(41,'2021-02-24 14:44:44.522449','6','Update4',3,'',10,1),(42,'2021-02-24 14:44:44.523344','7','Update5',3,'',10,1),(43,'2021-02-24 14:44:44.524243','8','Update6',3,'',10,1),(44,'2021-02-24 14:44:44.525136','9','Update7',3,'',10,1),(45,'2021-02-24 14:44:44.526063','10','Update8',3,'',10,1),(46,'2021-02-24 14:44:44.527187','11','Update9',3,'',10,1),(47,'2021-02-24 15:40:06.055877','17','The Complete Sherlock Holmes Vol I',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',10,1),(48,'2021-02-24 15:40:16.364552','18','The Complete Sherlock Holmes Vol II',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',10,1),(49,'2021-03-13 15:08:16.324832','1','False Impressions',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,2),(50,'2021-03-13 19:15:47.262196','23','The Veteran',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(51,'2021-03-13 19:16:24.309478','22','The Pillars of the Earth',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(52,'2021-03-13 19:17:10.706772','23','The Veteran',2,'[{\"changed\": {\"fields\": [\"Author\"]}}]',10,2),(53,'2021-03-13 19:17:39.049624','21','The Age of Wrath',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(54,'2021-03-13 19:18:05.611216','20','Dylan on Dylan',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(55,'2021-03-13 19:18:36.802211','19','The Age of Discontuinity',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(56,'2021-03-13 19:18:59.805898','18','The Complete Sherlock Holmes Vol II',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,2),(57,'2021-03-13 19:19:23.889652','17','The Complete Sherlock Holmes Vol I',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,2),(58,'2021-03-13 19:19:53.191917','16','Crime and Punishment',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(59,'2021-03-13 19:20:15.388647','15','Ahe Manohar Tari',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(60,'2021-03-13 19:20:55.266151','14','Aghal Paghal',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(61,'2021-03-13 19:21:20.416768','13','Gun Gayin Awadi',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(62,'2021-03-13 19:22:31.262377','12','Radiowaril Bhashane & Shrutika',2,'[{\"changed\": {\"fields\": [\"Slug\", \"Image\", \"Description\"]}}]',10,2),(63,'2021-03-13 19:22:59.822775','11','Asami Asami',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(64,'2021-03-13 19:23:25.865966','10','The Beautiful and the Damned',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(65,'2021-03-13 19:23:48.410853','9','Beyond the Three Seas',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(66,'2021-03-13 19:24:14.436853','8','The Last Mughal',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(67,'2021-03-13 19:24:43.147516','7','Jurassic Park',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(68,'2021-03-13 19:25:24.414524','6','Uncommon Wisdom',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(69,'2021-03-13 19:26:00.524708','5','The Outsider',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(70,'2021-03-13 19:26:41.861870','4','Angels & Demons',2,'[{\"changed\": {\"fields\": [\"Slug\", \"Description\"]}}]',10,2),(71,'2021-03-13 19:27:08.950047','3','One',2,'[{\"changed\": {\"fields\": [\"Image\", \"Description\"]}}]',10,2),(72,'2021-03-13 19:27:35.036538','2','A Prisoner of Birth',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,2),(73,'2021-03-13 20:41:34.042214','4','Angels & Demons',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,2),(74,'2021-03-14 23:34:28.556568','2','Jeffrey Archer',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',8,2),(75,'2021-03-14 23:36:21.843666','17','Ken Follett',2,'[]',8,2),(76,'2021-03-23 00:23:41.459990','3','One',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(77,'2021-03-23 00:26:50.881669','4','Angels & Demons',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(78,'2021-03-23 00:42:22.872263','5','The Outsider',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(79,'2021-03-23 00:45:18.811985','6','Uncommon Wisdom',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(80,'2021-03-23 00:46:35.539567','7','Jurassic Park',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(81,'2021-03-23 00:49:01.337080','8','The Last Mughal',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(82,'2021-03-23 00:54:01.761560','9','Beyond the Three Seas',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(83,'2021-03-23 00:56:26.090649','10','The Beautiful and the Damned',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(84,'2021-03-23 01:01:01.718733','11','Asami Asami',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(85,'2021-03-23 01:05:56.206314','12','Radiowaril Bhashane & Shrutika',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(86,'2021-03-23 01:10:45.200293','13','Gun Gayin Awadi',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(87,'2021-03-23 01:14:13.909648','14','Aghal Paghal',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(88,'2021-03-23 01:20:31.930746','15','Ahe Manohar Tari',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(89,'2021-03-23 01:25:22.451835','16','Crime and Punishment',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(90,'2021-03-23 01:31:27.291597','17','The Complete Sherlock Holmes Vol I',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(91,'2021-03-23 01:35:18.334590','18','The Complete Sherlock Holmes Vol II',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(92,'2021-03-23 01:36:36.675210','19','The Age of Discontuinity',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(93,'2021-03-23 01:37:49.853400','20','Dylan on Dylan',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(94,'2021-03-23 01:39:11.341702','21','The Age of Wrath',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2),(95,'2021-03-23 01:41:17.652891','22','The Pillars of the Earth',2,'[{\"changed\": {\"fields\": [\"Author\", \"Release date\", \"Description\"]}}]',10,2),(96,'2021-03-23 01:43:00.975157','23','The Veteran',2,'[{\"changed\": {\"fields\": [\"Release date\", \"Description\"]}}]',10,2);
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'bookstore','author'),(11,'bookstore','author_books'),(12,'bookstore','cart'),(13,'bookstore','cartproduct'),(9,'bookstore','genre'),(10,'bookstore','product'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'users','customer');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-24 04:06:16.494065'),(2,'auth','0001_initial','2021-02-24 04:06:16.571423'),(3,'admin','0001_initial','2021-02-24 04:06:16.774880'),(4,'admin','0002_logentry_remove_auto_add','2021-02-24 04:06:16.834865'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-24 04:06:16.843390'),(6,'contenttypes','0002_remove_content_type_name','2021-02-24 04:06:16.893800'),(7,'auth','0002_alter_permission_name_max_length','2021-02-24 04:06:16.923057'),(8,'auth','0003_alter_user_email_max_length','2021-02-24 04:06:16.945260'),(9,'auth','0004_alter_user_username_opts','2021-02-24 04:06:16.953947'),(10,'auth','0005_alter_user_last_login_null','2021-02-24 04:06:16.982581'),(11,'auth','0006_require_contenttypes_0002','2021-02-24 04:06:16.985079'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-24 04:06:16.993897'),(13,'auth','0008_alter_user_username_max_length','2021-02-24 04:06:17.026018'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-24 04:06:17.057608'),(15,'auth','0010_alter_group_name_max_length','2021-02-24 04:06:17.075913'),(16,'auth','0011_update_proxy_permissions','2021-02-24 04:06:17.085176'),(17,'auth','0012_alter_user_first_name_max_length','2021-02-24 04:06:17.118495'),(18,'bookstore','0001_initial','2021-02-24 04:06:17.163623'),(19,'bookstore','0002_author_biography','2021-02-24 04:06:17.305642'),(20,'sessions','0001_initial','2021-02-24 04:06:17.321775'),(21,'users','0001_initial','2021-02-24 04:06:17.361466'),(22,'bookstore','0003_auto_20210224_0420','2021-02-24 04:20:56.277508'),(23,'bookstore','0004_auto_20210224_0445','2021-02-24 04:45:09.325105'),(24,'bookstore','0005_auto_20210224_0458','2021-02-24 04:58:35.316674'),(25,'bookstore','0006_auto_20210224_0459','2021-02-24 04:59:50.699146'),(26,'bookstore','0007_auto_20210313_1009','2021-03-13 15:10:02.121456'),(27,'bookstore','0008_auto_20210317_2110','2021-03-18 01:11:07.984711'),(28,'bookstore','0009_author_books','2021-03-23 01:43:56.324632'),(29,'bookstore','0007_cart_cartproduct','2021-03-24 00:56:21.801759'),(30,'bookstore','0008_auto_20210317_1926','2021-03-24 00:56:36.256871'),(31,'bookstore','0009_auto_20210318_1958','2021-03-24 00:56:41.044551'),(32,'bookstore','0010_cart_cartproduct','2021-03-24 00:56:42.565109'),(33,'bookstore','0011_auto_20210323_2159','2021-03-24 01:59:46.623126'),(34,'bookstore','0012_auto_20210323_2203','2021-03-24 02:03:29.183772');
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
INSERT INTO `django_session` VALUES ('2c5o0am1up5tw00cneh0gyjff00uswfp','.eJxVjMEOwiAQRP9lz4YUWpbWo3e_gSzsKlUDSWlPxn-XJj3oXCaZNzNv8LStyW9VFj8znEHD6TcLFJ-Sd8APyveiYsnrMge1V9RBq7oWltfl6P4dJKqprWl0TH2vhW9ILELompCHqWOLxkkMzYxMI0Ut0RpjMQRHmnFwIh18vv7xOGs:1lEvzf:Igx6Rplrba-mFkvCKujEjmNr8TQta_EimY-Y8qhPKDw','2021-03-10 15:22:27.642614'),('xyzcclk60q5tznvongjadc580j7vvw72','.eJxVjsEOwiAQRP-FsyHQFgoevfsNzbK72KqBBOjJ-O-2pge9vpl5mZeYYG3ztFYu00LiLDpx-mUB8MFpD-gO6ZYl5tTKEuRekUda5TUTPy9H908wQ523tVcDYrDGkjeBNFNAh6OOnjfEnQLqlXIhajJOszGgTLTO9r0eOs_jLkUo7ftRvz-yaDu5:1lOtss:ZURIsypMGbPCLHzYELLGpnEI2PXx1fcjQzZIcB3nTQI','2021-04-07 03:08:38.113479'),('zc9wa11o0gqtvam5tqofuyhz84q96jz8','.eJxVjDsOwyAQBe9CHSE-BkPK9D4DWtglOIlAMnYV5e6xJRdJOzPvvVmAbS1h67SEGdmVKXb5ZRHSk-oh8AH13nhqdV3myI-En7bzqSG9bmf7d1Cgl33txZBStMaiNxElYUwujTJ72hEpAaiFcDFLNE6SMSBMts5qLQflaUT2-QL7mzgI:1lFRiS:aeBiPp2uMU0two7BAdjzGQdBXxefUYDpFKtwm1o1tDw','2021-03-12 01:14:48.508544');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customer`
--

DROP TABLE IF EXISTS `users_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `address_1` varchar(200) DEFAULT NULL,
  `zip_code` varchar(5) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_customer_user_id_a09bb4be_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customer`
--

LOCK TABLES `users_customer` WRITE;
/*!40000 ALTER TABLE `users_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-27 13:48:29
