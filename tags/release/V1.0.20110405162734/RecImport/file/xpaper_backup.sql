--phpMyAdmin SQL Dump
--version 2.11.5
--http://www.phpmyadmin.net
--
--主机: localhost
--生成日期: 2008 年 11 月 07 日 11:55
--服务器版本: 5.0.22
--PHP 版本: 5.2.5

--SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
--数据库: `xpaper`
--
DROP DATABASE `xpaper`;
CREATE DATABASE `xpaper` DEFAULT CHARACTER SET UTF8 ;
USE `xpaper`;

----------------------------------------------------------

--
--表的结构 `gp_account`
--

DROP TABLE IF EXISTS `gp_account`;
CREATE TABLE IF NOT EXISTS `gp_account` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_account`
--


----------------------------------------------------------

--
--表的结构 `gp_admin`
--

DROP TABLE IF EXISTS `gp_admin`;
CREATE TABLE IF NOT EXISTS `gp_admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `admin_ent_id` int(11) default NULL,
  `admin_name` varchar(50) default NULL,
  `admin_pass` varchar(50) default NULL,
  `admin_work` varchar(80) default NULL,
  `admin_rank` int(11) default NULL,
  `admin_showname` varchar(50) default NULL,
  `admin_email` varchar(100) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=88 ;

--
--导出表中的数据 `gp_admin`
--

INSERT INTO `gp_admin` (`admin_id`, `admin_ent_id`, `admin_name`, `admin_pass`, `admin_work`, `admin_rank`, `admin_showname`, `admin_email`) VALUES
(87, 107, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Xpaper多媒体数字报', 100, '李总编', 'sales@jnostart.com');

----------------------------------------------------------

--
--表的结构 `gp_base`
--

DROP TABLE IF EXISTS `gp_base`;
CREATE TABLE IF NOT EXISTS `gp_base` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=85 ;

--
--导出表中的数据 `gp_base`
--

INSERT INTO `gp_base` (`base_id`, `base_ent_id`, `base_sitename`, `base_url`, `base_createtime`, `base_sponser`, `base_address`, `base_zip`, `base_tel`, `base_email`, `base_copyright`, `base_logo`, `base_logo_header`, `base_defaultimg`, `base_pdf`, `base_ps`, `base_theme_id`, `base_allow_comment`, `base_paper_width`, `base_old_url`) VALUES
(84, 107, 'Xpaper数字报刊', 'localhost', '2008-04-13 13:40:59', '北京金启程科技', '北京市海淀区', '100084', '01062713015', 'sales@jinostart.com', '', '', '', '', 0, 0, 1, 0, 550, '');

----------------------------------------------------------

--
--表的结构 `gp_block`
--

DROP TABLE IF EXISTS `gp_block`;
CREATE TABLE IF NOT EXISTS `gp_block` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_block`
--


----------------------------------------------------------

--
--表的结构 `gp_comment`
--

DROP TABLE IF EXISTS `gp_comment`;
CREATE TABLE IF NOT EXISTS `gp_comment` (
  `comment_id` bigint(20) NOT NULL auto_increment,
  `comment_doc_id` bigint(20) default NULL,
  `comment_content` mediumtext,
  `comment_username` varchar(50) default NULL,
  `comment_tel` varchar(50) default NULL,
  `comment_ip` varchar(50) default NULL,
  `comment_time` datetime default NULL,
  `comment_status` int(11) default NULL,
  PRIMARY KEY  (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_comment`
--


----------------------------------------------------------

--
--表的结构 `gp_contribute`
--

DROP TABLE IF EXISTS `gp_contribute`;
CREATE TABLE IF NOT EXISTS `gp_contribute` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=2 ;

--
--导出表中的数据 `gp_contribute`
--

INSERT INTO `gp_contribute` (`contribute_id`, `contribute_title`, `contribute_author`, `contribute_dept`, `contribute_address`, `contribute_zip`, `contribute_email`, `contribute_tel`, `contribute_body`, `contribute_time`, `contribute_img`, `contribute_status`, `contribute_filesize`, `contribute_ip`, `contribute_ent_id`) VALUES
(1, 'fsfds', 'fsf', 'cxscxzcz', 'czxczx', '43455', 'fds@we', '4345454555', 'vfdsszc', '2009-03-20 13:17:56', '', 0, 0, '127.0.0.1', 107);

----------------------------------------------------------

--
--表的结构 `gp_css`
--

DROP TABLE IF EXISTS `gp_css`;
CREATE TABLE IF NOT EXISTS `gp_css` (
  `css_id` int(11) NOT NULL auto_increment,
  `css_name` varchar(50) default NULL,
  `css_isDefault` int(11) default NULL,
  `css_type` int(11) default NULL,
  `css_fontsize` varchar(50) default NULL,
  `css_lineheight` varchar(50) default NULL,
  `css_others` text,
  PRIMARY KEY  (`css_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_css`
--


----------------------------------------------------------

--
--表的结构 `gp_div`
--

DROP TABLE IF EXISTS `gp_div`;
CREATE TABLE IF NOT EXISTS `gp_div` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_div`
--


----------------------------------------------------------

--
--表的结构 `gp_divdoc`
--

DROP TABLE IF EXISTS `gp_divdoc`;
CREATE TABLE IF NOT EXISTS `gp_divdoc` (
  `divdoc_id` bigint(20) NOT NULL auto_increment,
  `divdoc_div_id` int(11) default NULL,
  `divdoc_doc_id` int(11) default NULL,
  `divdoc_body` mediumtext,
  `divdoc_page_id` int(11) default NULL,
  `divdoc_release_id` int(11) default NULL,
  `divdoc_lock` int(11) default '0',
  `divdoc_ent_id` int(11) default NULL,
  PRIMARY KEY  (`divdoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_divdoc`
--


----------------------------------------------------------

--
--表的结构 `gp_doc`
--

DROP TABLE IF EXISTS `gp_doc`;
CREATE TABLE IF NOT EXISTS `gp_doc` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=318 ;

--
--导出表中的数据 `gp_doc`
--

----------------------------------------------------------

--
--表的结构 `gp_element`
--

DROP TABLE IF EXISTS `gp_element`;
CREATE TABLE IF NOT EXISTS `gp_element` (
  `element_id` int(11) NOT NULL auto_increment,
  `element_name` varchar(50) default NULL,
  `element_inner_inc_show` mediumtext,
  `element_outer_inc_show` mediumtext,
  `element_inner_inc` mediumtext,
  `element_outer_inc` mediumtext,
  `element_width` int(11) default NULL,
  `element_height` int(11) default NULL,
  PRIMARY KEY  (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_element`
--


----------------------------------------------------------

--
--表的结构 `gp_hotnews`
--

DROP TABLE IF EXISTS `gp_hotnews`;
CREATE TABLE IF NOT EXISTS `gp_hotnews` (
  `hot_id` bigint(20) NOT NULL auto_increment,
  `hot_content` mediumtext,
  `hot_release_id` bigint(20) default NULL,
  PRIMARY KEY  (`hot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_hotnews`
--


----------------------------------------------------------

--
--表的结构 `gp_image`
--

DROP TABLE IF EXISTS `gp_image`;
CREATE TABLE IF NOT EXISTS `gp_image` (
  `image_id` bigint(20) NOT NULL auto_increment,
  `image_admin_id` int(11) default NULL,
  `image_pic` text,
  `image_type` varchar(50) default NULL,
  `image_picsize` int(11) default NULL,
  `image_uploadtime` datetime default NULL,
  `image_class` int(11) default NULL,
  `image_ent_id` int(11) default NULL,
  PRIMARY KEY  (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_image`
--


----------------------------------------------------------

--
--表的结构 `gp_link`
--

DROP TABLE IF EXISTS `gp_link`;
CREATE TABLE IF NOT EXISTS `gp_link` (
  `link_id` int(11) NOT NULL auto_increment,
  `link_order_num` int(11) default NULL,
  `link_type` int(11) default NULL,
  `link_caption` text,
  `link_target_url` text,
  `link_pic_url` text,
  `link_ent_id` int(11) default NULL,
  PRIMARY KEY  (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=2 ;

--
--导出表中的数据 `gp_link`
--

INSERT INTO `gp_link` (`link_id`, `link_order_num`, `link_type`, `link_caption`, `link_target_url`, `link_pic_url`, `link_ent_id`) VALUES
(1, 1, 0, '新浪', 'http://www.sina.com.cn', '', 107);

----------------------------------------------------------

--
--表的结构 `gp_page`
--

DROP TABLE IF EXISTS `gp_page`;
CREATE TABLE IF NOT EXISTS `gp_page` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=6 ;

--
--导出表中的数据 `gp_page`
--

INSERT INTO `gp_page` (`page_id`, `page_ent_id`, `page_pid`, `page_class`, `page_type`, `page_name_cn`, `page_name_en`, `page_admin`, `page_template_id`, `page_sort`, `edit_time`, `page_duty_editor`, `page_status`, `page_counter`, `page_index`, `page_showstyle`, `page_listtag`, `page_property`) VALUES
(5, 107, 0, 0, 1, '关于我们', '', 'admin|', 0, 2, '2009-03-21 05:20:18', '李老师', 0, 1, '1', 1, '', '00');

----------------------------------------------------------

--
--表的结构 `gp_paper`
--

DROP TABLE IF EXISTS `gp_paper`;
CREATE TABLE IF NOT EXISTS `gp_paper` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=173 ;

--
--导出表中的数据 `gp_paper`
--


----------------------------------------------------------

--
--表的结构 `gp_papername`
--

DROP TABLE IF EXISTS `gp_papername`;
CREATE TABLE IF NOT EXISTS `gp_papername` (
  `papername_id` int(11) NOT NULL auto_increment,
  `papername_ent_id` int(11) NOT NULL default '0',
  `papername_caption` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`papername_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_papername`
--


----------------------------------------------------------

--
--表的结构 `gp_pdf`
--

DROP TABLE IF EXISTS `gp_pdf`;
CREATE TABLE IF NOT EXISTS `gp_pdf` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_pdf`
--


----------------------------------------------------------

--
--表的结构 `gp_ps`
--

DROP TABLE IF EXISTS `gp_ps`;
CREATE TABLE IF NOT EXISTS `gp_ps` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=900 ;

--
--导出表中的数据 `gp_ps`
--


----------------------------------------------------------

--
--表的结构 `gp_query`
--

DROP TABLE IF EXISTS `gp_query`;
CREATE TABLE IF NOT EXISTS `gp_query` (
  `query_id` int(11) NOT NULL auto_increment,
  `query_name` varchar(50) default NULL,
  `query_url` text,
  `query_pic_url` text,
  `query_order_num` int(11) default NULL,
  `query_type` int(11) default NULL,
  `query_method` int(11) default NULL,
  `query_ent_id` int(11) default NULL,
  PRIMARY KEY  (`query_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_query`
--


----------------------------------------------------------

--
--表的结构 `gp_release`
--

DROP TABLE IF EXISTS `gp_release`;
CREATE TABLE IF NOT EXISTS `gp_release` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=5 ;

--
--导出表中的数据 `gp_release`
--

INSERT INTO `gp_release` (`release_id`, `release_name`, `release_time`, `release_master`, `release_pubtime`, `release_opentime`, `release_doing`, `release_total`, `release_ent_id`, `release_pagecount`, `release_to1`, `release_whodo`, `release_whatindex`) VALUES
(4, '第1期', '2009-02-18 00:00:00', '', '2009-11-03 07:01:35', '2009-02-18 14:00:00', 1, '总第1期', 107, 0, NULL, '-', 0);

----------------------------------------------------------

--
--表的结构 `gp_remark`
--

DROP TABLE IF EXISTS `gp_remark`;
CREATE TABLE IF NOT EXISTS `gp_remark` (
  `remark_id` int(11) NOT NULL auto_increment,
  `remark_doc_id` int(11) default NULL,
  `remark_content` mediumtext,
  `remark_ip` varchar(50) default NULL,
  `remark_time` datetime default NULL,
  PRIMARY KEY  (`remark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=3 ;

--
--导出表中的数据 `gp_remark`
--

INSERT INTO `gp_remark` (`remark_id`, `remark_doc_id`, `remark_content`, `remark_ip`, `remark_time`) VALUES
(1, 119, '?', '127.0.0.1', '2006-12-04 15:45:45'),
(2, 151, '欢迎大家投稿，不错的，还有稿费', '127.0.0.1', '2007-02-06 14:40:53');

----------------------------------------------------------

--
--表的结构 `gp_source`
--

DROP TABLE IF EXISTS `gp_source`;
CREATE TABLE IF NOT EXISTS `gp_source` (
  `source_id` bigint(20) NOT NULL auto_increment,
  `source_name` varchar(255) default NULL,
  `source_count` int(11) default '0',
  `source_ent_id` int(11) default NULL,
  PRIMARY KEY  (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=6 ;

--
--导出表中的数据 `gp_source`
--

INSERT INTO `gp_source` (`source_id`, `source_name`, `source_count`, `source_ent_id`) VALUES
(1, '323e42323', 19, 0),
(2, '2', 19, 0),
(3, 'fdsa', 19, 0),
(4, '1', 12, 0),
(5, '人民日报', 9, 0);

----------------------------------------------------------

--
--表的结构 `gp_subject`
--

DROP TABLE IF EXISTS `gp_subject`;
CREATE TABLE IF NOT EXISTS `gp_subject` (
  `subject_id` int(11) NOT NULL auto_increment,
  `subject_name` varchar(50) default NULL,
  `subject_order_num` int(11) default NULL,
  `subject_ent_id` varchar(10) default NULL,
  PRIMARY KEY  (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=3 ;

--
--导出表中的数据 `gp_subject`
--

INSERT INTO `gp_subject` (`subject_id`, `subject_name`, `subject_order_num`, `subject_ent_id`) VALUES
(1, '专题1', 1, '1');

----------------------------------------------------------

--
--表的结构 `gp_template`
--

DROP TABLE IF EXISTS `gp_template`;
CREATE TABLE IF NOT EXISTS `gp_template` (
  `template_id` bigint(20) NOT NULL auto_increment,
  `template_type` int(11) default NULL,
  `template_name` varchar(50) default NULL,
  `template_filename` varchar(250) default NULL,
  `template_pic` varchar(250) default NULL,
  `template_zoom` text,
  `template_utemplate_id` int(11) default NULL,
  `template_ent_id` int(11) default NULL,
  PRIMARY KEY  (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_template`
--


----------------------------------------------------------

--
--表的结构 `gp_theme`
--

DROP TABLE IF EXISTS `gp_theme`;
CREATE TABLE IF NOT EXISTS `gp_theme` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=6 ;

--
--导出表中的数据 `gp_theme`
--

INSERT INTO `gp_theme` (`theme_id`, `theme_name`, `theme_pic`, `theme_folder`, `theme_time`, `theme_ent_id`, `theme_stat`, `theme_type`, `theme_paper_width`) VALUES
(1, '主题1', './theme/01.jpg', 'paper/01', '2010-10-10 00:00:01', 0, 1, 0, 550),
(2, '主题2', './theme/02.jpg', 'paper/02', '2010-10-10 00:00:01', 0, 1, 0, 418),
(3, '主题3', './theme/03.jpg', 'paper/03', '2010-10-10 00:00:01', 0, 1, 0, 320),
(4, '主题4', './theme/04.jpg', 'paper/04', '2010-10-10 00:00:01', 0, 1, 0, 320),
(5, '主题5', './theme/05.jpg', 'paper/05', '2010-10-10 00:00:01', 0, 1, 0, 320),
(6, '主题6', './theme/06.jpg', 'paper/06', '2010-10-10 00:00:01', 0, 1, 0, 320),
(7, '主题7', './theme/07.jpg', 'paper/07', '2010-10-10 00:00:01', 0, 1, 0, 320),
(8, '主题8', './theme/08.jpg', 'paper/08', '2010-10-10 00:00:01', 0, 1, 0, 380);

----------------------------------------------------------

--
--表的结构 `gp_ublock`
--

DROP TABLE IF EXISTS `gp_ublock`;
CREATE TABLE IF NOT EXISTS `gp_ublock` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_ublock`
--


----------------------------------------------------------

--
--表的结构 `gp_udiv`
--

DROP TABLE IF EXISTS `gp_udiv`;
CREATE TABLE IF NOT EXISTS `gp_udiv` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_udiv`
--


----------------------------------------------------------

--
--表的结构 `gp_uelement`
--

DROP TABLE IF EXISTS `gp_uelement`;
CREATE TABLE IF NOT EXISTS `gp_uelement` (
  `uelement_id` bigint(20) NOT NULL auto_increment,
  `uelement_utemplate_id` bigint(20) default NULL,
  `uelement_element_id` bigint(20) default NULL,
  `uelement_top` int(11) default NULL,
  `uelement_left` int(11) default NULL,
  `uelement_width` int(11) default NULL,
  `uelement_height` int(11) default NULL,
  `uelement_ent_id` int(11) default NULL,
  PRIMARY KEY  (`uelement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_uelement`
--


----------------------------------------------------------

--
--表的结构 `gp_utemplate`
--

DROP TABLE IF EXISTS `gp_utemplate`;
CREATE TABLE IF NOT EXISTS `gp_utemplate` (
  `utemplate_id` bigint(20) NOT NULL auto_increment,
  `utemplate_name` varchar(200) default NULL,
  `utemplate_mother_id` bigint(20) default NULL,
  `utemplate_ent_id` int(11) default NULL,
  PRIMARY KEY  (`utemplate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `gp_utemplate`
--


----------------------------------------------------------

--
--表的结构 `p_ad`
--

DROP TABLE IF EXISTS `p_ad`;
CREATE TABLE IF NOT EXISTS `p_ad` (
  `ad_id` int(11) NOT NULL auto_increment,
  `ad_tag` varchar(30) default NULL,
  `ad_type` int(11) default NULL,
  `ad_url` tinytext,
  `ad_pic` tinytext,
  `ad_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_ad`
--


----------------------------------------------------------

--
--表的结构 `p_ent`
--

DROP TABLE IF EXISTS `p_ent`;
CREATE TABLE IF NOT EXISTS `p_ent` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=108 ;

--
--导出表中的数据 `p_ent`
--
use xpaper;
INSERT INTO `p_ent` (`ent_id`, `ent_stat`, `ent_name`, `ent_paper_name`, `ent_pos`, `ent_contact`, `ent_dept`, `ent_job`, `ent_tel`, `ent_fax`, `ent_email`, `ent_http`, `ent_add`, `ent_zip`, `ent_begin_time`, `ent_end_time`, `ent_update_time`, `ent_update_release_id`, `ent_paper_url`, `ent_url`, `ent_update_release_name`, `ent_reg_time`, `ent_last_logon_time`, `ent_logon_counter`, `ent_pub_type`, `ent_ftp_folder`, `ent_comment_count`, `ent_comment_point`, `ent_comment_content`, `ent_comment_style`, `ent_school_type`, `ent_paper_type`) VALUES
(107, 1, 'Xpaper数字报', '《Xpaper数字报》', '900180017008', '', '', '', '8610-62713015', '8610-62713015', 'webmaster@xpaper.com', 'http://www.*.xpaper.com/', 'beijing', '100089', '2008-08-18 13:40:59', '2008-10-30 00:00:00', '2008-11-15 11:01:03', 2, './newspic/_paper/1/2/4ccd05c616ad752cb043ccd5a9d67025316636.jpg.jpg.jpg', 'hgc45143.chinaw3.com', 'no.1', '2008-04-13 13:38:44', '2009-11-03 06:42:48', 127, 0, 'admin', 0, 0, 0, 0, 0, 0);

----------------------------------------------------------

--
--表的结构 `p_good`
--

DROP TABLE IF EXISTS `p_good`;
CREATE TABLE IF NOT EXISTS `p_good` (
  `good_id` int(11) NOT NULL auto_increment,
  `good_ord` int(11) default NULL,
  `good_ent_id` int(11) default NULL,
  `good_release_id` int(11) default NULL,
  `good_paper_url` text,
  `good_unit_id` int(11) NOT NULL default '0',
  `good_pub_type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_good`
--


----------------------------------------------------------

--
--表的结构 `p_image`
--

DROP TABLE IF EXISTS `p_image`;
CREATE TABLE IF NOT EXISTS `p_image` (
  `image_id` int(11) NOT NULL auto_increment,
  `image_pic` tinytext,
  `image_type` varchar(20) default NULL,
  `image_picsize` int(11) default NULL,
  `image_uploadtime` datetime default NULL,
  `image_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_image`
--


----------------------------------------------------------

--
--表的结构 `p_link`
--

DROP TABLE IF EXISTS `p_link`;
CREATE TABLE IF NOT EXISTS `p_link` (
  `link_id` int(11) NOT NULL auto_increment,
  `link_order_num` int(11) default NULL,
  `link_type` int(11) default NULL,
  `link_caption` text,
  `link_target_url` text,
  `link_pic_url` text,
  `link_end_id` int(11) default NULL,
  `link_unit_id` int(11) default '0',
  PRIMARY KEY  (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_link`
--


----------------------------------------------------------

--
--表的结构 `p_motif`
--

DROP TABLE IF EXISTS `p_motif`;
CREATE TABLE IF NOT EXISTS `p_motif` (
  `motif_id` int(11) NOT NULL auto_increment,
  `motif_name` varchar(100) default NULL,
  `motif_ord` int(11) default NULL,
  `motif_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`motif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_motif`
--


----------------------------------------------------------

--
--表的结构 `p_msg`
--

DROP TABLE IF EXISTS `p_msg`;
CREATE TABLE IF NOT EXISTS `p_msg` (
  `msg_id` bigint(20) NOT NULL auto_increment,
  `msg_ent_id` bigint(20) default NULL,
  `msg_time` datetime default NULL,
  `msg_status` int(11) default NULL,
  `msg_title` varchar(100) default NULL,
  `msg_body` mediumtext,
  `msg_respons` mediumtext,
  `msg_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_msg`
--


----------------------------------------------------------

--
--表的结构 `p_news`
--

DROP TABLE IF EXISTS `p_news`;
CREATE TABLE IF NOT EXISTS `p_news` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_news`
--


----------------------------------------------------------

--
--表的结构 `p_node`
--

DROP TABLE IF EXISTS `p_node`;
CREATE TABLE IF NOT EXISTS `p_node` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_node`
--


----------------------------------------------------------

--
--表的结构 `p_superadmin`
--

DROP TABLE IF EXISTS `p_superadmin`;
CREATE TABLE IF NOT EXISTS `p_superadmin` (
  `superadmin_id` int(11) NOT NULL auto_increment,
  `superadmin_name` varchar(50) default NULL,
  `superadmin_pass` varchar(60) default NULL,
  `superadmin_work` varchar(100) default NULL,
  `superadmin_rank` int(11) default NULL,
  `superadmin_showname` varchar(50) default NULL,
  `superadmin_email` varchar(255) default NULL,
  `superadmin_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`superadmin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=3 ;

--
--导出表中的数据 `p_superadmin`
--

INSERT INTO `p_superadmin` (`superadmin_id`, `superadmin_name`, `superadmin_pass`, `superadmin_work`, `superadmin_rank`, `superadmin_showname`, `superadmin_email`, `superadmin_unit_id`) VALUES
(2, 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', '-', 100, 'www', 'x@xpaper.com', 0);

----------------------------------------------------------

--
--表的结构 `p_tran`
--

DROP TABLE IF EXISTS `p_tran`;
CREATE TABLE IF NOT EXISTS `p_tran` (
  `tran_id` int(11) NOT NULL auto_increment,
  `tran_str` varchar(200) default NULL,
  `tran_admin_id` int(11) default NULL,
  `tran_time` datetime default NULL,
  `tran_ip` varchar(60) default NULL,
  PRIMARY KEY  (`tran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=76 ;

--
--导出表中的数据 `p_tran`
--

INSERT INTO `p_tran` (`tran_id`, `tran_str`, `tran_admin_id`, `tran_time`, `tran_ip`) VALUES
(18, 'afffc6b359537db539f5c3707825d4c7146256c2536501a6861b1cadd57b099b8ee5f4421250', 87, '2007-02-06 06:42:51', '127.0.0.1'),
(19, 'feded19f30744eb146a9c280cb0a4b4c37089649f70591860516585301f9c3a522d943211564', 87, '2007-02-06 06:44:06', '127.0.0.1'),
(21, 'd88c7b4b125ab17135acaaad441b4b9279682e147e30a1100968dda5289c4d10be99b313782', 87, '2007-02-06 14:30:17', '127.0.0.1');

----------------------------------------------------------

--
--表的结构 `p_unit`
--

DROP TABLE IF EXISTS `p_unit`;
CREATE TABLE IF NOT EXISTS `p_unit` (
  `unit_id` int(11) NOT NULL auto_increment,
  `unit_name` varchar(20) default NULL,
  `unit_pos` varchar(20) default NULL,
  `unit_ord` int(11) NOT NULL default '0',
  `unit_support` varchar(50) default NULL,
  `unit_path` varchar(20) default NULL,
  PRIMARY KEY  (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `p_unit`
--


----------------------------------------------------------

--
--表的结构 `x_action`
--

DROP TABLE IF EXISTS `x_action`;
CREATE TABLE IF NOT EXISTS `x_action` (
  `action_id` int(11) NOT NULL auto_increment,
  `action_unit_id` int(11) NOT NULL default '0',
  `action_title` varchar(200) default NULL,
  `action_body` text,
  `action_time` datetime default NULL,
  PRIMARY KEY  (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `x_action`
--


----------------------------------------------------------

--
--表的结构 `x_actionmember`
--

DROP TABLE IF EXISTS `x_actionmember`;
CREATE TABLE IF NOT EXISTS `x_actionmember` (
  `actionmember_id` int(11) NOT NULL auto_increment,
  `actionmember_action_id` int(11) NOT NULL default '0',
  `actionmember_ent_id` int(11) NOT NULL default '0',
  `actionmember_name` varchar(100) NOT NULL default '',
  `actionmember_sex` int(11) NOT NULL default '0',
  `actionmember_idnum` varchar(20) NOT NULL default '',
  `actionmember_contact` text NOT NULL,
  PRIMARY KEY  (`actionmember_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `x_actionmember`
--


----------------------------------------------------------

--
--表的结构 `x_committee`
--

DROP TABLE IF EXISTS `x_committee`;
CREATE TABLE IF NOT EXISTS `x_committee` (
  `committee_id` int(11) NOT NULL auto_increment,
  `committee_realname` varchar(20) default NULL,
  `committee_dept` varchar(100) default NULL,
  `committee_contact` varchar(200) default NULL,
  `committee_username` varchar(20) default NULL,
  `committee_password` varchar(20) default NULL,
  `committee_unit_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`committee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `x_committee`
--


----------------------------------------------------------

--
--表的结构 `x_pingxuan`
--

DROP TABLE IF EXISTS `x_pingxuan`;
CREATE TABLE IF NOT EXISTS `x_pingxuan` (
  `pingxuan_id` int(11) NOT NULL auto_increment,
  `pingxuan_unit_id` int(11) NOT NULL default '0',
  `pingxuan_title` varchar(200) NOT NULL default '',
  `pingxuan_body` text,
  `pingxuan_time` datetime default NULL,
  `pingxuan_status` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pingxuan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `x_pingxuan`
--


----------------------------------------------------------

--
--表的结构 `x_pxcate`
--

DROP TABLE IF EXISTS `x_pxcate`;
CREATE TABLE IF NOT EXISTS `x_pxcate` (
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
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `x_pxcate`
--


----------------------------------------------------------

--
--表的结构 `x_pxdoc`
--

DROP TABLE IF EXISTS `x_pxdoc`;
CREATE TABLE IF NOT EXISTS `x_pxdoc` (
  `pxdoc_id` int(11) NOT NULL auto_increment,
  `pxdoc_pxcate_id` int(11) NOT NULL default '0',
  `pxdoc_ent_id` int(11) NOT NULL default '0',
  `pxdoc_unit_id` int(11) NOT NULL default '0',
  `pxdoc_doc_id` int(11) NOT NULL default '0',
  `pxdoc_lv` int(11) NOT NULL default '0',
  `pxdoc_sum_point` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pxdoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `x_pxdoc`
--


----------------------------------------------------------

--
--表的结构 `x_pxdoclv`
--

DROP TABLE IF EXISTS `x_pxdoclv`;
CREATE TABLE IF NOT EXISTS `x_pxdoclv` (
  `pxdoclv_id` int(11) NOT NULL auto_increment,
  `pxdoclv_committee_id` int(11) NOT NULL default '0',
  `pxdoclv_lv` int(11) NOT NULL default '0',
  `pxdoclv_doc_id` int(11) NOT NULL default '0',
  `pxdoclv_pxcate_id` int(11) NOT NULL default '0',
  `pxdoclv_body` text,
  PRIMARY KEY  (`pxdoclv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8 AUTO_INCREMENT=1 ;

--
--导出表中的数据 `x_pxdoclv`
--

