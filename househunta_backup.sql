/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: househunta
-- ------------------------------------------------------
-- Server version	10.11.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ab_events`
--

DROP TABLE IF EXISTS `ab_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) NOT NULL,
  `experiment_id` varchar(255) NOT NULL,
  `metadata` text DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `variant` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_events`
--

LOCK TABLES `ab_events` WRITE;
/*!40000 ALTER TABLE `ab_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `ab_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_experiments`
--

DROP TABLE IF EXISTS `ab_experiments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_experiments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `experiment_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `target_roles` varchar(255) DEFAULT NULL,
  `traffic_percentage` int(11) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `variants` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKh57fb8ffdp6qo1slho5gf169m` (`experiment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_experiments`
--

LOCK TABLES `ab_experiments` WRITE;
/*!40000 ALTER TABLE `ab_experiments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ab_experiments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ab_variant_assignments`
--

DROP TABLE IF EXISTS `ab_variant_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ab_variant_assignments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assigned_at` datetime(6) NOT NULL,
  `experiment_id` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `variant` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKs3ebr8s529krhjjj670m4eake` (`user_id`,`experiment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ab_variant_assignments`
--

LOCK TABLES `ab_variant_assignments` WRITE;
/*!40000 ALTER TABLE `ab_variant_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ab_variant_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bio` text DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `is_verified` bit(1) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `max_appointments_per_day` int(11) DEFAULT NULL,
  `max_properties` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `verification_date` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKica2nnf6jymrt09bvuv7e4mai` (`user_id`),
  CONSTRAINT `FK2vh8rg4inh3scgcguimya35my` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity_types`
--

DROP TABLE IF EXISTS `amenity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenity_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amenity_key` varchar(100) NOT NULL,
  `amenity_name` varchar(200) NOT NULL,
  `category` varchar(50) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKg06wfw9yc8355fudl4wauvyo1` (`amenity_key`),
  KEY `idx_amenity_types_category` (`category`),
  KEY `idx_amenity_types_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity_types`
--

LOCK TABLES `amenity_types` WRITE;
/*!40000 ALTER TABLE `amenity_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenity_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agent_notes` text DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `cancelled_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `confirmed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `no_show_at` datetime(6) DEFAULT NULL,
  `reminder_sent_at` datetime(6) DEFAULT NULL,
  `rescheduled_reason` varchar(255) DEFAULT NULL,
  `start_time` time(6) NOT NULL,
  `status` enum('CANCELLED','COMPLETED','CONFIRMED','NO_SHOW','PENDING','RESCHEDULED') NOT NULL,
  `tenant_notes` text DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `agent_id` bigint(20) NOT NULL,
  `match_id` bigint(20) DEFAULT NULL,
  `property_id` bigint(20) NOT NULL,
  `rescheduled_from` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK46orji28766umkccany4ma9he` (`agent_id`),
  KEY `FKaeqel1ea9pmvbk9650gsv9ecn` (`match_id`),
  KEY `FKe32g7ytf1s49sat3w1wm4cptk` (`property_id`),
  KEY `FKo27gqxtrk2m5uvkcoivojvujg` (`rescheduled_from`),
  KEY `FKhpawwp308oijr2ox9mtcvwtuf` (`tenant_id`),
  CONSTRAINT `FK46orji28766umkccany4ma9he` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  CONSTRAINT `FKaeqel1ea9pmvbk9650gsv9ecn` FOREIGN KEY (`match_id`) REFERENCES `swipe_matches` (`id`),
  CONSTRAINT `FKe32g7ytf1s49sat3w1wm4cptk` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `FKhpawwp308oijr2ox9mtcvwtuf` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKo27gqxtrk2m5uvkcoivojvujg` FOREIGN KEY (`rescheduled_from`) REFERENCES `appointments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `record_id` bigint(20) DEFAULT NULL,
  `old_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_value`)),
  `new_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_value`)),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_action` (`action`),
  KEY `idx_table_record` (`table_name`,`record_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_user_created` (`user_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_users`
--

DROP TABLE IF EXISTS `blocked_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blocker_id` bigint(20) NOT NULL,
  `blocked_id` bigint(20) NOT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `blocked_at` datetime(6) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_block` (`blocker_id`,`blocked_id`),
  UNIQUE KEY `UKsjs9rx68tjx90xii3mctenqul` (`blocker_id`,`blocked_id`),
  KEY `idx_blocked_users_blocker` (`blocker_id`),
  KEY `idx_blocked_users_blocked` (`blocked_id`),
  CONSTRAINT `fk_block_blocked` FOREIGN KEY (`blocked_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_block_blocker` FOREIGN KEY (`blocker_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_users`
--

LOCK TABLES `blocked_users` WRITE;
/*!40000 ALTER TABLE `blocked_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocked_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) DEFAULT NULL,
  `user1_id` bigint(20) NOT NULL,
  `user2_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_message_at` timestamp NULL DEFAULT NULL,
  `last_message_preview` varchar(255) DEFAULT NULL,
  `agent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_conversations_user1` (`user1_id`),
  KEY `idx_conversations_user2` (`user2_id`),
  KEY `idx_conversations_users` (`user1_id`,`user2_id`),
  KEY `idx_conversations_last_message` (`last_message_at`),
  KEY `idx_conversations_match` (`match_id`),
  KEY `FKjq8uc2ooxp2iyvatsgg7pqyir` (`agent_id`),
  CONSTRAINT `FKjq8uc2ooxp2iyvatsgg7pqyir` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  CONSTRAINT `fk_conversation_match` FOREIGN KEY (`match_id`) REFERENCES `swipe_matches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_conversation_user1` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_conversation_user2` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES
(1,'1','base tables','SQL','V1__base_tables.sql',1293072701,'hunta','2026-04-30 16:29:50',966,1),
(2,'2','location based filtering','SQL','V2__location_based_filtering.sql',-1173863265,'hunta','2026-04-30 16:29:51',851,1),
(3,'3','whatsapp notifications','SQL','V3__whatsapp_notifications.sql',721257840,'hunta','2026-04-30 16:29:52',167,1),
(4,'4','property applications','SQL','V4__property_applications.sql',1487487673,'hunta','2026-04-30 16:29:53',765,1),
(5,'5','composite indexes performance','SQL','V5__composite_indexes_performance.sql',-378106518,'hunta','2026-04-30 16:29:53',687,1),
(6,'6','soft delete support','SQL','V6__soft_delete_support.sql',1781713824,'hunta','2026-04-30 16:29:54',200,1),
(7,'7','critical indexes and constraints','SQL','V7__critical_indexes_and_constraints.sql',-1702371627,'hunta','2026-04-30 16:29:55',973,1),
(8,'8','audit logs','SQL','V8__audit_logs.sql',1955506157,'hunta','2026-04-30 16:29:55',142,1),
(9,'9','missing indexes and fixes','SQL','V9__missing_indexes_and_fixes.sql',2020893941,'hunta','2026-04-30 16:29:55',436,1),
(10,'10','critical production fixes','SQL','V10__critical_production_fixes.sql',190992209,'househunt','2026-05-01 15:48:13',325,1),
(11,'11','critical fixes','SQL','V11__critical_fixes.sql',2057260215,'househunt','2026-05-01 15:49:02',314,1),
(12,'12','blocked users','SQL','V12__blocked_users.sql',1765713480,'househunt','2026-05-01 15:49:50',289,0);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord_preference_education_level`
--

DROP TABLE IF EXISTS `landlord_preference_education_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `landlord_preference_education_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `education_level` varchar(50) NOT NULL,
  `preference_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKq89rhykox9ccjbnx2occ1u48f` (`preference_id`,`education_level`),
  CONSTRAINT `FKqo362raiwfbx5kn7hp2olwt27` FOREIGN KEY (`preference_id`) REFERENCES `landlord_preferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord_preference_education_level`
--

LOCK TABLES `landlord_preference_education_level` WRITE;
/*!40000 ALTER TABLE `landlord_preference_education_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `landlord_preference_education_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord_preference_employment_type`
--

DROP TABLE IF EXISTS `landlord_preference_employment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `landlord_preference_employment_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employment_type` varchar(50) NOT NULL,
  `preference_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4rg1j0t4xkcps6jdpf1qgh5b8` (`preference_id`,`employment_type`),
  CONSTRAINT `FKqkkytqnwlwhfwfvi9b9yfp0a` FOREIGN KEY (`preference_id`) REFERENCES `landlord_preferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord_preference_employment_type`
--

LOCK TABLES `landlord_preference_employment_type` WRITE;
/*!40000 ALTER TABLE `landlord_preference_employment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `landlord_preference_employment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord_preference_marital_status`
--

DROP TABLE IF EXISTS `landlord_preference_marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `landlord_preference_marital_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `preference_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKffpr3n36xrkool6qwyln34l2i` (`preference_id`,`status`),
  CONSTRAINT `FK4fysbtbdrsq6e21g21q2qgv2b` FOREIGN KEY (`preference_id`) REFERENCES `landlord_preferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord_preference_marital_status`
--

LOCK TABLES `landlord_preference_marital_status` WRITE;
/*!40000 ALTER TABLE `landlord_preference_marital_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `landlord_preference_marital_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord_preferences`
--

DROP TABLE IF EXISTS `landlord_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `landlord_preferences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `landlord_id` bigint(20) NOT NULL,
  `property_id` bigint(20) DEFAULT NULL,
  `preferred_marital_status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`preferred_marital_status`)),
  `preferred_employment_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`preferred_employment_type`)),
  `preferred_education_level` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`preferred_education_level`)),
  `min_income` varchar(255) DEFAULT NULL,
  `age_min` int(11) DEFAULT 18,
  `age_max` int(11) DEFAULT 99,
  `require_verified` tinyint(1) DEFAULT 0,
  `require_social_profiles` tinyint(1) DEFAULT 0,
  `prefer_no_pets` tinyint(1) DEFAULT 0,
  `prefer_no_smoking` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `match_weight_age` int(11) DEFAULT NULL,
  `match_weight_education` int(11) DEFAULT NULL,
  `match_weight_employment` int(11) DEFAULT NULL,
  `match_weight_income` int(11) DEFAULT NULL,
  `match_weight_verified` int(11) DEFAULT NULL,
  `min_match_score` int(11) DEFAULT NULL,
  `rent_max` int(11) DEFAULT NULL,
  `rent_min` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_landlord_preferences_landlord` (`landlord_id`),
  KEY `idx_landlord_preferences_property` (`property_id`),
  CONSTRAINT `fk_preference_landlord` FOREIGN KEY (`landlord_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_preference_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord_preferences`
--

LOCK TABLES `landlord_preferences` WRITE;
/*!40000 ALTER TABLE `landlord_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `landlord_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord_profiles`
--

DROP TABLE IF EXISTS `landlord_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `landlord_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `business_registration` varchar(100) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `verification_date` timestamp NULL DEFAULT NULL,
  `kyc_status` varchar(50) DEFAULT 'PENDING',
  `kyc_document_url` varchar(500) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bio` text DEFAULT NULL,
  `business_license` varchar(255) DEFAULT NULL,
  `business_license_url` varchar(255) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `idx_landlord_profiles_user` (`user_id`),
  KEY `idx_landlord_profiles_verified` (`is_verified`),
  KEY `idx_landlord_profiles_deleted` (`is_deleted`),
  CONSTRAINT `fk_landlord_profile_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord_profiles`
--

LOCK TABLES `landlord_profiles` WRITE;
/*!40000 ALTER TABLE `landlord_profiles` DISABLE KEYS */;
INSERT INTO `landlord_profiles` VALUES
(3,3,'Emeka','Okafor','+2348010000001','Emeka Okafor Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33',NULL,NULL,NULL,NULL),
(4,4,'Tunde','Adeleke','+2348010000002','Tunde Adeleke Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33',NULL,NULL,NULL,NULL),
(5,5,'Chidi','Nwosu','+2348010000003','Chidi Nwosu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33',NULL,NULL,NULL,NULL),
(6,6,'Ngozi','Adeyemi','+2348010000004','Ngozi Adeyemi Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33',NULL,NULL,NULL,NULL),
(7,7,'Funke','Eze','+2348010000005','Funke Eze Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33',NULL,NULL,NULL,NULL),
(8,8,'Kemi','Balogun','+2348010000006','Kemi Balogun Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33',NULL,NULL,NULL,NULL),
(9,9,'Bayo','Okonkwo','+2348010000007','Bayo Okonkwo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34',NULL,NULL,NULL,NULL),
(10,10,'Seun','Fashola','+2348010000008','Seun Fashola Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34',NULL,NULL,NULL,NULL),
(11,11,'Amaka','Chukwu','+2348010000009','Amaka Chukwu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34',NULL,NULL,NULL,NULL),
(12,12,'Femi','Abubakar','+2348010000010','Femi Abubakar Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34',NULL,NULL,NULL,NULL),
(13,13,'Yemi','Ogundimu','+2348010000011','Yemi Ogundimu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34',NULL,NULL,NULL,NULL),
(14,14,'Chisom','Nnaji','+2348010000012','Chisom Nnaji Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34',NULL,NULL,NULL,NULL),
(15,15,'Obinna','Adebayo','+2348010000013','Obinna Adebayo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34',NULL,NULL,NULL,NULL),
(16,16,'Sola','Obaseki','+2348010000014','Sola Obaseki Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34',NULL,NULL,NULL,NULL),
(17,17,'Tobi','Obi','+2348010000015','Tobi Obi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35',NULL,NULL,NULL,NULL),
(18,18,'Adaeze','Amadi','+2348010000016','Adaeze Amadi Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35',NULL,NULL,NULL,NULL),
(19,19,'Ola','Bakare','+2348010000017','Ola Bakare Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35',NULL,NULL,NULL,NULL),
(20,20,'Uche','Dike','+2348010000018','Uche Dike Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35',NULL,NULL,NULL,NULL),
(21,21,'Gbenga','Lawal','+2348010000019','Gbenga Lawal Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35',NULL,NULL,NULL,NULL),
(22,22,'Ifeanyi','Osagie','+2348010000020','Ifeanyi Osagie Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35',NULL,NULL,NULL,NULL),
(23,23,'Blessing','Oyelaran','+2348010000021','Blessing Oyelaran Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35',NULL,NULL,NULL,NULL),
(24,24,'Chukwu','Nnamdi','+2348010000022','Chukwu Nnamdi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36',NULL,NULL,NULL,NULL),
(25,25,'Ade','Adesanya','+2348010000023','Ade Adesanya Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36',NULL,NULL,NULL,NULL),
(26,26,'Nkem','Ekwueme','+2348010000024','Nkem Ekwueme Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36',NULL,NULL,NULL,NULL),
(27,27,'Rotimi','Olawale','+2348010000025','Rotimi Olawale Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36',NULL,NULL,NULL,NULL),
(28,28,'Dupe','Igwe','+2348010000026','Dupe Igwe Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36',NULL,NULL,NULL,NULL),
(29,29,'Kunle','Awolowo','+2348010000027','Kunle Awolowo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36',NULL,NULL,NULL,NULL),
(30,30,'Zainab','Nzegwu','+2348010000028','Zainab Nzegwu Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37',NULL,NULL,NULL,NULL),
(31,31,'Taiwo','Onwudiwe','+2348010000029','Taiwo Onwudiwe Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37',NULL,NULL,NULL,NULL),
(32,32,'Bisi','Olufemi','+2348010000030','Bisi Olufemi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37',NULL,NULL,NULL,NULL),
(33,33,'Kayode','Okafor','+2348010000031','Kayode Okafor Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37',NULL,NULL,NULL,NULL),
(34,34,'Ifeoma','Adeleke','+2348010000032','Ifeoma Adeleke Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37',NULL,NULL,NULL,NULL),
(35,35,'Lanre','Nwosu','+2348010000033','Lanre Nwosu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37',NULL,NULL,NULL,NULL),
(36,36,'Chinwe','Adeyemi','+2348010000034','Chinwe Adeyemi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37',NULL,NULL,NULL,NULL),
(37,37,'Wale','Eze','+2348010000035','Wale Eze Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38',NULL,NULL,NULL,NULL),
(38,38,'Aisha','Balogun','+2348010000036','Aisha Balogun Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38',NULL,NULL,NULL,NULL),
(39,39,'Bolaji','Okonkwo','+2348010000037','Bolaji Okonkwo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38',NULL,NULL,NULL,NULL),
(40,40,'Nneka','Fashola','+2348010000038','Nneka Fashola Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38',NULL,NULL,NULL,NULL),
(41,41,'Damilola','Chukwu','+2348010000039','Damilola Chukwu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38',NULL,NULL,NULL,NULL),
(42,42,'Ejike','Abubakar','+2348010000040','Ejike Abubakar Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38',NULL,NULL,NULL,NULL),
(43,43,'Shade','Ogundimu','+2348010000041','Shade Ogundimu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38',NULL,NULL,NULL,NULL),
(44,44,'Ike','Nnaji','+2348010000042','Ike Nnaji Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(45,45,'Uju','Adebayo','+2348010000043','Uju Adebayo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(46,46,'Dotun','Obaseki','+2348010000044','Dotun Obaseki Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(47,47,'Nkechi','Obi','+2348010000045','Nkechi Obi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(48,48,'Chika','Amadi','+2348010000046','Chika Amadi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(49,49,'Toyin','Bakare','+2348010000047','Toyin Bakare Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(50,50,'Fola','Dike','+2348010000048','Fola Dike Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(51,51,'Musa','Lawal','+2348010000049','Musa Lawal Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(52,52,'Halima','Osagie','+2348010000050','Halima Osagie Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39',NULL,NULL,NULL,NULL),
(53,53,'Hakeem','Oyelaran','+2348010000051','Hakeem Oyelaran Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40',NULL,NULL,NULL,NULL),
(54,54,'Bunmi','Nnamdi','+2348010000052','Bunmi Nnamdi Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40',NULL,NULL,NULL,NULL),
(55,55,'Deola','Adesanya','+2348010000053','Deola Adesanya Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40',NULL,NULL,NULL,NULL),
(56,56,'Ayo','Ekwueme','+2348010000054','Ayo Ekwueme Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40',NULL,NULL,NULL,NULL),
(57,57,'Ibi','Olawale','+2348010000055','Ibi Olawale Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40',NULL,NULL,NULL,NULL),
(58,58,'Chibundo','Igwe','+2348010000056','Chibundo Igwe Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40',NULL,NULL,NULL,NULL),
(59,59,'Titi','Awolowo','+2348010000057','Titi Awolowo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40',NULL,NULL,NULL,NULL),
(60,60,'Obi','Nzegwu','+2348010000058','Obi Nzegwu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40',NULL,NULL,NULL,NULL),
(61,61,'Gbemi','Onwudiwe','+2348010000059','Gbemi Onwudiwe Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(62,62,'Nonso','Olufemi','+2348010000060','Nonso Olufemi Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(63,63,'Yetunde','Okafor','+2348010000061','Yetunde Okafor Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(64,64,'Edet','Adeleke','+2348010000062','Edet Adeleke Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(65,65,'Tope','Nwosu','+2348010000063','Tope Nwosu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(66,66,'Ebele','Adeyemi','+2348010000064','Ebele Adeyemi Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(67,67,'Kolade','Eze','+2348010000065','Kolade Eze Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(68,68,'Chidera','Balogun','+2348010000066','Chidera Balogun Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(69,69,'Fisayo','Okonkwo','+2348010000067','Fisayo Okonkwo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41',NULL,NULL,NULL,NULL),
(70,70,'Remi','Fashola','+2348010000068','Remi Fashola Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(71,71,'Goke','Chukwu','+2348010000069','Goke Chukwu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(72,72,'Chibuike','Abubakar','+2348010000070','Chibuike Abubakar Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(73,73,'Onyeka','Ogundimu','+2348010000071','Onyeka Ogundimu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(74,74,'Feyi','Nnaji','+2348010000072','Feyi Nnaji Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(75,75,'Moyo','Adebayo','+2348010000073','Moyo Adebayo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(76,76,'Obafemi','Obaseki','+2348010000074','Obafemi Obaseki Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(77,77,'Adunni','Obi','+2348010000075','Adunni Obi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(78,78,'Chidi','Amadi','+2348010000076','Chidi Amadi Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42',NULL,NULL,NULL,NULL),
(79,79,'Bello','Bakare','+2348010000077','Bello Bakare Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43',NULL,NULL,NULL,NULL),
(80,80,'Lolade','Dike','+2348010000078','Lolade Dike Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43',NULL,NULL,NULL,NULL),
(81,81,'Uzo','Lawal','+2348010000079','Uzo Lawal Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43',NULL,NULL,NULL,NULL),
(82,82,'Dayo','Osagie','+2348010000080','Dayo Osagie Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43',NULL,NULL,NULL,NULL),
(83,83,'Ngwu','Oyelaran','+2348010000081','Ngwu Oyelaran Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43',NULL,NULL,NULL,NULL),
(84,84,'Jide','Nnamdi','+2348010000082','Jide Nnamdi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43',NULL,NULL,NULL,NULL),
(85,85,'Oluchi','Adesanya','+2348010000083','Oluchi Adesanya Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43',NULL,NULL,NULL,NULL),
(86,86,'Tutu','Ekwueme','+2348010000084','Tutu Ekwueme Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(87,87,'Efemena','Olawale','+2348010000085','Efemena Olawale Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(88,88,'Hauwa','Igwe','+2348010000086','Hauwa Igwe Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(89,89,'Omotunde','Awolowo','+2348010000087','Omotunde Awolowo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(90,90,'Okeke','Nzegwu','+2348010000088','Okeke Nzegwu Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(91,91,'Esosa','Onwudiwe','+2348010000089','Esosa Onwudiwe Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(92,92,'Uzor','Olufemi','+2348010000090','Uzor Olufemi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(93,93,'Morenike','Okafor','+2348010000091','Morenike Okafor Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(94,94,'Ehi','Adeleke','+2348010000092','Ehi Adeleke Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44',NULL,NULL,NULL,NULL),
(95,95,'Iminabo','Nwosu','+2348010000093','Iminabo Nwosu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45',NULL,NULL,NULL,NULL),
(96,96,'Okon','Adeyemi','+2348010000094','Okon Adeyemi Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45',NULL,NULL,NULL,NULL),
(97,97,'Abiola','Eze','+2348010000095','Abiola Eze Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45',NULL,NULL,NULL,NULL),
(98,98,'Kola','Balogun','+2348010000096','Kola Balogun Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45',NULL,NULL,NULL,NULL),
(99,99,'Agatha','Okonkwo','+2348010000097','Agatha Okonkwo Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45',NULL,NULL,NULL,NULL),
(100,100,'Dike','Fashola','+2348010000098','Dike Fashola Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45',NULL,NULL,NULL,NULL),
(101,101,'Olubunmi','Chukwu','+2348010000099','Olubunmi Chukwu Properties',NULL,0,NULL,'PENDING',NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45',NULL,NULL,NULL,NULL),
(102,102,'Nana','Abubakar','+2348010000100','Nana Abubakar Properties',NULL,1,NULL,'APPROVED',NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `landlord_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'Nigeria',
  `parent_id` bigint(20) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_location_parent` (`parent_id`),
  KEY `idx_location_city` (`city`),
  KEY `idx_location_state` (`state`),
  KEY `idx_location_active` (`is_active`),
  KEY `idx_locations_active_state_city` (`is_active`,`state`,`city`),
  KEY `idx_locations_hierarchy` (`parent_id`,`is_active`),
  CONSTRAINT `fk_location_parent` FOREIGN KEY (`parent_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES
(1,'Lagos','Lagos','Lagos','Nigeria',NULL,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(2,'Abuja','Abuja','FCT','Nigeria',NULL,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(3,'Ibadan','Ibadan','Oyo','Nigeria',NULL,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(4,'Port Harcourt','Port Harcourt','Rivers','Nigeria',NULL,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(5,'Benin City','Benin City','Edo','Nigeria',NULL,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(6,'Lekki','Lekki','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(7,'Ikoyi','Ikoyi','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(8,'Victoria Island','Victoria Island','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(9,'Yaba','Yaba','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(10,'Ikeja','Ikeja','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(11,'Surulere','Surulere','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(12,'Apapa','Apapa','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(13,'Ojuelegba','Ojuelegba','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(14,'Mushin','Mushin','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(15,' Oshodi','Oshodi','Lagos','Nigeria',1,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(16,'Lekki Phase 1','Lekki','Lagos','Nigeria',6,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(17,'Lekki Phase 2','Lekki','Lagos','Nigeria',6,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(18,'Lekki Peninsula','Lekki','Lagos','Nigeria',6,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(19,'Gwagwalada','Gwagwalada','FCT','Nigeria',2,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(20,'Kuje','Kuje','FCT','Nigeria',2,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(21,'Bwari','Bwari','FCT','Nigeria',2,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(22,'Asokoro','Asokoro','FCT','Nigeria',2,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(23,' Maitama','Maitama','FCT','Nigeria',2,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(24,' Wuse 2','Wuse 2','FCT','Nigeria',2,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(25,'Bodija','Bodija','Oyo','Nigeria',3,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(26,'Iwo Road','Iwo Road','Oyo','Nigeria',3,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(27,' Dugbe','Dugbe','Oyo','Nigeria',3,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(28,'Ring Road','Ring Road','Oyo','Nigeria',3,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(29,'GRA','GRA','Rivers','Nigeria',4,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(30,'D-Line','D-Line','Rivers','Nigeria',4,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(31,'Oil Mill','Oil Mill','Rivers','Nigeria',4,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(32,'Trans Amadi','Trans Amadi','Rivers','Nigeria',4,NULL,NULL,1,'2026-04-30 16:29:51','2026-04-30 16:29:51'),
(93,'Ikeja','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(94,'Lekki','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(95,'Victoria Island','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(96,'Ikoyi','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(97,'Yaba','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(98,'Surulere','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(99,'Gbagada','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(100,'Maryland','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(101,'Ojodu','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(102,'Magodo','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(103,'Apapa','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(104,'Festac Town','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(105,'Mushin','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(106,'Agege','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(107,'Ikorodu','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(108,'Epe','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(109,'Badagry','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(110,'Ajah','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(111,'Sangotedo','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(112,'Chevron Drive','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(113,'VGC','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(114,'Ilupeju','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(115,'Oshodi','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(116,'Isolo','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(117,'Amuwo Odofin','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(118,'Satellite Town','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(119,'Ketu','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(120,'Ojota','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(121,'Allen Avenue','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32'),
(122,'Wuse','Lagos','Lagos','Nigeria',1,NULL,NULL,1,'2026-05-02 02:43:32','2026-05-02 02:43:32');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attempted_at` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `failure_reason` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `success` bit(1) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_login_attempts_user` (`user_id`),
  KEY `idx_login_attempts_email` (`email`),
  KEY `idx_login_attempts_ip` (`ip_address`),
  KEY `idx_login_attempts_time` (`attempted_at`),
  KEY `idx_login_attempts_success` (`success`,`attempted_at`),
  KEY `idx_login_attempts_brute_force` (`email`,`ip_address`,`success`,`attempted_at`),
  CONSTRAINT `fk_login_attempts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `content` text NOT NULL,
  `message_type` varchar(50) DEFAULT 'TEXT',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `attachment_url` varchar(255) DEFAULT NULL,
  `read_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_messages_conversation` (`conversation_id`),
  KEY `idx_messages_sender` (`sender_id`),
  KEY `idx_messages_created_at` (`created_at`),
  KEY `idx_messages_conversation_read` (`conversation_id`,`is_read`),
  KEY `idx_messages_conversation_time` (`conversation_id`,`created_at`),
  KEY `idx_messages_chat_pagination` (`conversation_id`,`created_at`,`id`,`sender_id`,`content`(100)),
  CONSTRAINT `fk_message_conversation` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_message_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_logs`
--

DROP TABLE IF EXISTS `notification_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `payload` text DEFAULT NULL,
  `whatsapp_message_id` varchar(255) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_type` (`type`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_notification_logs_user` (`user_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_logs`
--

LOCK TABLES `notification_logs` WRITE;
/*!40000 ALTER TABLE `notification_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_preferences`
--

DROP TABLE IF EXISTS `notification_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_preferences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `whatsapp_enabled` tinyint(1) DEFAULT 1,
  `whatsapp_match_notifications` tinyint(1) DEFAULT 1,
  `whatsapp_message_notifications` tinyint(1) DEFAULT 1,
  `whatsapp_application_notifications` tinyint(1) DEFAULT 1,
  `whatsapp_marketing` tinyint(1) DEFAULT 0,
  `email_enabled` tinyint(1) DEFAULT 1,
  `email_match_notifications` tinyint(1) DEFAULT 1,
  `email_message_notifications` tinyint(1) DEFAULT 0,
  `email_weekly_digest` tinyint(1) DEFAULT 1,
  `push_enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `idx_notification_prefs_user` (`user_id`),
  CONSTRAINT `fk_notification_pref_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_preferences`
--

LOCK TABLES `notification_preferences` WRITE;
/*!40000 ALTER TABLE `notification_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `channel` varchar(50) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `language` varchar(10) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `template_key` varchar(100) NOT NULL,
  `template_name` varchar(200) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `variables` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`variables`)),
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_template_version` (`template_key`,`language`,`version`),
  KEY `idx_notification_templates_key` (`template_key`),
  KEY `idx_notification_templates_active` (`is_active`,`channel`),
  KEY `idx_notification_templates_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `landlord_id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `property_type` varchar(50) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `latitude` decimal(38,2) DEFAULT NULL,
  `longitude` decimal(38,2) DEFAULT NULL,
  `bedrooms` int(11) NOT NULL DEFAULT 0,
  `bathrooms` decimal(38,2) NOT NULL,
  `square_feet` int(11) DEFAULT NULL,
  `rent_amount` decimal(38,2) NOT NULL,
  `deposit_amount` decimal(38,2) NOT NULL,
  `amenities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`amenities`)),
  `has_parking` tinyint(1) DEFAULT 0,
  `has_ac` tinyint(1) DEFAULT 0,
  `has_furnished` tinyint(1) DEFAULT 0,
  `pet_friendly` tinyint(1) DEFAULT 0,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `virtual_tour_url` varchar(500) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `max_matches` int(11) DEFAULT 10,
  `current_matches` int(11) DEFAULT 0,
  `available_from` date DEFAULT NULL,
  `listing_status` varchar(50) NOT NULL DEFAULT 'ACTIVE',
  `application_deadline` date DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_properties_landlord` (`landlord_id`),
  KEY `idx_properties_city` (`city`),
  KEY `idx_properties_state` (`state`),
  KEY `idx_properties_type` (`property_type`),
  KEY `idx_properties_status` (`listing_status`),
  KEY `idx_properties_available` (`is_available`),
  KEY `idx_properties_rent` (`rent_amount`),
  KEY `idx_properties_deleted` (`is_deleted`),
  KEY `idx_properties_landlord_status` (`landlord_id`,`is_available`,`listing_status`),
  KEY `idx_properties_search` (`is_available`,`listing_status`,`is_deleted`,`rent_amount`,`created_at`),
  CONSTRAINT `fk_property_landlord` FOREIGN KEY (`landlord_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES
(1,3,'5-Bed Townhouse in VGC, Lagos','Beautiful 5-bedroom townhouse located in the heart of VGC. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','77 Ozumba Mbadiwe Avenue','VGC','Lagos','Lagos','100032',6.58,3.36,5,2.00,856,1750000.00,875000.00,'[\"BQ\",\"Garden\"]',1,1,1,1,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-17','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33'),
(2,4,'2-Bed Townhouse in Ketu, Lagos','Beautiful 2-bedroom townhouse located in the heart of Ketu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','14 Obafemi Awolowo Way','Ketu','Lagos','Lagos','100064',6.57,3.33,2,2.00,779,900000.00,450000.00,'[\"Elevator\",\"24/7 Power Supply\"]',1,1,0,1,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-08','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33'),
(3,5,'4-Bed Condo in Maryland, Lagos','Beautiful 4-bedroom condo located in the heart of Maryland. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','2 Lagos-Abeokuta Expressway','Maryland','Lagos','Lagos','100094',6.53,3.44,4,2.00,1194,2500000.00,1250000.00,'[\"Elevator\",\"24/7 Power Supply\",\"Water Treatment\",\"Garden\"]',1,0,1,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-06-09','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33'),
(4,6,'4-Bed Studio in Festac Town, Lagos','Beautiful 4-bedroom studio located in the heart of Festac Town. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','94 Obafemi Awolowo Way','Festac Town','Lagos','Lagos','100009',6.53,3.31,4,3.00,1144,2300000.00,1150000.00,'[\"Gym\",\"Water Treatment\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-21','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33'),
(5,7,'5-Bed Townhouse in Epe, Lagos','Beautiful 5-bedroom townhouse located in the heart of Epe. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','47 Tejuoso Street','Epe','Lagos','Lagos','100004',6.50,3.39,5,2.00,1997,1800000.00,900000.00,'[\"24/7 Power Supply\",\"Parking Space\",\"Garden\",\"Water Treatment\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-06-10','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33'),
(6,8,'4-Bed House in Ketu, Lagos','Beautiful 4-bedroom house located in the heart of Ketu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','73 Tejuoso Street','Ketu','Lagos','Lagos','100068',6.52,3.35,4,4.00,925,1650000.00,825000.00,'[\"Parking Space\",\"Water Treatment\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-09','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33'),
(7,9,'4-Bed Studio in Lekki, Lagos','Beautiful 4-bedroom studio located in the heart of Lekki. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','43 Ozumba Mbadiwe Avenue','Lekki','Lagos','Lagos','100041',6.51,3.40,4,2.00,684,2650000.00,1325000.00,'[\"Security\",\"24/7 Power Supply\",\"Gym\"]',0,1,0,1,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-12','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34'),
(8,10,'2-Bed Studio in VGC, Lagos','Beautiful 2-bedroom studio located in the heart of VGC. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','90 Keffi Street','VGC','Lagos','Lagos','100010',6.49,3.42,2,2.00,1399,2200000.00,1100000.00,'[\"BQ\",\"Elevator\",\"Security\"]',0,0,1,1,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-30','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34'),
(9,11,'2-Bed Townhouse in Ilupeju, Lagos','Beautiful 2-bedroom townhouse located in the heart of Ilupeju. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','92 Randle Avenue','Ilupeju','Lagos','Lagos','100054',6.60,3.44,2,4.00,1180,1300000.00,650000.00,'[\"Garden\",\"Water Treatment\",\"Swimming Pool\",\"BQ\"]',1,0,1,0,'[\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\"]',NULL,1,10,0,'2026-06-09','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34'),
(10,12,'4-Bed House in Satellite Town, Lagos','Beautiful 4-bedroom house located in the heart of Satellite Town. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','6 Tejuoso Street','Satellite Town','Lagos','Lagos','100017',6.58,3.40,4,4.00,518,1750000.00,875000.00,'[\"Security\",\"Water Treatment\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-06-13','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34'),
(11,13,'2-Bed House in Isolo, Lagos','Beautiful 2-bedroom house located in the heart of Isolo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','96 Admiralty Way','Isolo','Lagos','Lagos','100059',6.55,3.34,2,3.00,859,2000000.00,1000000.00,'[\"Security\",\"24/7 Power Supply\",\"Gym\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-05-26','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34'),
(12,14,'1-Bed Condo in Badagry, Lagos','Beautiful 1-bedroom condo located in the heart of Badagry. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','44 Ahmadu Bello Way','Badagry','Lagos','Lagos','100042',6.55,3.33,1,4.00,1467,2950000.00,1475000.00,'[\"Swimming Pool\",\"24/7 Power Supply\",\"BQ\"]',0,1,1,1,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-06-05','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34'),
(13,15,'1-Bed Apartment in Chevron Drive, Lagos','Beautiful 1-bedroom apartment located in the heart of Chevron Drive. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','61 Bourdillon Road','Chevron Drive','Lagos','Lagos','100069',6.53,3.35,1,1.00,2313,1400000.00,700000.00,'[\"Parking Space\",\"CCTV\",\"Water Treatment\",\"Gym\",\"Security\"]',1,0,0,1,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-16','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34'),
(14,16,'5-Bed Townhouse in Yaba, Lagos','Beautiful 5-bedroom townhouse located in the heart of Yaba. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','30 Ikorodu Road','Yaba','Lagos','Lagos','100081',6.50,3.37,5,4.00,2386,1150000.00,575000.00,'[\"24/7 Power Supply\",\"CCTV\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-23','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34'),
(15,17,'4-Bed Condo in Ketu, Lagos','Beautiful 4-bedroom condo located in the heart of Ketu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','42 Agege Motor Road','Ketu','Lagos','Lagos','100056',6.50,3.38,4,3.00,1260,2300000.00,1150000.00,'[\"Swimming Pool\",\"CCTV\",\"Elevator\",\"Security\",\"BQ\",\"Parking Space\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-05-30','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35'),
(16,18,'3-Bed Apartment in Isolo, Lagos','Beautiful 3-bedroom apartment located in the heart of Isolo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','53 Bode Thomas Street','Isolo','Lagos','Lagos','100066',6.57,3.44,3,3.00,1929,1200000.00,600000.00,'[\"Elevator\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-06-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35'),
(17,19,'3-Bed Condo in Mushin, Lagos','Beautiful 3-bedroom condo located in the heart of Mushin. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','18 Sanusi Fafunwa Street','Mushin','Lagos','Lagos','100046',6.54,3.42,3,3.00,1492,2750000.00,1375000.00,'[\"Security\",\"Parking Space\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-06-02','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35'),
(18,20,'2-Bed Townhouse in Allen Avenue, Lagos','Beautiful 2-bedroom townhouse located in the heart of Allen Avenue. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','14 Obafemi Awolowo Way','Allen Avenue','Lagos','Lagos','100050',6.56,3.38,2,3.00,649,2600000.00,1300000.00,'[\"Security\",\"CCTV\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\"]',NULL,1,10,0,'2026-06-10','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35'),
(19,21,'4-Bed Studio in Ajah, Lagos','Beautiful 4-bedroom studio located in the heart of Ajah. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','39 Bourdillon Road','Ajah','Lagos','Lagos','100091',6.52,3.33,4,4.00,2385,1450000.00,725000.00,'[\"BQ\",\"Elevator\",\"Garden\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35'),
(20,22,'1-Bed Townhouse in Mushin, Lagos','Beautiful 1-bedroom townhouse located in the heart of Mushin. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','98 Admiralty Way','Mushin','Lagos','Lagos','100043',6.58,3.31,1,1.00,574,2850000.00,1425000.00,'[\"Swimming Pool\",\"Security\",\"BQ\",\"Gym\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-05-27','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35'),
(21,23,'1-Bed Studio in Gbagada, Lagos','Beautiful 1-bedroom studio located in the heart of Gbagada. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','17 Adeola Odeku Street','Gbagada','Lagos','Lagos','100001',6.49,3.40,1,2.00,2390,1750000.00,875000.00,'[\"CCTV\",\"BQ\",\"Gym\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-19','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35'),
(22,24,'4-Bed House in Yaba, Lagos','Beautiful 4-bedroom house located in the heart of Yaba. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','34 Ahmadu Bello Way','Yaba','Lagos','Lagos','100074',6.45,3.32,4,3.00,1334,1800000.00,900000.00,'[\"Water Treatment\",\"24/7 Power Supply\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-02','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36'),
(23,25,'1-Bed Studio in Satellite Town, Lagos','Beautiful 1-bedroom studio located in the heart of Satellite Town. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','31 Bourdillon Road','Satellite Town','Lagos','Lagos','100026',6.55,3.37,1,4.00,1965,2050000.00,1025000.00,'[\"CCTV\",\"BQ\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-18','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36'),
(24,26,'1-Bed Studio in Lekki, Lagos','Beautiful 1-bedroom studio located in the heart of Lekki. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','88 Keffi Street','Lekki','Lagos','Lagos','100091',6.54,3.40,1,3.00,1367,1700000.00,850000.00,'[\"BQ\",\"Gym\",\"24/7 Power Supply\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36'),
(25,27,'3-Bed Condo in Isolo, Lagos','Beautiful 3-bedroom condo located in the heart of Isolo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','71 Bourdillon Road','Isolo','Lagos','Lagos','100050',6.55,3.42,3,2.00,951,1200000.00,600000.00,'[\"Gym\",\"Garden\",\"Swimming Pool\"]',1,0,1,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-05-24','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36'),
(26,28,'1-Bed Apartment in Agege, Lagos','Beautiful 1-bedroom apartment located in the heart of Agege. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','79 Bode Thomas Street','Agege','Lagos','Lagos','100098',6.48,3.36,1,1.00,1082,1600000.00,800000.00,'[\"Parking Space\",\"Water Treatment\",\"Garden\",\"Elevator\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-06-04','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36'),
(27,29,'4-Bed Townhouse in Ilupeju, Lagos','Beautiful 4-bedroom townhouse located in the heart of Ilupeju. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','100 Obafemi Awolowo Way','Ilupeju','Lagos','Lagos','100022',6.59,3.33,4,4.00,478,2950000.00,1475000.00,'[\"Parking Space\",\"CCTV\",\"Water Treatment\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-18','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36'),
(28,30,'4-Bed Apartment in Ketu, Lagos','Beautiful 4-bedroom apartment located in the heart of Ketu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','10 Tejuoso Street','Ketu','Lagos','Lagos','100021',6.59,3.33,4,3.00,435,1850000.00,925000.00,'[\"Garden\",\"BQ\",\"Parking Space\",\"24/7 Power Supply\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-12','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37'),
(29,31,'3-Bed Studio in Ajah, Lagos','Beautiful 3-bedroom studio located in the heart of Ajah. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','69 Admiralty Way','Ajah','Lagos','Lagos','100061',6.48,3.39,3,4.00,1789,750000.00,375000.00,'[\"24/7 Power Supply\",\"Water Treatment\",\"Security\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-22','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37'),
(30,32,'2-Bed Townhouse in Lekki, Lagos','Beautiful 2-bedroom townhouse located in the heart of Lekki. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','82 Sanusi Fafunwa Street','Lekki','Lagos','Lagos','100020',6.55,3.35,2,4.00,1956,1100000.00,550000.00,'[\"Swimming Pool\",\"Elevator\",\"BQ\",\"Water Treatment\",\"Gym\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\"]',NULL,1,10,0,'2026-05-03','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37'),
(31,33,'1-Bed House in Ojota, Lagos','Beautiful 1-bedroom house located in the heart of Ojota. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','81 Ahmadu Bello Way','Ojota','Lagos','Lagos','100044',6.45,3.33,1,3.00,704,2050000.00,1025000.00,'[\"Gym\",\"Parking Space\"]',0,1,1,1,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-22','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37'),
(32,34,'4-Bed Townhouse in Mushin, Lagos','Beautiful 4-bedroom townhouse located in the heart of Mushin. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','17 Obafemi Awolowo Way','Mushin','Lagos','Lagos','100003',6.54,3.35,4,2.00,761,1700000.00,850000.00,'[\"24/7 Power Supply\",\"Garden\",\"Parking Space\",\"BQ\"]',0,0,0,0,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-18','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37'),
(33,35,'4-Bed Townhouse in Wuse, Lagos','Beautiful 4-bedroom townhouse located in the heart of Wuse. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','30 Jide Kosoko Street','Wuse','Lagos','Lagos','100060',6.46,3.39,4,1.00,867,1200000.00,600000.00,'[\"Garden\",\"24/7 Power Supply\",\"Swimming Pool\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-08','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37'),
(34,36,'5-Bed Studio in Ikeja, Lagos','Beautiful 5-bedroom studio located in the heart of Ikeja. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','72 Fola Osibo Road','Ikeja','Lagos','Lagos','100029',6.54,3.35,5,3.00,1006,1450000.00,725000.00,'[\"Elevator\",\"Parking Space\",\"Water Treatment\",\"Swimming Pool\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-05-06','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37'),
(35,37,'4-Bed House in Isolo, Lagos','Beautiful 4-bedroom house located in the heart of Isolo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','54 Adetokunbo Ademola Street','Isolo','Lagos','Lagos','100055',6.46,3.43,4,1.00,471,1800000.00,900000.00,'[\"Parking Space\",\"Gym\"]',0,0,1,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-06-08','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38'),
(36,38,'5-Bed Studio in Allen Avenue, Lagos','Beautiful 5-bedroom studio located in the heart of Allen Avenue. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','29 Adetokunbo Ademola Street','Allen Avenue','Lagos','Lagos','100080',6.52,3.40,5,3.00,1139,2550000.00,1275000.00,'[\"Security\"]',1,1,1,1,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-18','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38'),
(37,39,'2-Bed Apartment in Ojodu, Lagos','Beautiful 2-bedroom apartment located in the heart of Ojodu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','81 Fola Osibo Road','Ojodu','Lagos','Lagos','100029',6.57,3.38,2,2.00,1329,1700000.00,850000.00,'[\"Water Treatment\",\"Security\",\"Elevator\",\"Swimming Pool\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-06-08','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38'),
(38,40,'5-Bed Townhouse in Gbagada, Lagos','Beautiful 5-bedroom townhouse located in the heart of Gbagada. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','83 Ahmadu Bello Way','Gbagada','Lagos','Lagos','100064',6.52,3.35,5,2.00,1048,2100000.00,1050000.00,'[\"Water Treatment\",\"Elevator\",\"Gym\",\"Swimming Pool\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38'),
(39,41,'1-Bed House in Ojota, Lagos','Beautiful 1-bedroom house located in the heart of Ojota. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','30 Herbert Macaulay Way','Ojota','Lagos','Lagos','100083',6.51,3.33,1,2.00,1743,2150000.00,1075000.00,'[\"Gym\",\"Elevator\",\"CCTV\"]',0,0,1,1,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-04','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38'),
(40,42,'1-Bed Townhouse in Satellite Town, Lagos','Beautiful 1-bedroom townhouse located in the heart of Satellite Town. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','73 Adeola Odeku Street','Satellite Town','Lagos','Lagos','100040',6.47,3.33,1,2.00,1320,2700000.00,1350000.00,'[\"BQ\",\"Garden\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-26','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38'),
(41,43,'3-Bed Studio in Magodo, Lagos','Beautiful 3-bedroom studio located in the heart of Magodo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','48 Admiralty Way','Magodo','Lagos','Lagos','100075',6.47,3.34,3,1.00,1235,1450000.00,725000.00,'[\"Parking Space\",\"BQ\",\"Gym\"]',0,0,1,1,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-29','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38'),
(42,44,'5-Bed House in VGC, Lagos','Beautiful 5-bedroom house located in the heart of VGC. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','49 Keffi Street','VGC','Lagos','Lagos','100020',6.55,3.36,5,3.00,1627,1250000.00,625000.00,'[\"24/7 Power Supply\",\"BQ\",\"Parking Space\",\"Swimming Pool\"]',1,0,1,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(43,45,'2-Bed Townhouse in Victoria Island, Lagos','Beautiful 2-bedroom townhouse located in the heart of Victoria Island. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','19 Jide Kosoko Street','Victoria Island','Lagos','Lagos','100092',6.51,3.37,2,3.00,1996,2600000.00,1300000.00,'[\"24/7 Power Supply\",\"Elevator\",\"Water Treatment\"]',0,0,0,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-21','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(44,46,'2-Bed Townhouse in Mushin, Lagos','Beautiful 2-bedroom townhouse located in the heart of Mushin. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','87 Agege Motor Road','Mushin','Lagos','Lagos','100097',6.53,3.41,2,2.00,1668,950000.00,475000.00,'[\"Parking Space\",\"Garden\",\"BQ\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(45,47,'3-Bed Apartment in Wuse, Lagos','Beautiful 3-bedroom apartment located in the heart of Wuse. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','45 Sanusi Fafunwa Street','Wuse','Lagos','Lagos','100063',6.59,3.31,3,2.00,2022,1450000.00,725000.00,'[\"Swimming Pool\",\"Gym\",\"24/7 Power Supply\",\"Parking Space\"]',1,0,1,1,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-13','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(46,48,'3-Bed Studio in Oshodi, Lagos','Beautiful 3-bedroom studio located in the heart of Oshodi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','69 Adetokunbo Ademola Street','Oshodi','Lagos','Lagos','100075',6.51,3.35,3,4.00,1552,2450000.00,1225000.00,'[\"CCTV\",\"Swimming Pool\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\"]',NULL,1,10,0,'2026-05-26','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(47,49,'3-Bed Townhouse in Yaba, Lagos','Beautiful 3-bedroom townhouse located in the heart of Yaba. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','43 Adetokunbo Ademola Street','Yaba','Lagos','Lagos','100058',6.55,3.38,3,4.00,1182,1400000.00,700000.00,'[\"CCTV\",\"Swimming Pool\",\"Security\",\"Garden\",\"Parking Space\",\"Elevator\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-30','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(48,50,'5-Bed Apartment in Sangotedo, Lagos','Beautiful 5-bedroom apartment located in the heart of Sangotedo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','17 Jide Kosoko Street','Sangotedo','Lagos','Lagos','100032',6.57,3.41,5,3.00,1426,1300000.00,650000.00,'[\"BQ\",\"Gym\",\"Swimming Pool\",\"Water Treatment\",\"Garden\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-18','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(49,51,'5-Bed Apartment in VGC, Lagos','Beautiful 5-bedroom apartment located in the heart of VGC. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','30 Ozumba Mbadiwe Avenue','VGC','Lagos','Lagos','100068',6.49,3.38,5,1.00,1944,1850000.00,925000.00,'[\"Elevator\",\"Gym\",\"Swimming Pool\",\"Water Treatment\",\"CCTV\",\"Garden\"]',1,0,1,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-06-06','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(50,52,'4-Bed Condo in Chevron Drive, Lagos','Beautiful 4-bedroom condo located in the heart of Chevron Drive. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','56 Bourdillon Road','Chevron Drive','Lagos','Lagos','100098',6.58,3.38,4,3.00,638,550000.00,275000.00,'[\"Security\",\"24/7 Power Supply\",\"Water Treatment\",\"Garden\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-06-02','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39'),
(51,53,'2-Bed Townhouse in Gbagada, Lagos','Beautiful 2-bedroom townhouse located in the heart of Gbagada. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','16 Admiralty Way','Gbagada','Lagos','Lagos','100022',6.58,3.31,2,3.00,443,2400000.00,1200000.00,'[\"CCTV\",\"Security\",\"Gym\",\"Parking Space\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-05-25','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40'),
(52,54,'5-Bed Condo in Ojodu, Lagos','Beautiful 5-bedroom condo located in the heart of Ojodu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','51 Ahmadu Bello Way','Ojodu','Lagos','Lagos','100010',6.54,3.36,5,3.00,2380,1450000.00,725000.00,'[\"Water Treatment\",\"Gym\",\"Parking Space\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-04','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40'),
(53,55,'2-Bed Condo in Allen Avenue, Lagos','Beautiful 2-bedroom condo located in the heart of Allen Avenue. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','26 Herbert Macaulay Way','Allen Avenue','Lagos','Lagos','100086',6.57,3.31,2,2.00,1752,1600000.00,800000.00,'[\"Security\",\"Swimming Pool\",\"Garden\"]',0,0,1,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-11','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40'),
(54,56,'4-Bed House in Ajah, Lagos','Beautiful 4-bedroom house located in the heart of Ajah. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','98 Fola Osibo Road','Ajah','Lagos','Lagos','100032',6.48,3.31,4,3.00,1983,2600000.00,1300000.00,'[\"Elevator\",\"Swimming Pool\",\"24/7 Power Supply\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-24','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40'),
(55,57,'3-Bed Apartment in Ajah, Lagos','Beautiful 3-bedroom apartment located in the heart of Ajah. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','11 Admiralty Way','Ajah','Lagos','Lagos','100057',6.53,3.43,3,3.00,540,1550000.00,775000.00,'[\"24/7 Power Supply\",\"CCTV\"]',0,0,1,0,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-23','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40'),
(56,58,'5-Bed Apartment in Ojodu, Lagos','Beautiful 5-bedroom apartment located in the heart of Ojodu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','92 Keffi Street','Ojodu','Lagos','Lagos','100089',6.46,3.37,5,1.00,2028,2850000.00,1425000.00,'[\"24/7 Power Supply\",\"Swimming Pool\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-05-13','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40'),
(57,59,'4-Bed Apartment in Amuwo Odofin, Lagos','Beautiful 4-bedroom apartment located in the heart of Amuwo Odofin. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','100 Obafemi Awolowo Way','Amuwo Odofin','Lagos','Lagos','100054',6.46,3.32,4,3.00,475,1200000.00,600000.00,'[\"24/7 Power Supply\",\"Gym\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-06-06','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40'),
(58,60,'4-Bed House in Satellite Town, Lagos','Beautiful 4-bedroom house located in the heart of Satellite Town. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','84 Bode Thomas Street','Satellite Town','Lagos','Lagos','100091',6.52,3.45,4,2.00,521,1300000.00,650000.00,'[\"24/7 Power Supply\",\"Garden\",\"Parking Space\",\"Security\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-06-14','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40'),
(59,61,'2-Bed Condo in Badagry, Lagos','Beautiful 2-bedroom condo located in the heart of Badagry. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','70 Randle Avenue','Badagry','Lagos','Lagos','100085',6.48,3.32,2,4.00,2090,2750000.00,1375000.00,'[\"Garden\",\"Water Treatment\",\"Parking Space\",\"BQ\",\"CCTV\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-20','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(60,62,'5-Bed Studio in Ajah, Lagos','Beautiful 5-bedroom studio located in the heart of Ajah. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','48 Ozumba Mbadiwe Avenue','Ajah','Lagos','Lagos','100055',6.59,3.45,5,1.00,485,1700000.00,850000.00,'[\"24/7 Power Supply\",\"Elevator\",\"Swimming Pool\"]',1,1,1,1,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-19','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(61,63,'2-Bed House in Gbagada, Lagos','Beautiful 2-bedroom house located in the heart of Gbagada. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','41 Fola Osibo Road','Gbagada','Lagos','Lagos','100025',6.57,3.36,2,1.00,1610,2400000.00,1200000.00,'[\"Garden\",\"CCTV\",\"24/7 Power Supply\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\"]',NULL,1,10,0,'2026-05-19','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(62,64,'5-Bed House in Apapa, Lagos','Beautiful 5-bedroom house located in the heart of Apapa. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','58 Bode Thomas Street','Apapa','Lagos','Lagos','100022',6.57,3.45,5,1.00,2198,800000.00,400000.00,'[\"24/7 Power Supply\",\"Swimming Pool\",\"BQ\",\"Garden\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(63,65,'3-Bed Townhouse in Ojota, Lagos','Beautiful 3-bedroom townhouse located in the heart of Ojota. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','4 Adetokunbo Ademola Street','Ojota','Lagos','Lagos','100004',6.54,3.40,3,1.00,1532,2150000.00,1075000.00,'[\"Garden\",\"24/7 Power Supply\",\"CCTV\",\"Security\"]',0,0,1,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-12','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(64,66,'3-Bed House in Mushin, Lagos','Beautiful 3-bedroom house located in the heart of Mushin. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','72 Jide Kosoko Street','Mushin','Lagos','Lagos','100068',6.53,3.44,3,4.00,783,1250000.00,625000.00,'[\"Garden\",\"BQ\",\"24/7 Power Supply\",\"CCTV\",\"Parking Space\",\"Swimming Pool\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-13','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(65,67,'5-Bed Townhouse in Ikoyi, Lagos','Beautiful 5-bedroom townhouse located in the heart of Ikoyi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','10 Adeola Odeku Street','Ikoyi','Lagos','Lagos','100046',6.60,3.39,5,4.00,1125,1350000.00,675000.00,'[\"Garden\",\"Water Treatment\",\"Elevator\",\"24/7 Power Supply\"]',1,0,1,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-24','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(66,68,'1-Bed Studio in Oshodi, Lagos','Beautiful 1-bedroom studio located in the heart of Oshodi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','32 Obafemi Awolowo Way','Oshodi','Lagos','Lagos','100015',6.50,3.43,1,3.00,1045,2400000.00,1200000.00,'[\"Elevator\",\"Security\",\"BQ\",\"Gym\"]',0,0,0,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-18','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(67,69,'5-Bed Studio in VGC, Lagos','Beautiful 5-bedroom studio located in the heart of VGC. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','52 Fola Osibo Road','VGC','Lagos','Lagos','100060',6.56,3.38,5,2.00,786,950000.00,475000.00,'[\"Elevator\",\"Security\",\"Swimming Pool\",\"Gym\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-06-04','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41'),
(68,70,'3-Bed Condo in Ojodu, Lagos','Beautiful 3-bedroom condo located in the heart of Ojodu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','41 Lagos-Abeokuta Expressway','Ojodu','Lagos','Lagos','100015',6.47,3.38,3,3.00,1187,2250000.00,1125000.00,'[\"Elevator\",\"Swimming Pool\",\"Security\",\"Parking Space\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-16','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(69,71,'4-Bed House in Ajah, Lagos','Beautiful 4-bedroom house located in the heart of Ajah. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','31 Jide Kosoko Street','Ajah','Lagos','Lagos','100089',6.45,3.31,4,4.00,752,2050000.00,1025000.00,'[\"Security\",\"BQ\",\"CCTV\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-06-06','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(70,72,'5-Bed Studio in Sangotedo, Lagos','Beautiful 5-bedroom studio located in the heart of Sangotedo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','32 Herbert Macaulay Way','Sangotedo','Lagos','Lagos','100027',6.55,3.44,5,4.00,1247,850000.00,425000.00,'[\"Parking Space\",\"Garden\",\"Water Treatment\",\"CCTV\"]',0,0,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-06-08','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(71,73,'2-Bed Condo in Epe, Lagos','Beautiful 2-bedroom condo located in the heart of Epe. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','20 Adetokunbo Ademola Street','Epe','Lagos','Lagos','100098',6.59,3.37,2,3.00,564,550000.00,275000.00,'[\"Security\",\"CCTV\",\"Elevator\",\"Swimming Pool\",\"BQ\"]',1,0,1,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-14','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(72,74,'4-Bed Apartment in VGC, Lagos','Beautiful 4-bedroom apartment located in the heart of VGC. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','6 Adeola Odeku Street','VGC','Lagos','Lagos','100051',6.52,3.34,4,4.00,798,1650000.00,825000.00,'[\"24/7 Power Supply\",\"Gym\"]',0,0,0,1,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-14','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(73,75,'4-Bed Condo in Yaba, Lagos','Beautiful 4-bedroom condo located in the heart of Yaba. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','52 Herbert Macaulay Way','Yaba','Lagos','Lagos','100076',6.59,3.35,4,4.00,1355,1400000.00,700000.00,'[\"Parking Space\",\"Gym\",\"Security\"]',0,1,0,1,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-31','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(74,76,'3-Bed Apartment in Ikorodu, Lagos','Beautiful 3-bedroom apartment located in the heart of Ikorodu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','87 Agege Motor Road','Ikorodu','Lagos','Lagos','100007',6.49,3.32,3,4.00,1204,1200000.00,600000.00,'[\"Water Treatment\",\"Swimming Pool\",\"Garden\",\"CCTV\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-19','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(75,77,'4-Bed Studio in Ikoyi, Lagos','Beautiful 4-bedroom studio located in the heart of Ikoyi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','29 Randle Avenue','Ikoyi','Lagos','Lagos','100077',6.48,3.35,4,2.00,1620,1800000.00,900000.00,'[\"Parking Space\",\"CCTV\",\"Swimming Pool\",\"BQ\",\"Gym\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-06-12','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(76,78,'4-Bed Condo in Oshodi, Lagos','Beautiful 4-bedroom condo located in the heart of Oshodi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','26 Keffi Street','Oshodi','Lagos','Lagos','100051',6.47,3.43,4,1.00,2040,2500000.00,1250000.00,'[\"Water Treatment\",\"BQ\",\"Swimming Pool\",\"Security\",\"Gym\"]',0,0,1,1,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-06-04','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42'),
(77,79,'1-Bed Townhouse in Magodo, Lagos','Beautiful 1-bedroom townhouse located in the heart of Magodo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','48 Keffi Street','Magodo','Lagos','Lagos','100029',6.45,3.32,1,3.00,881,800000.00,400000.00,'[\"24/7 Power Supply\",\"Elevator\",\"Water Treatment\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-06-01','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43'),
(78,80,'1-Bed House in Badagry, Lagos','Beautiful 1-bedroom house located in the heart of Badagry. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','22 Ahmadu Bello Way','Badagry','Lagos','Lagos','100062',6.46,3.43,1,2.00,1869,2250000.00,1125000.00,'[\"Gym\",\"Garden\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-06-13','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43'),
(79,81,'5-Bed Apartment in Magodo, Lagos','Beautiful 5-bedroom apartment located in the heart of Magodo. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','98 Jide Kosoko Street','Magodo','Lagos','Lagos','100081',6.54,3.45,5,4.00,2099,950000.00,475000.00,'[\"BQ\",\"Garden\",\"Elevator\",\"Water Treatment\"]',0,0,1,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-08','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43'),
(80,82,'1-Bed Apartment in Apapa, Lagos','Beautiful 1-bedroom apartment located in the heart of Apapa. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','71 Awolowo Road','Apapa','Lagos','Lagos','100042',6.52,3.32,1,1.00,588,2150000.00,1075000.00,'[\"Swimming Pool\",\"BQ\",\"Garden\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-02','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43'),
(81,83,'5-Bed Studio in Gbagada, Lagos','Beautiful 5-bedroom studio located in the heart of Gbagada. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','57 Adetokunbo Ademola Street','Gbagada','Lagos','Lagos','100085',6.54,3.31,5,1.00,1091,1600000.00,800000.00,'[\"Swimming Pool\",\"CCTV\",\"24/7 Power Supply\",\"Parking Space\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-09','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43'),
(82,84,'2-Bed Townhouse in Ajah, Lagos','Beautiful 2-bedroom townhouse located in the heart of Ajah. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','83 Fola Osibo Road','Ajah','Lagos','Lagos','100084',6.48,3.40,2,4.00,905,2050000.00,1025000.00,'[\"BQ\",\"Gym\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-06-06','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43'),
(83,85,'4-Bed Apartment in Chevron Drive, Lagos','Beautiful 4-bedroom apartment located in the heart of Chevron Drive. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','47 Bourdillon Road','Chevron Drive','Lagos','Lagos','100047',6.47,3.34,4,3.00,1335,1850000.00,925000.00,'[\"Parking Space\",\"Swimming Pool\",\"Gym\",\"Water Treatment\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-30','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43'),
(84,86,'4-Bed Townhouse in Oshodi, Lagos','Beautiful 4-bedroom townhouse located in the heart of Oshodi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','78 Kofo Abayomi Street','Oshodi','Lagos','Lagos','100063',6.48,3.43,4,2.00,1730,1200000.00,600000.00,'[\"Elevator\",\"Garden\"]',0,0,1,0,'[\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\"]',NULL,1,10,0,'2026-05-02','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(85,87,'2-Bed Condo in Festac Town, Lagos','Beautiful 2-bedroom condo located in the heart of Festac Town. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','41 Ikorodu Road','Festac Town','Lagos','Lagos','100018',6.47,3.45,2,3.00,409,1500000.00,750000.00,'[\"CCTV\",\"Swimming Pool\",\"Water Treatment\",\"Garden\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-05-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(86,88,'5-Bed Studio in VGC, Lagos','Beautiful 5-bedroom studio located in the heart of VGC. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','58 Bode Thomas Street','VGC','Lagos','Lagos','100054',6.51,3.39,5,2.00,1058,1950000.00,975000.00,'[\"24/7 Power Supply\",\"Garden\",\"Security\",\"CCTV\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-06-05','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(87,89,'4-Bed Apartment in Amuwo Odofin, Lagos','Beautiful 4-bedroom apartment located in the heart of Amuwo Odofin. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','16 Randle Avenue','Amuwo Odofin','Lagos','Lagos','100093',6.49,3.44,4,1.00,1396,800000.00,400000.00,'[\"CCTV\",\"Garden\",\"Gym\",\"24/7 Power Supply\",\"Swimming Pool\"]',0,1,0,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-21','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(88,90,'3-Bed Apartment in Ojodu, Lagos','Beautiful 3-bedroom apartment located in the heart of Ojodu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','19 Jide Kosoko Street','Ojodu','Lagos','Lagos','100091',6.46,3.37,3,4.00,1541,1450000.00,725000.00,'[\"Parking Space\",\"BQ\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\"]',NULL,1,10,0,'2026-05-05','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(89,91,'1-Bed Studio in Ikoyi, Lagos','Beautiful 1-bedroom studio located in the heart of Ikoyi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','11 Ozumba Mbadiwe Avenue','Ikoyi','Lagos','Lagos','100065',6.59,3.34,1,3.00,963,1550000.00,775000.00,'[\"Swimming Pool\",\"Security\",\"Parking Space\"]',0,0,1,0,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-15','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(90,92,'5-Bed House in Victoria Island, Lagos','Beautiful 5-bedroom house located in the heart of Victoria Island. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','65 Ozumba Mbadiwe Avenue','Victoria Island','Lagos','Lagos','100058',6.53,3.34,5,1.00,1466,1750000.00,875000.00,'[\"Parking Space\",\"Water Treatment\",\"24/7 Power Supply\"]',1,0,0,1,'[\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\"]',NULL,1,10,0,'2026-05-02','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(91,93,'3-Bed Apartment in Allen Avenue, Lagos','Beautiful 3-bedroom apartment located in the heart of Allen Avenue. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','94 Adeola Odeku Street','Allen Avenue','Lagos','Lagos','100045',6.51,3.42,3,4.00,1832,1050000.00,525000.00,'[\"Water Treatment\",\"BQ\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\"]',NULL,1,10,0,'2026-06-03','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(92,94,'5-Bed House in Ojodu, Lagos','Beautiful 5-bedroom house located in the heart of Ojodu. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','1 Bourdillon Road','Ojodu','Lagos','Lagos','100059',6.54,3.40,5,1.00,523,2900000.00,1450000.00,'[\"BQ\",\"Elevator\",\"Water Treatment\",\"Parking Space\",\"24/7 Power Supply\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-02','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44'),
(93,95,'3-Bed Townhouse in Festac Town, Lagos','Beautiful 3-bedroom townhouse located in the heart of Festac Town. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','TOWNHOUSE','3 Sanusi Fafunwa Street','Festac Town','Lagos','Lagos','100062',6.58,3.41,3,3.00,2056,700000.00,350000.00,'[\"Swimming Pool\",\"24/7 Power Supply\",\"BQ\",\"Security\",\"Parking Space\"]',1,0,0,0,'[\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\"]',NULL,1,10,0,'2026-05-03','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45'),
(94,96,'4-Bed House in Lekki, Lagos','Beautiful 4-bedroom house located in the heart of Lekki. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','HOUSE','71 Adeola Odeku Street','Lekki','Lagos','Lagos','100097',6.54,3.37,4,4.00,865,1400000.00,700000.00,'[\"CCTV\",\"BQ\",\"Swimming Pool\"]',0,0,1,0,'[\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\",\"https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800\",\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\"]',NULL,1,10,0,'2026-05-07','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45'),
(95,97,'1-Bed Condo in Maryland, Lagos','Beautiful 1-bedroom condo located in the heart of Maryland. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','85 Bourdillon Road','Maryland','Lagos','Lagos','100035',6.51,3.43,1,2.00,413,2200000.00,1100000.00,'[\"Security\",\"Garden\"]',1,0,1,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-13','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45'),
(96,98,'5-Bed Condo in Ilupeju, Lagos','Beautiful 5-bedroom condo located in the heart of Ilupeju. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','35 Awolowo Road','Ilupeju','Lagos','Lagos','100092',6.58,3.35,5,3.00,1204,1100000.00,550000.00,'[\"BQ\",\"Security\",\"24/7 Power Supply\",\"Garden\",\"Parking Space\"]',1,1,0,0,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-06','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45'),
(97,99,'4-Bed Apartment in Satellite Town, Lagos','Beautiful 4-bedroom apartment located in the heart of Satellite Town. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','45 Tejuoso Street','Satellite Town','Lagos','Lagos','100035',6.53,3.31,4,1.00,587,650000.00,325000.00,'[\"Elevator\",\"Garden\"]',0,1,1,0,'[\"https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800\",\"https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800\",\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\"]',NULL,1,10,0,'2026-05-04','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45'),
(98,100,'5-Bed Studio in Ojota, Lagos','Beautiful 5-bedroom studio located in the heart of Ojota. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','STUDIO','3 Herbert Macaulay Way','Ojota','Lagos','Lagos','100051',6.56,3.43,5,3.00,1092,2500000.00,1250000.00,'[\"Gym\",\"Parking Space\",\"CCTV\",\"Water Treatment\",\"Swimming Pool\",\"BQ\"]',1,0,1,1,'[\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\"]',NULL,1,10,0,'2026-05-28','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45'),
(99,101,'3-Bed Condo in Oshodi, Lagos','Beautiful 3-bedroom condo located in the heart of Oshodi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','CONDO','79 Ozumba Mbadiwe Avenue','Oshodi','Lagos','Lagos','100079',6.45,3.31,3,3.00,1721,1400000.00,700000.00,'[\"24/7 Power Supply\",\"CCTV\",\"Garden\",\"Swimming Pool\"]',0,1,0,1,'[\"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800\",\"https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800\",\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\"]',NULL,1,10,0,'2026-05-31','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45'),
(100,102,'1-Bed Apartment in Ikoyi, Lagos','Beautiful 1-bedroom apartment located in the heart of Ikoyi. Features modern amenities, 24/7 power supply, and excellent security. Close to major roads, schools, and shopping centres. Available immediately for qualified tenants.','APARTMENT','46 Adetokunbo Ademola Street','Ikoyi','Lagos','Lagos','100097',6.55,3.31,1,2.00,2161,500000.00,250000.00,'[\"Security\",\"Gym\",\"Garden\",\"24/7 Power Supply\",\"CCTV\",\"Parking Space\"]',1,1,1,0,'[\"https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800\",\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800\",\"https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800\"]',NULL,1,10,0,'2026-05-17','ACTIVE','2026-06-15',0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_agents`
--

DROP TABLE IF EXISTS `property_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_agents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assigned_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `unassigned_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `agent_id` bigint(20) NOT NULL,
  `assigned_by` bigint(20) DEFAULT NULL,
  `property_id` bigint(20) NOT NULL,
  `unassigned_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmlsdvyurm7bd2ysfo0u10m3bb` (`agent_id`),
  KEY `FKskmc7yiccspllmrttl8frbklo` (`assigned_by`),
  KEY `FKr4xkxldo0ry2wmnajqkxo58wh` (`property_id`),
  KEY `FKl328l34qwqve9qh6vakgslmqs` (`unassigned_by`),
  CONSTRAINT `FKl328l34qwqve9qh6vakgslmqs` FOREIGN KEY (`unassigned_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FKmlsdvyurm7bd2ysfo0u10m3bb` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  CONSTRAINT `FKr4xkxldo0ry2wmnajqkxo58wh` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `FKskmc7yiccspllmrttl8frbklo` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_agents`
--

LOCK TABLES `property_agents` WRITE;
/*!40000 ALTER TABLE `property_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_amenities`
--

DROP TABLE IF EXISTS `property_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_amenities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amenity_key` varchar(100) NOT NULL,
  `amenity_value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_highlighted` bit(1) DEFAULT NULL,
  `property_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_property_amenity` (`property_id`,`amenity_key`),
  KEY `idx_property_amenities_property` (`property_id`),
  KEY `idx_property_amenities_key` (`amenity_key`),
  CONSTRAINT `fk_amenity_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_amenities`
--

LOCK TABLES `property_amenities` WRITE;
/*!40000 ALTER TABLE `property_amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_applications`
--

DROP TABLE IF EXISTS `property_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_applications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'APPLIED',
  `matched_at` timestamp NULL DEFAULT NULL,
  `match_id` bigint(20) DEFAULT NULL,
  `cover_letter` text DEFAULT NULL,
  `tenant_profile_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tenant_profile_snapshot`)),
  `move_in_date` datetime DEFAULT NULL,
  `lease_duration_months` int(11) DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `withdrawn_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_application_property_tenant` (`property_id`,`tenant_id`),
  UNIQUE KEY `uk_property_applications_unique` (`property_id`,`tenant_id`),
  KEY `idx_pa_property` (`property_id`),
  KEY `idx_pa_status` (`status`),
  KEY `idx_pa_property_status` (`property_id`,`status`),
  KEY `idx_pa_tenant` (`tenant_id`),
  KEY `idx_pa_applied_at` (`applied_at`),
  KEY `idx_property_applications_tenant_id` (`tenant_id`),
  KEY `idx_property_applications_property_status` (`property_id`,`status`),
  KEY `idx_property_applications_deleted` (`is_deleted`),
  KEY `idx_property_applications_tenant` (`tenant_id`,`status`,`applied_at`),
  KEY `idx_property_applications_property` (`property_id`,`status`,`applied_at`),
  KEY `idx_applications_landlord_status` (`property_id`,`status`,`is_deleted`),
  KEY `idx_property_applications_status_created` (`status`,`applied_at`),
  KEY `idx_applications_match` (`match_id`),
  KEY `idx_applications_status_landlord` (`property_id`,`status`,`is_deleted`,`applied_at`),
  CONSTRAINT `fk_application_match` FOREIGN KEY (`match_id`) REFERENCES `swipe_matches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_application_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_application_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_applications`
--

LOCK TABLES `property_applications` WRITE;
/*!40000 ALTER TABLE `property_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_images`
--

DROP TABLE IF EXISTS `property_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_primary` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_property_images_property` (`property_id`),
  KEY `idx_property_images_primary` (`property_id`,`is_primary`),
  KEY `idx_property_images_order` (`property_id`,`display_order`),
  CONSTRAINT `fk_property_image_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_images`
--

LOCK TABLES `property_images` WRITE;
/*!40000 ALTER TABLE `property_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_locations`
--

DROP TABLE IF EXISTS `property_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_property_location` (`property_id`,`location_id`),
  UNIQUE KEY `UK6ywb9gypyj1g9y255hjkw1ogn` (`property_id`,`location_id`),
  KEY `idx_property_location_property` (`property_id`),
  KEY `idx_property_location_location` (`location_id`),
  KEY `idx_property_locations_property` (`property_id`),
  CONSTRAINT `fk_property_location_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_property_location_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_locations`
--

LOCK TABLES `property_locations` WRITE;
/*!40000 ALTER TABLE `property_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_reviews`
--

DROP TABLE IF EXISTS `property_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_reviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `is_anonymous` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `is_verified` bit(1) DEFAULT NULL,
  `landlord_responded_at` datetime(6) DEFAULT NULL,
  `landlord_response` text DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review_text` text DEFAULT NULL,
  `review_title` varchar(200) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `match_id` bigint(20) DEFAULT NULL,
  `property_id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_property_tenant_review` (`property_id`,`tenant_id`),
  KEY `idx_property_reviews_property` (`property_id`,`rating`),
  KEY `idx_property_reviews_tenant` (`tenant_id`),
  KEY `idx_property_reviews_rating` (`rating`),
  KEY `idx_property_reviews_created` (`created_at`),
  KEY `idx_property_reviews_listing` (`property_id`,`is_deleted`,`rating`,`created_at`),
  KEY `fk_review_match` (`match_id`),
  CONSTRAINT `fk_review_match` FOREIGN KEY (`match_id`) REFERENCES `swipe_matches` (`id`),
  CONSTRAINT `fk_review_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `fk_review_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_reviews`
--

LOCK TABLES `property_reviews` WRITE;
/*!40000 ALTER TABLE `property_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_notes` text DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `details` text DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `resolved_at` datetime(6) DEFAULT NULL,
  `status` enum('DISMISSED','PENDING','RESOLVED','REVIEWING') NOT NULL,
  `reported_property_id` bigint(20) DEFAULT NULL,
  `reported_user_id` bigint(20) DEFAULT NULL,
  `reporter_id` bigint(20) NOT NULL,
  `resolved_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcnke46xcxn96t7vgctvep0g8b` (`reported_property_id`),
  KEY `FKb3bqi44mjskbnwupr31nfq5ui` (`reported_user_id`),
  KEY `FKd3qiw2om5d2oh5xb7fbdcq225` (`reporter_id`),
  KEY `FKru383gq6s2hvqp6jf4q3itays` (`resolved_by`),
  CONSTRAINT `FKb3bqi44mjskbnwupr31nfq5ui` FOREIGN KEY (`reported_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKcnke46xcxn96t7vgctvep0g8b` FOREIGN KEY (`reported_property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `FKd3qiw2om5d2oh5xb7fbdcq225` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKru383gq6s2hvqp6jf4q3itays` FOREIGN KEY (`resolved_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_searches`
--

DROP TABLE IF EXISTS `saved_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_searches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `last_notified_at` datetime(6) DEFAULT NULL,
  `notify_new_matches` bit(1) DEFAULT NULL,
  `result_count` int(11) DEFAULT NULL,
  `search_criteria` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`search_criteria`)),
  `search_name` varchar(200) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `tenant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_saved_searches_tenant` (`tenant_id`),
  KEY `idx_saved_searches_active` (`is_active`,`notify_new_matches`),
  CONSTRAINT `fk_saved_search_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_searches`
--

LOCK TABLES `saved_searches` WRITE;
/*!40000 ALTER TABLE `saved_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_profiles`
--

DROP TABLE IF EXISTS `social_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `profile_url` varchar(255) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `linked_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_social_profile_user_platform` (`user_id`,`platform`),
  KEY `idx_social_profiles_user` (`user_id`),
  KEY `idx_social_profiles_platform` (`platform`),
  CONSTRAINT `fk_social_profile_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_profiles`
--

LOCK TABLES `social_profiles` WRITE;
/*!40000 ALTER TABLE `social_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `auto_renew` bit(1) DEFAULT NULL,
  `cancellation_reason` varchar(500) DEFAULT NULL,
  `cancelled_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `payment_reference` varchar(255) DEFAULT NULL,
  `plan_type` enum('BASIC','FREE','PREMIUM') NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `status` enum('ACTIVE','CANCELLED','EXPIRED','PENDING') NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhro52ohfqfbay9774bev0qinr` (`user_id`),
  CONSTRAINT `FKhro52ohfqfbay9774bev0qinr` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swipe_actions`
--

DROP TABLE IF EXISTS `swipe_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `swipe_actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  `landlord_id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `swipe_direction` varchar(50) NOT NULL,
  `swipe_reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_swipe_actions_unique` (`property_id`,`landlord_id`,`tenant_id`,`swipe_direction`),
  UNIQUE KEY `uk_swipe_landlord_tenant_property_direction` (`landlord_id`,`tenant_id`,`property_id`,`swipe_direction`),
  KEY `idx_swipe_actions_landlord` (`landlord_id`),
  KEY `idx_swipe_actions_tenant` (`tenant_id`),
  KEY `idx_swipe_actions_property` (`property_id`),
  KEY `idx_swipe_actions_landlord_property` (`landlord_id`,`property_id`),
  KEY `idx_swipe_actions_direction` (`swipe_direction`),
  KEY `idx_swipe_actions_created_at` (`created_at`),
  KEY `idx_swipe_actions_property_landlord` (`property_id`,`landlord_id`),
  KEY `idx_swipe_actions_deleted` (`is_deleted`),
  KEY `idx_swipe_actions_active` (`property_id`,`landlord_id`,`tenant_id`,`is_deleted`),
  CONSTRAINT `fk_swipe_landlord` FOREIGN KEY (`landlord_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_swipe_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_swipe_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swipe_actions`
--

LOCK TABLES `swipe_actions` WRITE;
/*!40000 ALTER TABLE `swipe_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `swipe_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swipe_matches`
--

DROP TABLE IF EXISTS `swipe_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `swipe_matches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  `landlord_id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `match_status` varchar(50) NOT NULL DEFAULT 'ACTIVE',
  `expires_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `matched_at` datetime(6) NOT NULL,
  `unmatched_at` datetime(6) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_swipe_matches_property` (`property_id`),
  KEY `idx_swipe_matches_landlord` (`landlord_id`),
  KEY `idx_swipe_matches_tenant` (`tenant_id`),
  KEY `idx_swipe_matches_status` (`match_status`),
  KEY `idx_swipe_matches_landlord_tenant` (`landlord_id`,`tenant_id`),
  KEY `idx_swipe_matches_property_landlord_tenant` (`property_id`,`landlord_id`,`tenant_id`),
  KEY `idx_swipe_matches_expires` (`expires_at`,`match_status`),
  KEY `idx_swipe_matches_lookup` (`property_id`,`landlord_id`,`tenant_id`,`match_status`),
  CONSTRAINT `fk_match_landlord` FOREIGN KEY (`landlord_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_match_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_match_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swipe_matches`
--

LOCK TABLES `swipe_matches` WRITE;
/*!40000 ALTER TABLE `swipe_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `swipe_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swipe_tracking`
--

DROP TABLE IF EXISTS `swipe_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `swipe_tracking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `free_swipes_used` int(11) DEFAULT NULL,
  `last_reset_at` datetime(6) DEFAULT NULL,
  `last_swipe_at` datetime(6) DEFAULT NULL,
  `negative_swipes` int(11) DEFAULT NULL,
  `positive_swipes` int(11) DEFAULT NULL,
  `total_swipes` int(11) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKm6use9aejr5har3d9hks0ojhy` (`user_id`),
  CONSTRAINT `FKphtgp4ixarbd29h3g6qj6wsaf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swipe_tracking`
--

LOCK TABLES `swipe_tracking` WRITE;
/*!40000 ALTER TABLE `swipe_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `swipe_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_preferred_locations`
--

DROP TABLE IF EXISTS `tenant_preferred_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_preferred_locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_location` (`tenant_id`,`location_id`),
  UNIQUE KEY `UKolipbahi4bsomwv6eg8ynan4o` (`tenant_id`,`location_id`),
  KEY `idx_tenant_location_tenant` (`tenant_id`),
  KEY `idx_tenant_location_location` (`location_id`),
  KEY `idx_tenant_preferred_locations_tenant` (`tenant_id`),
  CONSTRAINT `FKp1nslkrap4642rchh5aye5ena` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_profiles` (`id`),
  CONSTRAINT `fk_tenant_location_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tenant_location_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_preferred_locations`
--

LOCK TABLES `tenant_preferred_locations` WRITE;
/*!40000 ALTER TABLE `tenant_preferred_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_preferred_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_profiles`
--

DROP TABLE IF EXISTS `tenant_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(50) NOT NULL,
  `marital_status` varchar(50) NOT NULL DEFAULT 'SINGLE',
  `employment_type` varchar(50) NOT NULL,
  `employer_name` varchar(200) DEFAULT NULL,
  `job_title` varchar(200) DEFAULT NULL,
  `income_range` varchar(50) NOT NULL,
  `income_verified` tinyint(1) DEFAULT 0,
  `education_level` varchar(50) NOT NULL,
  `rental_history_years` int(11) DEFAULT 0,
  `previous_landlord_contact` varchar(500) DEFAULT NULL,
  `has_eviction_history` tinyint(1) DEFAULT 0,
  `is_verified` tinyint(1) DEFAULT 0,
  `verification_date` timestamp NULL DEFAULT NULL,
  `kyc_document_url` varchar(255) DEFAULT NULL,
  `kyc_status` varchar(50) DEFAULT 'PENDING',
  `profile_completeness_score` int(11) DEFAULT 0,
  `bio` text DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `max_budget` int(11) DEFAULT NULL,
  `min_budget` int(11) DEFAULT NULL,
  `move_in_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `idx_tenant_profiles_user` (`user_id`),
  KEY `idx_tenant_profiles_gender` (`gender`),
  KEY `idx_tenant_profiles_marital_status` (`marital_status`),
  KEY `idx_tenant_profiles_employment_type` (`employment_type`),
  KEY `idx_tenant_profiles_income_range` (`income_range`),
  KEY `idx_tenant_profiles_education_level` (`education_level`),
  KEY `idx_tenant_profiles_verified` (`is_verified`),
  KEY `idx_tenant_profiles_kyc` (`kyc_status`),
  KEY `idx_tenant_profiles_deleted` (`is_deleted`),
  KEY `idx_tenant_profiles_filter_primary` (`marital_status`,`employment_type`,`education_level`,`income_range`,`is_verified`),
  KEY `idx_tenant_profiles_age` (`date_of_birth`),
  KEY `idx_tenant_profiles_income` (`income_range`),
  CONSTRAINT `fk_tenant_profile_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_profiles`
--

LOCK TABLES `tenant_profiles` WRITE;
/*!40000 ALTER TABLE `tenant_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_verification_documents`
--

DROP TABLE IF EXISTS `tenant_verification_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_verification_documents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `document_url` varchar(500) NOT NULL,
  `verification_status` varchar(50) DEFAULT 'PENDING',
  `verified_by` bigint(20) DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_verification_tenant` (`tenant_id`),
  KEY `idx_verification_status` (`verification_status`),
  CONSTRAINT `fk_verification_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_verification_documents`
--

LOCK TABLES `tenant_verification_documents` WRITE;
/*!40000 ALTER TABLE `tenant_verification_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_verification_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `device_info` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_sessions_user` (`user_id`),
  KEY `idx_user_sessions_token` (`session_token`),
  KEY `idx_user_sessions_active` (`is_active`,`expires_at`),
  CONSTRAINT `fk_session_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'TENANT',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `token_version` int(11) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `whatsapp_opt_in` tinyint(1) DEFAULT 0,
  `whatsapp_consent_at` timestamp NULL DEFAULT NULL,
  `whatsapp_consent_version` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `auth_provider` varchar(255) DEFAULT NULL,
  `failed_login_attempts` int(11) DEFAULT NULL,
  `last_active_at` datetime(6) DEFAULT NULL,
  `last_failed_login_at` datetime(6) DEFAULT NULL,
  `locked_until` datetime(6) DEFAULT NULL,
  `oauth_access_token` varchar(255) DEFAULT NULL,
  `oauth_refresh_token` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `whatsapp_opt_out` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_users_email` (`email`),
  KEY `idx_users_role` (`role`),
  KEY `idx_users_active` (`is_active`),
  KEY `idx_users_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(3,'landlord1@househunt.ng','$2a$10$ncBV7IMVQSBigE1CDFj/iuUisS3S474xpPjpLN5aCiu4InLHjogym','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(4,'landlord2@househunt.ng','$2a$10$cbp.a.t78xSQptI15Hbubes.niwIKoySoXlEaNOJ/OtQQuq0gYmS6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(5,'landlord3@househunt.ng','$2a$10$K0xJE/W9FJ.lp/j0TzNQMuSElKFTVR7UiWm6ek.NelzOj869scUx.','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(6,'landlord4@househunt.ng','$2a$10$GYlFeslSFeEo6htMMcsWE.cDaJhcWhTM/.D6PeF/shFCL3QWKPREe','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(7,'landlord5@househunt.ng','$2a$10$prHPiOZLz1tqqPLjAqSNaOEIGkC/XKijX.AhAEYD6.SEksz8TV2oa','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(8,'landlord6@househunt.ng','$2a$10$7NWwPTXtukzOPngEzuVnheW0svj0wmJifUSAPCbNE.NlMWsee8khC','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:33','2026-05-02 02:43:33','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(9,'landlord7@househunt.ng','$2a$10$OTsoynkmXIYObQS/.mI99uZ1a4jqysvIUraiXjWfV.GigVo0fnXpS','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(10,'landlord8@househunt.ng','$2a$10$LbFiVE6j9cLJFBouDp7LMOwoIJfL0sC4tLsyckH7LkDV4Gt7I9WrC','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(11,'landlord9@househunt.ng','$2a$10$UOaBJkzBmqmW6CDeu9ZnX.ASMpsbSojDBJCTVYLo8FtBQ2CMlswY2','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(12,'landlord10@househunt.ng','$2a$10$1tETyRv66/NL9iaDAT1qvuNsrlx3w3A8./BiBatm77zkKK4otSkU2','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(13,'landlord11@househunt.ng','$2a$10$gn3CIaIlcHGwIEOW.dofeup32mm4zdcVj7P7rWTGz.jlt7.A4B8i2','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(14,'landlord12@househunt.ng','$2a$10$uMG/FVrvT1Ko2snABqnaL.x0y8zvYaJasZ6jQpDvpAaYSyxOvz6Ve','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(15,'landlord13@househunt.ng','$2a$10$XNhxAxv8Fm4wBgAHsdLQP.TizplrA0vrWhpIcAnefzvN/0SOm1heO','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(16,'landlord14@househunt.ng','$2a$10$2h1b7NvRzuQ43VL.MA.maewBpEvI6ikaeA9kz10M5omSWWv/H.pfy','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:34','2026-05-02 02:43:34','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(17,'landlord15@househunt.ng','$2a$10$PHwtUoVRKqraHGaj9FvYcOV4wD3DXbfTW5zii3G78LQJvEFSeKF3O','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(18,'landlord16@househunt.ng','$2a$10$RmUYXgkXd5F/6T22wvJXj.5L.j3j8qFe1asBKg8lYoj/JmUgHB1z.','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(19,'landlord17@househunt.ng','$2a$10$WdbELPqsREU4itVEwtejd.NPWgRz6fhPuh6zQivI4K1vCkyjcho8O','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(20,'landlord18@househunt.ng','$2a$10$dqt26u5Titb6rX3FlgztdOA3mmdysch0JEcfHG6bD0ER5JvQBD1G6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(21,'landlord19@househunt.ng','$2a$10$5y2dcEOxA.u.czrqrf9sYe1yIux.cVi5ugXTE/OFt/KXaxRUEZIJW','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(22,'landlord20@househunt.ng','$2a$10$hhaW2ZrbGjHni5uTl9F8k.rwCmRnHOFTUtmDKNH7iLugyBGJZbMbS','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(23,'landlord21@househunt.ng','$2a$10$0Hw6tmw71tkXnYey9Gj6f.1P7dM6bXFsGoiEFcAxPgGuYgjxlCx2K','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:35','2026-05-02 02:43:35','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(24,'landlord22@househunt.ng','$2a$10$JaE.k2NK5YglEmP1YTh/deqmxeF60hv8AgiigXN22f2qy5gWUBpFW','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(25,'landlord23@househunt.ng','$2a$10$e0JXpUakkyMN3ko86xb2BOw5YiBI2pYuDxpfHoymhbtmys0Xwmt6y','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(26,'landlord24@househunt.ng','$2a$10$9mcZ/gAYv65zATQisUXgEuk.BxWA0ouX8DBH26HptL635Qv8Cq2vy','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(27,'landlord25@househunt.ng','$2a$10$gUeu2zt8lq7Vf8QtUkxW4uDEhaRIcRbOOj3okW.lLyn9ARZcWT1LC','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(28,'landlord26@househunt.ng','$2a$10$BYRLM0ijF6moBLuBnZniJOpK67ia3KaNbk2Xwy2BtnTGoyzfPDuv6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(29,'landlord27@househunt.ng','$2a$10$vBKM.F02EpalhP2I6rXKYe5JG0yvn2PdPgBxYuBd/Y2i5POJpFLAG','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:36','2026-05-02 02:43:36','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(30,'landlord28@househunt.ng','$2a$10$EeRa0NLOxMu9U9p.8Q3QWe70y3GrrODy/CMhtxAADFX7Z/r0H3wDK','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(31,'landlord29@househunt.ng','$2a$10$6nqSAVHLeKigbQKULRYSi.TkzTS/AXxR/RuayiCXz0aYh3gXUhbY.','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(32,'landlord30@househunt.ng','$2a$10$h0GoRxbpoTZ.T39yw61KJ.nVktEGWYpdP0rvvMmoYJwicf3cVb9Ea','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(33,'landlord31@househunt.ng','$2a$10$0j5cpFUq1jqeqOnUTgmP6.QHs62AikDeCYmMxExPkp9dOGtv7L9iK','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(34,'landlord32@househunt.ng','$2a$10$NkuVq1HVigGSUV6j3vN3r.1U6kHGabxk5tuPTtV5..Ix4yrRB0rQO','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(35,'landlord33@househunt.ng','$2a$10$t.lPz0Lq5A3ZnGsY9wsN9uYuBhEf0/yWGvy78/nNq0Ht4cKISpFUS','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(36,'landlord34@househunt.ng','$2a$10$7tTzqptkHWnFlUZXQDjmvOKECZHYAJG8p3tbx/L9G03vWsnEfu1rW','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:37','2026-05-02 02:43:37','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(37,'landlord35@househunt.ng','$2a$10$I0HyoKsNLY94BFaTJ8.csOI5WNVZUoYIfrZRUfLH5.G7zRDBg8d8i','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(38,'landlord36@househunt.ng','$2a$10$qCWeewZfKcSj8rU7MsvPcu9dhMnXjn9e3cqo2TFuTBa0UkIpyqgOy','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(39,'landlord37@househunt.ng','$2a$10$dG1DODJh7w4LA2L.rGo6m.GnyxQ1kQuE2gbisOn38/3gLBXaTJaU6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(40,'landlord38@househunt.ng','$2a$10$EXyH97FwOASV0gWEIzPaY.8wReBvvS4P06UtG.pvBRCAZ7GO9CNgy','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(41,'landlord39@househunt.ng','$2a$10$UipCc.q3yXFXqhRSnDZquOdNe.FEPbRVkigg.IWTu5Us6WZlHYKjO','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(42,'landlord40@househunt.ng','$2a$10$flbCh7ppUtT45fAhcSwQQud8KdpJcnmtyWdfdF8GDVRgbe/95smPS','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(43,'landlord41@househunt.ng','$2a$10$Stos5i8jDeLkOBXRCBuzDenGavLuDomQMuqn4tyhDM/RE1Ryt7rme','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:38','2026-05-02 02:43:38','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(44,'landlord42@househunt.ng','$2a$10$tQ7s9TiBctuWci6vQ8sNZOxwNmeXJ/S/xOl6hToAntmar5rh4wJL6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(45,'landlord43@househunt.ng','$2a$10$NfuU2JmKinHo4oFJtwJ8cuNHjoTL0ZpMllJhAoHRlvHiVXXAIMjZm','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(46,'landlord44@househunt.ng','$2a$10$CGKSiKRncxzbwmSyGLEZg.NKWnjbt6Ss9AuQqXrjGDW3OYiCcHwWy','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(47,'landlord45@househunt.ng','$2a$10$Lt9Pz/hnmsjJdFCLlQ6a2eHqvFjm2kK5LKcOEyI5Iwg74R0akLu5u','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(48,'landlord46@househunt.ng','$2a$10$1MRttf6lMHuYPKMGBZEo3OxJgxEt..ltw2pscZSIjAXUDgu7SnsBq','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(49,'landlord47@househunt.ng','$2a$10$Ed7du1njpud3h6gZnCIhmOtpkej2XV5RnKznAAgqUUxGvFlNLoY0y','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(50,'landlord48@househunt.ng','$2a$10$g252zmLwmY8o3t7qIHJQoufejvSleiWlidMV1FXZRMaKRBcKAPpgq','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(51,'landlord49@househunt.ng','$2a$10$IhgNXRFYn9FkSCc3s5/1zego43ih0MxIqwzK0ujrxpa/eiCqr3FY2','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(52,'landlord50@househunt.ng','$2a$10$mMMHDKz.titBwI9k7hyHF.XzegfISILY7L4xap/aJnkw5QoU5qCai','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:39','2026-05-02 02:43:39','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(53,'landlord51@househunt.ng','$2a$10$xN3jOSvgnLrIZOFjtIKDF.sNypdz4YKYB2LYpq1O5tfzljG3YR9Xq','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(54,'landlord52@househunt.ng','$2a$10$KAu0tKg6CJhCROZMGKHAgeo87aMcD.a5ghjXua8oVKNnGH/8uCBFe','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(55,'landlord53@househunt.ng','$2a$10$bOjKFs1apiyU0cIcXTkfhOlzE9ptmOUSFDqJHQt1ILHumI2.RrAu6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(56,'landlord54@househunt.ng','$2a$10$VHZyOcLJua3EnRH/DsphXeE8L6MX1LkOI3kz.PRdHRwviRnhLbuXu','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(57,'landlord55@househunt.ng','$2a$10$6wiBXlaoTLisFiVCQ0SQl.gCgWYGs.bu64/D3YYZ3JAr.6bCcDhgC','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(58,'landlord56@househunt.ng','$2a$10$q5.UFvshunQ0/WP/CJbA1OIZnwt5MqlM5SkNkgJntgeN/Nug5.rCG','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(59,'landlord57@househunt.ng','$2a$10$ZiiXhXDDvad25XTJYnen6OqJm2Uyesdj5Du89peQ4bhj0N4S/K6M2','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(60,'landlord58@househunt.ng','$2a$10$X/IdW4N5mfW9dBgEA0SdI.UPdfA8D0UJ0f4DJLEvHXCUTctu2/xWi','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:40','2026-05-02 02:43:40','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(61,'landlord59@househunt.ng','$2a$10$1IcgmwX9KEcipSVedRYiF.vLX8QJVc16ERWHjO53QBkqckTM3oT6G','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(62,'landlord60@househunt.ng','$2a$10$anCl6M61MsTk0aSMqzcCH.jj2P5jKJKHB4di86vmAmLaXqgG9N6ty','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(63,'landlord61@househunt.ng','$2a$10$Vq8c0dzxPFnoHSyX3NmP8.hq.xJXkvSorlNwpI/XMHaMw2UTRH23a','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(64,'landlord62@househunt.ng','$2a$10$Qz5cGLwV54KOszM4kUMOEO0EYB1WoLKQ83f8udBuh.XQmTdamlwlW','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(65,'landlord63@househunt.ng','$2a$10$OZs3c8XGLOTnF0ErDahjl.FGPiLMQI9Gdz9VYhF4qc1bKPb2wy4Sq','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(66,'landlord64@househunt.ng','$2a$10$IldK4aC5N/fDKLYgYp8uZO4KzsY9w49vKhLlCRBqlzWnrY6RP/V.O','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(67,'landlord65@househunt.ng','$2a$10$8tEFJbybqyJc8bvm47srsOxlMDiC0tHbm/5ZPJiqW0ptfxNoCtROm','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(68,'landlord66@househunt.ng','$2a$10$wpYP.t/yAZRWX980bocwieVEnO0USIUN1Jw.MzEL3dCcYUq0NUrBO','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(69,'landlord67@househunt.ng','$2a$10$bCg/ooVUw.VUivZ0WpiBr.ayQbDMHGh8YG4N0ZC50nILwRBHuwCSO','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:41','2026-05-02 02:43:41','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(70,'landlord68@househunt.ng','$2a$10$kODsov.NdAvH3LYb9R18Xu4KQ9MRL3TuK1FfLs0ZvyQfLyZsJwsfC','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(71,'landlord69@househunt.ng','$2a$10$uh.yWFFzPOQCcdIlTBPrce.T8Yr5uVRZQm5WrVFIBmZ1UixZleAUi','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(72,'landlord70@househunt.ng','$2a$10$byUcFW9Z5vSdKs.s8eBo3.ZkNmR7r3j8JJVKiJLQP1T0tKnWbHWzG','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(73,'landlord71@househunt.ng','$2a$10$woi9vRVylpadmdsbz8tl.OeL1mdiWt7iwAYimFnpN2RHhmHqQTqcC','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(74,'landlord72@househunt.ng','$2a$10$oFYdDnS.nFTaEjUlGSPHeOjShs5WJ5jpN91kmu6Ke6JMxEl0rj0Za','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(75,'landlord73@househunt.ng','$2a$10$w9XIR9yWAIMgo0yn5P4xqO/EBzkFRvohDNF8CeUIDiuvUpXAQAoMO','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(76,'landlord74@househunt.ng','$2a$10$y9gaSu.nKMm.W2PZrdSr6.e8nzy3hwrtHRy.ttrt74IQPDeLaVuE6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(77,'landlord75@househunt.ng','$2a$10$UJhDva3Fzx93bwnQPtorzOAl8Dn5kFL48bIRuIHBqV2/k.5MymAGa','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(78,'landlord76@househunt.ng','$2a$10$uI04VXQX9B.8NNTgFDaZl.TgRlukMWYwx/u5uLY.2BAA2Ugq8ySj6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:42','2026-05-02 02:43:42','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(79,'landlord77@househunt.ng','$2a$10$wL4PapVVMXLDKgAjTV98ceSLCRPzKD4BYvOpzWceQ05vh8IB2g89O','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(80,'landlord78@househunt.ng','$2a$10$IFoEY/meLQkM22C0ILBfBuEER0Jw.P7qL2nQGtzhJyCAEJGzQrkPG','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(81,'landlord79@househunt.ng','$2a$10$ucn84ZkXAXtiMIfjuwgPN.5vr3WBxcMCrp0uRVYkI8kzBQJn7BWTu','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(82,'landlord80@househunt.ng','$2a$10$YoWYneVym.PIwzxlbTqGSedPjHyHLLuKpS527T7J7x2GPg5vMZwrm','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(83,'landlord81@househunt.ng','$2a$10$2Qey7RPG1yzIWkBlWYF9quamF2AwDqDGD4glFxszjjUpIWnjCUdIa','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(84,'landlord82@househunt.ng','$2a$10$UQq1t6Wn978gpVxAWJwho.b4kEdS0m24atm491bchjWCQIP4xsGqa','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(85,'landlord83@househunt.ng','$2a$10$HedEBj.mH3cMN7WQUBjP3.iOkPvPotVlpHV2QE3qGNz0fvxtpijOe','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:43','2026-05-02 02:43:43','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(86,'landlord84@househunt.ng','$2a$10$ZXgtOM.zXINvB2wnfZXfW.R7pG36O5kEynX6zD50OShv2HgtAw1/y','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(87,'landlord85@househunt.ng','$2a$10$eP8mqiitGxKVfqNjZmaAtO9rWvNpwHMFayx9cUVCsgL2JVscbajI.','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(88,'landlord86@househunt.ng','$2a$10$nSaxKoppIGc47iw2nY9Ex.9DOGBA3IeNHWn4bY5rf3m6AZPZXqKa.','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(89,'landlord87@househunt.ng','$2a$10$Q6wyivKiHF1bssnLKRqHzOA.4Py7xCS.6B7gQ62BPgAyg7yMAEqwa','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(90,'landlord88@househunt.ng','$2a$10$icscAUh3O654jBIG32oMCuMdFUbbg6MejqqNeUU.R5MuSHxth1ULG','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(91,'landlord89@househunt.ng','$2a$10$CSD0e2ECtJH41tQUjlIbfuD1yG/YSwDcXqn5bObwBWEKmsipHWgrC','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(92,'landlord90@househunt.ng','$2a$10$91vVxZlUZ.wtpMB/AaGtBO1FeCvP8yaY7Y.95zOobqlmlQC63eLR2','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(93,'landlord91@househunt.ng','$2a$10$Ho0YWHUCaKtzrqlCc2fUZuW5Z1OWyb35viajPnLyRn0.hqwuPow3G','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(94,'landlord92@househunt.ng','$2a$10$L9tvn.Var4ZK3nU9XfWbyOJ3QiXCZp/E3OIYUJENVPAht8Fch.LaO','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:44','2026-05-02 02:43:44','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(95,'landlord93@househunt.ng','$2a$10$7hUuZu.W.9wmgvWtVQrAI.gp4565yEb9o/1RWJgZpV78pSIIvNQq6','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(96,'landlord94@househunt.ng','$2a$10$tO1R7XjGwMLlaNfmjkmjDOOpILaWVFNqoxSnDDffXxe1q3/y.ZUU2','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(97,'landlord95@househunt.ng','$2a$10$o6dABwV2jLnsslguK/cqZeZ9pHnlxhBl2xt1SR9ZkPGiOCLIYwzma','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(98,'landlord96@househunt.ng','$2a$10$PvGiV5UI0Cn/wiMBEb8A2uB9F3gi4o9plyMin1ss3nA/L6VrMyQte','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(99,'landlord97@househunt.ng','$2a$10$hm7q2OFo967.kZ.jM8oqe.PUoWA9AUi9QECabDrRZukFBz1v5MRtS','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(100,'landlord98@househunt.ng','$2a$10$1TymODTZmAwX4gykFBKcZOluN0XJKv.LSNqK7LIkVoC3N4aTHumfK','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(101,'landlord99@househunt.ng','$2a$10$Zv3sZaK4KX833wF6XamQYuOTw1HuMzWl.UC6xJrL8.tur4vgtxAXS','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),
(102,'landlord100@househunt.ng','$2a$10$Vrby7zupbYtaz2G5cONZwu/50M/nVnBzN0DCr2jJU0850i/xtsgGu','LANDLORD',1,0,0,NULL,NULL,NULL,0,NULL,NULL,'2026-05-02 02:43:45','2026-05-02 02:43:45','LOCAL',0,NULL,NULL,NULL,NULL,NULL,NULL,'\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-18 10:01:16
