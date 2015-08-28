-- phpMyAdmin SQL Dump
-- version 4.2.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-08-28 20:12:17
-- 服务器版本： 5.5.44-0ubuntu0.14.10.1
-- PHP Version: 5.5.12-2ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onethink`
--
CREATE DATABASE IF NOT EXISTS `onethink` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `onethink`;

-- --------------------------------------------------------

--
-- 表的结构 `ot_action`
--
-- 创建时间： 2015-07-18 15:07:10
-- 最后更新： 2015-07-18 15:07:10
--

CREATE TABLE IF NOT EXISTS `ot_action` (
`id` int(11) unsigned NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ot_action`
--

INSERT INTO `ot_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `ot_action_log`
--
-- 创建时间： 2015-07-18 15:07:10
-- 最后更新： 2015-08-28 11:00:01
--

CREATE TABLE IF NOT EXISTS `ot_action_log` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=304 ;

--
-- 转存表中的数据 `ot_action_log`
--

INSERT INTO `ot_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 6, 1, 2130706433, 'config', 13, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1433675564),
(2, 11, 1, 2130706433, 'category', 39, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1433682322),
(3, 11, 1, 2130706433, 'category', 39, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1433682492),
(4, 11, 1, 2130706433, 'category', 39, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1433682517),
(5, 11, 1, 2130706433, 'category', 39, '操作url：/onethink/admin.php?s=/Category/remove/id/39.html', 1, 1433682822),
(6, 11, 1, 2130706433, 'category', 40, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1433682971),
(7, 11, 1, 2130706433, 'category', 41, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1433683031),
(8, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1433683291),
(9, 11, 1, 2130706433, 'category', 42, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1433683454),
(10, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-12 14:13登录了后台', 1, 1434089581),
(11, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-12 17:43登录了后台', 1, 1434102235),
(12, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-12 19:42登录了后台', 1, 1434109337),
(13, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-12 20:23登录了后台', 1, 1434111785),
(14, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-12 20:25登录了后台', 1, 1434111953),
(15, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-12 20:35登录了后台', 1, 1434112500),
(16, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-12 20:35登录了后台', 1, 1434112557),
(17, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-16 11:57登录了后台', 1, 1434427021),
(18, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-16 14:17登录了后台', 1, 1434435465),
(19, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-18 22:24登录了后台', 1, 1434637468),
(20, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-18 23:12登录了后台', 1, 1434640326),
(21, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-22 21:22登录了后台', 1, 1434979345),
(22, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-06-22 22:12登录了后台', 1, 1434982357),
(23, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-05 17:00登录了后台', 1, 1436086842),
(24, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-11 16:53登录了后台', 1, 1436604813),
(25, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-12 19:10登录了后台', 1, 1436699421),
(26, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-16 11:37登录了后台', 1, 1437017825),
(27, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-16 13:43登录了后台', 1, 1437025392),
(28, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-16 22:01登录了后台', 1, 1437055315),
(29, 11, 1, 2130706433, 'category', 41, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437055768),
(30, 11, 1, 2130706433, 'category', 41, '操作url：/onethink/admin.php?s=/Category/remove/id/41.html', 1, 1437055875),
(31, 11, 1, 2130706433, 'category', 42, '操作url：/onethink/admin.php?s=/Category/remove/id/42.html', 1, 1437055878),
(32, 11, 1, 2130706433, 'category', 40, '操作url：/onethink/admin.php?s=/Category/remove/id/40.html', 1, 1437055881),
(33, 11, 1, 2130706433, 'category', 43, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437055898),
(34, 11, 1, 2130706433, 'category', 43, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437055947),
(35, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437056053),
(36, 11, 1, 2130706433, 'category', 45, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437056077),
(37, 11, 1, 2130706433, 'category', 45, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437056092),
(38, 11, 1, 2130706433, 'category', 1, '操作url：/onethink/admin.php?s=/Category/remove/id/1.html', 1, 1437056653),
(39, 10, 1, 2130706433, 'Menu', 13, '操作url：/onethink/admin.php?s=/Menu/edit.html', 1, 1437056889),
(40, 10, 1, 2130706433, 'Menu', 0, '操作url：/onethink/admin.php?s=/Menu/del/id/13.html', 1, 1437056916),
(41, 11, 1, 2130706433, 'category', 45, '操作url：/onethink/admin.php?s=/Category/remove/id/45.html', 1, 1437057093),
(42, 11, 1, 2130706433, 'category', 46, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437057130),
(43, 11, 1, 2130706433, 'category', 46, '操作url：/onethink/admin.php?s=/Category/remove/id/46.html', 1, 1437057752),
(44, 11, 1, 2130706433, 'category', 47, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437060123),
(45, 11, 1, 2130706433, 'category', 48, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437061595),
(46, 11, 1, 2130706433, 'category', 48, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437061623),
(47, 11, 1, 2130706433, 'category', 48, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437061657),
(48, 11, 1, 2130706433, 'category', 48, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437061679),
(49, 11, 1, 2130706433, 'category', 49, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437061719),
(50, 11, 1, 2130706433, 'category', 49, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437061788),
(51, 11, 1, 2130706433, 'category', 48, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437061803),
(52, 11, 1, 2130706433, 'category', 48, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437061825),
(53, 11, 1, 2130706433, 'category', 50, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437062022),
(54, 11, 1, 2130706433, 'category', 51, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437062043),
(55, 11, 1, 2130706433, 'category', 52, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437062063),
(56, 11, 1, 2130706433, 'category', 47, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437062206),
(57, 11, 1, 2130706433, 'category', 53, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437062280),
(58, 8, 1, 2130706433, 'attribute', 33, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1437062753),
(59, 7, 1, 2130706433, 'model', 3, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437062963),
(60, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437062977),
(61, 1, 1, 3525927644, 'member', 1, 'kangbiao在2015-07-18 13:35登录了后台', 1, 1437197703),
(62, 9, 1, 2130706433, 'channel', 0, '操作url：/onethink/admin.php?s=/Channel/del/id/1.html', 1, 1437232192),
(63, 9, 1, 2130706433, 'channel', 0, '操作url：/onethink/admin.php?s=/Channel/del/id/2.html', 1, 1437232195),
(64, 9, 1, 2130706433, 'channel', 0, '操作url：/onethink/admin.php?s=/Channel/del/id/3.html', 1, 1437232198),
(65, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-23 22:59登录了后台', 1, 1437663544),
(66, 11, 1, 2130706433, 'category', 54, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1437663651),
(67, 11, 1, 2130706433, 'category', 54, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437663695),
(68, 11, 1, 2130706433, 'category', 53, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437667038),
(69, 11, 1, 2130706433, 'category', 48, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437667473),
(70, 11, 1, 2130706433, 'category', 49, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437667502),
(71, 11, 1, 2130706433, 'category', 54, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437667735),
(72, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437668277),
(73, 8, 1, 2130706433, 'attribute', 34, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1437668435),
(74, 8, 1, 2130706433, 'attribute', 35, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1437668587),
(75, 8, 1, 2130706433, 'attribute', 36, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1437668630),
(76, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437668925),
(77, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437668960),
(78, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437669245),
(79, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437669270),
(80, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437669365),
(81, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1437669372),
(82, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437669466),
(83, 8, 1, 2130706433, 'attribute', 37, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1437669581),
(84, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437669646),
(85, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437669865),
(86, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1437669910),
(87, 8, 1, 2130706433, 'attribute', 37, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1437669974),
(88, 8, 1, 2130706433, 'attribute', 37, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1437670005),
(89, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-25 22:36登录了后台', 1, 1437834971),
(90, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-29 15:26登录了后台', 1, 1438154790),
(91, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438154991),
(92, 8, 1, 2130706433, 'attribute', 38, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438155495),
(93, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438155598),
(94, 11, 1, 2130706433, 'category', 53, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438155626),
(95, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438155727),
(96, 11, 1, 2130706433, 'category', 53, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438155828),
(97, 11, 1, 2130706433, 'category', 53, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438155854),
(98, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438155954),
(99, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438156149),
(100, 8, 1, 2130706433, 'attribute', 38, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438156236),
(101, 8, 1, 2130706433, 'attribute', 38, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438156273),
(102, 8, 1, 2130706433, 'attribute', 39, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438156308),
(103, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438156413),
(104, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438156469),
(105, 8, 1, 2130706433, 'attribute', 39, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438156626),
(106, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438156683),
(107, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438156834),
(108, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438156920),
(109, 8, 1, 2130706433, 'attribute', 3, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438157097),
(110, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438157437),
(111, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438157448),
(112, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438157815),
(113, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438157834),
(114, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438157999),
(115, 8, 1, 2130706433, 'attribute', 39, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438158145),
(116, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438158244),
(117, 8, 1, 2130706433, 'attribute', 3, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438158397),
(118, 8, 1, 2130706433, 'attribute', 3, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438158453),
(119, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438158635),
(120, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438158693),
(121, 8, 1, 2130706433, 'attribute', 3, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438158728),
(122, 8, 1, 2130706433, 'attribute', 19, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438158744),
(123, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438158824),
(124, 10, 1, 2130706433, 'Menu', 6, '操作url：/onethink/admin.php?s=/Menu/edit.html', 1, 1438159091),
(125, 10, 1, 2130706433, 'Menu', 6, '操作url：/onethink/admin.php?s=/Menu/edit.html', 1, 1438159116),
(126, 1, 2, 2130706433, 'member', 2, 'normal在2015-07-29 18:09登录了后台', 1, 1438164578),
(127, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-29 18:09登录了后台', 1, 1438164592),
(128, 11, 1, 2130706433, 'category', 50, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438167370),
(129, 8, 1, 2130706433, 'attribute', 40, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438167513),
(130, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438167578),
(131, 8, 1, 2130706433, 'attribute', 40, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438167866),
(132, 8, 1, 2130706433, 'attribute', 41, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438167930),
(133, 8, 1, 2130706433, 'attribute', 41, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438167940),
(134, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438167987),
(135, 7, 1, 2130706433, 'model', 7, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438168060),
(136, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438168080),
(137, 7, 1, 2130706433, 'model', 8, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438168131),
(138, 8, 1, 2130706433, 'attribute', 42, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438168217),
(139, 8, 1, 2130706433, 'attribute', 43, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438168241),
(140, 7, 1, 2130706433, 'model', 8, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438168351),
(141, 7, 1, 2130706433, 'model', 8, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438168400),
(142, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438168580),
(143, 8, 1, 2130706433, 'attribute', 44, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438168733),
(144, 8, 1, 2130706433, 'attribute', 45, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438168781),
(145, 8, 1, 2130706433, 'attribute', 46, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438168877),
(146, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438169063),
(147, 11, 1, 2130706433, 'category', 51, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438169102),
(148, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438169203),
(149, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438169296),
(150, 11, 1, 2130706433, 'category', 51, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438169343),
(151, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438169644),
(152, 8, 1, 2130706433, 'attribute', 46, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438169703),
(153, 8, 1, 2130706433, 'attribute', 47, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438169835),
(154, 8, 1, 2130706433, 'attribute', 48, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438169884),
(155, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438169964),
(156, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438170004),
(157, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438170055),
(158, 11, 1, 2130706433, 'category', 52, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438170122),
(159, 11, 1, 2130706433, 'category', 55, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1438170175),
(160, 8, 1, 2130706433, 'attribute', 49, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438170212),
(161, 7, 1, 2130706433, 'model', 8, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438170238),
(162, 8, 1, 2130706433, 'attribute', 50, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438170432),
(163, 8, 1, 2130706433, 'attribute', 51, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438170458),
(164, 7, 1, 2130706433, 'model', 7, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438170540),
(165, 7, 1, 2130706433, 'model', 7, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438170572),
(166, 7, 1, 2130706433, 'model', 7, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438170594),
(167, 8, 1, 2130706433, 'attribute', 52, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438170762),
(168, 8, 1, 2130706433, 'attribute', 46, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438170774),
(169, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438170790),
(170, 7, 1, 2130706433, 'model', 4, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438170837),
(171, 8, 1, 2130706433, 'attribute', 52, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438170952),
(172, 7, 1, 2130706433, 'model', 6, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438171085),
(173, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-30 11:53登录了后台', 1, 1438228398),
(174, 11, 1, 2130706433, 'category', 56, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1438228858),
(175, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438228949),
(176, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438228957),
(177, 8, 1, 2130706433, 'attribute', 53, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438229302),
(178, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438229418),
(179, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438229455),
(180, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438229594),
(181, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438229708),
(182, 11, 1, 2130706433, 'category', 47, '操作url：/onethink/admin.php?s=/Category/remove/id/47.html', 1, 1438229741),
(183, 11, 1, 2130706433, 'category', 56, '操作url：/onethink/admin.php?s=/Category/remove/id/56.html', 1, 1438229756),
(184, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438229800),
(185, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438229882),
(186, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438230089),
(187, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-30 16:11登录了后台', 1, 1438243897),
(188, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-30 20:09登录了后台', 1, 1438258193),
(189, 9, 1, 2130706433, 'channel', 9, '操作url：/onethink/admin.php?s=/Channel/edit.html', 1, 1438258681),
(190, 11, 1, 2130706433, 'category', 57, '操作url：/onethink/admin.php?s=/Category/add.html', 1, 1438261799),
(191, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438261836),
(192, 8, 1, 2130706433, 'attribute', 54, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438261963),
(193, 8, 1, 2130706433, 'attribute', 55, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438262046),
(194, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438262173),
(195, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438262285),
(196, 11, 1, 2130706433, 'category', 57, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438262306),
(197, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438262339),
(198, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438262739),
(199, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438262877),
(200, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438263065),
(201, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438263108),
(202, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438263255),
(203, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438263362),
(204, 8, 1, 2130706433, 'attribute', 2, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438263397),
(205, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438263416),
(206, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438263494),
(207, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438263668),
(208, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1438263709),
(209, 7, 1, 2130706433, 'model', 5, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438263825),
(210, 8, 1, 2130706433, 'attribute', 55, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438264356),
(211, 8, 1, 2130706433, 'attribute', 55, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438264416),
(212, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438264902),
(213, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438264917),
(214, 8, 1, 2130706433, 'attribute', 55, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438265291),
(215, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438265314),
(216, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-07-31 15:54登录了后台', 1, 1438329266),
(217, 7, 1, 2130706433, 'model', 10, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438338649),
(218, 8, 1, 2130706433, 'attribute', 25, '操作url：/onethink/admin.php?s=/Attribute/remove/id/25.html', 1, 1438338707),
(219, 8, 1, 2130706433, 'attribute', 26, '操作url：/onethink/admin.php?s=/Attribute/remove/id/26.html', 1, 1438338711),
(220, 8, 1, 2130706433, 'attribute', 23, '操作url：/onethink/admin.php?s=/Attribute/remove/id/23.html', 1, 1438338715),
(221, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438338797),
(222, 8, 1, 2130706433, 'attribute', 56, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438338885),
(223, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438338903),
(224, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438338996),
(225, 8, 1, 2130706433, 'attribute', 56, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438339053),
(226, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438339227),
(227, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438339285),
(228, 8, 1, 2130706433, 'attribute', 56, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438339564),
(229, 8, 1, 2130706433, 'attribute', 56, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438339616),
(230, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438339639),
(231, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438339774),
(232, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438340029),
(233, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438340200),
(234, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438340240),
(235, 8, 1, 2130706433, 'attribute', 56, '操作url：/onethink/admin.php?s=/Attribute/remove/id/56.html', 1, 1438340414),
(236, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438340433),
(237, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438340584),
(238, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438340673),
(239, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438340970),
(240, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438340989),
(241, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341002),
(242, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341084),
(243, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341230),
(244, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438341273),
(245, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341581),
(246, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341596),
(247, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341683),
(248, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341782),
(249, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438341850),
(250, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341921),
(251, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438341942),
(252, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438341948),
(253, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438342036),
(254, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438342099),
(255, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438342135),
(256, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438342155),
(257, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438342224),
(258, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438342330),
(259, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438342419),
(260, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438342496),
(261, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438342535),
(262, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438342748),
(263, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438342785),
(264, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438342885),
(265, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438343004),
(266, 6, 1, 2130706433, 'config', 11, '操作url：/onethink/admin.php?s=/Config/edit.html', 1, 1438343080),
(267, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438343207),
(268, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438343262),
(269, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438343484),
(270, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438343541),
(271, 6, 1, 2130706433, 'config', 0, '操作url：/onethink/admin.php?s=/Config/del/id/11.html', 1, 1438343725),
(272, 8, 1, 2130706433, 'attribute', 57, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438343832),
(273, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438343849),
(274, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438343874),
(275, 8, 1, 2130706433, 'attribute', 10, '操作url：/onethink/admin.php?s=/Attribute/update.html', 1, 1438358454),
(276, 8, 1, 2130706433, 'attribute', 55, '操作url：/onethink/admin.php?s=/Attribute/remove/id/55.html', 1, 1438358476),
(277, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438358518),
(278, 7, 1, 2130706433, 'model', 9, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438358539),
(279, 8, 1, 2130706433, 'attribute', 57, '操作url：/onethink/admin.php?s=/Attribute/remove/id/57.html', 1, 1438358967),
(280, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438358985),
(281, 7, 1, 2130706433, 'model', 2, '操作url：/onethink/admin.php?s=/Model/update.html', 1, 1438359003),
(282, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-08-03 21:02登录了后台', 1, 1438606938),
(283, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-08-07 20:58登录了后台', 1, 1438952285),
(284, 1, 2, 2130706433, 'member', 2, 'normal在2015-08-07 21:20登录了后台', 1, 1438953627),
(285, 1, 2, 2130706433, 'member', 2, 'normal在2015-08-07 21:20登录了后台', 1, 1438953647),
(286, 1, 2, 2130706433, 'member', 2, 'normal在2015-08-07 21:24登录了后台', 1, 1438953879),
(287, 1, 2, 2130706433, 'member', 2, 'normal在2015-08-07 21:24登录了后台', 1, 1438953889),
(288, 1, 3, 2130706433, 'member', 3, 'test在2015-08-07 21:25登录了后台', 1, 1438953958),
(289, 1, 3, 2130706433, 'member', 3, 'test在2015-08-07 21:26登录了后台', 1, 1438953975),
(290, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-08-17 16:01登录了后台', 1, 1439798481),
(291, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-08-17 20:51登录了后台', 1, 1439815884),
(292, 11, 1, 2130706433, 'category', 44, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817100),
(293, 11, 1, 2130706433, 'category', 53, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817217),
(294, 11, 1, 2130706433, 'category', 57, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817255),
(295, 11, 1, 2130706433, 'category', 55, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817290),
(296, 11, 1, 2130706433, 'category', 52, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817297),
(297, 11, 1, 2130706433, 'category', 51, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817304),
(298, 11, 1, 2130706433, 'category', 54, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817340),
(299, 11, 1, 2130706433, 'category', 54, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817344),
(300, 11, 1, 2130706433, 'category', 54, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817365),
(301, 11, 1, 2130706433, 'category', 49, '操作url：/onethink/admin.php?s=/Category/edit.html', 1, 1439817371),
(302, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-08-24 18:59登录了后台', 1, 1440413976),
(303, 1, 1, 2130706433, 'member', 1, 'kangbiao在2015-08-28 19:00登录了后台', 1, 1440759601);

-- --------------------------------------------------------

--
-- 表的结构 `ot_addons`
--
-- 创建时间： 2015-07-18 15:07:10
-- 最后更新： 2015-07-31 09:24:34
--

CREATE TABLE IF NOT EXISTS `ot_addons` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `ot_addons`
--

INSERT INTO `ot_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"2","editor_markdownpreview":"0","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 0, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ot_attachment`
--
-- 创建时间： 2015-07-18 15:07:10
-- 最后更新： 2015-07-18 15:07:10
--

CREATE TABLE IF NOT EXISTS `ot_attachment` (
`id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ot_attribute`
--
-- 创建时间： 2015-07-18 15:07:10
-- 最后更新： 2015-07-31 16:09:27
--

CREATE TABLE IF NOT EXISTS `ot_attribute` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `ot_attribute`
--

INSERT INTO `ot_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '', 1, '', 1, 0, 1, 1438263397, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(3, 'title', '标题', 'char(80) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1438158728, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'atindex', '是否显示在首页', 'tinyint(4) NOT NULL', 'radio', '0', '若选择显示，请上传封面图片', 1, '0:不显示\r\n1:显示', 1, 0, 1, 1438358454, 1383891233, '', 3, '', 'regex', '', 0, 'function'),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1438158744, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(53, 'detail', '详细内容', 'text NOT NULL', 'editor', '', '', 1, '', 5, 1, 1, 1438229302, 1438229302, '', 3, '', 'regex', '', 3, 'function'),
(38, 'publish_view', '出版物详细信息', 'text NOT NULL', 'editor', '', '', 1, '', 6, 1, 1, 1438156273, 1438155495, '', 3, '', 'regex', '', 3, 'function'),
(39, 'publish_shortcut', '出版物简介', 'text NOT NULL', 'textarea', '', '', 1, '', 6, 0, 1, 1438158145, 1438156308, '', 3, '', 'regex', '', 3, 'function'),
(47, 'research_forward', '研究方向', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1438169835, 1438169835, '', 3, '', 'regex', '', 3, 'function'),
(48, 'contact', '联系方式', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1438169884, 1438169884, '', 3, '', 'regex', '', 3, 'function'),
(42, 'research_forward', '研究方向', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 8, 0, 1, 1438168218, 1438168218, '', 3, '', 'regex', '', 3, 'function'),
(43, 'contact', '联系方式', 'varchar(20) NOT NULL', 'string', '', '', 1, '', 8, 0, 1, 1438168241, 1438168241, '', 3, '', 'regex', '', 3, 'function'),
(44, 'zhicheng', '职称', 'varchar(30) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1438168733, 1438168733, '', 3, '', 'regex', '', 3, 'function'),
(45, 'introduction', '介绍', 'text NOT NULL', 'editor', '', '', 1, '', 4, 0, 1, 1438168781, 1438168781, '', 3, '', 'regex', '', 3, 'function'),
(46, 'header_img', '照片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 4, 1, 1, 1438170775, 1438168877, '', 3, '', 'regex', '', 3, 'function'),
(49, 'header_img', '照片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 8, 1, 1, 1438170212, 1438170212, '', 3, '', 'regex', '', 3, 'function'),
(50, 'where', '去向', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 7, 0, 1, 1438170432, 1438170432, '', 3, '', 'regex', '', 3, 'function'),
(51, 'header_img', '照片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 7, 1, 1, 1438170458, 1438170458, '', 3, '', 'regex', '', 3, 'function'),
(52, 'show_introduction', '是否显示简介', 'tinyint(4) NOT NULL', 'radio', '0', '', 1, '0:不显示\n1:显示', 4, 1, 1, 1438170952, 1438170762, '', 3, '', 'regex', '', 3, 'function'),
(54, 'detail', '研究方向介绍', 'text NOT NULL', 'editor', '', '', 1, '', 9, 1, 1, 1438261963, 1438261963, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `ot_auth_extend`
--
-- 创建时间： 2015-07-18 15:07:10
-- 最后更新： 2015-08-07 13:25:52
--

CREATE TABLE IF NOT EXISTS `ot_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `ot_auth_extend`
--

INSERT INTO `ot_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1),
(2, 43, 1),
(2, 44, 1),
(2, 48, 1),
(2, 49, 1),
(2, 50, 1),
(2, 51, 1),
(2, 52, 1),
(2, 53, 1),
(2, 54, 1),
(2, 55, 1),
(2, 57, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ot_auth_group`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-08-07 13:26:12
--

CREATE TABLE IF NOT EXISTS `ot_auth_group` (
`id` mediumint(8) unsigned NOT NULL COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ot_auth_group`
--

INSERT INTO `ot_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,17,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,100,102,103');

-- --------------------------------------------------------

--
-- 表的结构 `ot_auth_group_access`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-08-07 13:25:32
--

CREATE TABLE IF NOT EXISTS `ot_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ot_auth_group_access`
--

INSERT INTO `ot_auth_group_access` (`uid`, `group_id`) VALUES
(3, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ot_auth_rule`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-18 15:07:11
-- 最后检查： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_auth_rule` (
`id` mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=219 ;

--
-- 转存表中的数据 `ot_auth_rule`
--

INSERT INTO `ot_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/index', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/Article/examine', '审核列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', -1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(218, 'admin', 1, 'Admin/think/lists', '数据列表', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ot_category`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-08-17 13:16:11
--

CREATE TABLE IF NOT EXISTS `ot_category` (
`id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `ot_category`
--

INSERT INTO `ot_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(48, 'news', '新闻事件', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2,3', '2,1,3', 0, 0, 1, 0, 0, '', NULL, 1437061595, 1437667473, 1, 0, ''),
(49, 'fenlei1', '分类1', 48, 0, 10, '', '', '', '', '', '', '', '2', '2', '2,1', 0, 1, 1, 0, 0, '', NULL, 1437061719, 1439817371, 1, 0, '中文,\r\n英文'),
(43, 'active', '动态管理', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2,3', '2,1,3', 0, 0, 1, 0, 0, '', NULL, 1437055898, 1437055947, 1, 0, ''),
(44, 'onlyOneDoc', '单独文档', 43, 0, 10, '', '', '', '', '', '', '', '5', '5', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1437056053, 1439817100, 1, 0, '中文,\r\n英文'),
(50, 'members', '成员信息', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '4', '2,1,3', 0, 0, 1, 0, 0, '', NULL, 1437062022, 1438167370, 1, 0, ''),
(51, 'teacher', '老师', 50, 0, 10, '', '', '', '', '', '', '', '4', '4', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1437062043, 1439817304, 1, 0, '中文,\r\n英文'),
(52, 'student', '小组成员', 50, 0, 10, '', '', '', '', '', '', '', '8', '8', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1437062063, 1439817297, 1, 0, '中文,\r\n英文'),
(53, 'publish', '出版物', 43, 0, 10, '', '', '', '', '', '', '', '6', '6', '2,1', 0, 1, 1, 0, 0, '', NULL, 1437062280, 1439817217, 1, 0, '中文,\r\n英文'),
(54, 'fenlei2', '分类2个', 48, 0, 10, '', '', '', '', '', '', '', '2', '2', '2,1', 0, 1, 1, 0, 0, '', NULL, 1437663651, 1439817365, 1, 0, '中文,\r\n英文'),
(55, 'graduated_stu', '已毕业学生', 50, 0, 10, '', '', '', '', '', '', '', '7', '7', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1438170175, 1439817290, 1, 0, '中文,\r\n英文'),
(57, 'research_forward', '研究方向', 43, 0, 10, '', '', '', '', '', '', '', '9', '9', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1438261799, 1439817255, 1, 0, '中文,\r\n英文');

-- --------------------------------------------------------

--
-- 表的结构 `ot_channel`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-08-28 11:00:44
--

CREATE TABLE IF NOT EXISTS `ot_channel` (
`id` int(10) unsigned NOT NULL COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `ot_channel`
--

INSERT INTO `ot_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(6, 0, '新闻事件', 'nav/news', 3, 1437232258, 1437232258, 1, 0),
(5, 0, '出版物', 'nav/publish', 2, 1437232243, 1437232243, 1, 0),
(4, 0, '研究方向', 'nav/research', 1, 1437232226, 1437232226, 1, 0),
(7, 0, '成员信息', 'nav/members', 4, 1437232304, 1437232304, 1, 0),
(8, 0, '关于我们', 'nav/about', 5, 1437232322, 1437232322, 1, 0),
(9, 0, '联系我们', 'nav/contact', 6, 1438258672, 1438258681, 1, 0),
(10, 0, '向勇老师', 'nav/bio', 0, 1440759644, 1440759644, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ot_config`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-31 11:55:25
--

CREATE TABLE IF NOT EXISTS `ot_config` (
`id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `ot_config`
--

INSERT INTO `ot_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, 'XXX教研室', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'XXX教研室', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP,OneThink', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 9),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰\r\namaze:蓝色清爽', '后台颜色风格', 1379122533, 1433675564, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '0', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ot_document`
--
-- 创建时间： 2015-07-31 10:56:40
-- 最后更新： 2015-08-28 11:39:31
--

CREATE TABLE IF NOT EXISTS `ot_document` (
`id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL COMMENT '标识',
  `title` char(80) NOT NULL COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `atindex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示在首页',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `ot_document`
--

INSERT INTO `ot_document` (`id`, `uid`, `name`, `title`, `category_id`, `group_id`, `description`, `root`, `pid`, `model_id`, `type`, `atindex`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(1, 1, '', 'OneThink1.1开发版发布', 43, 0, '期待已久的OneThink最新版发布', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 21, 0, 0, 0, 1406001360, 1433675839, 1),
(2, 1, '', 'dsd', 43, 0, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 5, 0, 0, 0, 1434091995, 1434091995, 1),
(3, 1, '', 'fgdf', 44, 0, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1437061362, 1437061362, -1),
(4, 1, '', '标题1', 49, 0, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1437663803, 1437663803, 3),
(5, 1, '', '文章1_1', 49, 0, '文章1_1的描述', 0, 0, 2, 2, 0, 0, 7, 1, 0, 0, 5, 0, 0, 0, 1438607029, 1438607029, 1),
(6, 1, '', '文章2_1', 54, 0, '文章2_1的描述', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 11, 0, 0, 0, 1438343505, 1438343505, 1),
(7, 1, '', '出版物1', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438155780, 1438155809, -1),
(8, 1, '', '', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438156500, 1438156592, 3),
(9, 1, '', '', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1438156800, 1438156903, 3),
(10, 1, '', '', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1435737720, 1438156998, 3),
(11, 1, '', '', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1435824300, 1438157172, 3),
(12, 1, '', '新闻事件', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1435911000, 1438157462, 1),
(13, 1, '', '', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1435825020, 1438157897, 3),
(14, 1, '', '', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1435911480, 1438157991, 3),
(15, 1, '', '', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1435825200, 1438158126, 3),
(17, 1, '', '康彪', 52, 0, '', 0, 0, 8, 2, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 1438249243, 1438249243, 1),
(18, 1, '', '何老师', 51, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 10, 0, 0, 0, 1438245928, 1438245928, 1),
(19, 1, '', '林老师', 51, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438247829, 1438247829, 1),
(20, 1, '', 'lilaish', 51, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438252236, 1438252236, 1),
(21, 1, '关于我们', 'about', 44, 0, '', 0, 0, 5, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438263624, 1438263624, 1),
(22, 1, '', 'research', 44, 0, '', 0, 0, 5, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438259151, 1438259151, -1),
(23, 1, '专利', 'patent', 44, 0, '', 0, 0, 5, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438263613, 1438263613, 1),
(24, 1, '联系我们', 'contact', 44, 0, '', 0, 0, 5, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1440414087, 1440414087, 1),
(25, 1, '', '康彪', 55, 0, '', 0, 0, 7, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438263977, 1438263977, 1),
(26, 1, '', '研究方向1', 57, 0, '研究方向描述(必研究方向描述', 0, 0, 9, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438336313, 1438336313, 1),
(27, 1, '', '研究方向名称', 57, 0, '研究方向描述研究方向描述研究方向描述研究方向描述研究方向描述研究方向描述研究方向描述', 0, 0, 9, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438264476, 1438264476, -1),
(28, 1, '', '研究方向名称', 57, 0, '研究方向描述研究方向描述', 0, 0, 9, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438358567, 1438358567, 1),
(30, 1, '', '出版物简介1', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438329300, 1438330586, 1),
(31, 1, '', '出版物简介2', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1438329300, 1438330874, 1),
(32, 1, '', '出版物简介', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1423123200, 1440416977, 1),
(33, 1, '', '$publishCategory$publishCategory', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1435738980, 1438331005, 1),
(34, 1, '', '郭德纲', 49, 0, '规范化的灌灌灌灌灌', 0, 0, 2, 2, 0, 0, 6, 1, 0, 0, 20, 0, 0, 0, 1438607006, 1438607006, 1),
(35, 1, '', 'fdsf', 49, 0, 'dsadsadsad', 0, 0, 2, 2, 1, 0, 5, 1, 0, 0, 7, 0, 0, 0, 1438606993, 1438606993, 1),
(36, 1, '', 'fds', 49, 1, '公司发到', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1439817470, 1439817470, 1),
(37, 1, '', '', 53, 0, '', 0, 0, 6, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1437132180, 1440416938, 3),
(38, 1, '向勇老师简历', 'bio', 44, 0, '', 0, 0, 5, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1440761971, 1440761971, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_article`
--
-- 创建时间： 2015-07-31 16:09:27
-- 最后更新： 2015-08-17 13:17:50
--

CREATE TABLE IF NOT EXISTS `ot_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `content` text NOT NULL COMMENT '文章内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `ot_document_article`
--

INSERT INTO `ot_document_article` (`id`, `content`) VALUES
(1, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>'),
(2, '<p>dsds<br/></p>'),
(3, '<p>ghfdgfdg<br/></p>'),
(4, ''),
(5, '<p><span style="font-size: 20px;">的发生范德萨</span><br/></p>'),
(6, '<p><span style="font-size: 24px;">的发生发的说法第三方<br/></span></p>'),
(34, '<p>挂号费和规范和风格<br/></p>'),
(35, '<p>dsfdsfdsfds<br/></p>'),
(36, '<p>非官方的个<br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_download`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_graduated_stu`
--
-- 创建时间： 2015-07-29 11:47:38
--

CREATE TABLE IF NOT EXISTS `ot_document_graduated_stu` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `where` varchar(255) NOT NULL COMMENT '去向',
  `header_img` int(10) unsigned NOT NULL COMMENT '照片'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `ot_document_graduated_stu`
--

INSERT INTO `ot_document_graduated_stu` (`id`, `where`, `header_img`) VALUES
(25, '清华大学', 4);

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_members`
--
-- 创建时间： 2015-07-29 11:05:40
--

CREATE TABLE IF NOT EXISTS `ot_document_members` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `research_forward` varchar(50) NOT NULL COMMENT '研究方向',
  `contact` varchar(20) NOT NULL COMMENT '联系方式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_onlyone`
--
-- 创建时间： 2015-07-30 04:08:22
--

CREATE TABLE IF NOT EXISTS `ot_document_onlyone` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `detail` text NOT NULL COMMENT '详细内容'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `ot_document_onlyone`
--

INSERT INTO `ot_document_onlyone` (`id`, `detail`) VALUES
(21, '<p style="text-indent:28px;background-color:white"><span style="font-size:14px;line-height:1.5">信息与软件工程学院前身为电子科技大学示范性软件学院，是教育部和国家计委联合批准成立的全国首批</span><span style="font-size:14px;line-height:1.5">35</span><span style="font-size:14px;line-height:1.5">所示范性软件学院之一。</span><span style="font-size:14px;line-height:1.5">2011</span><span style="font-size:14px;line-height:1.5">年信息与软件工程学院以电子科技大学沙河校区代码独立招生。学院现有软件工程一级学科博士学位授予权，软件工程专业为国家级特色专业。</span></p><p style="text-indent:28px;background-color:white"><span style="font-size:14px;line-height:1.5">学院拥有国家软件人才国际培训基地（成都）、</span><span style="font-size:14px;line-height:1.5">IBM</span><span style="font-size:14px;line-height:1.5">大型主机系统教育中心（成都）、国家级工程实践教育中心（国家级校</span><a name="_GoBack"></a><span style="font-size:14px;line-height:1.5">外实践基地）等机构。其中，国家软件人才国际培训基地（成都）是由国家外国专家局、国际人才交流基金会联合批准的全国首批基地之一；</span><span style="font-size:14px;line-height:1.5">IBM</span><span style="font-size:14px;line-height:1.5">大型主机系统教育中心（成都）是全国首批建立的五个中心之一，拥有西南地区唯一一台</span><span style="font-size:14px;line-height:1.5">IBMeServer Z900</span><span style="font-size:14px;line-height:1.5">大型计算机。</span></p><p style="text-indent:28px"><span style="font-size:14px;line-height:1.5">学院拥有一支学历高、经验丰富的教学师资队伍。现有专职教师</span><span style="font-size:14px;line-height:1.5">91</span><span style="font-size:14px;line-height:1.5">人，具有博士学位教师</span><span style="font-size:14px;line-height:1.5">70</span><span style="font-size:14px;line-height:1.5">人，几十位企业及国外兼职教师。</span><a name="OLE_LINK6"></a><a name="OLE_LINK5"></a><span style="font-size:14px;line-height:1.5">近年来，学院承担了</span><span style="font-size:14px;line-height:1.5">8</span><span style="font-size:14px;line-height:1.5">项国家级及省部级教学研究项目。获国家级教学成果二等奖</span><span style="font-size:14px;line-height:1.5">1</span><span style="font-size:14px;line-height:1.5">项，获四川省教学成果一等奖</span><span style="font-size:14px;line-height:1.5">1</span><span style="font-size:14px;line-height:1.5">项，获各级精品课程</span><span style="font-size:14px;line-height:1.5">20</span><span style="font-size:14px;line-height:1.5">门，出版教材近</span><span style="font-size:14px;line-height:1.5">21</span><span style="font-size:14px;line-height:1.5">部。承担了国家重大科技专项</span><span style="font-size:14px;line-height:1.5">1</span><span style="font-size:14px;line-height:1.5">项、国家科技支撑计划项目</span><span style="font-size:14px;line-height:1.5">1</span><span style="font-size:14px;line-height:1.5">项、国家</span><span style="font-size:14px;line-height:1.5">863</span><span style="font-size:14px;line-height:1.5">计划项目</span><span style="font-size:14px;line-height:1.5">1</span><span style="font-size:14px;line-height:1.5">项、国家自然科学基金</span><span style="font-size:14px;line-height:1.5">27</span><span style="font-size:14px;line-height:1.5">项，横向科研项目</span><span style="font-size:14px;line-height:1.5">90</span><span style="font-size:14px;line-height:1.5">余项。发表学术论文</span><span style="font-size:14px;line-height:1.5">590</span><span style="font-size:14px;line-height:1.5">余篇，其中被</span><span style="font-size:14px;line-height:1.5">SCI/EI</span><span style="font-size:14px;line-height:1.5">检索收录</span><span style="font-size:14px;line-height:1.5">130</span><span style="font-size:14px;line-height:1.5">多篇，获得专利及软件著作权</span><span style="font-size:14px;line-height:1.5">10</span><span style="font-size:14px;line-height:1.5">余项，获省科技进步二等奖</span><span style="font-size:14px;line-height:1.5">2</span><span style="font-size:14px;line-height:1.5">项、三等奖</span><span style="font-size:14px;line-height:1.5">2</span><span style="font-size:14px;line-height:1.5">项。</span></p><p style="text-indent:28px"><a name="OLE_LINK2"></a><a name="OLE_LINK1"></a><span style="font-size:14px;line-height:1.5">学院建立良好的教学科研环境，配备先进的教学实验设备。目前在校内拥有</span><span style="font-size:14px;line-height:1.5">3500</span><span style="font-size:14px;line-height:1.5">㎡供本科和研究生使用的教学、科研实验场地。与</span><span style="font-size:14px;line-height:1.5">IBM</span><span style="font-size:14px;line-height:1.5">、长虹、中软等建立教育部工程实践教育中心，与</span><span style="font-size:14px;line-height:1.5">Intel</span><span style="font-size:14px;line-height:1.5">、德州仪器（</span><span style="font-size:14px;line-height:1.5">TI</span><span style="font-size:14px;line-height:1.5">）、腾讯、百度、青牛软件、东方通等</span><span style="font-size:14px;line-height:1.5">10</span><span style="font-size:14px;line-height:1.5">余家国内外知名企业建立了校内、校外实习实训基地。</span></p><p style="text-indent:28px;background-color:white"><span style="font-size:14px;line-height:1.5">学院结合国家“卓越工程师教育培养计划</span><span style="font-size:14px;line-height:1.5">”</span><span style="font-size:14px;line-height:1.5">，坚持以学生为中心、以创新求发展的人才培养理念，培养专业知识厚、综合素质高、创新能力强、具有良好职业素养、拥有国际视野和社会竞争力强的工程型软件人才。自建院以来，共为国家和地方输送了</span><a name="OLE_LINK8"></a><a name="OLE_LINK7"></a><span style="font-size:14px;line-height:1.5">5000</span><span style="font-size:14px;line-height:1.5">余名各层次复合型软件人才。学院设有软件技术、嵌入式系统、大型主机、网络安全工程、信息工程、数字动漫等本科生培养方向，有软件工程全日制专业学位和在职硕士研究生、软件工程博士研究生学位授予权。目前全日制在校学生</span><span style="font-size:14px;line-height:1.5">2600</span><span style="font-size:14px;line-height:1.5">余人，其中本科生</span><span style="font-size:14px;line-height:1.5">2200</span><span style="font-size:14px;line-height:1.5">余人，研究生</span><span style="font-size:14px;line-height:1.5">470</span><span style="font-size:14px;line-height:1.5">余人。</span></p><p style="text-indent:28px;background-color:white"><span style="font-size:14px;line-height:1.5">学院高度重视学生的国际化培养。与美国、英国、爱尔兰、比利时、印度等国的</span><span style="font-size:14px;line-height:1.5">30</span><span style="font-size:14px;line-height:1.5">余所著名高校开展联合办学项目，每年选派本科生赴荷兰、印度、新加坡等国开展实训，并招收海外留学生来校攻读学位。与国外高校联合培养专业知识厚、综合素质高、创新能力强、具有国际视野和国际竞争力的高层次拔尖软件人才。</span></p><p style="text-indent:28px"><span style="font-size:14px;line-height:1.5">学院大力支持学生创新创业活动，建立学生创新创业中心，设立学生创新基金。学生在海内外高水平科技竞赛中成绩突出，曾获</span><span style="font-size:14px;line-height:1.5">“IBM</span><span style="font-size:14px;line-height:1.5">大型主机技术全国应用大赛</span><span style="font-size:14px;line-height:1.5">”</span><span style="font-size:14px;line-height:1.5">最佳作品奖和最佳团队奖、“</span><span style="font-size:14px;line-height:1.5">2012</span><span style="font-size:14px;line-height:1.5">趋势科技校园程序设计大赛”中国区冠军、百度</span><span style="font-size:14px;line-height:1.5">“</span><span style="font-size:14px;line-height:1.5">机器知我心第二季</span><span style="font-size:14px;line-height:1.5">—</span><span style="font-size:14px;line-height:1.5">智能终端创意大赛</span><span style="font-size:14px;line-height:1.5">”</span><span style="font-size:14px;line-height:1.5">全国总决赛中获得唯一最高奖、我院学子所在团队获得国际基因工程机器大赛世界总决赛金牌等佳绩。</span></p><p style="text-indent:28px"><span style="font-size:14px;line-height:1.5">学院将发挥电子科技大学的学科优势和区位优势，形成自身办学特色，努力把学院办成满足社会需求、有国际竞争能力的复合型、实用型软件人才培养基地，成为在国内外有一定影响、特色鲜明的国家级示范性软件学院。</span></p><p><br/></p>'),
(22, '<p><span style="font-size:14px;">　电子科技大学是教育部直属、国家“985工程”“211工程”重点建设大学，坐落于有“天府之国”之称的西部经济、文化、交通中心——四川省成都市。</span>\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p><span style="font-size:14px;">　　学校原名成都电讯工程学\r\n院，是1956年在周恩来总理的亲自部署下，由交通大学（现上海交通大学、西安交通大学）、南京工学院（现东南大学）、华南工学院（现华南理工大学）的电\r\n讯工程有关专业合并创建而成，1960年被中共中央列为全国重点高等学校，1961年被中共中央确定为七所国防工业院校之一，1988年更名为电子科技大\r\n学，1997年被确定为国家首批“211工程”建设的重点大学，2000年由原信息产业部主管划转为教育部主管，2001年进入国家“985工程”重点建\r\n设大学行列。经过50多年的建设，学校形成了从本科到硕士研究生、博士研究生等多层次、多类型的人才培养格局，成为一所完整覆盖整个电子类学科，以电子信\r\n息科学技术为核心，以工为主，理工渗透，理、工、管、文协调发展的多科性研究型大学。</span></p><p><span style="font-size:14px;">　　学校设有清水河、沙河、九里堤三个校区，占地面积5000余亩，拥有馆藏丰富的现代化数字图书馆和一批设施齐备的现代化体育场馆。学校环境优美，绿树成荫，湖水悠悠，银杏成海，是读书治学的理想场所。</span></p><p><span style="font-size:14px;">　　学校以培养“基础知识厚、\r\n专业能力强、综合素质高、具有国际视野和社会责任感的拔尖创新人才”为根本任务，设有24个学院（部），59个本科专业，其中14个为国家级特色专业建设\r\n点，现有各类全日制在读学生33000余人，其中博士、硕士研究生12000余人。学生以素质全面、专业知识扎实、能力强、后劲足等鲜明特点受到了社会各\r\n界和用人单位的普遍赞誉，学生就业率一直保持在95%以上，本科生国内外深造比例在50%左右，成电学子遍布海内外IT领域。</span></p><p><span style="font-size:14px;">　　学校已建成一批国家和省部级精品开放课程、精品教材，拥有国家大学生文化素质教育基地，以及国家工科数学教学基地、国家工科电工电子教学基地、国家级电子实验教学示范中心等10余个国家级教育教学实践基地和示范中心，获得一批国家级教学成果奖。</span></p><p><span style="font-size:14px;">　　学校鼓励和支持学生积极参\r\n与科技创新、文化艺术和社会实践活动，构建了“普惠性”学生科技创新体系。学生活跃在全国大学生电子设计竞赛、“挑战杯”全国大学生课外学术科技作品竞\r\n赛、全国大学生艺术比赛、亚太大学生机器人竞赛、美国大学生数学建模竞赛、国际大专辩论赛、国际基因工程机器大赛等国内、国际各类竞赛的赛场上，争金夺\r\n银，成绩斐然。</span></p><p><span style="font-size:14px;">　　学校现有2个国家一级重点\r\n学科（所包括的6个二级学科均为国家重点学科）；一级学科博士学位授权点14个，二级学科博士学位授权点51个；一级学科硕士学位授权点25个，二级硕士\r\n学位授权点69个，具有电子与信息领域工程博士专业学位授予权和7种硕士专业学位授予权，设有博士后流动站13个。</span></p><p><span style="font-size:14px;">　　学校以“顶天、立地、树\r\n人”为科研工作定位，努力构建“三足鼎立”（军事电子科研、以国家各类基金为代表的基础研究、与企业合作为主体的应用技术研究）的科研架构，“十一五”以\r\n来科技成果获国家级奖励14项、部省级奖励181项，发表论文（专著）31000余篇（部），申请专利4500余项。学校拥有国家级重点实验室4个，国家\r\n工程中心1个，省部级科研机构41个，2个国家自然科学基金委创新群体、7个教育部创新团队和1个国防科技创新团队。学校设有国家大学科技园、电子科学技\r\n术研究院、东莞电子科技大学电子信息工程研究院、无锡研究院、成都研究院，致力于促进科研成果转化。</span></p><p><br/></p>'),
(23, '<p><span style="font-size:14px;">　　学校鼓励和支持学生积极参\r\n与科技创新、文化艺术和社会实践活动，构建了“普惠性”学生科技创新体系。学生活跃在全国大学生电子设计竞赛、“挑战杯”全国大学生课外学术科技作品竞\r\n赛、全国大学生艺术比赛、亚太大学生机器人竞赛、美国大学生数学建模竞赛、国际大专辩论赛、国际基因工程机器大赛等国内、国际各类竞赛的赛场上，争金夺\r\n银，成绩斐然。</span></p><p><span style="font-size:14px;">　　学校现有2个国家一级重点\r\n学科（所包括的6个二级学科均为国家重点学科）；一级学科博士学位授权点14个，二级学科博士学位授权点51个；一级学科硕士学位授权点25个，二级硕士\r\n学位授权点69个，具有电子与信息领域工程博士专业学位授予权和7种硕士专业学位授予权，设有博士后流动站13个。</span></p><p><span style="font-size:14px;">　　学校以“顶天、立地、树\r\n人”为科研工作定位，努力构建“三足鼎立”（军事电子科研、以国家各类基金为代表的基础研究、与企业合作为主体的应用技术研究）的科研架构，“十一五”以\r\n来科技成果获国家级奖励14项、部省级奖励181项，发表论文（专著）31000余篇（部），申请专利4500余项。学校拥有国家级重点实验室4个，国家\r\n工程中心1个，省部级科研机构41个，2个国家自然科学基金委创新群体、7个教育部创新团队和1个国防科技创新团队。学校设有国家大学科技园、电子科学技\r\n术研究院、东莞电子科技大学电子信息工程研究院、无锡研究院、成都研究院，致力于促进科研成果转化。</span></p><p><span style="font-size:14px;">　　学校大力实施“人才强校”\r\n战略，现有教职工3800余人，其中专任教师2100余人，教授445人。拥有一支包括7位中国科学院、中国工程院院士，59位国家“千人计划”入选者\r\n（含“青年千人计划”），1名“万人计划”领军人才，26位长江学者，14位国家杰出青年科技基金获得者，8位国家级教学名师、全国优秀教师和全国师德先\r\n进个人等在内的高水平师资队伍。</span></p><p><span style="font-size:14px;">　　学校大力实施国际化发展战\r\n略，已与世界50多个国家和地区的200余所大学、科研机构、企业建立友好合作关系，同一批国外知名高校签署了学生交流及联合培养协议，与美国威廉玛丽学\r\n院、韩国浦项工科大学成为姊妹学校。自2010年实现留学生规模招生以来，学校已招收来自全球50多个国家和地区的600余名留学生。学校每年主办十余次\r\n国际学术会议，选派大批教师赴海外访学进修、合作研究和参加国际会议。INTEL、MICROSOFT、TI和IBM等跨国公司在我校设立联合实验室、研\r\n发中心和奖学金项目等，直接参与我校的人才培养。学校积极推进国际化人才培养，与英国格拉斯哥大学建立了战略合作伙伴关系，共建电子科技大学格拉斯哥学\r\n院；与法国蒙彼利埃二大建立了战略合作伙伴关系，共建孔子学院；与美国和葡萄牙名校开展IMBA和DBA合作办学项目。</span></p><p><span style="font-size:14px;">　　电子科技大学以“求实求真、大气大为”为校训，以人才培养为根本，以服务国家、地方经济建设和国防建设为己任，开拓进取，锐意创新，为建成以电子信息科学技术为特色的多科性研究型大学而不懈奋斗。</span></p><p><br/></p>'),
(24, '<p style="text-align: center;"><span style="font-family:Verdana"><span style="padding-bottom: 0px;widows: 2;background-color: rgb(255,255,255);text-indent: 0px;padding-left: 0px;letter-spacing: normal;padding-right: 0px;font: 14px/25px Tahoma, Helvetica, SimSun, sans-serif, Hei;word-wrap: break-word;white-space: normal;orphans: 2;float: none;color: rgb(0,0,0);word-spacing: 0px;padding-top: 0px;-webkit-text-size-adjust: auto;-webkit-text-stroke-width: 0px"><span style="padding-bottom: 0px;padding-left: 0px;padding-right: 0px;word-wrap: break-word;float: none;font-size: 9px;padding-top: 0px"><span style="padding-bottom: 0px;padding-left: 0px;padding-right: 0px;word-wrap: break-word;padding-top: 0px"><span style="padding-bottom: 0px;padding-left: 0px;padding-right: 0px;word-wrap: break-word;padding-top: 0px;font-family:楷体_GB2312"><span style="font-family:Verdana"><span style="font-family:Verdana;font-size:1px"><span style="padding-bottom: 0px;widows: 2;background-color: rgb(255,255,255);text-indent: 0px;padding-left: 0px;letter-spacing: normal;padding-right: 0px;font: 14px/25px Tahoma, Helvetica, SimSun, sans-serif, Hei;word-wrap: break-word;white-space: normal;orphans: 2;float: none;color: rgb(0,0,0);word-spacing: 0px;padding-top: 0px;-webkit-text-size-adjust: auto;-webkit-text-stroke-width: 0px"><span style="padding-bottom: 0px;padding-left: 0px;padding-right: 0px;word-wrap: break-word;float: none;font-size: 9px;padding-top: 0px"><span style="font-family:宋体;font-size:5px"><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 29px;font-weight: normal"><span style="font-family: &#39;宋体&#39;;color: rgb(0,0,0);font-size: 12px"></span></span></span></span></span></span></span></span></span></span></span></span></p><p style="text-align: left;margin-top: 0;margin-bottom: 0"><br/></p><p style="text-align: center;"><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal"></span></p><p style="text-align: center; line-height: 200%; margin-top: 0px; margin-bottom: 0px;"><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal">日新路与学堂路交叉路口的东北角，即为能科楼A座</span></p><p style="text-align: center; line-height: 200%; margin-top: 0px; margin-bottom: 0px;"><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal">地址:北京市海淀区清华大学能科楼A座317</span></p><p style="text-align: center; line-height: 200%; margin-top: 0px; margin-bottom: 0px;"><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal">联系人：何向明</span><span style="font-family: &#39;宋体&#39;;color: rgb(0,0,0);font-size: 20px"><br/></span><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal">联系电话:010-62773274,62794226</span><span style="font-family: &#39;宋体&#39;;color: rgb(0,0,0);font-size: 20px"><br/></span><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal">手机:13701010570，18611706382</span><span style="font-family: &#39;宋体&#39;;color: rgb(0,0,0);font-size: 20px"><br/></span><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal">电子邮件:hexm@tsinghua.edu.cn</span></p><p style="text-align: center; line-height: 200%; margin-top: 0px; margin-bottom: 0px;"><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal"><img src="http://api.map.baidu.com/staticimage?center=116.404,39.915&zoom=10&width=530&height=340&markers=116.404,39.915" height="340" width="530"/></span></p><p style="text-align: center; line-height: 200%; margin-top: 0px; margin-bottom: 0px;"><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal">华东锂电技术研究院，地址：江苏省张家港市华昌路沙洲湖科创园C1栋，大学城东。百度地图输入“华东锂电技术研究院”进行导航，可直达。</span></p><p style="text-align: center; line-height: 200%; margin-top: 0px; margin-bottom: 0px;"><span style="font-style: normal;font-family: &#39;宋体&#39;;background: rgb(255,255,255);color: rgb(0,0,0);font-size: 20px;font-weight: normal">电话：0512 35020320/21/22/27<img src="http://hexmgroup.com/UploadFile/2013530222640352.jpg" border="0"/></span></p><p><br/></p><p><br/></p>'),
(38, '<p style="text-align: center;"><span style="color: rgb(227, 108, 9); font-size: 36px;">向勇老师简历</span><span style="color:#e36c09;"><br/></span></p><h3><img style="float: left; width: 218px; height: 268px;" alt="1440761630310677.png" src="/editor/upload/image/20150828/1440761630310677.png" title="1440761630310677.png" border="0" height="268" vspace="0" width="218"/>&nbsp; <br/></h3><h3 style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 联系电话:56546546</h3><h3 style="text-align: center;">住址:54454546</h3><h3 style="text-align: center;">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 邮箱:54646@qq.com<br/></h3><h3><br/><span style="color:#e36c09;font-size:20px;"></span></h3><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><hr/><h3><span style="color:#e36c09;font-size:20px;">目标职位</span></h3><p style="text-indent:2em;">[此处键入您的期望职位]</p><hr/><h3><span style="color:#e36c09;font-size:20px;">学历</span></h3><p><br/></p><ol class=" list-paddingleft-2" style="list-style-type: decimal;"><li><p><span class="ue_t">[键入起止时间]</span> <span class="ue_t">[键入学校名称] </span> <span class="ue_t">[键入所学专业]</span> <span class="ue_t">[键入所获学位]</span></p></li><li><p><span class="ue_t">[键入起止时间]</span> <span class="ue_t">[键入学校名称]</span> <span class="ue_t">[键入所学专业]</span> <span class="ue_t">[键入所获学位]</span></p></li></ol><p><br/></p><p><span class="ue_t"></span></p><hr/><p><span class="ue_t"></span><span style="color:#e36c09;font-size:20px;" class="ue_t">工作经验</span></p><ol class=" list-paddingleft-2" style="list-style-type: decimal;"><li><p><span class="ue_t">[键入起止时间]</span> <span class="ue_t">[键入公司名称]</span> <span class="ue_t">[键入职位名称]</span></p></li><ol class=" list-paddingleft-2" style="list-style-type: lower-alpha;"><li><p><span class="ue_t">[键入负责项目]</span> <span class="ue_t">[键入项目简介]</span></p></li><li><p><span class="ue_t">[键入负责项目]</span> <span class="ue_t">[键入项目简介]</span></p></li></ol><li><p><span class="ue_t">[键入起止时间]</span> <span class="ue_t">[键入公司名称]</span> <span class="ue_t">[键入职位名称]</span></p></li><ol class=" list-paddingleft-2" style="list-style-type: lower-alpha;"><li><p><span class="ue_t">[键入负责项目]</span> <span class="ue_t">[键入项目简介]</span></p></li></ol><p><span class="ue_t"></span></p></ol><p><span style="color:#e36c09;font-size:20px;"></span></p><hr/><p><span style="color:#e36c09;font-size:20px;"></span><span style="color:#e36c09;font-size:20px;">掌握技能</span></p><p style="text-indent:2em;">&nbsp;<span class="ue_t">[这里可以键入您所掌握的技能]</span><br/></p><p><br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_publish`
--
-- 创建时间： 2015-07-29 07:51:48
-- 最后更新： 2015-08-24 11:24:57
--

CREATE TABLE IF NOT EXISTS `ot_document_publish` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `publish_view` text NOT NULL COMMENT '出版物详细信息',
  `publish_shortcut` text NOT NULL COMMENT '出版物简介'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `ot_document_publish`
--

INSERT INTO `ot_document_publish` (`id`, `publish_view`, `publish_shortcut`) VALUES
(7, '<p>而二文本<br/></p>', ''),
(8, '出版物详细信息<p><br/></p>', '出版物简介'),
(9, '<p>出版物详细信息1<br/></p>', '出版物简介1'),
(10, '<p>泛光灯<br/></p>', '非官方的个'),
(11, '<p>&nbsp;fds<br/></p>', 'cv'),
(12, '<p>分公司的<br/></p>', '大放送'),
(13, '<p>ghdfg<br/></p>', 'tgd'),
(14, '<p>gfdsg<br/></p>', 'dfs'),
(15, '<p>ghfg<br/></p>', 'fdg'),
(30, '<p>打分<br/></p>', '出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介'),
(31, '<p>打分<br/></p>', '出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介'),
(32, '<p>出版物简介出版物简介<br/></p>', '出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介出版物简介'),
(33, '<pre style="background-color:#272822;color:#f8f8f2;font-family:&#39;Source Code Pro&#39;;font-size:12.8pt;">$publishCategory</pre><pre style="background-color:#272822;color:#f8f8f2;font-family:&#39;Source Code Pro&#39;;font-size:12.8pt;">$publishCategory</pre><p><br/></p>', '$publishCategory'),
(37, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_research`
--
-- 创建时间： 2015-07-31 16:01:16
--

CREATE TABLE IF NOT EXISTS `ot_document_research` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `research_name` varchar(255) NOT NULL COMMENT 'dsad',
  `detail` text NOT NULL COMMENT '研究方向介绍'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `ot_document_research`
--

INSERT INTO `ot_document_research` (`id`, `research_name`, `detail`) VALUES
(26, '', '<p><br/></p><p><a name="dfsd "></a>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍</p><p style="text-align:center"><video class="edui-upload-video  vjs-default-skin    video-js" controls="" preload="none" width="420" height="280" src="/editor/upload/video/20150731/1438336073481756.mp4" data-setup="{}"><source src="/editor/upload/video/20150731/1438336073481756.mp4" type="video/mp4"/></video></p><p style="text-align:center"><img alt="2015-05-21 17:08:08屏幕截图.png" src="/editor/upload/image/20150731/1438336188769595.png" title="1438336188769595.png"/></p><p style="line-height: 16px;"><img style="vertical-align: middle; margin-right: 2px;" src="http://localhost/onethink/Public/static/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif"/><a style="font-size:12px; color:#0066cc;" href="/editor/upload/file/20150731/1438336231163473.pdf" title="django.pdf">django.pdf</a></p><p><br/></p>'),
(27, '', '<p>研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span></p><p>研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span></p><p><br/></p>'),
(28, '', '<p>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span>研究方向介绍<span class="check-tips"></span></p>');

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_student`
--
-- 创建时间： 2015-07-29 11:43:32
--

CREATE TABLE IF NOT EXISTS `ot_document_student` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `research_forward` varchar(50) NOT NULL COMMENT '研究方向',
  `contact` varchar(20) NOT NULL COMMENT '联系方式',
  `header_img` int(10) unsigned NOT NULL COMMENT '照片'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `ot_document_student`
--

INSERT INTO `ot_document_student` (`id`, `research_forward`, `contact`, `header_img`) VALUES
(17, '软件技术', '18144240528', 3);

-- --------------------------------------------------------

--
-- 表的结构 `ot_document_teacher`
--
-- 创建时间： 2015-07-29 11:55:52
--

CREATE TABLE IF NOT EXISTS `ot_document_teacher` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `zhicheng` varchar(30) NOT NULL COMMENT '职称',
  `introduction` text NOT NULL COMMENT '介绍',
  `header_img` int(10) unsigned NOT NULL COMMENT '照片',
  `research_forward` varchar(255) NOT NULL COMMENT '研究方向',
  `contact` varchar(20) NOT NULL COMMENT '联系方式',
  `show_introduction` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示简介'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `ot_document_teacher`
--

INSERT INTO `ot_document_teacher` (`id`, `zhicheng`, `introduction`, `header_img`, `research_forward`, `contact`, `show_introduction`) VALUES
(18, '教授', '<span style="font-size: 24px;">分公司东莞东莞</span><p><br/></p>', 1, '大数据', '11111111', 1),
(19, '博士', '公会官方和规范化<p><br/></p>', 2, '云计算', '245316546123', 0),
(20, 'dsf', '<p>fgdfdfg<br/></p>', 4, 'fdsd', 'dfsdsf', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ot_file`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_file` (
`id` int(10) unsigned NOT NULL COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ot_file`
--

INSERT INTO `ot_file` (`id`, `name`, `savename`, `savepath`, `ext`, `mime`, `size`, `md5`, `sha1`, `location`, `url`, `create_time`) VALUES
(1, '53eb25399989a.zip', '5574284e5c913.zip', '2015-06-07/', 'zip', 'application/zip', 872, '119e37adaeebe48172d0867c19933cbd', '323cf17df3bcd82ec8c7e7604a9a8702d353776c', 0, '', 1433675854);

-- --------------------------------------------------------

--
-- 表的结构 `ot_hooks`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-08-07 13:00:20
--

CREATE TABLE IF NOT EXISTS `ot_hooks` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `ot_hooks`
--

INSERT INTO `ot_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1438952420, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ot_member`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-08-28 11:00:01
--

CREATE TABLE IF NOT EXISTS `ot_member` (
`uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `id` int(10) unsigned NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ot_member`
--

INSERT INTO `ot_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `id`) VALUES
(1, 'kangbiao', 0, '0000-00-00', '', 170, 35, 0, 1433675286, 2130706433, 1440759601, 1, 0),
(2, 'normal', 0, '0000-00-00', '', 20, 5, 0, 0, 2130706433, 1438953889, 1, 0),
(3, 'test', 0, '0000-00-00', '', 10, 2, 0, 0, 2130706433, 1438953975, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ot_menu`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-29 08:38:36
-- 最后检查： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_menu` (
`id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

--
-- 转存表中的数据 `ot_menu`
--

INSERT INTO `ot_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 1),
(2, '内容', 0, 2, 'Article/index', 0, '', '', 0, 1),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, 1),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0, 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, 1),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, 1),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0, 1),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, 1),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0, 1),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0, 1),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, 1),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, 1),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0, 1),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0, 1),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0, 1),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, 1),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, 1),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0, 1),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, 1),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, 1),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, 1),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, 1),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, 1),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, 1),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, 1),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0, 1),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, 1),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, 1),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, 1),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, 1),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, 1),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, 1),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, 1),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, 1),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, 1),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, 1),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, 1),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, 1),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, 1),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0, 1),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, 1),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, 1),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, 1),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, 1),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, 1),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, 1),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, 1),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, 1),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, 1),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, 1),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, 1),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, 1),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, 1),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0, 1),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0, 1),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0, 1),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, 1),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, 1),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, 1),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0, 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, 1),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, 1),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, 1),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, 1),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0, 1),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, 1),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0, 1),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, 1),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, 1),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, 1),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, 1),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0, 1),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, 1),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, 1),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, 1),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, 1),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0, 1),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0, 1),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, 1),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, 1),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, 1),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, 1),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, 1),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, 1),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, 1),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, 1),
(93, '其他', 0, 5, 'other', 1, '', '', 0, 1),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, 1),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, 1),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, 1),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0, 1),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0, 1),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, 1),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, 1),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, 1),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, 1),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, 1),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0, 1),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, 1),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, 1),
(122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, 1),
(123, '审核列表', 3, 0, 'Article/examine', 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ot_model`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-31 16:10:03
--

CREATE TABLE IF NOT EXISTS `ot_model` (
`id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `ot_model`
--

INSERT INTO `ot_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `attribute_alias`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","5"],"2":["10","12","16"]}', '1:基础,2:扩展', '21,12,4,10,3,16,24,5', '', '', '', '', 'title:标题\r\ndescription:描述\r\natindex:是否显示在首页\r\nview:浏览量\r\nupdate_time:更新时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 0, 'title', 'title', 1383891243, 1438359003, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891252, 1437062963, 1, 'MyISAM'),
(4, 'teacher', '老师信息', 1, '', 1, '{"1":["3","46","44","47","48","45","52"]}', '1:基础', '3,52,46,44,47,48,45', 'title:姓名\nintroduction:个人简介', '', '', '', 'title:姓名\nzhicheng:职称\nresearch_forward:研究方向\ncontact:联系方式\nshow_introduction:显示简介\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', 'title', 1433683291, 1438170837, 1, 'InnoDB'),
(5, 'onlyone', '一篇文章', 1, '', 1, '{"1":["3","2","53","16"]}', '1:基础', '21,3,2,53,16', 'title:名称(<font color=''grey''>英文</font>)\r\nname:备注(<font color=''grey''>中文</font>)', '', '', '', 'title:名称\r\nname:备注\r\nview:浏览量\r\nupdate_time:更新时间\r\nid:操作:[EDIT]|编辑\r\n', 10, 'title', 'title', 1437668277, 1438263825, 1, 'InnoDB'),
(6, 'publish', '出版物', 1, '', 1, '{"1":["39","3","38","20"],"2":["19","16"]}', '1:基础;2:扩展', '19,39,16,38,3,20', 'level:请输入整数(<font color=''grey''>数值越大排序越靠前</font>)\r\nview:请输入初始化浏览量(<font color=''grey''>默认为0</font>)\r\ntitle:关键字(<font color=''grey''>必填,用于全局搜索</font>)', '', '', '', 'id:编号\r\npublish_shortcut:出版物简介\r\ntitle:关键字\r\ncreate_time:添加时间\r\nlevel:优先级\r\nview:浏览量\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'publish_shortcut', 'publish_shortcut', 1438154991, 1438171085, 1, 'MyISAM'),
(7, 'graduated_stu', '已毕业学生', 1, '', 1, '{"1":["3","50","51"]}', '1:基础', '3,51,50', 'title:姓名', '', '', '', 'title:姓名\r\nwhere:去向\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', 'title', 1438168060, 1438170594, 1, 'InnoDB'),
(8, 'student', '小组成员', 1, '', 1, '{"1":["3","43","42"]}', '1:基础', '3,49,43,42', 'title:姓名\r\nresearch_forward:研究方向\r\ncontact:联系方式', '', '', '', 'title:姓名\r\nresearch_forward:研究方向\r\ncontact:联系方式\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', 'title', 1438168131, 1438170238, 1, 'InnoDB'),
(9, 'research', '研究方向', 1, '', 1, '{"1":["3","10","5","54"]}', '1:基础', '3,10,5,54', 'title:研究方向名称\r\ndescription:研究方向描述(<font color=''grey''>必填,显示在首页</font>)', '', '', '', 'title:研究方向名称\r\ndescription:研究方向描述\r\natindex:是否显示在首页\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', 'title', 1438261836, 1438358539, 1, 'MyISAM'),
(10, 'news', '新闻模型', 1, '', 1, '', '1:基础', '', '', '', '', '', NULL, 10, '', '', 1438338649, 1438338649, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `ot_picture`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-08-03 13:03:46
--

CREATE TABLE IF NOT EXISTS `ot_picture` (
`id` int(10) unsigned NOT NULL COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ot_picture`
--

INSERT INTO `ot_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2015-07-29/55b8bb2e0a7a6.jpg', '', '8c0b43b8c8e4dc0d056415175d357e77', 'd8e3946191f70179aae21f417f5d3b6b09cc22c6', 1, 1438169901),
(2, '/Uploads/Picture/2015-07-30/55b9eb83bf450.png', '', '699f8bc07749957aff085df54620ec56', '7d367469d8248fd8142b178f92c756704aad0aed', 1, 1438247811),
(3, '/Uploads/Picture/2015-07-30/55b9f118543ee.png', '', 'b93622f9506e6a0b3a24c52c883c2420', '69083eff2dd02afd9113a5c290c6d2a6d7e0c47c', 1, 1438249240),
(4, '/Uploads/Picture/2015-07-30/55b9fcc46c71b.jpg', '', 'b0525bffe5e5c071a551613f17959772', '21632a8a9ddcddb2f22073a556ac29a4b4495a9b', 1, 1438252228),
(5, '/Uploads/Picture/2015-07-31/55bb99a201c05.png', '', 'd87cfc95ae1faa8af6828e722e3a5ec0', 'd95802fe2573b24935d2eaf5a0f42e1ef55415c3', 1, 1438357921),
(6, '/Uploads/Picture/2015-08-03/55bf669bf2373.png', '', '6ccce0b23dfe341f589209d1c2beaeb1', '46754e384dc6c4c5c68fbf2a6b8019201ec6d36e', 1, 1438607003),
(7, '/Uploads/Picture/2015-08-03/55bf66b2f41ca.jpg', '', '3e1c3f3d666c02c3c6b52ac8c2754be3', 'eeb43926814ba7e35d69db992758251c3fd7010a', 1, 1438607026);

-- --------------------------------------------------------

--
-- 表的结构 `ot_research`
--
-- 创建时间： 2015-07-25 14:19:12
--

CREATE TABLE IF NOT EXISTS `ot_research` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `research_name` varchar(255) NOT NULL COMMENT 'dsad',
  `research_description` varchar(255) NOT NULL COMMENT '研究方向概要',
  `research_detail` text NOT NULL COMMENT '研究方向详细信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ot_ucenter_admin`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_ucenter_admin` (
`id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ot_ucenter_app`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_ucenter_app` (
`id` int(10) unsigned NOT NULL COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ot_ucenter_member`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-08-28 11:00:01
--

CREATE TABLE IF NOT EXISTS `ot_ucenter_member` (
`id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ot_ucenter_member`
--

INSERT INTO `ot_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'kangbiao', 'fd3fdf5232287a957dd440d7911cc47a', '1316278289@qq.com', '', 1433675286, 2130706433, 1440759601, 2130706433, 1433675286, 1),
(2, 'normal', 'fd3fdf5232287a957dd440d7911cc47a', '1111@qq.com', '', 1433684727, 2130706433, 1438953889, 2130706433, 1433684727, 1),
(3, 'test', '002ddd706bd9daf9dae6dfa2e7b63b07', '1316278289s@qq.com', '', 1438953922, 2130706433, 1438953975, 2130706433, 1438953922, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ot_ucenter_setting`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_ucenter_setting` (
`id` int(10) unsigned NOT NULL COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ot_url`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_url` (
`id` int(11) unsigned NOT NULL COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ot_userdata`
--
-- 创建时间： 2015-07-18 15:07:11
-- 最后更新： 2015-07-18 15:07:11
--

CREATE TABLE IF NOT EXISTS `ot_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ot_action`
--
ALTER TABLE `ot_action`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_action_log`
--
ALTER TABLE `ot_action_log`
 ADD PRIMARY KEY (`id`), ADD KEY `action_ip_ix` (`action_ip`), ADD KEY `action_id_ix` (`action_id`), ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `ot_addons`
--
ALTER TABLE `ot_addons`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_attachment`
--
ALTER TABLE `ot_attachment`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_record_status` (`record_id`,`status`);

--
-- Indexes for table `ot_attribute`
--
ALTER TABLE `ot_attribute`
 ADD PRIMARY KEY (`id`), ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `ot_auth_extend`
--
ALTER TABLE `ot_auth_extend`
 ADD UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`), ADD KEY `uid` (`group_id`), ADD KEY `group_id` (`extend_id`);

--
-- Indexes for table `ot_auth_group`
--
ALTER TABLE `ot_auth_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_auth_group_access`
--
ALTER TABLE `ot_auth_group_access`
 ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`), ADD KEY `uid` (`uid`), ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `ot_auth_rule`
--
ALTER TABLE `ot_auth_rule`
 ADD PRIMARY KEY (`id`), ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `ot_category`
--
ALTER TABLE `ot_category`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_name` (`name`), ADD KEY `pid` (`pid`);

--
-- Indexes for table `ot_channel`
--
ALTER TABLE `ot_channel`
 ADD PRIMARY KEY (`id`), ADD KEY `pid` (`pid`);

--
-- Indexes for table `ot_config`
--
ALTER TABLE `ot_config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_name` (`name`), ADD KEY `type` (`type`), ADD KEY `group` (`group`);

--
-- Indexes for table `ot_document`
--
ALTER TABLE `ot_document`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_category_status` (`category_id`,`status`), ADD KEY `idx_status_type_pid` (`status`,`uid`,`pid`);

--
-- Indexes for table `ot_document_article`
--
ALTER TABLE `ot_document_article`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_document_download`
--
ALTER TABLE `ot_document_download`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_document_graduated_stu`
--
ALTER TABLE `ot_document_graduated_stu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_document_members`
--
ALTER TABLE `ot_document_members`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_document_onlyone`
--
ALTER TABLE `ot_document_onlyone`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_document_publish`
--
ALTER TABLE `ot_document_publish`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_document_research`
--
ALTER TABLE `ot_document_research`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_document_student`
--
ALTER TABLE `ot_document_student`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_document_teacher`
--
ALTER TABLE `ot_document_teacher`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_file`
--
ALTER TABLE `ot_file`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_md5` (`md5`);

--
-- Indexes for table `ot_hooks`
--
ALTER TABLE `ot_hooks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ot_member`
--
ALTER TABLE `ot_member`
 ADD PRIMARY KEY (`uid`), ADD KEY `status` (`status`);

--
-- Indexes for table `ot_menu`
--
ALTER TABLE `ot_menu`
 ADD PRIMARY KEY (`id`), ADD KEY `pid` (`pid`), ADD KEY `status` (`status`);

--
-- Indexes for table `ot_model`
--
ALTER TABLE `ot_model`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_picture`
--
ALTER TABLE `ot_picture`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_research`
--
ALTER TABLE `ot_research`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_ucenter_admin`
--
ALTER TABLE `ot_ucenter_admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_ucenter_app`
--
ALTER TABLE `ot_ucenter_app`
 ADD PRIMARY KEY (`id`), ADD KEY `status` (`status`);

--
-- Indexes for table `ot_ucenter_member`
--
ALTER TABLE `ot_ucenter_member`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`), ADD KEY `status` (`status`);

--
-- Indexes for table `ot_ucenter_setting`
--
ALTER TABLE `ot_ucenter_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot_url`
--
ALTER TABLE `ot_url`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `idx_url` (`url`);

--
-- Indexes for table `ot_userdata`
--
ALTER TABLE `ot_userdata`
 ADD UNIQUE KEY `uid` (`uid`,`type`,`target_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ot_action`
--
ALTER TABLE `ot_action`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `ot_action_log`
--
ALTER TABLE `ot_action_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=304;
--
-- AUTO_INCREMENT for table `ot_addons`
--
ALTER TABLE `ot_addons`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ot_attachment`
--
ALTER TABLE `ot_attachment`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ot_attribute`
--
ALTER TABLE `ot_attribute`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `ot_auth_group`
--
ALTER TABLE `ot_auth_group`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ot_auth_rule`
--
ALTER TABLE `ot_auth_rule`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=219;
--
-- AUTO_INCREMENT for table `ot_category`
--
ALTER TABLE `ot_category`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `ot_channel`
--
ALTER TABLE `ot_channel`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ot_config`
--
ALTER TABLE `ot_config`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `ot_document`
--
ALTER TABLE `ot_document`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `ot_document_graduated_stu`
--
ALTER TABLE `ot_document_graduated_stu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `ot_document_members`
--
ALTER TABLE `ot_document_members`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `ot_document_onlyone`
--
ALTER TABLE `ot_document_onlyone`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `ot_document_publish`
--
ALTER TABLE `ot_document_publish`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `ot_document_research`
--
ALTER TABLE `ot_document_research`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `ot_document_student`
--
ALTER TABLE `ot_document_student`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `ot_document_teacher`
--
ALTER TABLE `ot_document_teacher`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `ot_file`
--
ALTER TABLE `ot_file`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ot_hooks`
--
ALTER TABLE `ot_hooks`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ot_member`
--
ALTER TABLE `ot_member`
MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ot_menu`
--
ALTER TABLE `ot_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `ot_model`
--
ALTER TABLE `ot_model`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ot_picture`
--
ALTER TABLE `ot_picture`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ot_research`
--
ALTER TABLE `ot_research`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `ot_ucenter_admin`
--
ALTER TABLE `ot_ucenter_admin`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID';
--
-- AUTO_INCREMENT for table `ot_ucenter_app`
--
ALTER TABLE `ot_ucenter_app`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID';
--
-- AUTO_INCREMENT for table `ot_ucenter_member`
--
ALTER TABLE `ot_ucenter_member`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ot_ucenter_setting`
--
ALTER TABLE `ot_ucenter_setting`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID';
--
-- AUTO_INCREMENT for table `ot_url`
--
ALTER TABLE `ot_url`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
