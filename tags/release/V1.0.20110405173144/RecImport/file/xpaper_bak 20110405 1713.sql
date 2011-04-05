-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema xpaper
--

CREATE DATABASE IF NOT EXISTS xpaper;
USE xpaper;

--
-- Definition of table `gp_account`
--

DROP TABLE IF EXISTS `gp_account`;
CREATE TABLE `gp_account` (
  `account_id` int(11) NOT NULL auto_increment,
  `account_loginName` varchar(20) default NULL,
  `account_password` varchar(20) default NULL,
  `account_question` varchar(20) default NULL,
  `account_answer` varchar(20) default NULL,
  `account_realname` varchar(20) default NULL,
  `account_sex` int(2) default NULL,
  `account_email` varchar(20) default NULL,
  `account_userphone` varchar(12) default NULL,
  `account_fax` varchar(12) default NULL,
  `account_usermobile` varchar(12) default NULL,
  `account_address` varchar(40) default NULL,
  `account_postcode` varchar(10) default NULL,
  `account_company` varchar(20) default NULL,
  `account_occupation` varchar(20) default NULL,
  `account_userpass` varchar(4) default NULL,
  `account_dt` date default NULL,
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_account`
--

/*!40000 ALTER TABLE `gp_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_account` ENABLE KEYS */;


--
-- Definition of table `gp_admin`
--

DROP TABLE IF EXISTS `gp_admin`;
CREATE TABLE `gp_admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `admin_ent_id` int(11) default NULL,
  `admin_name` varchar(50) default NULL,
  `admin_pass` varchar(50) default NULL,
  `admin_work` varchar(80) default NULL,
  `admin_rank` int(11) default NULL,
  `admin_showname` varchar(50) default NULL,
  `admin_email` varchar(100) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_admin`
--

/*!40000 ALTER TABLE `gp_admin` DISABLE KEYS */;
INSERT INTO `gp_admin` (`admin_id`,`admin_ent_id`,`admin_name`,`admin_pass`,`admin_work`,`admin_rank`,`admin_showname`,`admin_email`) VALUES 
 (87,107,'admin','e10adc3949ba59abbe56e057f20f883e','Xpaper多媒体数字报',100,'李总编','sales@jnostart.com');
/*!40000 ALTER TABLE `gp_admin` ENABLE KEYS */;


--
-- Definition of table `gp_base`
--

DROP TABLE IF EXISTS `gp_base`;
CREATE TABLE `gp_base` (
  `base_id` int(11) NOT NULL auto_increment,
  `base_ent_id` int(11) default NULL,
  `base_sitename` varchar(50) default NULL,
  `base_url` varchar(100) default NULL,
  `base_createtime` datetime default NULL,
  `base_sponser` varchar(100) default NULL,
  `base_address` text,
  `base_zip` varchar(50) default NULL,
  `base_tel` varchar(150) default NULL,
  `base_email` varchar(100) default NULL,
  `base_copyright` varchar(100) default NULL,
  `base_logo` text,
  `base_logo_header` text,
  `base_defaultimg` text,
  `base_pdf` int(11) default '0',
  `base_ps` int(11) default '0',
  `base_theme_id` int(11) default NULL,
  `base_allow_comment` int(11) default NULL,
  `base_paper_width` int(11) NOT NULL default '0',
  `base_old_url` varchar(200) default NULL,
  PRIMARY KEY  (`base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_base`
--

/*!40000 ALTER TABLE `gp_base` DISABLE KEYS */;
INSERT INTO `gp_base` (`base_id`,`base_ent_id`,`base_sitename`,`base_url`,`base_createtime`,`base_sponser`,`base_address`,`base_zip`,`base_tel`,`base_email`,`base_copyright`,`base_logo`,`base_logo_header`,`base_defaultimg`,`base_pdf`,`base_ps`,`base_theme_id`,`base_allow_comment`,`base_paper_width`,`base_old_url`) VALUES 
 (84,107,'Xpaper数字报刊','localhost','2008-04-13 13:40:59','北京金启程科技','北京市海淀区','100084','01062713015','sales@jinostart.com','','','','',0,0,8,0,380,'');
/*!40000 ALTER TABLE `gp_base` ENABLE KEYS */;


--
-- Definition of table `gp_block`
--

DROP TABLE IF EXISTS `gp_block`;
CREATE TABLE `gp_block` (
  `block_id` int(11) NOT NULL auto_increment,
  `block_template_id` int(11) default NULL,
  `block_name` varchar(50) default NULL,
  `block_order_num` int(11) default NULL,
  `block_word_count` int(11) default NULL,
  `block_have_pic` int(11) default NULL,
  `block_release_id` int(11) default NULL,
  `block_bgcolor` varchar(6) default NULL,
  `block_ent_id` int(11) default NULL,
  PRIMARY KEY  (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_block`
--

/*!40000 ALTER TABLE `gp_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_block` ENABLE KEYS */;


--
-- Definition of table `gp_comment`
--

DROP TABLE IF EXISTS `gp_comment`;
CREATE TABLE `gp_comment` (
  `comment_id` bigint(20) NOT NULL auto_increment,
  `comment_doc_id` bigint(20) default NULL,
  `comment_content` mediumtext,
  `comment_username` varchar(50) default NULL,
  `comment_tel` varchar(50) default NULL,
  `comment_ip` varchar(50) default NULL,
  `comment_time` datetime default NULL,
  `comment_status` int(11) default NULL,
  PRIMARY KEY  (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_comment`
--

/*!40000 ALTER TABLE `gp_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_comment` ENABLE KEYS */;


--
-- Definition of table `gp_contribute`
--

DROP TABLE IF EXISTS `gp_contribute`;
CREATE TABLE `gp_contribute` (
  `contribute_id` int(11) NOT NULL auto_increment,
  `contribute_title` varchar(255) default NULL,
  `contribute_author` varchar(255) default NULL,
  `contribute_dept` varchar(255) default NULL,
  `contribute_address` varchar(255) default NULL,
  `contribute_zip` varchar(255) default NULL,
  `contribute_email` varchar(255) default NULL,
  `contribute_tel` varchar(255) default NULL,
  `contribute_body` mediumtext,
  `contribute_time` datetime default NULL,
  `contribute_img` text,
  `contribute_status` int(11) default '0',
  `contribute_filesize` int(11) default '0',
  `contribute_ip` varchar(50) default NULL,
  `contribute_ent_id` int(11) default NULL,
  PRIMARY KEY  (`contribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_contribute`
--

/*!40000 ALTER TABLE `gp_contribute` DISABLE KEYS */;
INSERT INTO `gp_contribute` (`contribute_id`,`contribute_title`,`contribute_author`,`contribute_dept`,`contribute_address`,`contribute_zip`,`contribute_email`,`contribute_tel`,`contribute_body`,`contribute_time`,`contribute_img`,`contribute_status`,`contribute_filesize`,`contribute_ip`,`contribute_ent_id`) VALUES 
 (1,'fsfds','fsf','cxscxzcz','czxczx','43455','fds@we','4345454555','vfdsszc','2009-03-20 13:17:56','',0,0,'127.0.0.1',107);
/*!40000 ALTER TABLE `gp_contribute` ENABLE KEYS */;


--
-- Definition of table `gp_css`
--

DROP TABLE IF EXISTS `gp_css`;
CREATE TABLE `gp_css` (
  `css_id` int(11) NOT NULL auto_increment,
  `css_name` varchar(50) default NULL,
  `css_isDefault` int(11) default NULL,
  `css_type` int(11) default NULL,
  `css_fontsize` varchar(50) default NULL,
  `css_lineheight` varchar(50) default NULL,
  `css_others` text,
  PRIMARY KEY  (`css_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_css`
--

/*!40000 ALTER TABLE `gp_css` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_css` ENABLE KEYS */;


--
-- Definition of table `gp_div`
--

DROP TABLE IF EXISTS `gp_div`;
CREATE TABLE `gp_div` (
  `div_id` bigint(20) NOT NULL auto_increment,
  `div_order_num` int(11) default NULL,
  `div_name` varchar(50) default NULL,
  `div_block_id` bigint(20) default NULL,
  `div_width` int(11) default NULL,
  `div_height` int(11) default NULL,
  `div_direction` int(11) default NULL,
  `div_word_count` int(11) default NULL,
  `div_istop` int(11) default '0',
  `div_top` int(11) default '0',
  `div_type` varchar(10) default NULL,
  PRIMARY KEY  (`div_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_div`
--

/*!40000 ALTER TABLE `gp_div` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_div` ENABLE KEYS */;


--
-- Definition of table `gp_divdoc`
--

DROP TABLE IF EXISTS `gp_divdoc`;
CREATE TABLE `gp_divdoc` (
  `divdoc_id` bigint(20) NOT NULL auto_increment,
  `divdoc_div_id` int(11) default NULL,
  `divdoc_doc_id` int(11) default NULL,
  `divdoc_body` mediumtext,
  `divdoc_page_id` int(11) default NULL,
  `divdoc_release_id` int(11) default NULL,
  `divdoc_lock` int(11) default '0',
  `divdoc_ent_id` int(11) default NULL,
  PRIMARY KEY  (`divdoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_divdoc`
--

/*!40000 ALTER TABLE `gp_divdoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_divdoc` ENABLE KEYS */;


--
-- Definition of table `gp_doc`
--

DROP TABLE IF EXISTS `gp_doc`;
CREATE TABLE `gp_doc` (
  `doc_id` bigint(20) NOT NULL auto_increment,
  `doc_order_num` int(11) default NULL,
  `doc_title_sub` mediumtext,
  `doc_title` mediumtext,
  `doc_title_addon` mediumtext,
  `doc_title_pos` int(11) default NULL,
  `doc_body` mediumtext,
  `doc_body_show` mediumtext,
  `doc_author_id` int(11) default NULL,
  `doc_edit_time` datetime default NULL,
  `doc_page_id` bigint(20) default NULL,
  `doc_paper_id` bigint(20) default NULL,
  `doc_page_name_cn` mediumtext,
  `doc_block_id` bigint(20) default NULL,
  `doc_release_id` int(11) default NULL,
  `doc_image_comment` mediumtext,
  `doc_navi_sign` int(11) default NULL,
  `doc_have_pic` mediumtext,
  `doc_img_option` tinytext,
  `doc_filename` mediumtext,
  `doc_download` mediumtext,
  `doc_filesize` int(11) default NULL,
  `doc_page_index` varchar(50) default NULL,
  `doc_time_mark` varchar(150) default NULL,
  `doc_body_text` mediumtext,
  `doc_title_text` mediumtext,
  `doc_source` tinytext,
  `doc_img_list` mediumtext,
  `doc_checkflower` int(11) default '0',
  `doc_property` tinytext,
  `doc_title_manual` mediumtext,
  `doc_is_have_pic` int(11) default '0',
  `doc_subject_id` int(11) default NULL,
  `doc_ent_id` int(11) default NULL,
  `doc_remark_times` int(11) default NULL,
  `doc_all_text` mediumtext,
  `doc_audio_ok` int(11) default NULL,
  `doc_author` varchar(50) NOT NULL default '',
  `doc_keywords` varchar(100) NOT NULL default '',
  `doc_foreword` text NOT NULL,
  PRIMARY KEY  (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_doc`
--

/*!40000 ALTER TABLE `gp_doc` DISABLE KEYS */;
INSERT INTO `gp_doc` (`doc_id`,`doc_order_num`,`doc_title_sub`,`doc_title`,`doc_title_addon`,`doc_title_pos`,`doc_body`,`doc_body_show`,`doc_author_id`,`doc_edit_time`,`doc_page_id`,`doc_paper_id`,`doc_page_name_cn`,`doc_block_id`,`doc_release_id`,`doc_image_comment`,`doc_navi_sign`,`doc_have_pic`,`doc_img_option`,`doc_filename`,`doc_download`,`doc_filesize`,`doc_page_index`,`doc_time_mark`,`doc_body_text`,`doc_title_text`,`doc_source`,`doc_img_list`,`doc_checkflower`,`doc_property`,`doc_title_manual`,`doc_is_have_pic`,`doc_subject_id`,`doc_ent_id`,`doc_remark_times`,`doc_all_text`,`doc_audio_ok`,`doc_author`,`doc_keywords`,`doc_foreword`) VALUES 
 (332,1,'','“市场化”是企业内刊最终的命运终结','',0,'　　本报讯（李平）市场经济下，几乎没有什么不能作为直接商品而出现，也有许多外界人士赞许某些企业内刊，认为只要争取到刊号，并不逊色于正式出版物，完全可以公开发行。<br>　　但这，恰恰正是企业内刊所应提防的一种走向。<br>　　不错，随着新闻出版行业的逐渐放开，它作为一种新兴产业将吸引外部资金的大量涌入：或者直接推出企业内刊，对原有的内容做一番彻底的改变，按照市场的游戏规则来运做；或是收购一家出版物，企业内刊人作为嫡系部队派驻进去；或者是采取参股的形式，而内刊人也是不可或缺的。这时的企业内刊便成为企业先期市场演练与人才培训的基地，为企业切入这一行业提供了有力的实践论证依据。现在，已经有企业内刊开始向这方面做出探索与尝试。不管是否是对投入的一种有益补充，还是对自身实力的张扬，毕竟，现在已经有刊物刊出了有偿征订的启事。<br>　　但可以预料，企业内刊完全走向市场，开始自主经营、自负盈亏的同时，也就意味着它丧失了立足的根本———企业性，也就宣告了一个企业内刊命运的终结。<br>　　目前的企业内刊同我国现阶段的社会主义一样，都属于初级阶段。遍览国内各种内刊，实质上大家都在努力形成自己稳定的主体风格，成熟的基调，大家在相互模仿、借鉴的同时寻求着创新与超越。相信随着中国企业真正走向世界，企业内刊的胸量与“视界”也将同步放大，到那时，企业内刊也就将转入了另一片洞天。<br>　　但作为一个内刊人，作为企业的一员，我们最最关心的是，我们的中国企业能走多远……',NULL,87,'2011-04-05 09:04:35',NULL,182,'',-1,4,'',0,'','010','','',0,'0','f97923fc9cfc6a0894a114bd3e562a8720707','161161 161161 177190 177168 209182 163168 192238 198189 163169 202208 179161 190173 188195 207194 163172 188184 186245 195187 211208 202178 195180 178187 196220 215247 206170 214177 189211 201204 198183 182248 179246 207214 163172 210178 211208 208237 182224 205226 189231 200203 202191 212222 208237 196179 208169 198243 210181 196218 191175 163172 200207 206170 214187 210170 213249 200161 181189 191175 186197 163172 178162 178187 209183 201171 211218 213253 202189 179246 176230 206239 163172 205234 200171 191201 210212 185171 191170 183162 208208 161163 161161 161161 181171 213226 163172 199161 199161 213253 202199 198243 210181 196218 191175 203249 211166 204225 183192 181196 210187 214214 215223 207242 161163 161161 161161 178187 180237 163172 203230 215197 208194 206197 179246 176230 208208 210181 181196 214240 189165 183197 191170 163172 203252 215247 206170 210187 214214 208194 208203 178250 210181 189171 206252 210253 205226 178191 215202 189240 181196 180243 193191 211191 200235 163186 187242 213223 214177 189211 205198 179246 198243 210181 196218 191175 163172 182212 212173 211208 181196 196218 200221 215246 210187 183172 179185 181215 181196 184196 177228 163172 176180 213213 202208 179161 181196 211206 207183 185230 212242 192180 212203 215246 163187 187242 202199 202213 185186 210187 188210 179246 176230 206239 163172 198243 210181 196218 191175 200203 215247 206170 181213 207181 178191 182211 197201 215164 189248 200165 163187 187242 213223 202199 178201 200161 178206 185201 181196 208206 202189 163172 182248 196218 191175 200203 210178 202199 178187 191201 187242 200177 181196 161163 213226 202177 181196 198243 210181 196218 191175 177227 179201 206170 198243 210181 207200 198218 202208 179161 209221 193183 211235 200203 178197 197224 209181 181196 187249 181216 163172 206170 198243 210181 199208 200235 213226 210187 208208 210181 204225 185169 193203 211208 193166 181196 202181 188249 194219 214164 210192 190221 161163 207214 212218 163172 210209 190173 211208 198243 210181 196218 191175 191170 202188 207242 213226 183189 195230 215246 179246 204189 203247 211235 179162 202212 161163 178187 185220 202199 183241 202199 182212 205182 200235 181196 210187 214214 211208 210230 178185 179228 163172 187185 202199 182212 215212 201237 202181 193166 181196 213197 209239 163172 177207 190185 163172 207214 212218 210209 190173 211208 191175 206239 191175 179246 193203 211208 179165 213247 182169 181196 198244 202194 161163 161161 161161 181171 191201 210212 212164 193207 163172 198243 210181 196218 191175 205234 200171 215223 207242 202208 179161 163172 191170 202188 215212 214247 190173 211170 161162 215212 184186 211175 191247 181196 205172 202177 163172 210178 190205 210226 206182 215197 203252 201165 202167 193203 193162 215227 181196 184249 177190 161170 161170 161170 198243 210181 208212 163172 210178 190205 208251 184230 193203 210187 184246 198243 210181 196218 191175 195252 212203 181196 214213 189225 161163 161161 161161 196191 199176 181196 198243 210181 196218 191175 205172 206210 185250 207214 189215 182206 181196 201231 187225 214247 210229 210187 209249 163172 182188 202244 211218 179245 188182 189215 182206 161163 177233 192192 185250 196218 184247 214214 196218 191175 163172 202181 214202 201207 180243 188210 182188 212218 197172 193166 208206 179201 215212 188186 206200 182168 181196 214247 204229 183231 184241 163172 179201 202236 181196 187249 181247 163172 180243 188210 212218 207224 187165 196163 183194 161162 189232 188248 181196 205172 202177 209176 199243 215197 180180 208194 211235 179172 212189 161163 207224 208197 203230 215197 214208 185250 198243 210181 213230 213253 215223 207242 202192 189231 163172 198243 210181 196218 191175 181196 208216 193191 211235 161176 202211 189231 161177 210178 189171 205172 178189 183197 180243 163172 181189 196199 202177 163172 198243 210181 196218 191175 210178 190205 189171 215170 200235 193203 193237 210187 198172 182180 204236 161163 161161 161161 181171 215247 206170 210187 184246 196218 191175 200203 163172 215247 206170 198243 210181 181196 210187 212177 163172 206210 195199 215238 215238 185216 208196 181196 202199 163172 206210 195199 181196 214208 185250 198243 210181 196220 215223 182224 212182 161173 161173','161176 202208 179161 187175 161177 202199 198243 210181 196218 191175 215238 214213 181196 195252 212203 214213 189225','','',0,NULL,'',0,0,107,NULL,'“市场化”是企业内刊最终的命运终结\r\n　　本报讯（李平）市场经济下，几乎没有什么不能作为直接商品而出现，也有许多外界人士赞许某些企业内刊，认为只要争取到刊号，并不逊色于正式出版物，完全可以公开发行。　　但这，恰恰正是企业内刊所应提防的一种走向。　　不错，随着新闻出版行业的逐渐放开，它作为一种新兴产业将吸引外部资金的大量涌入：或者直接推出企业内刊，对原有的内容做一番彻底的改变，按照市场的游戏规则来运做；或是收购一家出版物，企业内刊人作为嫡系部队派驻进去；或者是采取参股的形式，而内刊人也是不可或缺的。这时的企业内刊便成为企业先期市场演练与人才培训的基地，为企业切入这一行业提供了有力的实践论证依据。现在，已经有企业内刊开始向这方面做出探索与尝试。不管是否是对投入的一种有益补充，还是对自身实力的张扬，毕竟，现在已经有刊物刊出了有偿征订的启事。　　但可以预料，企业内刊完全走向市场，开始自主经营、自负盈亏的同时，也就意味着它丧失了立足的根本———企业性，也就宣告了一个企业内刊命运的终结。　　目前的企业内刊同我国现阶段的社会主义一样，都属于初级阶段。遍览国内各种内刊，实质上大家都在努力形成自己稳定的主体风格，成熟的基调，大家在相互模仿、借鉴的同时寻求着创新与超越。相信随着中国企业真正走向世界，企业内刊的胸量与“视界”也将同步放大，到那时，企业内刊也就将转入了另一片洞天。　　但作为一个内刊人，作为企业的一员，我们最最关心的是，我们的中国企业能走多远……',0,'','','');
/*!40000 ALTER TABLE `gp_doc` ENABLE KEYS */;


--
-- Definition of table `gp_element`
--

DROP TABLE IF EXISTS `gp_element`;
CREATE TABLE `gp_element` (
  `element_id` int(11) NOT NULL auto_increment,
  `element_name` varchar(50) default NULL,
  `element_inner_inc_show` mediumtext,
  `element_outer_inc_show` mediumtext,
  `element_inner_inc` mediumtext,
  `element_outer_inc` mediumtext,
  `element_width` int(11) default NULL,
  `element_height` int(11) default NULL,
  PRIMARY KEY  (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_element`
--

/*!40000 ALTER TABLE `gp_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_element` ENABLE KEYS */;


--
-- Definition of table `gp_hotnews`
--

DROP TABLE IF EXISTS `gp_hotnews`;
CREATE TABLE `gp_hotnews` (
  `hot_id` bigint(20) NOT NULL auto_increment,
  `hot_content` mediumtext,
  `hot_release_id` bigint(20) default NULL,
  PRIMARY KEY  (`hot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_hotnews`
--

/*!40000 ALTER TABLE `gp_hotnews` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_hotnews` ENABLE KEYS */;


--
-- Definition of table `gp_image`
--

DROP TABLE IF EXISTS `gp_image`;
CREATE TABLE `gp_image` (
  `image_id` bigint(20) NOT NULL auto_increment,
  `image_admin_id` int(11) default NULL,
  `image_pic` text,
  `image_type` varchar(50) default NULL,
  `image_picsize` int(11) default NULL,
  `image_uploadtime` datetime default NULL,
  `image_class` int(11) default NULL,
  `image_ent_id` int(11) default NULL,
  PRIMARY KEY  (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_image`
--

/*!40000 ALTER TABLE `gp_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_image` ENABLE KEYS */;


--
-- Definition of table `gp_link`
--

DROP TABLE IF EXISTS `gp_link`;
CREATE TABLE `gp_link` (
  `link_id` int(11) NOT NULL auto_increment,
  `link_order_num` int(11) default NULL,
  `link_type` int(11) default NULL,
  `link_caption` text,
  `link_target_url` text,
  `link_pic_url` text,
  `link_ent_id` int(11) default NULL,
  PRIMARY KEY  (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_link`
--

/*!40000 ALTER TABLE `gp_link` DISABLE KEYS */;
INSERT INTO `gp_link` (`link_id`,`link_order_num`,`link_type`,`link_caption`,`link_target_url`,`link_pic_url`,`link_ent_id`) VALUES 
 (1,1,0,'新浪','http://www.sina.com.cn','',107);
/*!40000 ALTER TABLE `gp_link` ENABLE KEYS */;


--
-- Definition of table `gp_page`
--

DROP TABLE IF EXISTS `gp_page`;
CREATE TABLE `gp_page` (
  `page_id` int(11) NOT NULL auto_increment,
  `page_ent_id` int(11) default NULL,
  `page_pid` int(11) default NULL,
  `page_class` int(11) default NULL,
  `page_type` int(11) default NULL,
  `page_name_cn` varchar(255) default NULL,
  `page_name_en` varchar(255) default NULL,
  `page_admin` text,
  `page_template_id` int(11) default NULL,
  `page_sort` int(11) default NULL,
  `edit_time` datetime default NULL,
  `page_duty_editor` varchar(50) default NULL,
  `page_status` int(11) default NULL,
  `page_counter` int(11) default NULL,
  `page_index` varchar(50) default NULL,
  `page_showstyle` int(11) default '0',
  `page_listtag` varchar(50) default NULL,
  `page_property` varchar(255) default NULL,
  PRIMARY KEY  (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_page`
--

/*!40000 ALTER TABLE `gp_page` DISABLE KEYS */;
INSERT INTO `gp_page` (`page_id`,`page_ent_id`,`page_pid`,`page_class`,`page_type`,`page_name_cn`,`page_name_en`,`page_admin`,`page_template_id`,`page_sort`,`edit_time`,`page_duty_editor`,`page_status`,`page_counter`,`page_index`,`page_showstyle`,`page_listtag`,`page_property`) VALUES 
 (5,107,0,0,1,'关于我们','','admin|',0,2,'2009-03-21 05:20:18','李老师',0,1,'1',1,'','00');
/*!40000 ALTER TABLE `gp_page` ENABLE KEYS */;


--
-- Definition of table `gp_paper`
--

DROP TABLE IF EXISTS `gp_paper`;
CREATE TABLE `gp_paper` (
  `paper_id` bigint(20) NOT NULL auto_increment,
  `paper_release_id` bigint(20) default '0',
  `paper_page_id` bigint(20) default '0',
  `paper_url` text,
  `paper_time` datetime default NULL,
  `paper_author_id` int(11) default NULL,
  `paper_text` mediumtext,
  `paper_filesize` int(11) default NULL,
  `paper_ent_id` int(11) default NULL,
  `paper_name_cn` varchar(255) default NULL,
  `paper_editor` varchar(100) default NULL,
  `paper_pdf` text,
  `paper_timestamp` varchar(13) default NULL,
  PRIMARY KEY  (`paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_paper`
--

/*!40000 ALTER TABLE `gp_paper` DISABLE KEYS */;
INSERT INTO `gp_paper` (`paper_id`,`paper_release_id`,`paper_page_id`,`paper_url`,`paper_time`,`paper_author_id`,`paper_text`,`paper_filesize`,`paper_ent_id`,`paper_name_cn`,`paper_editor`,`paper_pdf`,`paper_timestamp`) VALUES 
 (182,4,0,'../newspic/_paper/107/4/c18c775f11a42692dd371b6ea149008287418.jpg','2011-04-05 09:04:28',87,'<area shape=\'rect\' href=\'Javascript:shownews(332);\'  alt=\'“市场化”是企业内刊最终的命运终结\' title=\'“市场化”是企业内刊最终的命运终结\' \r\n	    	onmouseover=MouseOverMap(20,114,137,186,332) onmouseout=MouseOutMap() coords=\'20,114,137,186\'>',986081,107,'第01版',NULL,'../newspic/_pdf/107/4/52ac32fb213dd4b9df00c79b733fce5f25071.pdf','4d9adb14248b8');
/*!40000 ALTER TABLE `gp_paper` ENABLE KEYS */;


--
-- Definition of table `gp_papername`
--

DROP TABLE IF EXISTS `gp_papername`;
CREATE TABLE `gp_papername` (
  `papername_id` int(11) NOT NULL auto_increment,
  `papername_ent_id` int(11) NOT NULL default '0',
  `papername_caption` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`papername_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_papername`
--

/*!40000 ALTER TABLE `gp_papername` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_papername` ENABLE KEYS */;


--
-- Definition of table `gp_pdf`
--

DROP TABLE IF EXISTS `gp_pdf`;
CREATE TABLE `gp_pdf` (
  `pdf_id` bigint(20) NOT NULL auto_increment,
  `pdf_page_id` int(11) default '0',
  `pdf_release_id` int(11) default '0',
  `pdf_filename` varchar(200) default NULL,
  `pdf_filesize` varchar(50) default NULL,
  `pdf_time` datetime default NULL,
  `pdf_page_name` varchar(50) default NULL,
  `pdf_page_index` varchar(11) default NULL,
  `pdf_download_counter` int(11) default '0',
  `pdf_ent_id` int(11) default NULL,
  PRIMARY KEY  (`pdf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_pdf`
--

/*!40000 ALTER TABLE `gp_pdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_pdf` ENABLE KEYS */;


--
-- Definition of table `gp_ps`
--

DROP TABLE IF EXISTS `gp_ps`;
CREATE TABLE `gp_ps` (
  `ps_id` bigint(20) NOT NULL auto_increment,
  `ps_release_id` int(11) default NULL,
  `ps_ent_id` int(11) default NULL,
  `ps_content` mediumtext,
  `ps_left` int(11) default NULL,
  `ps_top` int(11) default NULL,
  `ps_width` int(11) default NULL,
  `ps_height` int(11) default NULL,
  `ps_paper_id` int(11) default NULL,
  PRIMARY KEY  (`ps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_ps`
--

/*!40000 ALTER TABLE `gp_ps` DISABLE KEYS */;
INSERT INTO `gp_ps` (`ps_id`,`ps_release_id`,`ps_ent_id`,`ps_content`,`ps_left`,`ps_top`,`ps_width`,`ps_height`,`ps_paper_id`) VALUES 
 (947,4,107,'中共凯里学院委员会主办院报编辑部编辑出版贵州省新闻出版局审批ＤＢ５号',86,76,205,10,182),
 (948,4,107,'2010年1月5日第1期（总第1期）',313,17,32,22,182),
 (949,4,107,'总编辑：孙富强网址：http://www.jinostart.com电子信箱：chareler@163.com新闻热线：010-62713015',301,55,53,28,182),
 (950,4,107,'敬业奉献创业创新',25,63,46,25,182),
 (951,4,107,'内刊在企业',161,311,145,5,182),
 (952,4,107,'“市场化”是企业内刊最终的命运终结',30,95,177,19,182),
 (953,4,107,'本报讯（李平）市场经济下，几乎没有什么不能作为直接商品而出现，也有许多外界人士赞许某些企业内刊，认为只要争取到刊号，并不逊色于正式出版物，完全可以公开发行。但这，恰恰正是企业内刊所应提防的一种走向。不错，随着新闻出版行业的逐渐放开，它作为一种新兴产业将吸引外部资金的大量涌入：或者直接推出企业内刊，对原有的内容做一番彻底的改变，按照市场的游戏规则来运做；或是收购一家出版物，企业内刊人作为嫡系部队派驻进去；或者是采取参股的形式，而内刊人也是不可或缺的。这时的企业内刊便成为企业先期市场演练与人才培训的基地，为企业切入这一行业提供了有力的实践论证依据。现在，已经有企业内刊开始向这方面做出探索与尝试。不管是否是对投入的一种有益补充，还是对自身实力的张扬，毕竟，现在已经有刊物刊出了有偿征订的启事。但可以预料，企业内刊完全走向市场，开始自主经营、自负盈亏的同时，也就意味着它丧失了立足的根本———企业性，也就宣告了一个企业内刊命运的终结。目前的企业内刊同我国现阶段的社会主义一样，都属于初级阶段。遍览国内各种内刊，实质上大家都在努力形成自己稳定的主体风格，成熟的基调，大家在相互模仿、借鉴的同时寻求着创新与超越。相信随着中国企业真正走向世界，企业内刊的胸量与“视界”也将同步放大，到那时，企业内刊也就将转入了另一片洞天。但作为一个内刊人，作为企业的一员，我们最最关心的是，我们的中国企业能走多远……',20,114,117,72,182),
 (954,4,107,'xpaper数字媒体解决方案———数字报纸又一道风景线',265,90,85,14,182),
 (955,4,107,'本报讯“xpaper”数字媒体解决方案，为包含名为xpaper的“一键出报”内涵，它能使报纸的数字化流程与原有的报纸排版制作流程无缝衔接，使数据格式统一并在报社各个部门共享，避免重复劳动。这种为为传统媒体提供智能电子报出版技术、多渠道辅助发行手段、灵活的商务服务方式，不仅可以帮助国内众多传统媒体实现向数学化媒体的跨越，更使得传统媒体的数字化进程“零门槛”。而且为集团企业内部报纸和期刊的发行添加一个宣传的利器，并为之节省印刷、发行费用的开支。如果把集团企业报刊放到互联网上，我们可以看到一份报纸的完整电子版。他们的版式未变，企业的新闻通过互联网数字报纸的视角传递到受众群体那里，他将以传统媒体形式，借助新的技术手段，把集团文化、产品、服务理念、公司经营价值观等传播出去；所有都没有变，不过内容本身可能由静态变为动态，为的是更好地利用多媒体的表现形式，提高传播的命中率和传播速度，增加视觉冲击力。',262,103,93,63,182),
 (956,4,107,'数字报不再是免费午餐？《人民日报》电子版每月24元收费浏览引发专家讨论',21,194,25,200,182),
 (957,4,107,'据《广州日报》报道，从2010年1月1日起，人民网对《人民日报》数字版服务进行收费。对此，有人认为，这是传统报业发展的一个趋势，且会进一步促进报纸资讯的“优质化”；也有人认为从收费邮箱开始，互联网中免费的地盘日益被蚕食，免费的网络午餐是否结束了？收费分三种模式其实，早在上月下旬，《人民日报》数字版就在其网页发布了电子报收费通知。通知详细阐明了三种收费模式：每月24元、半年128元、全年198元。读者可通过在线支付、银行转账和邮局汇款3种方式支付。如不购买，从2010年1月1日起就无法免费、在线阅读当天的数字报。与“数字报”收费同时，人民网上的新闻依然可照读无恙，重要内容相差不多的《人民日报(海外版)》电子版也免费运行。免费的网络午餐结束？《人民日报》电子版收费并非第一个吃螃蟹—————资料显示，早在2007年4月，温州报业集团旗下4份报纸上线发行，这是中国首份付费订阅的数字报纸。但作为全国最大的报纸，《人民日报》此举无疑在新闻界引起了“地震”。支持者新民网特约评论员吕怡然认为，这是“内容供应商”自信的表现，也是传统媒体维护版权、改善盈利模式的实际举措。暨南大学新闻学系主任张晋升说，《人民日报》数字版服务进行收费彰显了两个信号：第一是传统报业集团将进一步保护自己的版权；第二是新闻纸在资讯竞争中仍然保持深度的优势。可更多的专家学者并不看好。广东省记协主席范以锦坦言：“如果能从其他渠道，免费看到同样的信息，真正付钱的人不会很多。”南京大学新闻研究所所长丁柏铨教授坦言：“收费，是一种尝试，可以理解。但前景不是很看好，真正付费看新闻的读者不会太多。”事实确实如此———国外调研公司GfK近期的一项调查显示，全球87%的网民不愿为网络内容付费。“中国网友习惯了新闻资讯免费，《人民日报》是试图证明新闻资讯是有价值的。”在互联网新闻界工作超过8年的资深媒体人陶然指出，“但我觉得，单纯的电子报收费没有意义。此路危险，行不通。”其他报纸是否会跟进？北京外国语大学国际新闻与传播系教授表示，《人民日报》作为一份靠行政拨款创办的报纸，它的费用都是来自纳税人的钱，主要的功能是宣传，不是一份市场化的报纸，它采取这种方式改善盈利模式，是可以讨论的。但对于市场化的报纸来说，采取这种方式当然是无可厚非的。“这是一个麻烦。”范以锦毫不客气地指出，“免费，也许会亏损；收费，点击率减少。这是一对矛盾，要平衡很难。”范以锦表示，其他媒体并不会盲目跟进收费，“收钱谁都想，但为什么想而不做，就是大家在考虑社会影响、品牌效应，以及由点击率产生的广告。大家都在慎重考虑跟进后的效果。”“对新闻媒体，读者的依赖程度没有那么高。”丁柏铨教授指出，“除非哪一天某个新闻能做到像机顶盒一样，大家就不得不去接受收费了。”',50,197,99,188,182),
 (958,4,107,'企业与内刊的关系',163,195,93,20,182),
 (959,4,107,'本报讯有一种观点认为：企业与内刊就是老子和儿子的关系；也有人把企业内刊比喻成是老板在一个叫“文化的后花园”里包养的二奶。无论那种说法，都形象地说明了企业与企业内刊之间的关系，即：企业内刊是企业的附属物，是企业发展的产物，是一个企业老板文化品味的风向标，是老板才、情、识的综合体现。《万科周刊》的人文气息和规范表象，《奥园》杂志的追求“出位”和“傲视”风格，无不透出各自企业和老板的个性。因此，一方面，内刊是因企业的存在而存在的。企业是因，内刊是果；而另一方面，内刊反过来对企业的发展又具有巨大的推动作用：内刊是企业声音的舆论阵地；内刊是企业观点的传播管道；内刊是企业形象的展示窗口；内刊是企业文化的建设手段；内刊是企业员工的沟通平台；由此可见，企业内刊人不仅仅是编辑一本简单的杂志，他们的工作是与企业的文化、理念、形象、品牌等等之类最高端和最核心的部分密切联系在一起的。这就要求企业的领导人，对内刊人予以充分的授权和广阔的空间。',162,211,97,86,182),
 (960,4,107,'一、追溯企业内刊的起源和众人文化诉求的趋势威廉姆斯在《关键词》一书中界定大众文化的四种含义，最为重要的就是“众人喜好的文化”。所以好的企业文化一定是被员工、被客户、被社会同时认可的文化。如何把企业文化付诸形式，非内刊莫属。企业内刊早期是出于信息沟通的需要，企业发展到一定规模之后，管理层的思想已经不能有效传达，企业思想需要整理、沉淀、传播，需要文字梳理。在大家都觉得企业文化内涵不足的情况下，内刊有责任把企业或产品的文化特质表现出来。作为企业话语权建构的一部分，内刊的精神辐射范围已经发散到社会各界，并且越来越多地参与到公共话语权体系之中。这种渗透既有意，又属无心插柳。有的内刊针对一些问题展开的讨论，与公共话语空间已经形成完好对接。由于企业生存在大环境下或者做着普罗大众的事情，企业文化不仅是企业的事情还是社会的事情，到了一定阶段之后，必然会出现越来越开放的诉求。从而内刊便参与到这里面来。企业内刊走到今天，已经在定位上出现了很明显的分化。有的走开放路线，有的坚守自己的不可复制的独特风格，有的则继续执着于反映企业内部情况。同时越来越多的企业在内刊设置上呈现细分化、多元化趋势。在风格上，有的时尚前沿，有的现实纯朴，有的则专业性很强，分别折射出企业和企业领头人的风格。在许多情况，任何一个产业链各环节对这些企业内刊的需求很强烈，因为这既是思想资源，又是商业信息资源。社会各界也对自身行业本身和从业者的人文思想比较感兴趣，但是内刊如果想把企业文化和战略规划传导到全国各界群体的范围内，难度相当大：时效性、印刷成本、投递成本、团队成本等，都是需要予以考虑的。企业内刊毕竟是企业的一个服务机构分支，目前尚未听说有某个行业的哪家企业转行做杂志，所以如何使内刊作用最大化，是企业需要但还无法圆满解决的难题。多媒体数字报是目前可以选择的有效解决方案之一。xpaper多媒体数字报的目的，就是利用计算机网络技术，把企业内刊（报纸、杂志）包含的所有信息载体，即这些思想更快更广地传播到业界和社会的各个角落。多媒体数字报和草根式传播应该是未来的方向之一，尽管不会对传统纸介质媒体进行全面彻底的颠覆和覆盖，但其低成本、定向传播的特点是极具生命力的。随着网络的普及，作为与过去书面阅读同样的生活方式，已经在80后的新生代中形成，他们很少看报纸，主要从网络获取信息。这将决定平面媒体的发展趋势和未来传媒的存在形式。互联网改变了现代人的生活方式，中国庞大的网络军团掀起多媒体数字报的热潮，更进一步借助互联网的传播和特色，为新生代读者提供独特的阅读体验。其实，早在互联网第一波浪潮兴起时，传统媒体电子化已成为公认的发展趋势，电子化浪潮对传统媒体的改变有目共睹。多媒体数字报刊作为新兴载体的出现，将使新老媒体的优势互补和融合成为现实。多媒体数字报刊所具有的多媒体特性，也为传统媒体提供了更多的表现形式，更适合新生代受众的阅读需求，当然更为传统媒体赚得了更高的人气。和传统报刊比较，多媒体数字报刊十分重视视觉效果，利用flash、音效和视频等技术加强图像的表现力。由于网络的互动性，电子杂志也能及时通过留言板等和读者进行更密切和互动的联系。二、企业内刊的功能分析我们知道，对大众传播的社会功能分析，以拉斯韦尔1948年在《社会传播的构造和功能》一书中提出的传播三功能，加上赖特1960年在《功能分析和大众传播》中总结了拉斯韦尔提出的三个范畴并提出的第四项功能，总称为“传播四功能论”最为经典。这四项功能具体是：环境监测功能、社会协调功能、文化传递功能以及娱乐功能。对照于企业内刊，可以看出它无可争议地也具有以上的功能，但如前所述，因其具有一些公开发行的媒体所不具备的特点，它的社会功能也自然地在承继了传统媒体的基础上，有自身的独特特色。（一）企业内刊的凝聚功能企业内刊是企业文化的外化形式，起着增强企业内部凝聚力的重要作用。作为大众传媒的重要组成部分，企业内刊肩负着忠实记录企业历史和传播企业文化的社会责任。2004年在沈阳举行的第五届泰山企业内刊研讨会上，华新国际集团总裁卢铿提出了文化与企业内刊的责任问题。他认为，企业内刊对文化负有责任。其一是对企业、企业的作品和对企业的人进行教育；其二是创新中国企业文化的特色；其三，是促进民族文化的现代化。另外，作为企业文化建设的有效平台，企业内刊在企业文化建设中的特殊作用主要通过三个方面体现，一是对内对外传播与交流企业文化的“窗口”；二是集中反映个性化的企业文化建设；三是集中反映企业文化建设中的“领袖情结”，企业家在以其人格的魅力和丰厚的文化底蕴建立企业文化的时候，他对企业的历史和未来也必须做出阐释和描绘，企业文化的演进过程，在很大意义上是企业家对自身历史和未来的不断阐释和描绘的过程。这一条在民营企业文化建设中尤为突出。集团就曾在公司领导的倡导下成立了专门的组织———企业文化中心，来开展公司的企业文化建设和管理企业内刊的编辑出版工作。从某种意义上说，作为企业文化建设有效平台的企业内刊，它是伴随企业文化演进的一个舞台和历史记录，也是企业凝聚力不断增强的一种工具，更是企业竞争尤其是文化竞争的直接参与者。二）企业内刊的导向功能企业内部刊物的价值在于它是一种人力资源开发、投入的方式，培育以员工为中心、发掘企业内部蕴藏的生产力，它是公司管理层、企业内各部门与一线生产工人相互交流的平台，具有鲜明的导向性。员工们通过这一平台知道企业的发展动向,接受一些现代管理理念,从而开阔了视野、解放了思想。员工们也通过这一平台学习和掌握企业的工作指导原则和方向，按照企业管理者的领导意图开展各项工作。据我所知，国祯集团由于所涉产业广泛，公司员工工作地点相对分散，员工们之间直接的、面对面的交流与沟通并不太多，但是员工们通过积极向企业文化载体投稿、阅读这些载体所刊登的工作指导原则、企业内、外部动态，加强了沟通与了解，更进一步地促进了企业文化的融合和交流。（三）企业内刊的传播功能企业在不断求生存、求发展过程中与外界的联系越来越紧密，企业内刊的职能也随着相应地变化、发展起来，担任起对外宣传企业形象、企业文化，构建企业与客户交流平台的角色来。企业内刊由于其发行的范围越来越广，层次越来越多，已经突破了仅限于内部职工传阅的局限，也突破了企业同行之间的交流局面，更多地则成为企业精神成长发育提升的载体，在当今的社会信息传递依然重要的形势下，企业内刊逐渐成为整合内外部资源的一个平台，成为宣传企业文化、树立企业形象、博得好名声的一个品牌，为企业获得社会认同和肯定奠定良好的基础，这一现象已引起了社会各界的广泛关注。',158,304,200,192,182),
 (961,4,107,'jinostartnewspaper',26,15,45,10,182),
 (962,4,107,'内刊在企业发展中的责任',161,302,75,13,182),
 (963,4,107,'未来的数字报怎样读',265,166,80,13,182),
 (964,4,107,'一、从用户角度：比如你花了一定的价格订了一份传统报纸，但你对报纸上的信息却别无选择，即使是不需要的信息，你也已经付了费；但花同样的价格上网读报，你可以按需索取，不必花费冤枉钱。因此，从价格的角度看，网上报纸可能会高于传统报纸；从价值的角度看，网上报纸内容丰富，只要拥有一款软件，你就可以漫步于各种报纸之中，其优势是传统报纸不能比拟的。读者在传统报纸面前是被动的客体，而在网上报纸跟前则是互动的主体，在这里，人的价值显然是无法用价格来衡量的。二、从报刊媒体角度：传统报刊业必须接受挑战，在已经到来的数字化时代的进行创新，报刊业战略转型的基本方向无疑是数字化、网络化，这是传统报刊业通向未来的必由之路。可是在报刊业数字化转型过程中我们发现了一个怪圈，门户网站依靠转载数字报刊媒体的内容可以实现源源不断的赢利，报刊媒体具有新闻采编特权、内容资源优势、品牌优势、人才优势的情况下，投入巨额资金建设的网络服务体系却并没有出现预期的收益，以门户网站为样板设计出来的网络化产品并没有形成新的经济增长点和足以实现赢利的价值链，这些报业门户网站纷纷沦为\"包袱\"、\"鸡肋\"、\"面子工程\"，甚至成为损害报刊业传统基业的帮凶。三、从便利性角度：网上报刊具有的某些优势是传统的报刊所不及的。它除了选择范围广外，还可以免除阅览室里人满为患时找不到座位的尴尬，或者想一睹为快最新一期报刊，却被其他读者捷足先登时的懊恼。假如你是一位足球爱好者，而附近又恰好没有报刊亭，你可能不得不经常花费较长的时间去买足球报。四、从环保角度：我们联合报业媒体共同努力为公众提供绿色环保的报纸，与环境和谐；与知识同行，我们一起为自然加油。\"绿色报纸，绿色阅读，今天你为环保出力了吗？\"我觉要在思想认识上要将电子报刊当作一种全新的媒体服务模式来经营，而不仅仅是将纸质报刊简单地电子化后通过网络来传播。',263,175,94,123,182);
/*!40000 ALTER TABLE `gp_ps` ENABLE KEYS */;


--
-- Definition of table `gp_query`
--

DROP TABLE IF EXISTS `gp_query`;
CREATE TABLE `gp_query` (
  `query_id` int(11) NOT NULL auto_increment,
  `query_name` varchar(50) default NULL,
  `query_url` text,
  `query_pic_url` text,
  `query_order_num` int(11) default NULL,
  `query_type` int(11) default NULL,
  `query_method` int(11) default NULL,
  `query_ent_id` int(11) default NULL,
  PRIMARY KEY  (`query_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_query`
--

/*!40000 ALTER TABLE `gp_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_query` ENABLE KEYS */;


--
-- Definition of table `gp_release`
--

DROP TABLE IF EXISTS `gp_release`;
CREATE TABLE `gp_release` (
  `release_id` int(11) NOT NULL auto_increment,
  `release_name` varchar(50) default NULL,
  `release_time` datetime default NULL,
  `release_master` varchar(255) default NULL,
  `release_pubtime` datetime default NULL,
  `release_opentime` datetime default NULL,
  `release_doing` int(11) default '0',
  `release_total` varchar(100) default NULL,
  `release_ent_id` int(11) default NULL,
  `release_pagecount` int(11) default '4',
  `release_to1` varchar(20) default NULL,
  `release_whodo` varchar(20) NOT NULL default '-',
  `release_whatindex` int(11) NOT NULL default '0',
  PRIMARY KEY  (`release_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_release`
--

/*!40000 ALTER TABLE `gp_release` DISABLE KEYS */;
INSERT INTO `gp_release` (`release_id`,`release_name`,`release_time`,`release_master`,`release_pubtime`,`release_opentime`,`release_doing`,`release_total`,`release_ent_id`,`release_pagecount`,`release_to1`,`release_whodo`,`release_whatindex`) VALUES 
 (4,'第1期','2009-02-18 00:00:00','','2011-04-05 09:13:58','2009-02-18 14:00:00',1,'总第1期',107,0,NULL,'-',0);
/*!40000 ALTER TABLE `gp_release` ENABLE KEYS */;


--
-- Definition of table `gp_remark`
--

DROP TABLE IF EXISTS `gp_remark`;
CREATE TABLE `gp_remark` (
  `remark_id` int(11) NOT NULL auto_increment,
  `remark_doc_id` int(11) default NULL,
  `remark_content` mediumtext,
  `remark_ip` varchar(50) default NULL,
  `remark_time` datetime default NULL,
  PRIMARY KEY  (`remark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_remark`
--

/*!40000 ALTER TABLE `gp_remark` DISABLE KEYS */;
INSERT INTO `gp_remark` (`remark_id`,`remark_doc_id`,`remark_content`,`remark_ip`,`remark_time`) VALUES 
 (1,119,'?','127.0.0.1','2006-12-04 15:45:45'),
 (2,151,'欢迎大家投稿，不错的，还有稿费','127.0.0.1','2007-02-06 14:40:53');
/*!40000 ALTER TABLE `gp_remark` ENABLE KEYS */;


--
-- Definition of table `gp_source`
--

DROP TABLE IF EXISTS `gp_source`;
CREATE TABLE `gp_source` (
  `source_id` bigint(20) NOT NULL auto_increment,
  `source_name` varchar(255) default NULL,
  `source_count` int(11) default '0',
  `source_ent_id` int(11) default NULL,
  PRIMARY KEY  (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_source`
--

/*!40000 ALTER TABLE `gp_source` DISABLE KEYS */;
INSERT INTO `gp_source` (`source_id`,`source_name`,`source_count`,`source_ent_id`) VALUES 
 (1,'323e42323',19,0),
 (2,'2',19,0),
 (3,'fdsa',19,0),
 (4,'1',12,0),
 (5,'人民日报',9,0);
/*!40000 ALTER TABLE `gp_source` ENABLE KEYS */;


--
-- Definition of table `gp_subject`
--

DROP TABLE IF EXISTS `gp_subject`;
CREATE TABLE `gp_subject` (
  `subject_id` int(11) NOT NULL auto_increment,
  `subject_name` varchar(50) default NULL,
  `subject_order_num` int(11) default NULL,
  `subject_ent_id` varchar(10) default NULL,
  PRIMARY KEY  (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_subject`
--

/*!40000 ALTER TABLE `gp_subject` DISABLE KEYS */;
INSERT INTO `gp_subject` (`subject_id`,`subject_name`,`subject_order_num`,`subject_ent_id`) VALUES 
 (1,'专题1',1,'1'),
 (3,'ce',1,'107');
/*!40000 ALTER TABLE `gp_subject` ENABLE KEYS */;


--
-- Definition of table `gp_template`
--

DROP TABLE IF EXISTS `gp_template`;
CREATE TABLE `gp_template` (
  `template_id` bigint(20) NOT NULL auto_increment,
  `template_type` int(11) default NULL,
  `template_name` varchar(50) default NULL,
  `template_filename` varchar(250) default NULL,
  `template_pic` varchar(250) default NULL,
  `template_zoom` text,
  `template_utemplate_id` int(11) default NULL,
  `template_ent_id` int(11) default NULL,
  PRIMARY KEY  (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_template`
--

/*!40000 ALTER TABLE `gp_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_template` ENABLE KEYS */;


--
-- Definition of table `gp_theme`
--

DROP TABLE IF EXISTS `gp_theme`;
CREATE TABLE `gp_theme` (
  `theme_id` int(11) NOT NULL auto_increment,
  `theme_name` varchar(100) default NULL,
  `theme_pic` text,
  `theme_folder` varchar(100) default NULL,
  `theme_time` datetime default NULL,
  `theme_ent_id` int(11) default NULL,
  `theme_stat` int(11) default NULL,
  `theme_type` int(11) default '0',
  `theme_paper_width` int(11) default NULL,
  PRIMARY KEY  (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_theme`
--

/*!40000 ALTER TABLE `gp_theme` DISABLE KEYS */;
INSERT INTO `gp_theme` (`theme_id`,`theme_name`,`theme_pic`,`theme_folder`,`theme_time`,`theme_ent_id`,`theme_stat`,`theme_type`,`theme_paper_width`) VALUES 
 (1,'主题1','./theme/01.jpg','paper/01','2010-10-10 00:00:01',0,1,0,550),
 (2,'主题2','./theme/02.jpg','paper/02','2010-10-10 00:00:01',0,1,0,418),
 (3,'主题3','./theme/03.jpg','paper/03','2010-10-10 00:00:01',0,1,0,320),
 (4,'主题4','./theme/04.jpg','paper/04','2010-10-10 00:00:01',0,1,0,320),
 (5,'主题5','./theme/05.jpg','paper/05','2010-10-10 00:00:01',0,1,0,320),
 (6,'主题6','./theme/06.jpg','paper/06','2010-10-10 00:00:01',0,1,0,320),
 (7,'主题7','./theme/07.jpg','paper/07','2010-10-10 00:00:01',0,1,0,320),
 (8,'主题8','./theme/08.jpg','paper/08','2010-10-10 00:00:01',0,1,0,380);
/*!40000 ALTER TABLE `gp_theme` ENABLE KEYS */;


--
-- Definition of table `gp_ublock`
--

DROP TABLE IF EXISTS `gp_ublock`;
CREATE TABLE `gp_ublock` (
  `ublock_id` bigint(20) NOT NULL auto_increment,
  `ublock_utemplate_id` bigint(20) default NULL,
  `ublock_name` varchar(50) default NULL,
  `ublock_top` int(11) default NULL,
  `ublock_left` int(11) default NULL,
  `ublock_width` int(11) default NULL,
  `ublock_height` int(11) default NULL,
  `ublock_border_width` int(11) default NULL,
  `ublock_border_color` varchar(50) default NULL,
  `ublock_border_style` varchar(20) default NULL,
  `ublock_bg_color` varchar(50) default NULL,
  `ublock_bg_img` mediumtext,
  `ublock_ent_id` int(11) default NULL,
  PRIMARY KEY  (`ublock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_ublock`
--

/*!40000 ALTER TABLE `gp_ublock` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_ublock` ENABLE KEYS */;


--
-- Definition of table `gp_udiv`
--

DROP TABLE IF EXISTS `gp_udiv`;
CREATE TABLE `gp_udiv` (
  `udiv_id` bigint(20) NOT NULL auto_increment,
  `udiv_type` smallint(6) default NULL,
  `udiv_order` smallint(6) default NULL,
  `udiv_ublock_id` bigint(20) default NULL,
  `udiv_top` int(11) default NULL,
  `udiv_left` int(11) default NULL,
  `udiv_width` int(11) default NULL,
  `udiv_height` int(11) default NULL,
  `udiv_bg_color` varchar(50) default NULL,
  `udiv_ent_id` int(11) default NULL,
  PRIMARY KEY  (`udiv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_udiv`
--

/*!40000 ALTER TABLE `gp_udiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_udiv` ENABLE KEYS */;


--
-- Definition of table `gp_uelement`
--

DROP TABLE IF EXISTS `gp_uelement`;
CREATE TABLE `gp_uelement` (
  `uelement_id` bigint(20) NOT NULL auto_increment,
  `uelement_utemplate_id` bigint(20) default NULL,
  `uelement_element_id` bigint(20) default NULL,
  `uelement_top` int(11) default NULL,
  `uelement_left` int(11) default NULL,
  `uelement_width` int(11) default NULL,
  `uelement_height` int(11) default NULL,
  `uelement_ent_id` int(11) default NULL,
  PRIMARY KEY  (`uelement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_uelement`
--

/*!40000 ALTER TABLE `gp_uelement` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_uelement` ENABLE KEYS */;


--
-- Definition of table `gp_utemplate`
--

DROP TABLE IF EXISTS `gp_utemplate`;
CREATE TABLE `gp_utemplate` (
  `utemplate_id` bigint(20) NOT NULL auto_increment,
  `utemplate_name` varchar(200) default NULL,
  `utemplate_mother_id` bigint(20) default NULL,
  `utemplate_ent_id` int(11) default NULL,
  PRIMARY KEY  (`utemplate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gp_utemplate`
--

/*!40000 ALTER TABLE `gp_utemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gp_utemplate` ENABLE KEYS */;


--
-- Definition of table `p_ad`
--

DROP TABLE IF EXISTS `p_ad`;
CREATE TABLE `p_ad` (
  `ad_id` int(11) NOT NULL auto_increment,
  `ad_tag` varchar(30) default NULL,
  `ad_type` int(11) default NULL,
  `ad_url` tinytext,
  `ad_pic` tinytext,
  `ad_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_ad`
--

/*!40000 ALTER TABLE `p_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_ad` ENABLE KEYS */;


--
-- Definition of table `p_ent`
--

DROP TABLE IF EXISTS `p_ent`;
CREATE TABLE `p_ent` (
  `ent_id` int(11) NOT NULL auto_increment,
  `ent_stat` int(11) default '0',
  `ent_name` varchar(100) default NULL,
  `ent_paper_name` varchar(100) default NULL,
  `ent_pos` varchar(20) default NULL,
  `ent_contact` varchar(255) default NULL,
  `ent_dept` varchar(100) default NULL,
  `ent_job` varchar(100) default NULL,
  `ent_tel` varchar(100) default NULL,
  `ent_fax` varchar(100) default NULL,
  `ent_email` varchar(100) default NULL,
  `ent_http` varchar(100) default NULL,
  `ent_add` tinytext,
  `ent_zip` varchar(10) default NULL,
  `ent_begin_time` datetime default NULL,
  `ent_end_time` datetime default NULL,
  `ent_update_time` datetime default NULL,
  `ent_update_release_id` int(11) default NULL,
  `ent_paper_url` tinytext,
  `ent_url` tinytext,
  `ent_update_release_name` varchar(50) default NULL,
  `ent_reg_time` datetime default NULL,
  `ent_last_logon_time` datetime default NULL,
  `ent_logon_counter` int(11) default '0',
  `ent_pub_type` int(11) default NULL,
  `ent_ftp_folder` varchar(50) NOT NULL default '',
  `ent_comment_count` int(11) NOT NULL default '0',
  `ent_comment_point` int(11) NOT NULL default '0',
  `ent_comment_content` int(11) NOT NULL default '0',
  `ent_comment_style` int(11) NOT NULL default '0',
  `ent_school_type` int(11) NOT NULL default '0',
  `ent_paper_type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_ent`
--

/*!40000 ALTER TABLE `p_ent` DISABLE KEYS */;
INSERT INTO `p_ent` (`ent_id`,`ent_stat`,`ent_name`,`ent_paper_name`,`ent_pos`,`ent_contact`,`ent_dept`,`ent_job`,`ent_tel`,`ent_fax`,`ent_email`,`ent_http`,`ent_add`,`ent_zip`,`ent_begin_time`,`ent_end_time`,`ent_update_time`,`ent_update_release_id`,`ent_paper_url`,`ent_url`,`ent_update_release_name`,`ent_reg_time`,`ent_last_logon_time`,`ent_logon_counter`,`ent_pub_type`,`ent_ftp_folder`,`ent_comment_count`,`ent_comment_point`,`ent_comment_content`,`ent_comment_style`,`ent_school_type`,`ent_paper_type`) VALUES 
 (107,1,'Xpaper数字报','《Xpaper数字报》','900180017008','','','','8610-62713015','8610-62713015','webmaster@xpaper.com','http://www.*.xpaper.com/','beijing','100089','2008-08-18 13:40:59','2008-10-30 00:00:00','2008-11-15 11:01:03',2,'./newspic/_paper/1/2/4ccd05c616ad752cb043ccd5a9d67025316636.jpg.jpg.jpg','hgc45143.chinaw3.com','no.1','2008-04-13 13:38:44','2011-04-05 08:56:33',135,0,'admin',0,0,0,0,0,0);
/*!40000 ALTER TABLE `p_ent` ENABLE KEYS */;


--
-- Definition of table `p_good`
--

DROP TABLE IF EXISTS `p_good`;
CREATE TABLE `p_good` (
  `good_id` int(11) NOT NULL auto_increment,
  `good_ord` int(11) default NULL,
  `good_ent_id` int(11) default NULL,
  `good_release_id` int(11) default NULL,
  `good_paper_url` text,
  `good_unit_id` int(11) NOT NULL default '0',
  `good_pub_type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_good`
--

/*!40000 ALTER TABLE `p_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_good` ENABLE KEYS */;


--
-- Definition of table `p_image`
--

DROP TABLE IF EXISTS `p_image`;
CREATE TABLE `p_image` (
  `image_id` int(11) NOT NULL auto_increment,
  `image_pic` tinytext,
  `image_type` varchar(20) default NULL,
  `image_picsize` int(11) default NULL,
  `image_uploadtime` datetime default NULL,
  `image_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_image`
--

/*!40000 ALTER TABLE `p_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_image` ENABLE KEYS */;


--
-- Definition of table `p_link`
--

DROP TABLE IF EXISTS `p_link`;
CREATE TABLE `p_link` (
  `link_id` int(11) NOT NULL auto_increment,
  `link_order_num` int(11) default NULL,
  `link_type` int(11) default NULL,
  `link_caption` text,
  `link_target_url` text,
  `link_pic_url` text,
  `link_end_id` int(11) default NULL,
  `link_unit_id` int(11) default '0',
  PRIMARY KEY  (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_link`
--

/*!40000 ALTER TABLE `p_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_link` ENABLE KEYS */;


--
-- Definition of table `p_motif`
--

DROP TABLE IF EXISTS `p_motif`;
CREATE TABLE `p_motif` (
  `motif_id` int(11) NOT NULL auto_increment,
  `motif_name` varchar(100) default NULL,
  `motif_ord` int(11) default NULL,
  `motif_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`motif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_motif`
--

/*!40000 ALTER TABLE `p_motif` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_motif` ENABLE KEYS */;


--
-- Definition of table `p_msg`
--

DROP TABLE IF EXISTS `p_msg`;
CREATE TABLE `p_msg` (
  `msg_id` bigint(20) NOT NULL auto_increment,
  `msg_ent_id` bigint(20) default NULL,
  `msg_time` datetime default NULL,
  `msg_status` int(11) default NULL,
  `msg_title` varchar(100) default NULL,
  `msg_body` mediumtext,
  `msg_respons` mediumtext,
  `msg_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_msg`
--

/*!40000 ALTER TABLE `p_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_msg` ENABLE KEYS */;


--
-- Definition of table `p_news`
--

DROP TABLE IF EXISTS `p_news`;
CREATE TABLE `p_news` (
  `news_id` int(11) NOT NULL auto_increment,
  `news_node_id` int(11) default NULL,
  `news_title` tinytext,
  `news_body` mediumtext,
  `news_summary` mediumtext,
  `news_time` datetime default NULL,
  `news_ord` int(11) default NULL,
  `news_counter` int(11) default NULL,
  `news_is_hot` int(11) default NULL,
  `news_motif_id` int(11) default NULL,
  `news_author` varchar(100) default NULL,
  `news_from` varchar(100) default NULL,
  `news_pic` text,
  `news_timemark` varchar(100) default NULL,
  `news_ent_id` int(11) NOT NULL default '0',
  `news_release_id` int(11) NOT NULL default '0',
  `news_paper_id` int(11) NOT NULL default '0',
  `news_unit_id` int(11) NOT NULL default '0',
  `news_doc_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_news`
--

/*!40000 ALTER TABLE `p_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_news` ENABLE KEYS */;


--
-- Definition of table `p_node`
--

DROP TABLE IF EXISTS `p_node`;
CREATE TABLE `p_node` (
  `node_id` int(11) NOT NULL auto_increment,
  `node_pid` int(11) default NULL,
  `node_ord` int(11) default NULL,
  `node_tag` varchar(20) default NULL,
  `node_name` varchar(100) default NULL,
  `node_memo` mediumtext,
  `node_type` int(11) default NULL,
  `node_url` varchar(255) default NULL,
  `node_template` varchar(255) default NULL,
  `node_show_index` int(11) default NULL,
  `node_show_menu` int(11) default NULL,
  `node_layer` varchar(60) default NULL,
  `node_sort_type` int(11) default NULL,
  `node_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_node`
--

/*!40000 ALTER TABLE `p_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_node` ENABLE KEYS */;


--
-- Definition of table `p_superadmin`
--

DROP TABLE IF EXISTS `p_superadmin`;
CREATE TABLE `p_superadmin` (
  `superadmin_id` int(11) NOT NULL auto_increment,
  `superadmin_name` varchar(50) default NULL,
  `superadmin_pass` varchar(60) default NULL,
  `superadmin_work` varchar(100) default NULL,
  `superadmin_rank` int(11) default NULL,
  `superadmin_showname` varchar(50) default NULL,
  `superadmin_email` varchar(255) default NULL,
  `superadmin_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`superadmin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_superadmin`
--

/*!40000 ALTER TABLE `p_superadmin` DISABLE KEYS */;
INSERT INTO `p_superadmin` (`superadmin_id`,`superadmin_name`,`superadmin_pass`,`superadmin_work`,`superadmin_rank`,`superadmin_showname`,`superadmin_email`,`superadmin_unit_id`) VALUES 
 (2,'admin','f6fdffe48c908deb0f4c3bd36c032e72','-',100,'www','x@xpaper.com',0);
/*!40000 ALTER TABLE `p_superadmin` ENABLE KEYS */;


--
-- Definition of table `p_tran`
--

DROP TABLE IF EXISTS `p_tran`;
CREATE TABLE `p_tran` (
  `tran_id` int(11) NOT NULL auto_increment,
  `tran_str` varchar(200) default NULL,
  `tran_admin_id` int(11) default NULL,
  `tran_time` datetime default NULL,
  `tran_ip` varchar(60) default NULL,
  PRIMARY KEY  (`tran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_tran`
--

/*!40000 ALTER TABLE `p_tran` DISABLE KEYS */;
INSERT INTO `p_tran` (`tran_id`,`tran_str`,`tran_admin_id`,`tran_time`,`tran_ip`) VALUES 
 (18,'afffc6b359537db539f5c3707825d4c7146256c2536501a6861b1cadd57b099b8ee5f4421250',87,'2007-02-06 06:42:51','127.0.0.1'),
 (19,'feded19f30744eb146a9c280cb0a4b4c37089649f70591860516585301f9c3a522d943211564',87,'2007-02-06 06:44:06','127.0.0.1'),
 (21,'d88c7b4b125ab17135acaaad441b4b9279682e147e30a1100968dda5289c4d10be99b313782',87,'2007-02-06 14:30:17','127.0.0.1');
/*!40000 ALTER TABLE `p_tran` ENABLE KEYS */;


--
-- Definition of table `p_unit`
--

DROP TABLE IF EXISTS `p_unit`;
CREATE TABLE `p_unit` (
  `unit_id` int(11) NOT NULL auto_increment,
  `unit_name` varchar(20) default NULL,
  `unit_pos` varchar(20) default NULL,
  `unit_ord` int(11) NOT NULL default '0',
  `unit_support` varchar(50) default NULL,
  `unit_path` varchar(20) default NULL,
  PRIMARY KEY  (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `p_unit`
--

/*!40000 ALTER TABLE `p_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_unit` ENABLE KEYS */;


--
-- Definition of table `x_action`
--

DROP TABLE IF EXISTS `x_action`;
CREATE TABLE `x_action` (
  `action_id` int(11) NOT NULL auto_increment,
  `action_unit_id` int(11) NOT NULL default '0',
  `action_title` varchar(200) default NULL,
  `action_body` text,
  `action_time` datetime default NULL,
  PRIMARY KEY  (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `x_action`
--

/*!40000 ALTER TABLE `x_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_action` ENABLE KEYS */;


--
-- Definition of table `x_actionmember`
--

DROP TABLE IF EXISTS `x_actionmember`;
CREATE TABLE `x_actionmember` (
  `actionmember_id` int(11) NOT NULL auto_increment,
  `actionmember_action_id` int(11) NOT NULL default '0',
  `actionmember_ent_id` int(11) NOT NULL default '0',
  `actionmember_name` varchar(100) NOT NULL default '',
  `actionmember_sex` int(11) NOT NULL default '0',
  `actionmember_idnum` varchar(20) NOT NULL default '',
  `actionmember_contact` text NOT NULL,
  PRIMARY KEY  (`actionmember_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `x_actionmember`
--

/*!40000 ALTER TABLE `x_actionmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_actionmember` ENABLE KEYS */;


--
-- Definition of table `x_committee`
--

DROP TABLE IF EXISTS `x_committee`;
CREATE TABLE `x_committee` (
  `committee_id` int(11) NOT NULL auto_increment,
  `committee_realname` varchar(20) default NULL,
  `committee_dept` varchar(100) default NULL,
  `committee_contact` varchar(200) default NULL,
  `committee_username` varchar(20) default NULL,
  `committee_password` varchar(20) default NULL,
  `committee_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`committee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `x_committee`
--

/*!40000 ALTER TABLE `x_committee` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_committee` ENABLE KEYS */;


--
-- Definition of table `x_pingxuan`
--

DROP TABLE IF EXISTS `x_pingxuan`;
CREATE TABLE `x_pingxuan` (
  `pingxuan_id` int(11) NOT NULL auto_increment,
  `pingxuan_unit_id` int(11) NOT NULL default '0',
  `pingxuan_title` varchar(200) NOT NULL default '',
  `pingxuan_body` text,
  `pingxuan_time` datetime default NULL,
  `pingxuan_status` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pingxuan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `x_pingxuan`
--

/*!40000 ALTER TABLE `x_pingxuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_pingxuan` ENABLE KEYS */;


--
-- Definition of table `x_pxcate`
--

DROP TABLE IF EXISTS `x_pxcate`;
CREATE TABLE `x_pxcate` (
  `pxcate_id` int(11) NOT NULL auto_increment,
  `pxcate_pingxuan_id` int(11) NOT NULL default '0',
  `pxcate_title` varchar(100) NOT NULL default '',
  `pxcate_lv1_lmt` int(11) NOT NULL default '0',
  `pxcate_lv2_lmt` int(11) NOT NULL default '0',
  `pxcate_lv3_lmt` int(11) NOT NULL default '0',
  `pxcate_lv4_lmt` int(11) NOT NULL default '0',
  `pxcate_lv5_lmt` int(11) NOT NULL default '0',
  `pxcate_lv6_lmt` int(11) NOT NULL default '0',
  `pxcate_lv7_lmt` int(11) NOT NULL default '0',
  `pxcate_lv8_lmt` int(11) NOT NULL default '0',
  `pxcate_lv9_lmt` int(11) NOT NULL default '0',
  `pxcate_lv10_lmt` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pxcate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `x_pxcate`
--

/*!40000 ALTER TABLE `x_pxcate` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_pxcate` ENABLE KEYS */;


--
-- Definition of table `x_pxdoc`
--

DROP TABLE IF EXISTS `x_pxdoc`;
CREATE TABLE `x_pxdoc` (
  `pxdoc_id` int(11) NOT NULL auto_increment,
  `pxdoc_pxcate_id` int(11) NOT NULL default '0',
  `pxdoc_ent_id` int(11) NOT NULL default '0',
  `pxdoc_unit_id` int(11) NOT NULL default '0',
  `pxdoc_doc_id` int(11) NOT NULL default '0',
  `pxdoc_lv` int(11) NOT NULL default '0',
  `pxdoc_sum_point` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pxdoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `x_pxdoc`
--

/*!40000 ALTER TABLE `x_pxdoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_pxdoc` ENABLE KEYS */;


--
-- Definition of table `x_pxdoclv`
--

DROP TABLE IF EXISTS `x_pxdoclv`;
CREATE TABLE `x_pxdoclv` (
  `pxdoclv_id` int(11) NOT NULL auto_increment,
  `pxdoclv_committee_id` int(11) NOT NULL default '0',
  `pxdoclv_lv` int(11) NOT NULL default '0',
  `pxdoclv_doc_id` int(11) NOT NULL default '0',
  `pxdoclv_pxcate_id` int(11) NOT NULL default '0',
  `pxdoclv_body` text,
  PRIMARY KEY  (`pxdoclv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `x_pxdoclv`
--

/*!40000 ALTER TABLE `x_pxdoclv` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_pxdoclv` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
