-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: boma
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin123','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `trade_id` int(11) NOT NULL,
  `isCase` varchar(1) NOT NULL DEFAULT 'n',
  `parentCompanyId` int(11) DEFAULT NULL,
  `logo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_company_trade1_idx` (`trade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'中奥科技','浙江省某创业板上市it互联网公司，主要产品行业平台和大数据挖掘，450人以上，年销售额10亿以上。',1,'n',0,15),(2,'华立集团','浙江某知名工业自动化上市公司，年销售额8亿，员工1000人，主要产品是品种齐全的大小电机、自动化产品等，产品分布国内外市场，侧重外销。',1,'n',0,13),(3,'BoMa','BoMa',1,'n',4,10),(4,'qingke','qingke',1,'n',0,11),(5,'mi','',2,'n',0,12),(6,'汇源','汇源果汁特别好喝',9,'y',0,4),(7,'万达','老公的公司',7,'y',0,5),(8,'浙二','浙江大学第二附属医院',5,'y',0,6),(9,'Nike','很贵的衣服',6,'n',0,7);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (2,'1'),(3,'2'),(6,'产品经理'),(1,'总经理'),(5,'护士长'),(4,'销售总监');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logo`
--

DROP TABLE IF EXISTS `logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `img_UNIQUE` (`img`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logo`
--

LOCK TABLES `logo` WRITE;
/*!40000 ALTER TABLE `logo` DISABLE KEYS */;
INSERT INTO `logo` VALUES (15,'12a17bcb-2544-4b01-8145-312068e77bac.png'),(13,'203a6bb8-20d2-464d-b586-8ad6e3ee4b5a.png'),(14,'2493ab2e-da81-474e-b4bd-01e9c6c64046.png'),(4,'362bb159-2362-4309-8c5b-1a36ad312e72.jpg'),(7,'449deda0-3de5-430e-b8ae-c17630f2a240.jpg'),(3,'47320c2d-674e-454d-af02-8c72a1002d3e.jpg'),(10,'58437403-12cc-4b8a-9381-8be7a0804d95.jpg'),(9,'5aecfc4f-f1cf-4278-8394-33b4aeff4bee.jpg'),(2,'69481301-9d6a-42a8-abc9-8faf5bd33fcc.jpg'),(5,'6f6081e6-f219-402f-89f4-1f7ea12dbf2f.jpg'),(8,'794c3d9f-92fe-4919-880a-5991ba6784ab.jpg'),(6,'85c985cc-3fda-4aaf-8107-b4b1af5dd8bd.jpg'),(1,'860f0f05-003b-4826-90c9-aea8ae2e1606.jpg'),(11,'9f296182-d9b2-4832-838b-82bb29374089.jpg'),(12,'b513933d-dc9e-4529-b4c1-b09e622a35ad.png');
/*!40000 ALTER TABLE `logo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `job` varchar(45) DEFAULT NULL,
  `showname` varchar(45) DEFAULT NULL,
  `comment` varchar(500) NOT NULL,
  `company_id` int(11) NOT NULL,
  `isPraise` varchar(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `fk_manager_company_idx` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'qq','it','q总','无',1,'y'),(2,'aa','it','a总','无',1,'y'),(3,'bb','',NULL,'无',1,'y'),(4,'cc','',NULL,'无',5,'n'),(5,'vv','',NULL,'vv',2,'y'),(6,'nn','',NULL,'无',1,'y'),(7,'mm','',NULL,'无',5,'y'),(8,'qq','',NULL,'无',5,'y'),(9,'ww','',NULL,'无',3,'y'),(10,'ee','',NULL,'无',1,'n'),(11,'wongya','yiyingjio',NULL,'wongya',4,'y');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `birth` date NOT NULL,
  `gender` varchar(1) NOT NULL,
  `marry` varchar(1) NOT NULL,
  `educational` varchar(45) NOT NULL,
  `registry` varchar(45) NOT NULL,
  `height` double NOT NULL,
  `domicile` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `requireJob` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (4,'小可爱','2017-01-01','0','0','幼儿园','浙江杭州',120,'浙江杭州','我可爱呀','让我火'),(5,'狗蛋','1992-02-02','1','0','小学','浙江杭州',165,'浙江杭州','我很强，但是穷。有志气，但是没有知识。','钱多就好'),(6,'萧炎','2017-01-01','1','0','博士后','斗罗大陆',150,'斗罗大陆萧家','我帅，实力强、、','都行'),(7,'马大哈','1987-02-02','0','0','专科','浙江杭州',150,'浙江杭州','做事马虎','有钱 工作不累就行'),(8,'孙晓小','2001-01-01','0','0','本科','浙江杭州',165,'浙江杭州','技术强，有实力','10k'),(10,'张三','1999-09-09','1','0','本科','杭州',170,'杭州','嘿嘿嘿','java开发实习生'),(11,'李四','1999-09-09','1','0','本科','浙江',180,'杭州','活泼可爱','销售总监'),(12,'得瑟','2222-02-02','0','0','本科','浙江杭州',123,'浙江杭州','送双杀','送双杀');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `isShow` varchar(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `fk_recommend_person1_idx` (`person_id`),
  KEY `fk_recommend_job1_idx` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend`
--

LOCK TABLES `recommend` WRITE;
/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
INSERT INTO `recommend` VALUES (4,5,6,'1'),(5,8,1,'1'),(6,7,5,'1'),(7,6,4,'1'),(9,10,6,'1'),(10,7,6,'1'),(11,10,5,'1');
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit`
--

DROP TABLE IF EXISTS `recruit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) NOT NULL,
  `salary` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `requirement` varchar(1000) NOT NULL,
  `isShow` varchar(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`id`),
  KEY `fk_recruit_company1_idx` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit`
--

LOCK TABLES `recruit` WRITE;
/*!40000 ALTER TABLE `recruit` DISABLE KEYS */;
INSERT INTO `recruit` VALUES (1,'浙江省某创业板上市it互联网公司，主要产品行业平台和大数据挖掘，450人以上，年销售额10亿以上。','30-35w','杭州',1,'诚聘人资经理','1、基本要求：管理岗位全日制本科以上学历；28-35岁；<br/>2、经验：3年以上制造业人事主管以上工作经验；<br/>3、技能：熟悉人力资源管理各个模块原理，具备良好的团队建设及人才梯队建设能力；<br/>4、素养：具备良好的人际交往，理解领悟表达能力，行动计划实施的执行能力及讲授能力。','y'),(2,'浙江某知名工业自动化上市公司，年销售额8亿，员工1000人，主要产品是品种齐全的大小电机、自动化产品等，产品分布国内外市场，侧重外销。','40w ','浙江某地级市',1,'诚聘人资总监','1、基本要求：管理岗位全日制本科以上学历；28-35岁；','y'),(40,'浙江省某创业板上市it互联网公司，主要产品行业平台和大数据挖掘，450人以上，年销售额10亿以上。','30-35w','杭州',4,'诚聘人资经理','1、基本要求：管理岗位全日制本科以上学历；28-35岁；<br/>2、经验：3年以上制造业人事主管以上工作经验；<br/>3、技能：熟悉人力资源管理各个模块原理，具备良好的团队建设及人才梯队建设能力；<br/>4、素养：具备良好的人际交往，理解领悟表达能力，行动计划实施的执行能力及讲授能力。','y'),(41,'浙江省某创业板上市it互联网公司，主要产品行业平台和大数据挖掘，450人以上，年销售额10亿以上。','30-35w','杭州',3,'诚聘人资经理','1、基本要求：管理岗位全日制本科以上学历；28-35岁；<br/>2、经验：3年以上制造业人事主管以上工作经验；<br/>3、技能：熟悉人力资源管理各个模块原理，具备良好的团队建设及人才梯队建设能力；<br/>4、素养：具备良好的人际交往，理解领悟表达能力，行动计划实施的执行能力及讲授能力。','y');
/*!40000 ALTER TABLE `recruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES (3,'foot'),(1,'it'),(2,'service'),(4,'信息'),(5,'医疗'),(7,'房地产'),(6,'服装'),(8,'榴莲'),(9,'食品');
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_job`
--

DROP TABLE IF EXISTS `trade_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `isShow` varchar(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `fk_trade_job_trade1_idx` (`trade_id`),
  KEY `fk_trade_job_job1_idx` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_job`
--

LOCK TABLES `trade_job` WRITE;
/*!40000 ALTER TABLE `trade_job` DISABLE KEYS */;
INSERT INTO `trade_job` VALUES (1,1,1,'n'),(2,1,2,'n'),(3,1,3,'n'),(4,2,2,'n'),(5,3,4,'n'),(6,3,2,'n'),(7,9,1,'y'),(8,5,5,'n'),(9,4,6,'y');
/*!40000 ALTER TABLE `trade_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'boma'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-21 17:43:52
