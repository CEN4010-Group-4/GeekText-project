-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add customer',7,'add_customer'),(26,'Can change customer',7,'change_customer'),(27,'Can delete customer',7,'delete_customer'),(28,'Can view customer',7,'view_customer'),(29,'Can add author',8,'add_author'),(30,'Can change author',8,'change_author'),(31,'Can delete author',8,'delete_author'),(32,'Can view author',8,'view_author'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add product',10,'add_product'),(38,'Can change product',10,'change_product'),(39,'Can delete product',10,'delete_product'),(40,'Can view product',10,'view_product'),(41,'Can add genre',9,'add_genre'),(42,'Can change genre',9,'change_genre'),(43,'Can delete genre',9,'delete_genre'),(44,'Can view genre',9,'view_genre');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$AMHGo4g3xlyp$GKGXIgjqgv2T8kk4O9ltpvridq67pPxc3hVx7nMAxbo=','2021-02-24 15:22:27.640630',1,'peter','','','',1,1,'2021-02-24 04:10:46.278712');
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
INSERT INTO `bookstore_author` VALUES (1,'Richard','Bach','2021-02-24 04:46:46.954026','Richard David Bach is an American writer widely known as the author of some of the 1970s\' biggest sellers, including Jonathan Livingston Seagull and Illusions: The Adventures of a Reluctant Messiah. Bach has written numerous works of fiction, and also non-fiction flight-related titles'),(2,'Archer','Jeffery','2021-02-24 00:05:57.000000','Jeffrey Howard Archer, Baron Archer of Weston-super-Mare is an English novelist, former politician, convicted perjurer, and peer of the realm. Before becoming an author, Archer was a Member of Parliament, but did not seek re-election after a financial scandal that left him almost bankrupt.'),(3,'Dan','Brown','2021-02-24 04:46:46.954026','Daniel Gerhard Brown is an American author best known for his thriller novels, including the Robert Langdon novels Angels & Demons, The Da Vinci Code, The Lost Symbol, Inferno and Origin. His novels are treasure hunts that usually take place over a period of 24 hours.'),(4,'Albert','Camus','2021-02-24 04:46:46.954026','Albert Camus was a French philosopher, author, and journalist. He won the Nobel Prize in Literature at the age of 44 in 1957, the second-youngest recipient in history. His works include The Stranger, The Plague, The Myth of Sisyphus, The Fall, and The Rebel. Camus was born in Algeria to French Pieds Noirs parents.'),(5,'Fritjof','Capra','2021-02-24 04:46:46.954026','Fritjof Capra is an Austrian-born American physicist, systems theorist and deep ecologist. In 1995, he became a founding director of the Center for Ecoliteracy in Berkeley, California. He is on the faculty of Schumacher College.'),(6,'Michael','Crichton','2021-02-24 04:46:46.954026','John Michael Crichton was an American author and filmmaker. His books have sold over 200 million copies worldwide, and over a dozen have been adapted into films. His literary works are usually within the science fiction, techno-thriller, and medical fiction genres, and heavily feature technology'),(7,'William','Dalrymple','2021-02-24 04:46:46.954026','William Dalrymple FRAS FRSL FRGS FRSE is a Scottish historian and writer, art historian and curator, as well as a broadcaster and critic.'),(8,'Siddhartha','Deb','2021-02-24 04:46:46.954026','Siddhartha Deb is an Indian author who was born in Meghalaya and grew up in Shillong in northeastern India. He was educated in India and at Columbia University, US. Deb began his career in journalism as a sports journalist in Calcutta in 1994 before moving to Delhi to continue regular journalism until 1998.'),(9,'P L','Deshpande','2021-02-24 04:46:46.954026','Purushottam Laxman Deshpande, popularly known by his initials or as P. L. Deshpande, was a Marathi writer and humorist from Maharashtra, India. He was also an accomplished film and stage actor, script writer, author, composer, musician, singer and orator.'),(10,'Sunita','Deshpande','2021-02-24 04:46:46.954026','Sunita Deshpande was a Marathi writer from Maharashtra, India. She was fondly called \"Sunitabai\"'),(11,'Fyodor','Dostoevsky','2021-02-24 04:46:46.954026','Fyodor Mikhailovich Dostoevsky, sometimes transliterated as Dostoyevsky, was a Russian novelist, philosopher, short story writer, essayist, and journalist.'),(12,'Arthur Conan','Doyle','2021-02-24 04:46:46.954026','Arthur Conan Doyle was born on 22 May 1859 in Edinburgh into a prosperous Irish family. He trained as a doctor, gaining his degree from Edinburgh University in 1881. He worked as a surgeon on a whaling boat and also as a medical officer on a steamer travelling between Liverpool and West Africa.'),(13,'Peter','Drucker','2021-02-24 04:46:46.954026','Peter Ferdinand Drucker was an Austrian management consultant, educator, and author, whose writings contributed to the philosophical and practical foundations of the modern business corporation.'),(14,'Bob','Dylan','2021-02-24 04:46:46.954026','Bob Dylan is an American singer-songwriter, author and visual artist. Widely regarded as one of the greatest songwriters, Dylan has been a major figure in popular culture for more than 50 years'),(15,'Abraham','Eraly','2021-02-24 04:46:46.954026','Abraham Eraly was an Indian writer of history, a teacher, and the founder of Chennai-based magazine Aside.'),(16,'Robert','Fisk','2021-02-24 04:46:46.954026','Robert Fisk was a writer and journalist who held British and Irish citizenship. During his career he developed strong views, and was especially critical of United States foreign policy in the Middle East and the Israeli governments treatment of Palestinians.'),(17,'Ken','Follett','2021-02-24 04:46:46.954026','Kenneth Martin Follett, CBE, FRSL is a Welsh author of thrillers and historical novels who has sold more than 160 million copies of his works. Many of his books have achieved high ranking on best seller lists.'),(18,'Frederick','Forsyth','2021-02-24 04:46:46.954026','Frederick McCarthy Forsyth CBE is an English novelist and journalist. He is best known for thrillers such as The Day of the Jackal, The Odessa File, The Fourth Protocol, The Dogs of War, The Devils Alternative, The Fist of God, Icon, The Veteran, Avenger, The Afghan, The Cobra and The Kill List.'),(19,'Sanjay','Garg','2021-02-24 04:46:46.954026','Amitav Ghosh is an Indian writer and the winner of the 54th Jnanpith award, best known for his work in English fiction.'),(20,'Amitav','Ghosh','2021-02-24 04:46:46.954026','hello'),(21,'Richard','Gordon','2021-02-24 04:46:46.954026','Richard Francis Gordon Jr. was an American naval officer and aviator, test pilot, and NASA astronaut, and an American football executive. He was one of 24 people to have flown to the Moon, as the command module pilot of the 1969 Apollo 12 mission which orbited the Moon 45 times.'),(22,'John','Grisham','2021-02-24 04:46:46.954026','John Ray Grisham Jr. is an American novelist, attorney, politician, and activist, best known for his popular legal thrillers. His books have been translated into 42 languages and published worldwide.');
/*!40000 ALTER TABLE `bookstore_author` ENABLE KEYS */;
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
INSERT INTO `bookstore_product` VALUES (1,'False Impressions','false-impressions','products/2021/02/24/False_Impressions_1.png','products/2021/02/24/False_Impressions_2.png','','Pan','1995-02-24 06:02:35.000000','False Impression is a mystery novel by English author Jeffrey Archer, first published in February 2005 by Macmillan. The novel was published in several countries.',10.00,'2021-02-24 05:59:58.000000','2021-02-24 06:03:25.199604',2,1),(2,'A Prisoner of Birth','prisoner-birth','','','','Pan','2008-02-24 06:05:44.000000','A Prisoner of Birth is a mystery novel by English author Jeffrey Archer, first published on 6 March 2008 by Macmillan. This book is a contemporary retelling of Dumas\'s 1844 novel The Count of Monte Cristo. The novel saw Archer return to the first place in the fiction best-seller list for the first time in a decade.',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',2,1),(3,'One','One','','','','Dell','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',1,2),(4,'Angels & Demons','Angels_&_Demons','','','','Random House','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',3,1),(5,'The Outsider','The_Outsider','','','','Penguin','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',4,1),(6,'Uncommon Wisdom','Uncommon_Wisdom','','','','Fontana','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',5,2),(7,'Jurassic Park','Jurassic_Park','','','','Random House','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',6,1),(8,'The Last Mughal','The_Last_Mughal','','','','Penguin','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',7,2),(9,'Beyond the Three Seas','Beyond_the_Three_Seas','','','','Random House','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',7,2),(10,'The Beautiful and the Damned','The_Beautiful_and_the_Damned','','','','Penguin','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',8,2),(11,'Asami Asami','Asami_Asami','','','','Mauj','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',9,1),(12,'Radiowaril Bhashane & Shrutika','Radiowaril_Bhashane_&_Shrutika','','','','Mauj','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',9,2),(13,'Gun Gayin Awadi','Gun_Gayin_Awadi','','','','Mauj','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',9,2),(14,'Aghal Paghal','Aghal_Paghal','','','','Mauj','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',9,2),(15,'Ahe Manohar Tari','Ahe_Manohar_Tari','','','','Mauj','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',10,2),(16,'Crime and Punishment','Crime_and_Punishment','','','','Penguin','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',11,1),(17,'The Complete Sherlock Holmes Vol I','The_Complete_Sherlock_Holmes_Vol_I','','','','Random House','2008-02-24 06:05:44.000000','To Be Updated',10.00,'2021-02-24 06:05:09.000000','2021-02-24 15:40:06.054120',12,1),(18,'The Complete Sherlock Holmes Vol II','The_Complete_Sherlock_Holmes_Vol_II','','','','Random House','2008-02-24 06:05:44.000000','To Be Updated',10.00,'2021-02-24 06:05:09.000000','2021-02-24 15:40:16.362932',12,1),(19,'The Age of Discontuinity','The_Age_of_Discontuinity','','','','Random House','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',13,2),(20,'Dylan on Dylan','Dylan_on_Dylan','','','','Random House','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',14,2),(21,'The Age of Wrath','The_Age_of_Wrath','','','','Penguin','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',15,2),(22,'The Pillars of the Earth','The_Pillars_of_the_Earth','','','','Harper Collins','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',16,2),(23,'The Veteran','The_Veteran','','','','Random House','2008-02-24 06:05:44.000000',' To Be Updated ',10.00,'2021-02-24 06:05:09.000000','2021-02-24 06:06:12.320583',17,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-24 04:46:46.955088','1','Richard Bach',1,'[{\"added\": {}}]',8,1),(2,'2021-02-24 05:17:27.722822','1','Fiction',1,'[{\"added\": {}}]',9,1),(3,'2021-02-24 05:17:31.738442','2','Non Fiction',1,'[{\"added\": {}}]',9,1),(4,'2021-02-24 05:24:42.984836','22','Grisham John',3,'',8,1),(5,'2021-02-24 05:24:42.988077','21','Gordon Richard',3,'',8,1),(6,'2021-02-24 05:24:42.989210','20','Ghosh Amitav',3,'',8,1),(7,'2021-02-24 05:24:42.990259','19','Garg Sanjay',3,'',8,1),(8,'2021-02-24 05:24:42.991392','18','Forsyth Frederick',3,'',8,1),(9,'2021-02-24 05:24:42.992307','17','Follett Ken',3,'',8,1),(10,'2021-02-24 05:24:42.993284','16','Fisk Robert',3,'',8,1),(11,'2021-02-24 05:24:42.994153','15','Eraly Abraham',3,'',8,1),(12,'2021-02-24 05:24:42.995137','14','Dylan Bob',3,'',8,1),(13,'2021-02-24 05:24:42.996111','13','Drucker Peter',3,'',8,1),(14,'2021-02-24 05:24:42.997229','12','Doyle Arthur Conan',3,'',8,1),(15,'2021-02-24 05:24:42.998231','11','Dostoevsky Fyodor',3,'',8,1),(16,'2021-02-24 05:24:42.999225','10','Deshpande Sunita',3,'',8,1),(17,'2021-02-24 05:24:43.000101','9','Deshpande P L',3,'',8,1),(18,'2021-02-24 05:24:43.001077','8','Deb Siddhartha',3,'',8,1),(19,'2021-02-24 05:24:43.002051','7','Dalrymple William',3,'',8,1),(20,'2021-02-24 05:24:43.003008','6','Crichton Michael',3,'',8,1),(21,'2021-02-24 05:24:43.004007','5','Capra Fritjof',3,'',8,1),(22,'2021-02-24 05:24:43.004842','4','Camus Albert',3,'',8,1),(23,'2021-02-24 05:24:43.005830','3','Brown Dan',3,'',8,1),(24,'2021-02-24 06:03:25.201106','1','False Impressions',1,'[{\"added\": {}}]',10,1),(25,'2021-02-24 06:06:12.322037','2','A Prisoner of Birth',1,'[{\"added\": {}}]',10,1),(26,'2021-02-24 14:44:44.504139','3','Update1',3,'',10,1),(27,'2021-02-24 14:44:44.508401','12','Update10',3,'',10,1),(28,'2021-02-24 14:44:44.509354','13','Update11',3,'',10,1),(29,'2021-02-24 14:44:44.510315','14','Update12',3,'',10,1),(30,'2021-02-24 14:44:44.511225','15','Update13',3,'',10,1),(31,'2021-02-24 14:44:44.512315','16','Update14',3,'',10,1),(32,'2021-02-24 14:44:44.513342','17','Update15',3,'',10,1),(33,'2021-02-24 14:44:44.514302','18','Update16',3,'',10,1),(34,'2021-02-24 14:44:44.515549','19','Update17',3,'',10,1),(35,'2021-02-24 14:44:44.516538','20','Update18',3,'',10,1),(36,'2021-02-24 14:44:44.517620','21','Update19',3,'',10,1),(37,'2021-02-24 14:44:44.518663','4','Update2',3,'',10,1),(38,'2021-02-24 14:44:44.519559','22','Update20',3,'',10,1),(39,'2021-02-24 14:44:44.520438','23','Update21',3,'',10,1),(40,'2021-02-24 14:44:44.521384','5','Update3',3,'',10,1),(41,'2021-02-24 14:44:44.522449','6','Update4',3,'',10,1),(42,'2021-02-24 14:44:44.523344','7','Update5',3,'',10,1),(43,'2021-02-24 14:44:44.524243','8','Update6',3,'',10,1),(44,'2021-02-24 14:44:44.525136','9','Update7',3,'',10,1),(45,'2021-02-24 14:44:44.526063','10','Update8',3,'',10,1),(46,'2021-02-24 14:44:44.527187','11','Update9',3,'',10,1),(47,'2021-02-24 15:40:06.055877','17','The Complete Sherlock Holmes Vol I',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',10,1),(48,'2021-02-24 15:40:16.364552','18','The Complete Sherlock Holmes Vol II',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'bookstore','author'),(9,'bookstore','genre'),(10,'bookstore','product'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'users','customer');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-24 04:06:16.494065'),(2,'auth','0001_initial','2021-02-24 04:06:16.571423'),(3,'admin','0001_initial','2021-02-24 04:06:16.774880'),(4,'admin','0002_logentry_remove_auto_add','2021-02-24 04:06:16.834865'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-24 04:06:16.843390'),(6,'contenttypes','0002_remove_content_type_name','2021-02-24 04:06:16.893800'),(7,'auth','0002_alter_permission_name_max_length','2021-02-24 04:06:16.923057'),(8,'auth','0003_alter_user_email_max_length','2021-02-24 04:06:16.945260'),(9,'auth','0004_alter_user_username_opts','2021-02-24 04:06:16.953947'),(10,'auth','0005_alter_user_last_login_null','2021-02-24 04:06:16.982581'),(11,'auth','0006_require_contenttypes_0002','2021-02-24 04:06:16.985079'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-24 04:06:16.993897'),(13,'auth','0008_alter_user_username_max_length','2021-02-24 04:06:17.026018'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-24 04:06:17.057608'),(15,'auth','0010_alter_group_name_max_length','2021-02-24 04:06:17.075913'),(16,'auth','0011_update_proxy_permissions','2021-02-24 04:06:17.085176'),(17,'auth','0012_alter_user_first_name_max_length','2021-02-24 04:06:17.118495'),(18,'bookstore','0001_initial','2021-02-24 04:06:17.163623'),(19,'bookstore','0002_author_biography','2021-02-24 04:06:17.305642'),(20,'sessions','0001_initial','2021-02-24 04:06:17.321775'),(21,'users','0001_initial','2021-02-24 04:06:17.361466'),(22,'bookstore','0003_auto_20210224_0420','2021-02-24 04:20:56.277508'),(23,'bookstore','0004_auto_20210224_0445','2021-02-24 04:45:09.325105'),(24,'bookstore','0005_auto_20210224_0458','2021-02-24 04:58:35.316674'),(25,'bookstore','0006_auto_20210224_0459','2021-02-24 04:59:50.699146');
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
INSERT INTO `django_session` VALUES ('2c5o0am1up5tw00cneh0gyjff00uswfp','.eJxVjMEOwiAQRP9lz4YUWpbWo3e_gSzsKlUDSWlPxn-XJj3oXCaZNzNv8LStyW9VFj8znEHD6TcLFJ-Sd8APyveiYsnrMge1V9RBq7oWltfl6P4dJKqprWl0TH2vhW9ILELompCHqWOLxkkMzYxMI0Ut0RpjMQRHmnFwIh18vv7xOGs:1lEvzf:Igx6Rplrba-mFkvCKujEjmNr8TQta_EimY-Y8qhPKDw','2021-03-10 15:22:27.642614');
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

-- Dump completed on 2021-02-24 11:04:30
