/*
SQLyog Ultimate v12.2.6 (64 bit)
MySQL - 5.7.20-log : Database - crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crm`;

/*Table structure for table `bank_chance` */

DROP TABLE IF EXISTS `bank_chance`;

CREATE TABLE `bank_chance` (
  `chan_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '商机id',
  `chan_name` varchar(64) NOT NULL COMMENT '商机名称',
  `chan_cust_id` bigint(32) NOT NULL COMMENT '客户id',
  `chan_user_id` bigint(32) NOT NULL COMMENT '负责人id',
  `chan_money` int(16) DEFAULT NULL COMMENT '商机金额',
  `chan_type` varchar(32) DEFAULT NULL COMMENT '商机类型',
  `chan_source` varchar(32) DEFAULT NULL COMMENT '商机来源',
  `chan_state` varchar(32) DEFAULT NULL COMMENT '商机状态',
  `chan_lkm_id` bigint(32) NOT NULL COMMENT '联系人id',
  `chan_linktime` date DEFAULT NULL COMMENT '联系时间',
  `chan_desc` varchar(1024) DEFAULT NULL COMMENT '机会描述',
  PRIMARY KEY (`chan_id`),
  KEY `FK_sale_chance_chan_user_id` (`chan_user_id`),
  KEY `FK_sale_chance_chan_cust_id` (`chan_cust_id`),
  KEY `FK11jsl8xoqu5y9sb5388g5aitk` (`chan_type`),
  KEY `FK45fw9571b7j1ax32gh21ny3sn` (`chan_lkm_id`),
  CONSTRAINT `FK11jsl8xoqu5y9sb5388g5aitk` FOREIGN KEY (`chan_type`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `FK2tg8wg3lvtnhctf9nr8b9aoq6` FOREIGN KEY (`chan_cust_id`) REFERENCES `cst_customer` (`cust_id`),
  CONSTRAINT `FK45fw9571b7j1ax32gh21ny3sn` FOREIGN KEY (`chan_lkm_id`) REFERENCES `cst_linkman` (`lkm_id`),
  CONSTRAINT `FK4xsq0wjns37uvt3k81t928ghu` FOREIGN KEY (`chan_user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FK52fw9571b7j1ax32gh21ny3sn` FOREIGN KEY (`chan_lkm_id`) REFERENCES `cst_linkman` (`lkm_id`),
  CONSTRAINT `FK_sale_chance_chan_cust_id` FOREIGN KEY (`chan_cust_id`) REFERENCES `cst_customer` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sale_chance_chan_user_id` FOREIGN KEY (`chan_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `bank_visit` */

DROP TABLE IF EXISTS `bank_visit`;

CREATE TABLE `bank_visit` (
  `visit_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `visit_cust_id` bigint(32) DEFAULT NULL COMMENT '客户id',
  `visit_user_id` bigint(32) DEFAULT NULL COMMENT '负责人id',
  `visit_time` date DEFAULT NULL COMMENT '拜访时间',
  `visit_interviewee` varchar(32) DEFAULT NULL COMMENT '被拜访人',
  `visit_addr` varchar(128) DEFAULT NULL COMMENT '拜访地点',
  `visit_detail` varchar(256) DEFAULT NULL COMMENT '拜访详情',
  `visit_nexttime` date DEFAULT NULL COMMENT '下次拜访时间',
  `visit_lkm_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `FK_sale_visit_cust_id` (`visit_cust_id`),
  KEY `FK_sale_visit_user_id` (`visit_user_id`),
  KEY `FKichy31hne7lhxfsny6uftnqgw` (`visit_lkm_id`),
  CONSTRAINT `FK9m51djrmj03bca5qatgnxysb9` FOREIGN KEY (`visit_lkm_id`) REFERENCES `cst_linkman` (`lkm_id`),
  CONSTRAINT `FK_sale_visit_cust_id` FOREIGN KEY (`visit_cust_id`) REFERENCES `cst_customer` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sale_visit_user_id` FOREIGN KEY (`visit_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKc92iepd26mixxfiris92hccjx` FOREIGN KEY (`visit_user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FKgr4aivocixwcvkwxcmc0b4css` FOREIGN KEY (`visit_cust_id`) REFERENCES `cst_customer` (`cust_id`),
  CONSTRAINT `FKichy31hne7lhxfsny6uftnqgw` FOREIGN KEY (`visit_lkm_id`) REFERENCES `cst_linkman` (`lkm_id`),
  CONSTRAINT `FKlal8erfafapenjyfkuvmy5yjm` FOREIGN KEY (`visit_user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FKp2wr7uttrekepfbxntgeibiom` FOREIGN KEY (`visit_cust_id`) REFERENCES `cst_customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `base_dict` */

DROP TABLE IF EXISTS `base_dict`;

CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) DEFAULT NULL COMMENT '数据字典项目(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `cst_customer` */

DROP TABLE IF EXISTS `cst_customer`;

CREATE TABLE `cst_customer` (
  `cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(32) NOT NULL COMMENT '客户名称(公司名称)',
  `cust_user_id` bigint(32) DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` bigint(32) DEFAULT NULL COMMENT '创建人id',
  `cust_source` varchar(32) DEFAULT NULL COMMENT '客户信息来源',
  `cust_industry` varchar(32) DEFAULT NULL COMMENT '客户所属行业',
  `cust_level` varchar(32) DEFAULT NULL COMMENT '客户级别',
  `cust_linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `cust_phone` varchar(64) DEFAULT NULL COMMENT '固定电话',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '移动电话',
  `cust_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `FKeh5g36duab8g1h051pdjfwcgd` (`cust_source`),
  KEY `FK2xhr3arwp3tkuae1da4lqv352` (`cust_industry`),
  KEY `FKrty52nvbjg1echf0se39eng49` (`cust_level`),
  KEY `FKcjw3tx77b5s062khpun5kwi9e` (`cust_state`),
  CONSTRAINT `FK2xhr3arwp3tkuae1da4lqv352` FOREIGN KEY (`cust_industry`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `FKcjw3tx77b5s062khpun5kwi9e` FOREIGN KEY (`cust_state`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `FKeh5g36duab8g1h051pdjfwcgd` FOREIGN KEY (`cust_source`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `FKrty52nvbjg1echf0se39eng49` FOREIGN KEY (`cust_level`) REFERENCES `base_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;

/*Table structure for table `cst_customer_detail` */

DROP TABLE IF EXISTS `cst_customer_detail`;

CREATE TABLE `cst_customer_detail` (
  `cust_id` bigint(32) NOT NULL,
  `cust_region` varchar(64) DEFAULT NULL COMMENT '客户地区',
  `cust_zip` varchar(16) DEFAULT NULL COMMENT '客户邮政编码',
  `cust_address` varchar(128) DEFAULT NULL COMMENT '客户联系地址',
  `cust_fax` varchar(64) DEFAULT NULL COMMENT '客户传真',
  `cust_website` varchar(128) DEFAULT NULL COMMENT '客户网址',
  `cust_licence` varchar(64) DEFAULT NULL COMMENT '客户营业执照注册号',
  `cust_corporation` varchar(64) DEFAULT NULL COMMENT '企业法人',
  `cust_capital` bigint(16) DEFAULT NULL COMMENT '客户注册资金',
  `cust_bank` varchar(512) DEFAULT NULL COMMENT '开户银行及账号',
  `cust_pic` varchar(64) DEFAULT NULL COMMENT '客户资质图片',
  `cust_memo` longtext COMMENT '客户简介',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `cst_linkman` */

DROP TABLE IF EXISTS `cst_linkman`;

CREATE TABLE `cst_linkman` (
  `lkm_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '联系人编号(主键)',
  `lkm_name` varchar(16) DEFAULT NULL COMMENT '联系人姓名',
  `lkm_cust_id` bigint(32) NOT NULL COMMENT '客户id',
  `lkm_gender` char(1) DEFAULT NULL COMMENT '联系人性别',
  `lkm_phone` varchar(16) DEFAULT NULL COMMENT '联系人办公电话',
  `lkm_mobile` varchar(16) DEFAULT NULL COMMENT '联系人手机',
  `lkm_email` varchar(64) DEFAULT NULL COMMENT '联系人邮箱',
  `lkm_qq` varchar(16) DEFAULT NULL COMMENT '联系人qq',
  `lkm_position` varchar(16) DEFAULT NULL COMMENT '联系人职位',
  `lkm_memo` varchar(512) DEFAULT NULL COMMENT '联系人备注',
  PRIMARY KEY (`lkm_id`),
  KEY `FK_cst_linkman_lkm_cust_id` (`lkm_cust_id`),
  CONSTRAINT `FK_cst_linkman_lkm_cust_id` FOREIGN KEY (`lkm_cust_id`) REFERENCES `cst_customer` (`cust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKh9yp1nql5227xxcopuxqx2e7q` FOREIGN KEY (`lkm_cust_id`) REFERENCES `cst_customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_memo` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_code` varchar(32) NOT NULL COMMENT '用户账号',
  `user_name` varchar(64) NOT NULL COMMENT '用户名称',
  `user_password` varchar(32) NOT NULL COMMENT '用户密码',
  `user_state` bigint(32) NOT NULL COMMENT '1:正常,0:暂停',
  `user_profile_photo` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user_detail` */

DROP TABLE IF EXISTS `sys_user_detail`;

CREATE TABLE `sys_user_detail` (
  `user_detail_id` bigint(32) NOT NULL,
  `user_age` int(2) DEFAULT NULL COMMENT '年龄',
  `user_addr` varchar(128) DEFAULT NULL COMMENT '员工住址',
  `user_resume` longtext COMMENT '简历',
  PRIMARY KEY (`user_detail_id`),
  CONSTRAINT `FK_user_detail_id` FOREIGN KEY (`user_detail_id`) REFERENCES `sys_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `role_id` bigint(32) NOT NULL COMMENT '角色id',
  `user_id` bigint(32) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK_user_role_user_id` (`user_id`),
  CONSTRAINT `FK_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
