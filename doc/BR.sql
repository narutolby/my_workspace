-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (i686)
--
-- Host: 211.151.57.197    Database: BR
-- ------------------------------------------------------
-- Server version	5.1.61

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
-- Table structure for table `ACADEMY`
--

DROP TABLE IF EXISTS `ACADEMY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACADEMY` (
  `id` varchar(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACADEMY`
--

LOCK TABLES `ACADEMY` WRITE;
/*!40000 ALTER TABLE `ACADEMY` DISABLE KEYS */;
INSERT INTO `ACADEMY` VALUES ('ff8081813cfaad48013cfaad51520000','自动化学院'),('ff8081813cfaad48013cfaadc982014a','计算机学院'),('ff8081813cfaad48013cfaae2b550279','工硕'),('ff8081813cfaad48013cfaae2c13027c','电子工程学院'),('ff8081813cfaad48013cfaae6ead0352','经济管理学院'),('ff8081813cfac4de013cfac4e5af0000','全校选');
/*!40000 ALTER TABLE `ACADEMY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BULLETIN`
--

DROP TABLE IF EXISTS `BULLETIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BULLETIN` (
  `id` varchar(32) NOT NULL,
  `community_id` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `pub_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FKDE7F29A7DF3410C9` (`community_id`),
  CONSTRAINT `FKDE7F29A7DF3410C9` FOREIGN KEY (`community_id`) REFERENCES `COMMUNITY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BULLETIN`
--

LOCK TABLES `BULLETIN` WRITE;
/*!40000 ALTER TABLE `BULLETIN` DISABLE KEYS */;
INSERT INTO `BULLETIN` VALUES ('ff8080813d010908013d1fe93c56000a','ff8081813cfac5a2013cfac62cc50001',' 请选课同学加入课程社区，并配置个人邮箱，方便即时下载课程资源。','2013-02-28 08:26:51'),('ff8080813d20dd0b013d243927710007','ff8081813cfac5a2013cfac62cc50001',' 第一次上机实验为3月14日。晚上18:30-20:30.地点在 主楼9层901机房。','2013-03-01 04:32:38'),('ff8080813d20dd0b013d243a12100008','ff8081813cfac5a2013cfac62cc50001','第一次上机实验的实验要求为《第二次上机实验 实验报告》。 请注意。','2013-03-01 04:33:38'),('ff8080813d5d91e7013d8c882d3c0002','ff8081813cfac5a2013cfac62cc50001',' 第二次上机时间3月28日晚上6:30，地点主楼901','2013-03-21 10:39:27');
/*!40000 ALTER TABLE `BULLETIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMUNITY`
--

DROP TABLE IF EXISTS `COMMUNITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMUNITY` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `admin_id` varchar(32) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `course_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4DDD3FC9A1487EC7` (`admin_id`),
  KEY `FK4DDD3FC9809BDA8B` (`course_id`),
  CONSTRAINT `FK4DDD3FC9809BDA8B` FOREIGN KEY (`course_id`) REFERENCES `COURSE` (`id`),
  CONSTRAINT `FK4DDD3FC9A1487EC7` FOREIGN KEY (`admin_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMUNITY`
--

LOCK TABLES `COMMUNITY` WRITE;
/*!40000 ALTER TABLE `COMMUNITY` DISABLE KEYS */;
INSERT INTO `COMMUNITY` VALUES ('ff8080813d258ddd013d39af86810000','数学分析(下)_鄂海红','ff8081813cfa9f16013cfa9f1e130001',0,'ff8081813cfaad48013cfaadc99501b4'),('ff8080813d5d91e7013dae73d1740006','现代服务科学原理与技术_鄂海红','ff8081813cfa9f16013cfa9f1e130001',0,'ff8081813cfaad48013cfaae2b56027b'),('ff8081813cfab1b6013cfab3ade70000','网络规划_皮人杰','ff8081813cfa9f16013cfa9f1e390002',1,'ff8081813cfaad48013cfaadc9a001e5'),('ff8081813cfab1b6013cfab4dc8e0001','面向对象程序设计方法_许可','ff8081813cfa9f16013cfa9f1eff0005',1,'ff8081813cfaad48013cfaae2c2102e0'),('ff8081813cfab1b6013cfab7c5f00002','数据结构_杨俊','ff8081813cfab679013cfab67fbe0000',1,'ff8081813cfaad48013cfaae2c2302f0'),('ff8081813cfab1b6013cfab870af0003','数据结构课程设计_杨俊','ff8081813cfab679013cfab67fbe0000',1,'ff8081813cfaad48013cfaadc9a101e8'),('ff8081813cfab1b6013cfab9e6000004','C高级语言程序设计_杨亚','ff8081813cfa9f16013cfa9f1fc80007',1,'ff8081813cfaad48013cfaae6ead0354'),('ff8081813cfab1b6013cfabaed4c0005','C++高级语言程序设计_于艳华','ff8081813cfa9f16013cfa9f1f6f0006',1,'ff8081813cfaad48013cfaad5192008d'),('ff8081813cfab1b6013cfabb4ea40006','现代服务科学原理与技术_宋美娜','ff8081813cfa9f16013cfa9f1e5a0003',1,'ff8081813cfaad48013cfaae2b56027b'),('ff8081813cfac5a2013cfac62cc50001','Java语言与程序设计_鄂海红','ff8081813cfa9f16013cfa9f1e130001',1,'ff8081813cfac4de013cfac4e5c80009');
/*!40000 ALTER TABLE `COMMUNITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMUNITY_USER`
--

DROP TABLE IF EXISTS `COMMUNITY_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMUNITY_USER` (
  `community_id` varchar(32) NOT NULL DEFAULT '',
  `user_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `FKB1F2D281D246F4CB` (`user_id`),
  KEY `FKB1F2D281DF3410C9` (`community_id`),
  CONSTRAINT `FKB1F2D281DF3410C9` FOREIGN KEY (`community_id`) REFERENCES `COMMUNITY` (`id`),
  CONSTRAINT `FKB1F2D281D246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMUNITY_USER`
--

LOCK TABLES `COMMUNITY_USER` WRITE;
/*!40000 ALTER TABLE `COMMUNITY_USER` DISABLE KEYS */;
INSERT INTO `COMMUNITY_USER` VALUES ('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d57504ccc0004'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d57504e480006'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d57504fad0008'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d575050b8000a'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d575051a4000b'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d5750538c000e'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d575055f10012'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d5750564f0013'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d575057470014'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d575057d60015'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d57505a330019'),('ff8081813cfac5a2013cfac62cc50001','402880043d575041013d57505adf001a'),('ff8081813cfac5a2013cfac62cc50001','ff8081813cfa9f16013cfa9f1e130001'),('ff8081813cfab1b6013cfab3ade70000','ff8081813cfa9f16013cfa9f1e390002'),('ff8081813cfab1b6013cfabb4ea40006','ff8081813cfa9f16013cfa9f1e5a0003'),('ff8081813cfab1b6013cfab4dc8e0001','ff8081813cfa9f16013cfa9f1eff0005'),('ff8081813cfab1b6013cfabaed4c0005','ff8081813cfa9f16013cfa9f1f6f0006'),('ff8081813cfab1b6013cfab9e6000004','ff8081813cfa9f16013cfa9f1fc80007'),('ff8081813cfab1b6013cfab7c5f00002','ff8081813cfab679013cfab67fbe0000'),('ff8081813cfab1b6013cfab870af0003','ff8081813cfab679013cfab67fbe0000'),('ff8081813cfac5a2013cfac62cc50001','ff8081813d010e5f013d0112589623f8'),('ff8081813cfac5a2013cfac62cc50001','ff8081813d010e5f013d0118fe9f6987'),('ff8081813cfac5a2013cfac62cc50001','ff8081813d010e5f013d0119d5a672a9');
/*!40000 ALTER TABLE `COMMUNITY_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COURSE`
--

DROP TABLE IF EXISTS `COURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COURSE` (
  `id` varchar(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  `major_id` varchar(32) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK76D5D41B874BAE49` (`major_id`),
  CONSTRAINT `FK76D5D41B874BAE49` FOREIGN KEY (`major_id`) REFERENCES `MAJOR` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COURSE`
--

LOCK TABLES `COURSE` WRITE;
/*!40000 ALTER TABLE `COURSE` DISABLE KEYS */;
INSERT INTO `COURSE` VALUES ('ff8081813cfaad48013cfaad51740002','工程图学','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad51750003','消费心理与市场分析','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad51760004','计算机网络技术与应用','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad51760005','大学英语四级','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad51760006','高等数学B(上)','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad51770007','大学英语三级','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad51770008','大学英语二级','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad51770009','形势与政策1～5','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad5177000a','形势与政策1～5','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad5177000b','用户界面设计与评估','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad5178000c','产品开发设计','ff8081813cfaad48013cfaad51730001',7),('ff8081813cfaad48013cfaad5178000d','线性代数','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad5178000e','大学计算机基础','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad5178000f','军事理论','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad51780010','体育专项（上）','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad51790011','体育专项（下）','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad51790012','平面构成','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad51790013','人机工程','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad51790014','工业设计导论','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad51790015','形势与政策1～5','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad517a0016','工程力学','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad517a0017','造型材料与工艺','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad517a0018','中国近现代史纲要','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad517a0019','互动多媒体设计（一）','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad517b001a','可用性测试技术','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad517b001b','立体构成','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad517b001c','高等数学B(下)','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad517b001d','电子设备结构设计','ff8081813cfaad48013cfaad51730001',7),('ff8081813cfaad48013cfaad517b001e','设计方法与分析','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad517c001f','设计表现','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad517c0020','数据处理与数据库','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad517c0021','思想道德修养与法律基础','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad517c0022','马克思主义基本原理','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad517c0023','大学英语一级','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad517d0024','计算机图形学基础','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad517d0025','设计素描（一）','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad517d0026','冲压工艺与模具设计','ff8081813cfaad48013cfaad51730001',7),('ff8081813cfaad48013cfaad517d0027','新技术概论','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad517d0028','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad517e0029','机械创新设计','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad517e002a','形势与政策1～5','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad517e002b','体育基础（下）','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad517e002c','形势与政策1～5','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad517e002d','色彩构成','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad517f002e','产品系统设计','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad517f002f','C高级语言程序设计','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad517f0030','机械设计基础','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad517f0031','广告设计','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad51800032','VI形象设计','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad51800033','中西方艺术史','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad51800034','JAVA高级语言程序设计','ff8081813cfaad48013cfaad51730001',3),('ff8081813cfaad48013cfaad51800035','体育基础（上）','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad51800036','产品结构设计与表达','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad51810037','计算机辅助工业设计（二）','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad51810038','概率论与数理统计','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad51810039','大学物理C','ff8081813cfaad48013cfaad51730001',2),('ff8081813cfaad48013cfaad5181003a','展示设计','ff8081813cfaad48013cfaad51730001',7),('ff8081813cfaad48013cfaad5181003b','设计素描（二）','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad5181003c','计算机辅助工业设计（一）','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad5182003d','产品概念设计','ff8081813cfaad48013cfaad51730001',7),('ff8081813cfaad48013cfaad5182003e','互动多媒体设计（二）','ff8081813cfaad48013cfaad51730001',6),('ff8081813cfaad48013cfaad5182003f','交互设计','ff8081813cfaad48013cfaad51730001',7),('ff8081813cfaad48013cfaad51820040','基础素描','ff8081813cfaad48013cfaad51730001',1),('ff8081813cfaad48013cfaad51830041','产品摄影','ff8081813cfaad48013cfaad51730001',7),('ff8081813cfaad48013cfaad51830042','大学英语选修','ff8081813cfaad48013cfaad51730001',5),('ff8081813cfaad48013cfaad51830043','综合造型基础','ff8081813cfaad48013cfaad51730001',4),('ff8081813cfaad48013cfaad51840045','形势与政策1～5','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad51840046','计算机网络','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad51840047','中国近现代史纲要','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad51840048','物流工程','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad51840049','C++高级语言程序设计','ff8081813cfaad48013cfaad51830044',2),('ff8081813cfaad48013cfaad5185004a','质量工程','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad5185004b','人因工程','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad5185004c','物流配送中心设计','ff8081813cfaad48013cfaad51830044',7),('ff8081813cfaad48013cfaad5185004d','物流成本分析与控制','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad5186004e','模拟电子技术','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad5186004f','大学计算机基础','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad51860050','电路分析基础','ff8081813cfaad48013cfaad51830044',2),('ff8081813cfaad48013cfaad51860051','体育基础（上）','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad51860052','单片机原理及PLC控制','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad51860053','系统工程导论','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad51870054','物流设施规划与设计','ff8081813cfaad48013cfaad51830044',7),('ff8081813cfaad48013cfaad51870055','大学英语二级','ff8081813cfaad48013cfaad51830044',2),('ff8081813cfaad48013cfaad51870056','形势与政策1～5','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad51870057','大学物理B（上）','ff8081813cfaad48013cfaad51830044',2),('ff8081813cfaad48013cfaad51880058','形势与政策1～5','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad51880059','体育基础（下）','ff8081813cfaad48013cfaad51830044',2),('ff8081813cfaad48013cfaad5188005a','管理学概论','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad5188005b','物流运营与控制','ff8081813cfaad48013cfaad51830044',7),('ff8081813cfaad48013cfaad5188005c','高等数学A(上)','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad5189005d','大学英语四级','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad5189005e','物流案例分析','ff8081813cfaad48013cfaad51830044',7),('ff8081813cfaad48013cfaad5189005f','工程力学与材料','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad51890060','概率论与随机过程','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad51890061','现代物流管理','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad518a0062','大学英语一级','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad518a0063','供应链管理','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad518a0064','大学英语选修','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad518a0065','形势与政策1～5','ff8081813cfaad48013cfaad51830044',2),('ff8081813cfaad48013cfaad518a0066','大学英语三级','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad518b0067','物流信息系统','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad518b0068','高等数学A(下)','ff8081813cfaad48013cfaad51830044',2),('ff8081813cfaad48013cfaad518b0069','现代邮政技术','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad518b006a','物流工程导论','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad518b006b','机械设计基础','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad518c006c','物流自动识别技术','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad518c006d','数据库技术与应用','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad518c006e','体育专项（下）','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad518c006f','工程图学','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad518c0070','应用统计学','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad518d0071','大学物理B（下）','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad518d0072','形势与政策1～5','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad518d0073','马克思主义基本原理','ff8081813cfaad48013cfaad51830044',2),('ff8081813cfaad48013cfaad518d0074','思想道德修养与法律基础','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad518d0075','采购管理','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad518e0076','控制工程基础','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad518e0077','物流技术与装备','ff8081813cfaad48013cfaad51830044',6),('ff8081813cfaad48013cfaad518e0078','企业资源计划','ff8081813cfaad48013cfaad51830044',7),('ff8081813cfaad48013cfaad518e0079','数字电子技术','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad518e007a','机械制造基础','ff8081813cfaad48013cfaad51830044',4),('ff8081813cfaad48013cfaad518f007b','微机原理与测控接口技术','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad518f007c','线性代数','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad518f007d','现代物流信息技术','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad518f007e','体育专项（上）','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad518f007f','军事理论','ff8081813cfaad48013cfaad51830044',1),('ff8081813cfaad48013cfaad51900080','JAVA高级语言程序设计','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad51900081','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad51900082','数据结构','ff8081813cfaad48013cfaad51830044',3),('ff8081813cfaad48013cfaad51900083','运筹学','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad51900084','系统建模与仿真','ff8081813cfaad48013cfaad51830044',5),('ff8081813cfaad48013cfaad51910086','测控仪器设计','ff8081813cfaad48013cfaad51910085',7),('ff8081813cfaad48013cfaad51910087','光电检测技术','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad51910088','DSP原理与应用','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad51920089','单片机原理及PLC控制','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad5192008a','大学物理B（上）','ff8081813cfaad48013cfaad51910085',2),('ff8081813cfaad48013cfaad5192008b','矢量分析与场论','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad5192008c','测控电路','ff8081813cfaad48013cfaad51910085',5),('ff8081813cfaad48013cfaad5192008d','C++高级语言程序设计','ff8081813cfaad48013cfaad51910085',2),('ff8081813cfaad48013cfaad5193008e','测试与检测技术基础','ff8081813cfaad48013cfaad51910085',5),('ff8081813cfaad48013cfaad5193008f','电子线路设计与仿真','ff8081813cfaad48013cfaad51910085',5),('ff8081813cfaad48013cfaad51930090','微机原理与测控接口技术','ff8081813cfaad48013cfaad51910085',5),('ff8081813cfaad48013cfaad51930091','马克思主义基本原理','ff8081813cfaad48013cfaad51910085',2),('ff8081813cfaad48013cfaad51940092','工程图学','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad51940093','自动检测仪表及装置','ff8081813cfaad48013cfaad51910085',7),('ff8081813cfaad48013cfaad51940094','形势与政策1～5','ff8081813cfaad48013cfaad51910085',5),('ff8081813cfaad48013cfaad51940095','C++高级语言程序设计','ff8081813cfaad48013cfaad51910085',7),('ff8081813cfaad48013cfaad51940096','通信测试技术','ff8081813cfaad48013cfaad51910085',7),('ff8081813cfaad48013cfaad51940097','概率论与随机过程','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad51950098','机电一体化','ff8081813cfaad48013cfaad51910085',7),('ff8081813cfaad48013cfaad51950099','中国近现代史纲要','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad5195009a','大学英语四级','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad5195009b','数字信号处理','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad5195009c','高等数学A(上)','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad5196009d','大学英语一级','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad5196009e','大学物理B（下）','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad5196009f','形势与政策1～5','ff8081813cfaad48013cfaad51910085',2),('ff8081813cfaad48013cfaad519600a0','高等数学A(下)','ff8081813cfaad48013cfaad51910085',2),('ff8081813cfaad48013cfaad519600a1','数据结构','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519700a2','模拟电子技术','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519700a3','大学计算机基础','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad519700a4','精密机械与仪器','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad519700a5','嵌入式系统设计与应用','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad519800a6','现代控制理论','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad519800a7','体育基础（下）','ff8081813cfaad48013cfaad51910085',2),('ff8081813cfaad48013cfaad519800a8','现代传感技术','ff8081813cfaad48013cfaad51910085',7),('ff8081813cfaad48013cfaad519800a9','大学英语选修','ff8081813cfaad48013cfaad51910085',5),('ff8081813cfaad48013cfaad519900aa','电路分析','ff8081813cfaad48013cfaad51910085',2),('ff8081813cfaad48013cfaad519900ab','现场总线技术','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad519900ac','体育专项（上）','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519900ad','形势与政策1～5','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad519900ae','数字电子技术','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad519a00af','误差理论与数据处理','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad519a00b0','计算机控制系统','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad519a00b1','集散控制系统','ff8081813cfaad48013cfaad51910085',7),('ff8081813cfaad48013cfaad519a00b2','思想道德修养与法律基础','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad519b00b3','军事理论','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad519b00b4','无线传感网络技术与应用','ff8081813cfaad48013cfaad51910085',7),('ff8081813cfaad48013cfaad519b00b5','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519b00b6','形势与政策1～5','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519b00b7','形势与政策1～5','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad519c00b8','体育专项（下）','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad519c00b9','复变函数','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519c00ba','控制工程基础','ff8081813cfaad48013cfaad51910085',5),('ff8081813cfaad48013cfaad519c00bb','线性代数','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad519c00bc','数据库技术与应用','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad519c00bd','计算机网络','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519d00be','体育基础（上）','ff8081813cfaad48013cfaad51910085',1),('ff8081813cfaad48013cfaad519d00bf','电接触与电连接基础','ff8081813cfaad48013cfaad51910085',5),('ff8081813cfaad48013cfaad519d00c0','工程力学与材料','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519d00c1','智能仪器','ff8081813cfaad48013cfaad51910085',6),('ff8081813cfaad48013cfaad519e00c2','大学英语三级','ff8081813cfaad48013cfaad51910085',3),('ff8081813cfaad48013cfaad519e00c3','工程光学','ff8081813cfaad48013cfaad51910085',4),('ff8081813cfaad48013cfaad519e00c4','大学英语二级','ff8081813cfaad48013cfaad51910085',2),('ff8081813cfaad48013cfaad519f00c6','电子材料学基础','ff8081813cfaad48013cfaad519f00c5',6),('ff8081813cfaad48013cfaad519f00c7','有限元方法','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a000c8','JAVA高级语言程序设计','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a000c9','高等数学A(上)','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51a000ca','材料力学','ff8081813cfaad48013cfaad519f00c5',4),('ff8081813cfaad48013cfaad51a100cb','工业机器人','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51a100cc','体育专项（上）','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a100cd','单片机原理及PLC控制','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a100ce','CAD/CAM技术','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51a200cf','大学英语选修','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a200d0','机械设计','ff8081813cfaad48013cfaad519f00c5',6),('ff8081813cfaad48013cfaad51a200d1','冲压工艺与模具设计','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51a200d2','高等数学A(下)','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51a200d3','形势与政策1～5','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a200d4','检测技术与信号处理','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a300d5','数字电子技术','ff8081813cfaad48013cfaad519f00c5',4),('ff8081813cfaad48013cfaad51a300d6','大学英语四级','ff8081813cfaad48013cfaad519f00c5',4),('ff8081813cfaad48013cfaad51a300d7','工程图学（一）','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51a300d8','计算机控制系统','ff8081813cfaad48013cfaad519f00c5',32),('ff8081813cfaad48013cfaad51a300d9','模拟电子技术','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a300da','大学计算机基础','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51a400db','工程图学（二）','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a400dc','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a400dd','特种机器人','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51a400de','大学英语二级','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51a400df','控制工程基础','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a400e0','虚拟制造技术','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51a500e1','机械原理','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a500e2','形势与政策1～5','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51a500e3','微机原理与测控接口技术','ff8081813cfaad48013cfaad519f00c5',4),('ff8081813cfaad48013cfaad51a500e4','军事理论','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51a500e5','马克思主义基本原理','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51a500e6','机电控制系统','ff8081813cfaad48013cfaad519f00c5',6),('ff8081813cfaad48013cfaad51a600e7','计算机网络','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a600e8','C++高级语言程序设计','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a600e9','线性代数','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51a600ea','大学英语一级','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51a600eb','机械创新设计','ff8081813cfaad48013cfaad519f00c5',6),('ff8081813cfaad48013cfaad51a600ec','形势与政策1～5','ff8081813cfaad48013cfaad519f00c5',4),('ff8081813cfaad48013cfaad51a700ed','多媒体技术与应用','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51a700ee','大学物理B（上）','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51a700ef','流体传动与控制','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a700f0','现代控制理论','ff8081813cfaad48013cfaad519f00c5',6),('ff8081813cfaad48013cfaad51a700f1','体育基础（上）','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51a800f2','互换性与测量技术','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a800f3','形势与政策1～5','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a800f4','数据结构','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51a800f5','形势与政策1～5','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51a800f6','嵌入式系统控制与应用','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a800f7','电路分析基础','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51a900f8','工程材料','ff8081813cfaad48013cfaad519f00c5',5),('ff8081813cfaad48013cfaad51a900f9','电子设备结构设计（二）','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51a900fa','电接触与电连接基础','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51a900fb','中国近现代史纲要','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51a900fc','电机控制','ff8081813cfaad48013cfaad519f00c5',6),('ff8081813cfaad48013cfaad51a900fd','信息安全','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51aa00fe','理论力学','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51aa00ff','现代邮政技术','ff8081813cfaad48013cfaad519f00c5',6),('ff8081813cfaad48013cfaad51aa0100','概率论与随机过程','ff8081813cfaad48013cfaad519f00c5',4),('ff8081813cfaad48013cfaad51aa0101','C高级语言程序设计','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51aa0102','思想道德修养与法律基础','ff8081813cfaad48013cfaad519f00c5',1),('ff8081813cfaad48013cfaad51aa0103','数字化制造','ff8081813cfaad48013cfaad519f00c5',6),('ff8081813cfaad48013cfaad51ab0104','机械制造基础','ff8081813cfaad48013cfaad519f00c5',4),('ff8081813cfaad48013cfaad51ab0105','大学英语三级','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51ab0106','电子设备结构设计（一）','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51ab0107','体育基础（下）','ff8081813cfaad48013cfaad519f00c5',2),('ff8081813cfaad48013cfaad51ab0108','体育专项（下）','ff8081813cfaad48013cfaad519f00c5',4),('ff8081813cfaad48013cfaad51ab0109','大学物理B（下）','ff8081813cfaad48013cfaad519f00c5',3),('ff8081813cfaad48013cfaad51ac010a','典型机构分析','ff8081813cfaad48013cfaad519f00c5',7),('ff8081813cfaad48013cfaad51ac010c','C++高级语言程序设计','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51ac010d','电力电子技术','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaad51ad010e','体育专项（上）','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51ad010f','大学物理B（上）','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51ad0110','工业机器人','ff8081813cfaad48013cfaad51ac010b',7),('ff8081813cfaad48013cfaad51ad0111','运筹学','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaad51ad0112','计算机网络','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaad51ae0113','形势与政策1～5','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51ae0114','大学计算机基础','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51ae0115','模式识别','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51ae0116','大学英语二级','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51ae0117','电路分析','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51ae0118','大学物理B（下）','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51af0119','线性代数','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51af011a','C高级语言程序设计','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51af011b','形势与政策1～5','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51af011c','大学英语选修','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51af011d','工业自动化与控制网络','ff8081813cfaad48013cfaad51ac010b',7),('ff8081813cfaad48013cfaad51af011e','通信测试技术','ff8081813cfaad48013cfaad51ac010b',7),('ff8081813cfaad48013cfaad51b0011f','现场总线技术','ff8081813cfaad48013cfaad51ac010b',6),('ff8081813cfaad48013cfaad51b00120','中国近现代史纲要','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51b00121','传感器网络技术与应用','ff8081813cfaad48013cfaad51ac010b',7),('ff8081813cfaad48013cfaad51b00122','微机原理与测控接口技术','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51b00123','体育基础（上）','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51b10124','体育基础（下）','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51b10125','数据结构','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51b10126','马克思主义基本原理','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51b10127','嵌入式系统设计与应用','ff8081813cfaad48013cfaad51ac010b',6),('ff8081813cfaad48013cfaad51b10128','DSP原理与应用','ff8081813cfaad48013cfaad51ac010b',6),('ff8081813cfaad48013cfaad51b10129','大学英语四级','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaad51b1012a','电机控制','ff8081813cfaad48013cfaad51ac010b',6),('ff8081813cfaad48013cfaad51b2012b','军事理论','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51b2012c','工程图学','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51b2012d','信号与系统','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaad51b2012e','大学英语三级','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51b2012f','概率论与随机过程','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaad51b20130','模拟电子技术','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51b30131','思想道德修养与法律基础','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51b30132','计算机控制系统','ff8081813cfaad48013cfaad51ac010b',6),('ff8081813cfaad48013cfaad51b30133','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51b30134','自动化导论','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51b30135','集散控制系统','ff8081813cfaad48013cfaad51ac010b',7),('ff8081813cfaad48013cfaad51b30136','形势与政策1～5','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51b40137','过程控制','ff8081813cfaad48013cfaad51ac010b',6),('ff8081813cfaad48013cfaad51b40138','形势与政策1～5','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaad51b40139','单片机原理及PLC控制','ff8081813cfaad48013cfaad51ac010b',6),('ff8081813cfaad48013cfaad51b4013a','复变函数','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51b4013b','高等数学A(下)','ff8081813cfaad48013cfaad51ac010b',2),('ff8081813cfaad48013cfaad51b5013c','自动控制原理','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51b5013d','现代传感技术','ff8081813cfaad48013cfaad51ac010b',7),('ff8081813cfaad48013cfaad51b5013e','体育专项（下）','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaad51b5013f','电子线路设计与仿真','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51b50140','计算机仿真','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51b60141','高等数学A(上)','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51b60142','检测技术与信号处理','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51b60143','系统工程导论','ff8081813cfaad48013cfaad51ac010b',7),('ff8081813cfaad48013cfaad51b70144','智能控制','ff8081813cfaad48013cfaad51ac010b',5),('ff8081813cfaad48013cfaad51b70145','形势与政策1～5','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51b70146','大学英语一级','ff8081813cfaad48013cfaad51ac010b',1),('ff8081813cfaad48013cfaad51b70147','现代控制理论','ff8081813cfaad48013cfaad51ac010b',6),('ff8081813cfaad48013cfaad51b80148','理论力学','ff8081813cfaad48013cfaad51ac010b',3),('ff8081813cfaad48013cfaad51b80149','数字电子技术','ff8081813cfaad48013cfaad51ac010b',4),('ff8081813cfaad48013cfaadc982014c','大学英语三级','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc983014d','智能科学与技术前沿讲座','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc983014e','数字逻辑与数字系统','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc983014f','脑与认知科学认识实验','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc9830150','体育专项（上）','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc9830151','形势与政策2','ff8081813cfaad48013cfaadc982014b',2),('ff8081813cfaad48013cfaadc9830152','机器智能','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc9840153','概率论与数理统计','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc9840154','线性代数','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc9840155','科技史与方法学','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc9840156','思想道德修养与法律基础','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc9840157','智能科学技术导论','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc9850158','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaadc982014b',2),('ff8081813cfaad48013cfaadc9850159','中国近现代史纲要','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc985015a','生物信息基础','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc985015b','自然语言处理与理解','ff8081813cfaad48013cfaadc982014b',6),('ff8081813cfaad48013cfaadc985015c','大学英语四级','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc985015d','模式分析','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc985015e','电路与电子学实验','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc986015f','程序设计实践','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc9860160','计算智能','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc9860161','离散数学（上）','ff8081813cfaad48013cfaadc982014b',2),('ff8081813cfaad48013cfaadc9860162','机器学习','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc9860163','网络技术导论','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc9860164','大学英语选修','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc9870165','大学英语二级','ff8081813cfaad48013cfaadc982014b',2),('ff8081813cfaad48013cfaadc9870166','智能游戏','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc9870167','体育基础（下）','ff8081813cfaad48013cfaadc982014b',2),('ff8081813cfaad48013cfaadc9870168','形式语言与自动机','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc9870169','计算机组成原理','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc987016a','体育专项（下）','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc987016b','群体智能','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc988016c','大学英语一级','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc988016d','计算机网络','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc988016e','形势与政策4','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc988016f','数据库系统原理','ff8081813cfaad48013cfaadc982014b',6),('ff8081813cfaad48013cfaadc9880170','智能信息网络实验','ff8081813cfaad48013cfaadc982014b',6),('ff8081813cfaad48013cfaadc9880171','信息内容安全','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc9890172','大学物理C','ff8081813cfaad48013cfaadc982014b',2),('ff8081813cfaad48013cfaadc9890173','高等数学A（上）','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc9890174','服务科学与服务工程概论','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc9890175','算法与数据结构','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc9890176','多模态信息处理','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc9890177','体育基础（上）','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc9890178','形势与政策5','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc98a0179','Web开发技术','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc98a017a','离散数学（下）','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc98a017b','军事理论','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc98a017c','操作系统','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc98a017d','形势与政策3','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc98a017e','形势与政策1','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc98b017f','计算机图形学','ff8081813cfaad48013cfaadc982014b',6),('ff8081813cfaad48013cfaadc98b0180','高等数学A（下）','ff8081813cfaad48013cfaadc982014b',2),('ff8081813cfaad48013cfaadc98b0181','计算导论与程序设计','ff8081813cfaad48013cfaadc982014b',1),('ff8081813cfaad48013cfaadc98b0182','大学英语选修','ff8081813cfaad48013cfaadc982014b',6),('ff8081813cfaad48013cfaadc98b0183','脑与认知科学基础','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc98b0184','UNIX编程环境','ff8081813cfaad48013cfaadc982014b',6),('ff8081813cfaad48013cfaadc98b0185','马克思主义基本原理','ff8081813cfaad48013cfaadc982014b',3),('ff8081813cfaad48013cfaadc98c0186','信息与知识获取','ff8081813cfaad48013cfaadc982014b',6),('ff8081813cfaad48013cfaadc98c0187','数据结构课程设计','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc98c0188','软件工程','ff8081813cfaad48013cfaadc982014b',6),('ff8081813cfaad48013cfaadc98c0189','电路与电子学基础','ff8081813cfaad48013cfaadc982014b',2),('ff8081813cfaad48013cfaadc98c018a','智能机器人','ff8081813cfaad48013cfaadc982014b',7),('ff8081813cfaad48013cfaadc98c018b','组合数学','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc98d018c','数学建模与模拟','ff8081813cfaad48013cfaadc982014b',4),('ff8081813cfaad48013cfaadc98d018d','信息科学原理','ff8081813cfaad48013cfaadc982014b',5),('ff8081813cfaad48013cfaadc98d018f','移动通信基础','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc98d0190','概率论与随机过程','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc98d0191','形势与政策5','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc98e0192','网络仿真技术','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc98e0193','软件工程','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc98e0194','Web开发技术','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc98e0195','运筹学','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc98e0196','大学英语选修','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc98e0197','形势与政策3','ff8081813cfaad48013cfaadc98d018e',3),('ff8081813cfaad48013cfaadc98e0198','中国近现代史纲要','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc98f0199','大学英语三级','ff8081813cfaad48013cfaadc98d018e',3),('ff8081813cfaad48013cfaadc98f019a','现代交换原理','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc98f019b','形势与政策4','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc98f019c','Unix编程环境','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc98f019d','Internet技术','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc98f019e','嵌入式操作系统与通信软件','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc990019f','分布式计算','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99001a0','软件工程综合设计与实验','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99001a1','服务科学与服务工程概论','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99101a2','数学分析(上)','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99101a3','人工智能原理','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc99101a4','无线通信技术','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99201a5','数字图像处理','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99201a6','计算机组成原理','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc99201a7','网络存储技术','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99201a8','网络技术导论','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc99301a9','信息安全概论','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99301aa','军事理论','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99301ab','高层网络协议','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99301ac','计算机图形学','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc99401ad','线性代数','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99401ae','信号与系统','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc99401af','大学英语四级','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc99401b0','微机系统与接口技术','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc99501b1','数字媒体内容综合设计与实验','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99501b2','计算机网络技术实践','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc99501b3','大学英语二级','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc99501b4','数学分析(下)','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc99601b5','面向对象分析与设计（Java）','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99601b6','形势与政策2','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc99601b7','多媒体技术','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99601b8','形式语言与自动机','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc99701b9','数据库系统原理','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc99701ba','组合数学','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc99701bb','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc99701bc','马克思主义基本原理','ff8081813cfaad48013cfaadc98d018e',3),('ff8081813cfaad48013cfaadc99701bd','思想道德修养与法律基础','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99801be','大学英语选修','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc99801bf','嵌入式系统综合设计与实验','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99801c0','计算机系统结构','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc99801c1','离散数学（下）','ff8081813cfaad48013cfaadc98d018e',3),('ff8081813cfaad48013cfaadc99901c2','现代通信网','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99901c3','计算机网络','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc99901c4','体育基础（上）','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99901c5','体育专项（上）','ff8081813cfaad48013cfaadc98d018e',3),('ff8081813cfaad48013cfaadc99901c6','数字逻辑与数字系统','ff8081813cfaad48013cfaadc98d018e',3),('ff8081813cfaad48013cfaadc99a01c7','通信软件综合设计与实验','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99a01c8','程序设计语言原理与实践','ff8081813cfaad48013cfaadc98d018e',6),('ff8081813cfaad48013cfaadc99a01c9','编译原理与技术','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc99a01ca','高等数学A(下)','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc99b01cb','数据仓库与数据挖掘','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99b01cc','计算导论与程序设计','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99b01cd','算法设计与分析','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc99b01ce','实时通信系统设计','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99c01cf','操作系统','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc99c01d0','电路与电子学实验','ff8081813cfaad48013cfaadc98d018e',3),('ff8081813cfaad48013cfaadc99c01d1','大学物理C','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc99c01d2','程序设计实践','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99d01d3','算法与数据结构','ff8081813cfaad48013cfaadc98d018e',3),('ff8081813cfaad48013cfaadc99d01d4','排队论','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc99d01d5','SoPC与嵌入式系统应用','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99d01d6','大学英语一级','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99d01d7','数学建模与模拟','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc99e01d8','智能管理','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc99e01d9','体育基础（下）','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc99e01da','自然语言处理导论','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc99e01db','通信原理','ff8081813cfaad48013cfaadc98d018e',5),('ff8081813cfaad48013cfaadc99f01dc','高等数学A(上)','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99f01dd','形势与政策1','ff8081813cfaad48013cfaadc98d018e',1),('ff8081813cfaad48013cfaadc99f01de','通信软件设计','ff8081813cfaad48013cfaadc98d018e',7),('ff8081813cfaad48013cfaadc99f01df','离散数学（上）','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc99f01e0','电路与电子学基础','ff8081813cfaad48013cfaadc98d018e',2),('ff8081813cfaad48013cfaadc9a001e1','体育专项（下）','ff8081813cfaad48013cfaadc98d018e',4),('ff8081813cfaad48013cfaadc9a001e3','大学英语三级','ff8081813cfaad48013cfaadc9a001e2',3),('ff8081813cfaad48013cfaadc9a001e4','计算机网络技术实践','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a001e5','网络规划','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a001e6','电路与电子学基础','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9a101e7','大学英语选修','ff8081813cfaad48013cfaadc9a001e2',5),('ff8081813cfaad48013cfaadc9a101e8','数据结构课程设计','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a101e9','大学英语选修','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a101ea','大学物理C','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9a101eb','网络存储技术','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a101ec','现代通信网','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a101ed','军事理论','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a101ee','体育专项（上）','ff8081813cfaad48013cfaadc9a001e2',3),('ff8081813cfaad48013cfaadc9a201ef','网络技术导论','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a201f0','计算机系统结构','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a201f1','计算机图形学','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a201f2','马克思主义基本原理','ff8081813cfaad48013cfaadc9a001e2',3),('ff8081813cfaad48013cfaadc9a201f3','多媒体技术','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a201f4','数学分析(上)','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a201f5','信息安全概论','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a301f6','数学分析(下)','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9a301f7','计算导论与程序设计','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a301f8','现代交换原理','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a301f9','数据库系统原理','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a301fa','网络工程综合设计与实验','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a301fb','体育基础（下）','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9a301fc','数字逻辑与数字系统','ff8081813cfaad48013cfaadc9a001e2',3),('ff8081813cfaad48013cfaadc9a401fd','通信软件综合设计与实验','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a401fe','形势与政策2','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9a401ff','算法与数据结构','ff8081813cfaad48013cfaadc9a001e2',3),('ff8081813cfaad48013cfaadc9a40200','网络工程','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a40201','编译原理与技术','ff8081813cfaad48013cfaadc9a001e2',5),('ff8081813cfaad48013cfaadc9a40202','算法设计与分析','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a50203','计算机网络','ff8081813cfaad48013cfaadc9a001e2',5),('ff8081813cfaad48013cfaadc9a50204','软件工程','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a50205','体育专项（下）','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a50206','计算机组成原理','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a50207','网络仿真技术','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a50208','微机系统与接口技术','ff8081813cfaad48013cfaadc9a001e2',5),('ff8081813cfaad48013cfaadc9a50209','网络软件设计开发','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a6020a','高等数学A(下)','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9a6020b','组合数学','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a6020c','排队论','ff8081813cfaad48013cfaadc9a001e2',5),('ff8081813cfaad48013cfaadc9a6020d','线性代数','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a6020e','Internet技术','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a6020f','概率论与随机过程','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a70210','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9a70211','信号与系统','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a70212','程序设计实践','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a70213','接入网技术','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a70214','面向对象分析与设计（Java）','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a70215','通信软件设计','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a70216','形式语言与自动机','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a70217','离散数学（上）','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9a80218','中国近现代史纲要','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a80219','形势与政策5','ff8081813cfaad48013cfaadc9a001e2',5),('ff8081813cfaad48013cfaadc9a8021a','移动通信基础','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a8021b','体育基础（上）','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a8021c','形势与政策1','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a8021d','形势与政策3','ff8081813cfaad48013cfaadc9a001e2',3),('ff8081813cfaad48013cfaadc9a8021e','高等数学A(上)','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a9021f','数学建模与模拟','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a90220','思想道德修养与法律基础','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9a90221','离散数学（下）','ff8081813cfaad48013cfaadc9a001e2',3),('ff8081813cfaad48013cfaadc9a90222','Unix编程环境','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9a90223','嵌入式操作系统与通信软件','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9a90224','形势与政策4','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9a90225','电路与电子学实验','ff8081813cfaad48013cfaadc9a001e2',3),('ff8081813cfaad48013cfaadc9a90226','大学英语一级','ff8081813cfaad48013cfaadc9a001e2',1),('ff8081813cfaad48013cfaadc9aa0227','运筹学','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9aa0228','Web开发技术','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9aa0229','网络信息安全基础','ff8081813cfaad48013cfaadc9a001e2',6),('ff8081813cfaad48013cfaadc9aa022a','软件工程综合设计与实验','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9aa022b','通信原理','ff8081813cfaad48013cfaadc9a001e2',5),('ff8081813cfaad48013cfaadc9ab022c','大学英语二级','ff8081813cfaad48013cfaadc9a001e2',2),('ff8081813cfaad48013cfaadc9ab022d','大学英语四级','ff8081813cfaad48013cfaadc9a001e2',4),('ff8081813cfaad48013cfaadc9ab022e','网络管理技术及应用','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9ab022f','高层网络协议','ff8081813cfaad48013cfaadc9a001e2',7),('ff8081813cfaad48013cfaadc9ab0230','操作系统','ff8081813cfaad48013cfaadc9a001e2',5),('ff8081813cfaad48013cfaadc9ac0232','形势与政策5','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9ac0233','数学分析(上)','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9ad0234','信息系统安全','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9ad0235','网络安全','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9ad0236','军事理论','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9ad0237','电路与电子学基础','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9ad0238','软件安全测评','ff8081813cfaad48013cfaadc9ac0231',7),('ff8081813cfaad48013cfaadc9ae0239','高等数学A(下)','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9ae023a','马克思主义基本原理','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9ae023b','多媒体技术与应用','ff8081813cfaad48013cfaadc9ac0231',7),('ff8081813cfaad48013cfaadc9ae023c','形势与政策1','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9af023d','现代通信网','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9af023e','软件安全','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9af023f','信息论与编码','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9af0240','现代交换原理','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9af0241','计算机网络','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9b00242','容错计算技术','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9b00243','通信网安全','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9b00244','信息隐藏与数字水印','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9b00245','通信原理','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9b10246','数学分析(下)','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9b10247','信息安全管理','ff8081813cfaad48013cfaadc9ac0231',7),('ff8081813cfaad48013cfaadc9b10248','电路与电子学实验','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9b10249','线性代数','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9b1024a','计算机组成与系统结构','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9b2024b','体育基础（下）','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9b2024c','大学英语一级','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9b2024d','数据结构','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9b2024e','信息安全数学基础（上）','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9b3024f','计算导论与程序设计','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9b30250','复变函数','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9b30251','编译原理与技术','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9b30252','操作系统','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9b40253','公钥密码应用','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9b40254','现代密码学','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9b40255','体育专项（上）','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9b40256','软件工程技术基础','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9b50257','高等数学A(上)','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9b50258','信息安全数学基础（下）','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9b50259','数字内容安全','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9b5025a','数字版权保护','ff8081813cfaad48013cfaadc9ac0231',7),('ff8081813cfaad48013cfaadc9b5025b','数学建模与模拟','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9b6025c','体育专项（下）','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9b6025d','信号与系统','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9b6025e','网络安全分析','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9b6025f','形势与政策2','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9b60260','微机系统与接口技术','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9b70261','数理统计','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9b70262','思想道德修养与法律基础','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9b70263','数据库技术与应用','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9b70264','大学物理C','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9b80265','大学英语三级','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9b80266','混沌计算','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9b80267','JAVA高级语言程序设计','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9b80268','形势与政策4','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9b80269','大学英语选修','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9b9026a','C++高级语言程序设计','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9b9026b','大学英语四级','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9b9026c','数字信号处理','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9b9026d','计算机仿真','ff8081813cfaad48013cfaadc9ac0231',7),('ff8081813cfaad48013cfaadc9ba026e','对称密码技术','ff8081813cfaad48013cfaadc9ac0231',5),('ff8081813cfaad48013cfaadc9ba026f','大学英语二级','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9ba0270','概率论与随机过程','ff8081813cfaad48013cfaadc9ac0231',4),('ff8081813cfaad48013cfaadc9ba0271','信息系统容灾技术','ff8081813cfaad48013cfaadc9ac0231',7),('ff8081813cfaad48013cfaadc9ba0272','数字逻辑与数字系统','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9bb0273','信息安全导论','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9bb0274','嵌入式系统及安全','ff8081813cfaad48013cfaadc9ac0231',6),('ff8081813cfaad48013cfaadc9bb0275','形势与政策3','ff8081813cfaad48013cfaadc9ac0231',3),('ff8081813cfaad48013cfaadc9bb0276','中国近现代史纲要','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaadc9bc0277','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaadc9ac0231',2),('ff8081813cfaad48013cfaadc9bc0278','体育基础（上）','ff8081813cfaad48013cfaadc9ac0231',1),('ff8081813cfaad48013cfaae2b56027b','现代服务科学原理与技术','ff8081813cfaad48013cfaae2b56027a',2),('ff8081813cfaad48013cfaae2c14027e','数字信号处理','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c14027f','高频电子线路','ff8081813cfaad48013cfaae2c13027d',4),('ff8081813cfaad48013cfaae2c140280','光信息处理','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c140281','军事理论','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c140282','软件无线电','ff8081813cfaad48013cfaae2c13027d',7),('ff8081813cfaad48013cfaae2c140283','高等数学A(下)','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c140284','数学物理方法','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c140285','光学系统与光电仪器','ff8081813cfaad48013cfaae2c13027d',7),('ff8081813cfaad48013cfaae2c150286','信号与系统','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c150287','大学英语四级','ff8081813cfaad48013cfaae2c13027d',4),('ff8081813cfaad48013cfaae2c150288','矢量分析与场论','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c150289','离散数学','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c15028a','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c15028b','微波工程基础','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c16028c','马克思主义基本原理','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c16028d','高等数学A(上)','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c16028e','微机原理及接口技术','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c16028f','复变函数','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c160290','嵌入式系统','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c170291','大学英语选修','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c170292','大学英语二级','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c170293','中国近现代史纲要','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c170294','形势与政策1～5','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c170295','信息论与编码','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c170296','信息网络应用基础','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c170297','光交换技术','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c180298','光纤通信系统','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c180299','光网络基础','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c18029a','数据结构','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c18029b','C高级语言程序设计','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c18029c','微电子器件基础','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c18029d','思想道德修养与法律基础','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c18029e','电路分析基础','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c18029f','电磁场与电磁波*','ff8081813cfaad48013cfaae2c13027d',4),('ff8081813cfaad48013cfaae2c1802a0','体育基础（下）','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c1902a1','光电子学','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c1902a2','通信原理（续）','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c1902a3','物理光学','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c1902a4','大学物理B（上）','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c1902a5','大学计算机基础','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c1902a6','无线传输技术及网络','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c1902a7','形势与政策1～5','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c1902a8','计算机网络','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c1a02a9','通信原理','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c1a02aa','大学英语选修','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c1a02ab','体育专项（下）','ff8081813cfaad48013cfaae2c13027d',4),('ff8081813cfaad48013cfaae2c1a02ac','激光原理与技术','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c1a02ad','无线光通信','ff8081813cfaad48013cfaae2c13027d',6),('ff8081813cfaad48013cfaae2c1a02ae','量子力学','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c1a02af','形势与政策1～5','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c1a02b0','大学英语三级','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c1b02b1','数字电路与逻辑设计','ff8081813cfaad48013cfaae2c13027d',4),('ff8081813cfaad48013cfaae2c1b02b2','光电子器件原理及应用','ff8081813cfaad48013cfaae2c13027d',7),('ff8081813cfaad48013cfaae2c1b02b3','体育专项（上）','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c1b02b4','电路辅助设计与仿真','ff8081813cfaad48013cfaae2c13027d',2),('ff8081813cfaad48013cfaae2c1b02b5','智能天线技术','ff8081813cfaad48013cfaae2c13027d',7),('ff8081813cfaad48013cfaae2c1b02b6','大学英语一级','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c1b02b7','线性代数','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c1b02b8','数据库技术与应用','ff8081813cfaad48013cfaae2c13027d',5),('ff8081813cfaad48013cfaae2c1b02b9','电子电路基础','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c1c02ba','形势与政策1～5','ff8081813cfaad48013cfaae2c13027d',4),('ff8081813cfaad48013cfaae2c1c02bb','面向对象程序设计方法','ff8081813cfaad48013cfaae2c13027d',4),('ff8081813cfaad48013cfaae2c1c02bc','体育基础（上）','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c1c02bd','形势与政策1～5','ff8081813cfaad48013cfaae2c13027d',1),('ff8081813cfaad48013cfaae2c1c02be','移动互联网','ff8081813cfaad48013cfaae2c13027d',7),('ff8081813cfaad48013cfaae2c1d02bf','概率论与随机过程','ff8081813cfaad48013cfaae2c13027d',4),('ff8081813cfaad48013cfaae2c1d02c0','光电检测与传感技术','ff8081813cfaad48013cfaae2c13027d',7),('ff8081813cfaad48013cfaae2c1d02c1','大学物理B（下）','ff8081813cfaad48013cfaae2c13027d',3),('ff8081813cfaad48013cfaae2c1d02c3','传感技术与应用','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c1d02c4','信号与系统','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c1e02c5','概率论与随机过程','ff8081813cfaad48013cfaae2c1d02c2',4),('ff8081813cfaad48013cfaae2c1e02c6','微机原理及接口技术','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c1e02c7','电波传播','ff8081813cfaad48013cfaae2c1d02c2',7),('ff8081813cfaad48013cfaae2c1e02c8','大学英语选修','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c1e02c9','体育基础（下）','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c1e02ca','大学物理B（下）','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c1e02cb','马克思主义基本原理','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c1e02cc','高频电子线路','ff8081813cfaad48013cfaae2c1d02c2',4),('ff8081813cfaad48013cfaae2c1f02cd','智能卡系统','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c1f02ce','数学物理方法','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c1f02cf','微波单片集成电路','ff8081813cfaad48013cfaae2c1d02c2',7),('ff8081813cfaad48013cfaae2c1f02d0','电子电路基础','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c1f02d1','嵌入式系统','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c1f02d2','体育专项（上）','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c1f02d3','高等数学A(下)','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c2002d4','中国近现代史纲要','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2002d5','体育基础（上）','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2002d6','信息论与编码','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c2002d7','大学英语一级','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2002d8','形势与政策1～5','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c2002d9','数字信号处理','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c2002da','大学计算机基础','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2002db','矢量分析与场论','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c2002dc','电路辅助设计与仿真','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c2102dd','大学英语二级','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c2102de','智能天线技术','ff8081813cfaad48013cfaae2c1d02c2',7),('ff8081813cfaad48013cfaae2c2102df','模拟集成电路设计','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c2102e0','面向对象程序设计方法','ff8081813cfaad48013cfaae2c1d02c2',4),('ff8081813cfaad48013cfaae2c2102e1','信息电子技术','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c2102e2','无线传输技术及网络','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c2102e3','通信原理','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c2102e4','复变函数','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c2202e5','大学物理B（上）','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c2202e6','电路分析基础','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c2202e7','微波工程基础','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c2202e8','高等数学A(上)','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2202e9','数据库技术与应用','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c2202ea','形势与政策1～5','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c2202eb','思想道德修养与法律基础','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2202ec','形势与政策1～5','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2202ed','形势与政策1～5','ff8081813cfaad48013cfaae2c1d02c2',4),('ff8081813cfaad48013cfaae2c2302ee','移动互联网','ff8081813cfaad48013cfaae2c1d02c2',7),('ff8081813cfaad48013cfaae2c2302ef','软件无线电','ff8081813cfaad48013cfaae2c1d02c2',7),('ff8081813cfaad48013cfaae2c2302f0','数据结构','ff8081813cfaad48013cfaae2c1d02c2',2),('ff8081813cfaad48013cfaae2c2302f1','离散数学','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c2302f2','通信网技术基础','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c2302f3','电磁场与电磁波*','ff8081813cfaad48013cfaae2c1d02c2',4),('ff8081813cfaad48013cfaae2c2302f4','信息网络应用基础','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c2302f5','天线测量','ff8081813cfaad48013cfaae2c1d02c2',7),('ff8081813cfaad48013cfaae2c2302f6','电磁兼容原理','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c2402f7','大学英语三级','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c2402f8','VLSI原理与EDA技术','ff8081813cfaad48013cfaae2c1d02c2',7),('ff8081813cfaad48013cfaae2c2402f9','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c2402fa','体育专项（下）','ff8081813cfaad48013cfaae2c1d02c2',4),('ff8081813cfaad48013cfaae2c2402fb','C高级语言程序设计','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2402fc','计算机网络','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c2402fd','线性代数','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2402fe','军事理论','ff8081813cfaad48013cfaae2c1d02c2',1),('ff8081813cfaad48013cfaae2c2502ff','电子信息系统概论','ff8081813cfaad48013cfaae2c1d02c2',7),('ff8081813cfaad48013cfaae2c250300','微电子学基础','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c250301','通信原理（续）','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c250302','天线理论','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c250303','无线光通信','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c250304','大学英语四级','ff8081813cfaad48013cfaae2c1d02c2',4),('ff8081813cfaad48013cfaae2c250305','数字电路与逻辑设计','ff8081813cfaad48013cfaae2c1d02c2',4),('ff8081813cfaad48013cfaae2c250306','形势与政策1～5','ff8081813cfaad48013cfaae2c1d02c2',3),('ff8081813cfaad48013cfaae2c250307','ASIC设计原理及应用','ff8081813cfaad48013cfaae2c1d02c2',6),('ff8081813cfaad48013cfaae2c260308','大学英语选修','ff8081813cfaad48013cfaae2c1d02c2',5),('ff8081813cfaad48013cfaae2c26030a','数据结构','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c26030b','软件无线电','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c26030c','形势与政策1～5','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c26030d','数字信号处理','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c26030e','传感技术与应用','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c26030f','信息论与编码','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c270310','DSP设计及应用','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c270311','数学物理方法','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c270312','微机电系统','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c270313','数据库技术与应用','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c270314','电磁兼容原理','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c270315','高等数学A(上)','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c270316','固体物理','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c270317','无线传输技术及网络','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c270318','电子电路基础','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c280319','线性代数','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c28031a','矢量分析与场论','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c28031b','思想道德修养与法律基础','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c28031c','电路分析基础','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c28031d','形势与政策1～5','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c28031e','体育专项（上）','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c28031f','大学计算机基础','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c290320','大学英语选修','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c290321','集成电路制造技术','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c290322','微机原理及接口技术','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c290323','计算机网络','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c290324','马克思主义基本原理','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c290325','通信原理（续）','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c2a0326','天线理论','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c2a0327','高频电子线路','ff8081813cfaad48013cfaae2c260309',4),('ff8081813cfaad48013cfaae2c2a0328','信息网络应用基础','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c2a0329','ASIC设计原理及应用','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c2a032a','C高级语言程序设计','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c2a032b','形势与政策1～5','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c2a032c','智能卡系统','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c2a032d','大学英语四级','ff8081813cfaad48013cfaae2c260309',4),('ff8081813cfaad48013cfaae2c2a032e','体育基础（下）','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c2b032f','电磁场与电磁波*','ff8081813cfaad48013cfaae2c260309',4),('ff8081813cfaad48013cfaae2c2b0330','SoC设计方法','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c2b0331','大学英语一级','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c2b0332','通信原理','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c2b0333','高等数学A(下)','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c2b0334','通信网技术基础','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c2b0335','微电子器件基础','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c2b0336','大学英语二级','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c2b0337','形势与政策1～5','ff8081813cfaad48013cfaae2c260309',4),('ff8081813cfaad48013cfaae2c2c0338','智能天线技术','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c2c0339','形势与政策1～5','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c2c033a','中国近现代史纲要','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c2c033b','移动互联网','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c2c033c','复变函数','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c2c033d','电路辅助设计与仿真','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c2c033e','大学物理B（下）','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c2d033f','体育基础（上）','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae2c2d0340','多媒体技术','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c2d0341','大学物理B（上）','ff8081813cfaad48013cfaae2c260309',2),('ff8081813cfaad48013cfaae2c2d0342','概率论与随机过程','ff8081813cfaad48013cfaae2c260309',4),('ff8081813cfaad48013cfaae2c2d0343','VLSI原理与EDA技术','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c2d0344','离散数学','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c2d0345','微波单片集成电路','ff8081813cfaad48013cfaae2c260309',7),('ff8081813cfaad48013cfaae2c2d0346','模拟集成电路设计','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c2d0347','数字电路与逻辑设计','ff8081813cfaad48013cfaae2c260309',4),('ff8081813cfaad48013cfaae2c2d0348','量子力学与统计物理','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c2e0349','嵌入式系统设计','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c2e034a','体育专项（下）','ff8081813cfaad48013cfaae2c260309',4),('ff8081813cfaad48013cfaae2c2e034b','可编程逻辑设计','ff8081813cfaad48013cfaae2c260309',6),('ff8081813cfaad48013cfaae2c2e034c','大学英语三级','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c2e034d','微波工程基础','ff8081813cfaad48013cfaae2c260309',5),('ff8081813cfaad48013cfaae2c2e034e','面向对象程序设计方法','ff8081813cfaad48013cfaae2c260309',4),('ff8081813cfaad48013cfaae2c2e034f','信号与系统','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c2e0350','毛泽东思想和中国特色社会主义理论体系概论','ff8081813cfaad48013cfaae2c260309',3),('ff8081813cfaad48013cfaae2c2f0351','军事理论','ff8081813cfaad48013cfaae2c260309',1),('ff8081813cfaad48013cfaae6ead0354','C高级语言程序设计','ff8081813cfaad48013cfaae6ead0353',2),('ff8081813cfaad48013cfaae6eae0356','C高级语言程序设计','ff8081813cfaad48013cfaae6eae0355',2),('ff8081813cfaad48013cfaae6eae0358','C高级语言程序设计','ff8081813cfaad48013cfaae6eae0357',2),('ff8081813cfac4de013cfac4e5c80009','Java语言与程序设计','ff8081813cfac4de013cfac4e5c60001',9);
/*!40000 ALTER TABLE `COURSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIRECTORY`
--

DROP TABLE IF EXISTS `DIRECTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIRECTORY` (
  `id` varchar(32) NOT NULL,
  `dir_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6CB82E4DD246F4CB` (`user_id`),
  CONSTRAINT `FK6CB82E4DD246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIRECTORY`
--

LOCK TABLES `DIRECTORY` WRITE;
/*!40000 ALTER TABLE `DIRECTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `DIRECTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FRIEND_GROUP`
--

DROP TABLE IF EXISTS `FRIEND_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FRIEND_GROUP` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `friend_group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FRIEND_GROUP`
--

LOCK TABLES `FRIEND_GROUP` WRITE;
/*!40000 ALTER TABLE `FRIEND_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FRIEND_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP`
--

DROP TABLE IF EXISTS `GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP` (
  `id` varchar(32) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `group_admin_id` varchar(32) DEFAULT NULL,
  `group_users_count` int(5) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK40EFE5FFFF09887` (`group_admin_id`),
  CONSTRAINT `FK40EFE5FFFF09887` FOREIGN KEY (`group_admin_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP`
--

LOCK TABLES `GROUP` WRITE;
/*!40000 ALTER TABLE `GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_RESOURCE`
--

DROP TABLE IF EXISTS `GROUP_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_RESOURCE` (
  `group_id` varchar(32) NOT NULL DEFAULT '',
  `resource_id` varchar(32) NOT NULL DEFAULT '',
  `share_user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`group_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_RESOURCE`
--

LOCK TABLES `GROUP_RESOURCE` WRITE;
/*!40000 ALTER TABLE `GROUP_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_USER`
--

DROP TABLE IF EXISTS `GROUP_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_USER` (
  `group_id` varchar(32) NOT NULL DEFAULT '',
  `user_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `FK6B1EC1ABD246F4CB` (`user_id`),
  KEY `FK6B1EC1ABA3DDB089` (`group_id`),
  CONSTRAINT `FK6B1EC1ABA3DDB089` FOREIGN KEY (`group_id`) REFERENCES `GROUP` (`id`),
  CONSTRAINT `FK6B1EC1ABD246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_USER`
--

LOCK TABLES `GROUP_USER` WRITE;
/*!40000 ALTER TABLE `GROUP_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAJOR`
--

DROP TABLE IF EXISTS `MAJOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MAJOR` (
  `id` varchar(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  `academy_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK45BBD991E1A2DA9` (`academy_id`),
  CONSTRAINT `FK45BBD991E1A2DA9` FOREIGN KEY (`academy_id`) REFERENCES `ACADEMY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAJOR`
--

LOCK TABLES `MAJOR` WRITE;
/*!40000 ALTER TABLE `MAJOR` DISABLE KEYS */;
INSERT INTO `MAJOR` VALUES ('ff8081813cfaad48013cfaad51730001','工业设计','ff8081813cfaad48013cfaad51520000'),('ff8081813cfaad48013cfaad51830044','物流工程','ff8081813cfaad48013cfaad51520000'),('ff8081813cfaad48013cfaad51910085','测控技术与仪器','ff8081813cfaad48013cfaad51520000'),('ff8081813cfaad48013cfaad519f00c5','机械工程及自动化','ff8081813cfaad48013cfaad51520000'),('ff8081813cfaad48013cfaad51ac010b','自动化','ff8081813cfaad48013cfaad51520000'),('ff8081813cfaad48013cfaadc982014b','智能科学与技术','ff8081813cfaad48013cfaadc982014a'),('ff8081813cfaad48013cfaadc98d018e','计算机科学与技术','ff8081813cfaad48013cfaadc982014a'),('ff8081813cfaad48013cfaadc9a001e2','网络工程','ff8081813cfaad48013cfaadc982014a'),('ff8081813cfaad48013cfaadc9ac0231','信息安全','ff8081813cfaad48013cfaadc982014a'),('ff8081813cfaad48013cfaae2b56027a','工硕','ff8081813cfaad48013cfaae2b550279'),('ff8081813cfaad48013cfaae2c13027d','光信息科学与技术','ff8081813cfaad48013cfaae2c13027c'),('ff8081813cfaad48013cfaae2c1d02c2','电子信息科学与技术','ff8081813cfaad48013cfaae2c13027c'),('ff8081813cfaad48013cfaae2c260309','电子科学与技术','ff8081813cfaad48013cfaae2c13027c'),('ff8081813cfaad48013cfaae6ead0353','经济学','ff8081813cfaad48013cfaae6ead0352'),('ff8081813cfaad48013cfaae6eae0355','工商管理','ff8081813cfaad48013cfaae6ead0352'),('ff8081813cfaad48013cfaae6eae0357','工程管理','ff8081813cfaad48013cfaae6ead0352'),('ff8081813cfac4de013cfac4e5c60001','全校选','ff8081813cfac4de013cfac4e5af0000');
/*!40000 ALTER TABLE `MAJOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE` (
  `id` varchar(32) NOT NULL,
  `resource_real_name` varchar(255) DEFAULT NULL,
  `upload_user_id` varchar(32) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `resource_type` varchar(10) DEFAULT NULL,
  `key_words` varchar(255) DEFAULT NULL,
  `resource_mark` int(3) DEFAULT NULL,
  `resource_size` bigint(20) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `download_times` int(5) DEFAULT NULL,
  `share_times` int(5) DEFAULT NULL,
  `collect_times` int(5) DEFAULT NULL,
  `resource_snapshot_path` varchar(255) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1A51B40E3B31188D` (`upload_user_id`),
  CONSTRAINT `FK1A51B40E3B31188D` FOREIGN KEY (`upload_user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE`
--

LOCK TABLES `RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE` VALUES ('8ae9a9623d144526013d1446023e0000','chrome_frame_helper.dll','ff8081813cfa9f16013cfa9f1e130001','2013-02-26 10:12:45','chrome_frame_helper.dll','dll',NULL,0,57448,NULL,0,0,0,NULL,1),('ff8080813d010908013d0eb3a3a70001','下学期本科生课表-终稿.xls','ff8081813cfa9f16013cfa9f1e5a0003','2013-02-25 08:14:46','下学期本科生课表-终稿.xls','xls',NULL,0,87552,NULL,1,0,0,NULL,1),('ff8080813d010908013d10d033410002','418.c','ff8081813cfa9f16013cfa9f1e130001','2013-02-25 18:05:12','418.c','c',NULL,0,589,NULL,1,0,0,NULL,1),('ff8080813d010908013d1fd025240003','李博洋开题报告.docx','ff8081813cfa9f16013cfa9f1e130001','2013-02-28 15:59:27',NULL,'docx',NULL,0,63607,NULL,0,0,0,NULL,0),('ff8080813d010908013d1fd1a1370004','vim使用图谱.jpg','ff8081813cfa9f16013cfa9f1e130001','2013-02-28 16:01:04',NULL,'jpg',NULL,0,235479,NULL,0,0,0,NULL,0),('ff8080813d010908013d1fdb80e00005','MyEclipse 6 Java 开发中文教程_免费电子版.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-02-28 16:11:51',NULL,'pdf',NULL,0,4952460,NULL,0,0,0,NULL,0),('ff8080813d010908013d1fdf98510006','MyEclipse 6 Java 开发中文教程_免费电子版.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-02-28 16:16:20','MyEclipse 6 Java 开发中文教程_免费电子版.pdf','pdf',NULL,0,4952460,NULL,20,0,0,NULL,0),('ff8080813d010908013d1fdffc140007','JAVA API官方文档中文版.CHM','ff8081813cfa9f16013cfa9f1e130001','2013-02-28 16:16:45','JAVA API官方文档中文版.CHM','CHM',NULL,0,19327009,NULL,278,0,0,NULL,0),('ff8080813d010908013d1fe442710008','JAVA API官方文档中文版.CHM','ff8081813cfa9f16013cfa9f1e130001','2013-02-28 16:21:25',NULL,'CHM',NULL,0,19327009,NULL,0,0,0,NULL,0),('ff8080813d010908013d1fe609660009','例题.rar','ff8081813cfa9f16013cfa9f1e130001','2013-02-28 16:23:22','例题.rar','rar',NULL,0,618016,NULL,31,0,0,NULL,0),('ff8080813d010908013d201875c6000b','第一次上机实验 实验报告.doc','ff8081813cfa9f16013cfa9f1e130001','2013-02-28 17:18:26','第一次上机实验 实验报告.doc','doc',NULL,0,51200,NULL,27,0,0,NULL,0),('ff8080813d20dd0b013d23507ea90000','chrome_100_percent.pak','ff8081813cfa9f16013cfa9f1e130001','2013-03-01 08:18:30',NULL,'pak',NULL,0,1020505,NULL,0,0,0,NULL,0),('ff8080813d20dd0b013d235d713e0001','JAVA语言与程序设计-第一讲-绪论-2013.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-03-01 08:32:39','JAVA语言与程序设计-第一讲-绪论-2013.pdf','pdf',NULL,0,3426292,NULL,22,0,0,NULL,0),('ff8080813d20dd0b013d237dfbc80003','chrome_100_percent.pak','ff8081813cfa9f16013cfa9f1e130001','2013-03-01 09:08:11',NULL,'pak',NULL,0,1020505,NULL,0,0,0,NULL,0),('ff8080813d20dd0b013d2396d35b0004','chrome_100_percent.pak','ff8081813cfa9f16013cfa9f1e130001','2013-03-01 09:35:19',NULL,'pak',NULL,0,1020505,NULL,3,0,0,NULL,0),('ff8080813d20dd0b013d243867e40006','实验上机安排.pptx','ff8081813cfa9f16013cfa9f1e130001','2013-03-01 12:31:49','实验上机安排.pptx','pptx',NULL,0,76609,NULL,22,0,0,NULL,0),('ff8080813d258ddd013d441f2e470001','第二次上机实验 实验报告.doc','ff8081813cfa9f16013cfa9f1e130001','2013-03-07 17:12:06','第二次上机实验 实验报告.doc','doc',NULL,0,43008,NULL,25,0,0,NULL,0),('ff8080813d258ddd013d474dc5d70005','JAVA高级语言程序设计-第二讲.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-03-08 08:01:52','JAVA高级语言程序设计-第二讲.pdf','pdf',NULL,0,3022283,NULL,21,0,0,NULL,0),('ff8080813d258ddd013d474e03a40006','JAVA语言与程序设计-第三讲-01-类与对象.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-03-08 08:02:07','JAVA语言与程序设计-第三讲-01-类与对象.pdf','pdf',NULL,0,1266127,NULL,22,0,0,NULL,0),('ff8080813d5d91e7013d8c875e790000','第三次上机实验 实验报告.doc','ff8081813cfa9f16013cfa9f1e130001','2013-03-21 18:38:34','第三次上机实验 实验报告.doc','doc',NULL,0,32768,NULL,25,0,0,NULL,0),('ff8080813d5d91e7013d8c87a6010001','JAVA语言与程序设计-第三讲-02-对象的使用.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-03-21 18:38:52','JAVA语言与程序设计-第三讲-02-对象的使用.pdf','pdf',NULL,0,1512981,NULL,18,0,0,NULL,0),('ff8080813d5d91e7013d8cbfe1770003','JAVA语言与程序设计-第三讲-03-访问权限及封装性.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-03-21 19:40:18','JAVA语言与程序设计-第三讲-03-访问权限及封装性.pdf','pdf',NULL,0,532083,NULL,18,0,0,NULL,0),('ff8080813d5d91e7013d8cbff60c0004','JAVA语言与程序设计-第三讲-04-类的继承性.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-03-21 19:40:23','JAVA语言与程序设计-第三讲-04-类的继承性.pdf','pdf',NULL,0,547060,NULL,26,0,0,NULL,0),('ff8080813d5d91e7013d8cc0076b0005','JAVA语言与程序设计-第三讲-05-super与多态.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-03-21 19:40:27','JAVA语言与程序设计-第三讲-05-super与多态.pdf','pdf',NULL,0,251145,NULL,19,0,0,NULL,0),('ff8080813d5d91e7013df8795c9c0007','第四次上机实验 实验报告.doc','ff8081813cfa9f16013cfa9f1e130001','2013-04-11 17:42:15','第四次上机实验 实验报告.doc','doc',NULL,0,36864,NULL,22,0,0,NULL,0),('ff8080813d5d91e7013df8e3de850008','JAVA语言与程序设计-第四讲-01-抽象类与接口.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-04-11 19:38:36','JAVA语言与程序设计-第四讲-01-抽象类与接口.pdf','pdf',NULL,0,2691157,NULL,23,0,0,NULL,0),('ff8080813d5d91e7013df8e400300009','JAVA语言与程序设计-第四讲-02-常用类.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-04-11 19:38:44','JAVA语言与程序设计-第四讲-02-常用类.pdf','pdf',NULL,0,1579136,NULL,21,0,0,NULL,0),('ff8080813e0129bc013e1ce47d300000','JAVA语言与程序设计-第五讲-图形用户界面.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-04-18 19:25:36','JAVA语言与程序设计-第五讲-图形用户界面.pdf','pdf',NULL,0,1216604,NULL,21,0,0,NULL,0),('ff8080813e0129bc013e1ce4c4340001','第五次上机实验 实验报告.doc','ff8081813cfa9f16013cfa9f1e130001','2013-04-18 19:25:54','第五次上机实验 实验报告.doc','doc',NULL,0,64000,NULL,19,0,0,NULL,0),('ff8080813e0129bc013e891717190002','第六次上机实验 实验报告.doc','ff8081813cfa9f16013cfa9f1e130001','2013-05-09 19:39:51','第六次上机实验 实验报告.doc','doc',NULL,0,38400,NULL,22,0,0,NULL,0),('ff8080813e0129bc013e8918ec070003','JAVA语言与程序设计-第六讲-Applet.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-05-09 19:41:52','JAVA语言与程序设计-第六讲-Applet.pdf','pdf',NULL,0,2208282,NULL,33,0,0,NULL,0),('ff8080813e0129bc013e891939fb0004','JAVA语言与程序设计-第七讲-异常处理.pdf','ff8081813cfa9f16013cfa9f1e130001','2013-05-09 19:42:11','JAVA语言与程序设计-第七讲-异常处理.pdf','pdf',NULL,0,1001735,NULL,29,0,0,NULL,0),('ff8080813e0129bc013ee36d90380005','JAVA语言与程序设计-第八讲-02-多线程的同步机制.ppt','ff8081813cfa9f16013cfa9f1e130001','2013-05-27 08:40:08','第六次上机实验 实验报告.doc','ppt',NULL,0,234496,NULL,13,0,0,NULL,0),('ff8080813e0129bc013ee36d92600006','JAVA语言与程序设计-第八讲-多线程.ppt','ff8081813cfa9f16013cfa9f1e130001','2013-05-27 08:40:09','第六次上机实验 实验报告.doc','ppt',NULL,0,839680,NULL,14,0,0,NULL,0),('ff8080813e0129bc013ee36d93b00007','JAVA语言与程序设计-第七讲-异常处理.ppt','ff8081813cfa9f16013cfa9f1e130001','2013-05-27 08:40:09','第六次上机实验 实验报告.doc','ppt',NULL,0,657920,NULL,12,0,0,NULL,0),('ff8080813e0129bc013ee36d94100008','第六次上机实验 实验报告.doc','ff8081813cfa9f16013cfa9f1e130001','2013-05-27 08:40:09','第六次上机实验 实验报告.doc','doc',NULL,0,65536,NULL,15,0,0,NULL,0);
/*!40000 ALTER TABLE `RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_COURSE`
--

DROP TABLE IF EXISTS `RESOURCE_COURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_COURSE` (
  `resource_id` varchar(32) NOT NULL DEFAULT '',
  `course_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`resource_id`,`course_id`),
  KEY `FKF2B2116C193D896B` (`resource_id`),
  KEY `FKF2B2116C809BDA8B` (`course_id`),
  CONSTRAINT `FKF2B2116C809BDA8B` FOREIGN KEY (`course_id`) REFERENCES `COURSE` (`id`),
  CONSTRAINT `FKF2B2116C193D896B` FOREIGN KEY (`resource_id`) REFERENCES `RESOURCE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_COURSE`
--

LOCK TABLES `RESOURCE_COURSE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_COURSE` DISABLE KEYS */;
INSERT INTO `RESOURCE_COURSE` VALUES ('8ae9a9623d144526013d1446023e0000','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d010908013d0eb3a3a70001','ff8081813cfaad48013cfaae2b56027b'),('ff8080813d010908013d10d033410002','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d010908013d1fdf98510006','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d010908013d1fdffc140007','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d010908013d1fe609660009','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d010908013d201875c6000b','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d20dd0b013d235d713e0001','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d20dd0b013d243867e40006','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d258ddd013d441f2e470001','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d258ddd013d474dc5d70005','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d258ddd013d474e03a40006','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d5d91e7013d8c875e790000','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d5d91e7013d8c87a6010001','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d5d91e7013d8cbfe1770003','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d5d91e7013d8cbff60c0004','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d5d91e7013d8cc0076b0005','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d5d91e7013df8795c9c0007','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d5d91e7013df8e3de850008','ff8081813cfac4de013cfac4e5c80009'),('ff8080813d5d91e7013df8e400300009','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013e1ce47d300000','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013e1ce4c4340001','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013e891717190002','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013e8918ec070003','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013e891939fb0004','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013ee36d90380005','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013ee36d92600006','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013ee36d93b00007','ff8081813cfac4de013cfac4e5c80009'),('ff8080813e0129bc013ee36d94100008','ff8081813cfac4de013cfac4e5c80009');
/*!40000 ALTER TABLE `RESOURCE_COURSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_RECOMMEND`
--

DROP TABLE IF EXISTS `RESOURCE_RECOMMEND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_RECOMMEND` (
  `id` varchar(32) NOT NULL,
  `resource_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `rs_rmd_id` varchar(32) DEFAULT NULL,
  `read_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_RECOMMEND`
--

LOCK TABLES `RESOURCE_RECOMMEND` WRITE;
/*!40000 ALTER TABLE `RESOURCE_RECOMMEND` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_RECOMMEND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUB_TOPIC`
--

DROP TABLE IF EXISTS `SUB_TOPIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUB_TOPIC` (
  `id` varchar(32) NOT NULL,
  `reply_topic_id` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `author_id` varchar(32) DEFAULT NULL,
  `pub_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDA30623032FFE70B` (`author_id`),
  KEY `FKDA306230A61AB83E` (`reply_topic_id`),
  CONSTRAINT `FKDA306230A61AB83E` FOREIGN KEY (`reply_topic_id`) REFERENCES `TOPIC` (`id`),
  CONSTRAINT `FKDA30623032FFE70B` FOREIGN KEY (`author_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUB_TOPIC`
--

LOCK TABLES `SUB_TOPIC` WRITE;
/*!40000 ALTER TABLE `SUB_TOPIC` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUB_TOPIC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAG`
--

DROP TABLE IF EXISTS `TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAG` (
  `id` varchar(32) NOT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `reference_times` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAG`
--

LOCK TABLES `TAG` WRITE;
/*!40000 ALTER TABLE `TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAG_RESOURCE`
--

DROP TABLE IF EXISTS `TAG_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAG_RESOURCE` (
  `tag_id` varchar(32) NOT NULL DEFAULT '',
  `resource_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`,`resource_id`),
  KEY `FK3470EB33193D896B` (`resource_id`),
  KEY `FK3470EB33E30E5669` (`tag_id`),
  CONSTRAINT `FK3470EB33E30E5669` FOREIGN KEY (`tag_id`) REFERENCES `TAG` (`id`),
  CONSTRAINT `FK3470EB33193D896B` FOREIGN KEY (`resource_id`) REFERENCES `RESOURCE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAG_RESOURCE`
--

LOCK TABLES `TAG_RESOURCE` WRITE;
/*!40000 ALTER TABLE `TAG_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAG_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TOPIC`
--

DROP TABLE IF EXISTS `TOPIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TOPIC` (
  `id` varchar(32) NOT NULL,
  `community_id` varchar(32) DEFAULT NULL,
  `author_id` varchar(32) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `pub_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4C4D50F32FFE70B` (`author_id`),
  KEY `FK4C4D50FDF3410C9` (`community_id`),
  CONSTRAINT `FK4C4D50FDF3410C9` FOREIGN KEY (`community_id`) REFERENCES `COMMUNITY` (`id`),
  CONSTRAINT `FK4C4D50F32FFE70B` FOREIGN KEY (`author_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TOPIC`
--

LOCK TABLES `TOPIC` WRITE;
/*!40000 ALTER TABLE `TOPIC` DISABLE KEYS */;
INSERT INTO `TOPIC` VALUES ('ff8080813d010908013d0afcf4f30000','ff8081813cfac5a2013cfac62cc50001','ff8081813cfa9f16013cfa9f1e130001','欢迎大家选修Java课程','欢迎大家选修Java课程，本学期课程将分为课堂课和上机课，成绩以上机课实验室报告及期末程序作业组成。\r\n\r\n祝大家学习愉快~','2013-02-24 14:56:22'),('ff8080813d20dd0b013d235e35e30002','ff8081813cfac5a2013cfac62cc50001','ff8081813cfa9f16013cfa9f1e130001','课程资源已经上传','第一章讲义；\r\n第一次上机实验报告；\r\n例题；\r\njava API文档；\r\n开发教程。','2013-03-01 08:33:29'),('ff8080813d20dd0b013d243837690005','ff8081813cfac5a2013cfac62cc50001','ff8081813cfa9f16013cfa9f1e130001','上机时间已经确定','请下载上机时间安排ppt即可。','2013-03-01 12:31:36'),('ff8080813d258ddd013d441fac700002','ff8081813cfac5a2013cfac62cc50001','ff8081813cfa9f16013cfa9f1e130001','第二次上机实验报告 已上传','已上传《第二次上机实验报告》。','2013-03-07 17:12:39'),('ff8080813d258ddd013d443d86050003','ff8081813cfac5a2013cfac62cc50001','ff8081813cfa9f16013cfa9f1e130001','助教邮箱','实验报告提交邮箱\r\n\r\n张昕<zx150842@gmail.com>','2013-03-07 17:45:15'),('ff8080813d258ddd013d44734c6a0004','ff8081813cfac5a2013cfac62cc50001','402880043d575041013d57504ccc0004','张昕邮箱','zx150842@gmail.com','2013-03-07 18:43:59'),('ff8080813d488d4d013d5828bf940000','ff8081813cfab1b6013cfab7c5f00002','ff8081813d010e5f013d01121c6521a4','111','2222','2013-03-11 14:34:58');
/*!40000 ALTER TABLE `TOPIC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `id` varchar(32) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `first_login_time` datetime DEFAULT NULL,
  `activity` int(5) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `user_birth` date DEFAULT NULL,
  `user_gender` int(11) DEFAULT NULL,
  `user_teleph` varchar(40) DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_BEHAVIOR`
--

DROP TABLE IF EXISTS `USER_BEHAVIOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_BEHAVIOR` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `behavior_type` int(11) DEFAULT NULL,
  `resource_id` varchar(32) DEFAULT NULL,
  `topic_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_BEHAVIOR`
--

LOCK TABLES `USER_BEHAVIOR` WRITE;
/*!40000 ALTER TABLE `USER_BEHAVIOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_BEHAVIOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_COLLECT_RESOURCE`
--

DROP TABLE IF EXISTS `USER_COLLECT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_COLLECT_RESOURCE` (
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `resource_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`resource_id`),
  KEY `FK901F3197D246F4CB` (`user_id`),
  KEY `FK901F3197193D896B` (`resource_id`),
  CONSTRAINT `FK901F3197193D896B` FOREIGN KEY (`resource_id`) REFERENCES `RESOURCE` (`id`),
  CONSTRAINT `FK901F3197D246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_COLLECT_RESOURCE`
--

LOCK TABLES `USER_COLLECT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `USER_COLLECT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_COLLECT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_DOWNLOAD_RESOURCE`
--

DROP TABLE IF EXISTS `USER_DOWNLOAD_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_DOWNLOAD_RESOURCE` (
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `resource_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`resource_id`),
  KEY `FK659CD671D246F4CB` (`user_id`),
  KEY `FK659CD671193D896B` (`resource_id`),
  CONSTRAINT `FK659CD671193D896B` FOREIGN KEY (`resource_id`) REFERENCES `RESOURCE` (`id`),
  CONSTRAINT `FK659CD671D246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_DOWNLOAD_RESOURCE`
--

LOCK TABLES `USER_DOWNLOAD_RESOURCE` WRITE;
/*!40000 ALTER TABLE `USER_DOWNLOAD_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_DOWNLOAD_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FOLLOW_COURSE`
--

DROP TABLE IF EXISTS `USER_FOLLOW_COURSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FOLLOW_COURSE` (
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `course_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`course_id`),
  KEY `FK49AC7EF5D246F4CB` (`user_id`),
  KEY `FK49AC7EF5809BDA8B` (`course_id`),
  CONSTRAINT `FK49AC7EF5809BDA8B` FOREIGN KEY (`course_id`) REFERENCES `COURSE` (`id`),
  CONSTRAINT `FK49AC7EF5D246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FOLLOW_COURSE`
--

LOCK TABLES `USER_FOLLOW_COURSE` WRITE;
/*!40000 ALTER TABLE `USER_FOLLOW_COURSE` DISABLE KEYS */;
INSERT INTO `USER_FOLLOW_COURSE` VALUES ('402880043d575041013d57504ccc0004','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d57504dc20005','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d57504e480006','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d57504f3f0007','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d57504fad0008','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d575050b8000a','ff8081813cfaad48013cfaadc99701b9'),('402880043d575041013d575050b8000a','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d575051a4000b','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d57505261000c','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d5750538c000e','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d575054a80010','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d575055600011','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d575055f10012','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d5750564f0013','ff8081813cfaad48013cfaae2c160290'),('402880043d575041013d5750564f0013','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d575057470014','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d575057d60015','ff8081813cfaad48013cfaadc99701b9'),('402880043d575041013d575057d60015','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d575059840018','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d57505a330019','ff8081813cfac4de013cfac4e5c80009'),('402880043d575041013d57505adf001a','ff8081813cfac4de013cfac4e5c80009'),('ff8081813cfa9f16013cfa9f1e130001','ff8081813cfac4de013cfac4e5c80009'),('ff8081813cfa9f16013cfa9f1e390002','ff8081813cfaad48013cfaadc9a001e5'),('ff8081813cfa9f16013cfa9f1e5a0003','ff8081813cfaad48013cfaae2b56027b'),('ff8081813cfa9f16013cfa9f1eff0005','ff8081813cfaad48013cfaae2c2102e0'),('ff8081813cfa9f16013cfa9f1f6f0006','ff8081813cfaad48013cfaad5192008d'),('ff8081813cfa9f16013cfa9f1fc80007','ff8081813cfaad48013cfaae6ead0354'),('ff8081813cfa9f16013cfa9f1fc80007','ff8081813cfaad48013cfaae6eae0356'),('ff8081813cfa9f16013cfa9f1fc80007','ff8081813cfaad48013cfaae6eae0358'),('ff8081813cfab679013cfab67fbe0000','ff8081813cfaad48013cfaadc98c0187'),('ff8081813cfab679013cfab67fbe0000','ff8081813cfaad48013cfaadc9a101e8'),('ff8081813cfab679013cfab67fbe0000','ff8081813cfaad48013cfaae2c2302f0'),('ff8081813d010e5f013d01121c6521a4','ff8081813cfac4de013cfac4e5c80009'),('ff8081813d010e5f013d0112589623f8','ff8081813cfac4de013cfac4e5c80009'),('ff8081813d010e5f013d01131d6f2b75','ff8081813cfac4de013cfac4e5c80009'),('ff8081813d010e5f013d01132e172c23','ff8081813cfac4de013cfac4e5c80009'),('ff8081813d010e5f013d0118fe9f6987','ff8081813cfaad48013cfaadc99b01cd'),('ff8081813d010e5f013d0118fe9f6987','ff8081813cfaad48013cfaadc9a50206'),('ff8081813d010e5f013d0118fe9f6987','ff8081813cfac4de013cfac4e5c80009'),('ff8081813d010e5f013d0119d5a672a9','ff8081813cfac4de013cfac4e5c80009'),('ff8081813d010e5f013d0119d5df72ab','ff8081813cfaad48013cfaae2c2a032d'),('ff8081813d010e5f013d0119d5df72ab','ff8081813cfac4de013cfac4e5c80009');
/*!40000 ALTER TABLE `USER_FOLLOW_COURSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FOLLOW_MAJOR`
--

DROP TABLE IF EXISTS `USER_FOLLOW_MAJOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FOLLOW_MAJOR` (
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `major_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`major_id`),
  KEY `FK44F74F7FD246F4CB` (`user_id`),
  KEY `FK44F74F7F874BAE49` (`major_id`),
  CONSTRAINT `FK44F74F7F874BAE49` FOREIGN KEY (`major_id`) REFERENCES `MAJOR` (`id`),
  CONSTRAINT `FK44F74F7FD246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FOLLOW_MAJOR`
--

LOCK TABLES `USER_FOLLOW_MAJOR` WRITE;
/*!40000 ALTER TABLE `USER_FOLLOW_MAJOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FOLLOW_MAJOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_RELATION`
--

DROP TABLE IF EXISTS `USER_RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_RELATION` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `friend_id` varchar(32) DEFAULT NULL,
  `follow_id` varchar(32) DEFAULT NULL,
  `friend_group_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_RELATION`
--

LOCK TABLES `USER_RELATION` WRITE;
/*!40000 ALTER TABLE `USER_RELATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_RELATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SHARE_RESOURCE`
--

DROP TABLE IF EXISTS `USER_SHARE_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SHARE_RESOURCE` (
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `resource_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`resource_id`),
  KEY `FK486DEF82D246F4CB` (`user_id`),
  KEY `FK486DEF82193D896B` (`resource_id`),
  CONSTRAINT `FK486DEF82193D896B` FOREIGN KEY (`resource_id`) REFERENCES `RESOURCE` (`id`),
  CONSTRAINT `FK486DEF82D246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SHARE_RESOURCE`
--

LOCK TABLES `USER_SHARE_RESOURCE` WRITE;
/*!40000 ALTER TABLE `USER_SHARE_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SHARE_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_TAG`
--

DROP TABLE IF EXISTS `USER_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_TAG` (
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `tag_id` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `FK1ED77906D246F4CB` (`user_id`),
  KEY `FK1ED77906E30E5669` (`tag_id`),
  CONSTRAINT `FK1ED77906E30E5669` FOREIGN KEY (`tag_id`) REFERENCES `TAG` (`id`),
  CONSTRAINT `FK1ED77906D246F4CB` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_TAG`
--

LOCK TABLES `USER_TAG` WRITE;
/*!40000 ALTER TABLE `USER_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_TAG` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-05 17:30:34