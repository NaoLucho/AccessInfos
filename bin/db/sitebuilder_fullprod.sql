-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 22 Juin 2018 à 15:41
-- Version du serveur :  5.7.22-0ubuntu18.04.1
-- Version de PHP :  7.1.17-1+ubuntu17.10.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sitebuilder`
--

-- --------------------------------------------------------

--
-- Structure de la table `acl_classes`
--

CREATE TABLE `acl_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `acl_entries`
--

CREATE TABLE `acl_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `object_identity_id` int(10) UNSIGNED DEFAULT NULL,
  `security_identity_id` int(10) UNSIGNED NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) UNSIGNED NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `acl_object_identities`
--

CREATE TABLE `acl_object_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_object_identity_id` int(10) UNSIGNED DEFAULT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `acl_object_identity_ancestors`
--

CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) UNSIGNED NOT NULL,
  `ancestor_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `acl_security_identities`
--

CREATE TABLE `acl_security_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `app_content`
--

CREATE TABLE `app_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `app_content`
--

INSERT INTO `app_content` (`id`, `title`, `content`, `type`, `locked`, `class`) VALUES
(1, 'Stop Pollution', '<p>Aujourd&rsquo;hui,&nbsp; dans&nbsp; plusieurs&nbsp; grandes&nbsp; villes,&nbsp; les&nbsp; statues&nbsp; portent&nbsp; des&nbsp; masques&nbsp; anti-pollution.</p>\r\n\r\n<p><img alt=\"\" class=\"aligncenter size-medium wp-image-2270\" src=\"https://accessinfos.files.wordpress.com/2018/03/stoppollution.jpg?w=248&amp;h=300\" style=\"float:right; height:300px; width:248px\" /></p>\r\n\r\n<p>C&rsquo;est&nbsp; pour&nbsp; montrer&nbsp; que&nbsp; l&rsquo;air&nbsp; est&nbsp; tr&egrave;s&nbsp; pollu&eacute;&nbsp; &agrave;&nbsp; Paris,&nbsp; Lyon,&nbsp; Toulouse,&nbsp; Grenoble, etc&hellip;&nbsp; &agrave;&nbsp; cause&nbsp; des&nbsp; voitures&nbsp; et&nbsp; camions&nbsp; qui&nbsp; roulent&nbsp; dans&nbsp; les&nbsp; villes,&nbsp; et&nbsp; des&nbsp; fum&eacute;es&nbsp; de&nbsp; chauffage.</p>\r\n\r\n<p>&laquo;&nbsp;<q>La pollution de l&rsquo;air tue et rend malade&nbsp;&raquo;&nbsp; disent&nbsp; des&nbsp; m&eacute;decins.</q></p>\r\n\r\n<p><q>&nbsp;Il y&nbsp; a&nbsp; de&nbsp; plus en plus&nbsp; d&rsquo;enfants&nbsp; qui&nbsp; ont&nbsp; de&nbsp; l&rsquo; asthme.</q></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" class=\"alignright size-medium wp-image-2264\" src=\"https://accessinfos.files.wordpress.com/2018/03/air-pollution.jpg?w=174&amp;h=300\" style=\"height:300px; width:174px\" />On&nbsp; peut&nbsp; mesurer&nbsp; la&nbsp; qualit&eacute;&nbsp; de&nbsp; l&rsquo;air&nbsp; avec&nbsp; des&nbsp; appareils&nbsp; pour&nbsp; savoir&nbsp; s&rsquo;il&nbsp; y&nbsp; a&nbsp; trop&nbsp; de&nbsp; poussi&egrave;res&nbsp; ou&nbsp; produits&nbsp; chimiques&nbsp; dans&nbsp; l&rsquo;air.</p>\r\n\r\n<p>Un&nbsp; gaz&nbsp; est&nbsp; tr&egrave;s&nbsp; dangereux&nbsp; :&nbsp; le&nbsp; dioxyde&nbsp; d&rsquo;azote.&nbsp;&nbsp; Les&nbsp; v&eacute;hicules&nbsp; qui&nbsp; roulent&nbsp; au&nbsp; diesel&nbsp; sont&nbsp; tr&egrave;s&nbsp; polluants.&nbsp; Ils&nbsp; seront&nbsp; interdits&nbsp; &agrave;&nbsp; Paris&nbsp; &agrave;&nbsp; partir&nbsp; de&nbsp; 2020.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Les&nbsp; statues&nbsp; masqu&eacute;es&nbsp; dans&nbsp; les&nbsp; villes&nbsp; rappellent&nbsp; qu&rsquo;il&nbsp; faut&nbsp; prendre&nbsp; des&nbsp; d&eacute;cisions&nbsp; politiques&nbsp; importantes&nbsp; pour&nbsp; diminuer&nbsp; les&nbsp; pollutions :</p>\r\n\r\n<ul>\r\n	<li>plus&nbsp; de&nbsp; transports&nbsp; en&nbsp; commun,&nbsp; trains,&nbsp; trams,&nbsp; bus,&hellip;&nbsp; et&nbsp; des&nbsp; transports&nbsp; moins&nbsp; chers</li>\r\n	<li>plus&nbsp; de&nbsp; pistes&nbsp; cyclables</li>\r\n	<li>supprimer&nbsp; le&nbsp; diesel</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" class=\"alignnone wp-image-2268\" src=\"https://accessinfos.files.wordpress.com/2018/03/stop-pollution3.jpg?w=353&amp;h=298\" style=\"height:298px; width:353px\" /> <img alt=\"\" class=\"alignnone size-medium wp-image-2267\" src=\"https://accessinfos.files.wordpress.com/2018/03/stop-pollution2.jpg?w=277&amp;h=300\" style=\"height:300px; width:277px\" /></p>\r\n\r\n<p>Des&nbsp; dizaines&nbsp; de&nbsp; statues&nbsp; montrent&nbsp; leur&nbsp; ras le bol&nbsp; de&nbsp; la&nbsp; pollution.</p>\r\n\r\n<p>#StopPollution &nbsp; sur&nbsp;&nbsp;&nbsp; <a href=\"https://twitter.com/search?q=%23stoppollution&amp;src=tyah\" rel=\"noopener\" target=\"_blank\"><img alt=\"\" class=\"alignnone wp-image-2272\" src=\"https://accessinfos.files.wordpress.com/2018/03/twitter.jpg?w=97&amp;h=86\" style=\"height:86px; width:97px\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" class=\"aligncenter size-medium wp-image-2265\" src=\"https://accessinfos.files.wordpress.com/2018/03/stop-pollution.jpg?w=300&amp;h=289\" style=\"height:289px; width:300px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'Content', 0, NULL),
(2, 'default_header', '<p style=\"text-align:center\"><span style=\"font-size:48px\"><a href=\"http://localhost/Sites/sitebuilder/web/app_dev.php/\" rel=\"home\" target=\"_self\"><span style=\"color:#2aa67d\">Access&#39; Infos</span></a> </span></p>\r\n\r\n<p>&nbsp;</p>', 'Content', 0, NULL),
(3, 'default_MenuPrincipal', '<p>Principal</p>', 'MainMenu', 0, NULL),
(4, 'CTRL>Connexion', '<p>FOSUserBundle:Security:login</p>', 'Controller', 0, NULL),
(5, 'Ici, des textes accessibles', '<h1>ici, des textes&nbsp;accessibles</h1>\r\n\r\n<hr />\r\n<p>Bonjour,</p>\r\n\r\n<p>Ce blog pr&eacute;sente des textes accessibles, faciles &agrave; lire, sur des sujets d&rsquo;actualit&eacute;, pour des personnes apprenant le fran&ccedil;ais ou des personnes ayant des difficult&eacute;s de lecture.</p>\r\n\r\n<p>A cause d&rsquo;une dyslexie, ou autres troubles d&rsquo;apprentissage, ou surdit&eacute;, ou m&eacute;connaissance du fran&ccedil;ais &eacute;crit, lire est fatigant et comprendre ce qu&rsquo;on lit peut &ecirc;tre tr&egrave;s difficile.</p>\r\n\r\n<p><img alt=\"access\" class=\"aligncenter size-full wp-image-590\" src=\"https://accessinfos.files.wordpress.com/2016/06/access.jpg?w=760\" /></p>\r\n\r\n<p>Nous mettons en ligne des textes en Fran&ccedil;ais Facile &agrave; Lire et &agrave; Comprendre, avec des informations, des actualit&eacute;s, des id&eacute;es.</p>\r\n\r\n<p>Vous pouvez aussi utiliser une synth&egrave;se vocale.</p>\r\n\r\n<p><img alt=\"picto_facile_lire\" class=\"aligncenter wp-image-823\" src=\"https://accessinfos.files.wordpress.com/2016/02/picto_facile_lire-e1472120343943.jpg?w=176&amp;h=175\" style=\"height:175px; width:176px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Si un th&egrave;me vous int&eacute;resse, vous pouvez nous envoyer une demande.</p>\r\n\r\n<p>Merci pour votre int&eacute;r&ecirc;t.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&eacute;cile P&eacute;guin, administratrice du blog.</p>', 'Content', 0, NULL),
(6, 'Contact', '<h3><strong>C&eacute;cile P&eacute;guin</strong></h3>\r\n\r\n<p>Orthophoniste, formatrice, consultante</p>\r\n\r\n<p>Salari&eacute;e &agrave; l&rsquo;ASEI &agrave; Ramonville, pr&egrave;s de Toulouse</p>\r\n\r\n<p>Plateforme Dys Occitanie</p>\r\n\r\n<p><a href=\"http://www.plateforme-dys.asei.asso.fr/\" rel=\"nofollow\">http://www.plateforme-dys.asei.asso.fr/</a></p>\r\n\r\n<p>mail :<span style=\"color:#000000\"> <a href=\"mailto:cecilepeguin@laposte.net?subject=Access\'%20Infos%3A\"><strong>cecilepeguin@laposte.net</strong></a></span></p>\r\n\r\n<p>compte twitter : <span style=\"color:#0000ff\">@CecileP-ortho</span></p>\r\n\r\n<p>D&rsquo;avance merci pour vos commentaires.</p>\r\n\r\n<p><img alt=\"\" class=\"alignnone size-full wp-image-1962\" src=\"https://accessinfos.files.wordpress.com/2016/02/cp-affiche.jpg?w=760\" /></p>', 'Content', 0, NULL),
(7, 'default_footer', '<a href=\"https://funga.fr/\">Propuls&eacute; par Funga</a>', 'Content', 0, NULL),
(8, 'C> Articles', '<p>SiteBundle:Article:list</p>', 'Controller', 1, NULL),
(9, 'C> Article', '<p>SiteBundle:Article:show</p>', 'Controller', 1, NULL),
(10, 'acceuil-infos', '<p>Bonjour,</p>\r\n\r\n<p>Ce site pr&eacute;sente des<strong> textes accessibles</strong>, <strong>faciles &agrave; lire</strong>, sur des sujets d&rsquo;actualit&eacute;, pour des personnes apprenant le fran&ccedil;ais ou des personnes ayant des difficult&eacute;s de lecture.</p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><a href=\"https://accessinfos.wordpress.com/accesscribe/\" rel=\"noopener\" target=\"_blank\"><img alt=\"\" class=\"alignright wp-image-2050\" src=\"https://accessinfos.files.wordpress.com/2017/12/logo-accesscribe.png?w=252&amp;h=231\" style=\"float:right; height:231px; margin-left:150px; margin-right:150px; width:252px\" /></a><span style=\"color:#003300\"><strong>AccesScribe</strong> : nouveau service </span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#003300\">pour l&rsquo;accessibilit&eacute; des textes, </span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#003300\">&agrave; l&rsquo;attention des personnes </span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#003300\">qui ont des difficult&eacute;s </span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#003300\">&agrave; &eacute;crire ou lire le Fran&ccedil;ais.</span></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<hr />', 'Content', 0, NULL),
(11, 'AccesScribe', '<h2>AccesScribe</h2>\r\n\r\n<div class=\"entry-content\">\r\n<p><img alt=\"\" class=\"alignright size-medium wp-image-2050\" src=\"https://accessinfos.files.wordpress.com/2017/12/logo-accesscribe.png?w=300&amp;h=275\" style=\"float:right; height:275px; width:300px\" /></p>\r\n\r\n<p>AccesScribe est un nouveau service pour l&rsquo;accessibilit&eacute; des textes, &agrave; l&rsquo;attention des personnes qui ont des difficult&eacute;s &agrave; &eacute;crire ou lire le Fran&ccedil;ais.</p>\r\n\r\n<p>(Mais aussi : corrections ou appuis pour &eacute;crits professionnels)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>AccesScribe Ecrire :</strong></p>\r\n\r\n<ul>\r\n	<li>&nbsp;corrections de textes, diaporamas, rapports, etc&hellip;</li>\r\n	<li>corrections sp&eacute;cialis&eacute;es pour les personnes dyslexiques &ndash; dysorthographiques.</li>\r\n	<li>&nbsp;corrections avec explications des erreurs.</li>\r\n	<li>corrections accompagn&eacute;es de petits exercices de r&eacute;vision adapt&eacute;s &agrave; vos erreurs.</li>\r\n	<li>&eacute;criture &agrave; partir d&rsquo;un enregistrement audio ou vid&eacute;o.</li>\r\n</ul>\r\n\r\n<p><strong>AccesScribe Lire :</strong></p>\r\n\r\n<ul>\r\n	<li>Adaptation de tout texte (administratif, litt&eacute;raire, courrier, mail,&hellip;) en texte FALC (Facile &agrave; Lire et &agrave; Comprendre), pour que tous puissent acc&eacute;der au sens de votre communication, y compris les personnes ayant un handicap cognitif, dys, ou les personnes ne connaissant pas bien le fran&ccedil;ais.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><span style=\"color:#993366\"><strong>Tarifs indicatifs :</strong></span></p>\r\n\r\n<p><span style=\"color:#993366\">Correction simple : &mdash;&mdash;&mdash;&mdash;- 1 centime le mot</span></p>\r\n\r\n<p><span style=\"color:#993366\">Correction avec code couleur </span><span style=\"color:#993366\">pour comprendre ses erreurs : &mdash;-2 centimes le mot</span></p>\r\n\r\n<p><span style=\"color:#666699\">Correction expliqu&eacute;e + exercices adapt&eacute;s &agrave; ses erreurs : &mdash; 10 centimes le mot</span></p>\r\n\r\n<p><span style=\"color:#666699\">&Eacute;valuation de votre orthographe + r&eacute;visions,&nbsp;envoi d&rsquo;exercices &mdash;- sur devis</span></p>\r\n\r\n<p><span style=\"color:#993366\">&Eacute;crit &agrave; partir d&rsquo;un enregistrement &mdash; 2 centimes le mot</span></p>\r\n\r\n<p><span style=\"color:#993366\"><strong><span style=\"color:#339966\">Adaptation en fran&ccedil;ais facile &agrave; lire (ou FALC) : &mdash;&ndash;sur devis &ndash; entre 5 et 10 ctm le mot</span></strong></span></p>\r\n\r\n<p><span style=\"color:#993300\">Appui r&eacute;daction professionnelle &mdash;&mdash;&ndash; sur devis &ndash; 10 &euro; la page maximum (police 12)</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Pour tout renseignement, ou envoi de texte pour devis :</p>\r\n\r\n<p>par mail&nbsp; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; <a href=\"mailto:accesscribe@laposte.net\">accesscribe@laposte.net</a></p>\r\n\r\n<p>Merci</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" class=\"aligncenter size-medium wp-image-2051\" src=\"https://accessinfos.files.wordpress.com/2017/12/accesscrbe.jpg?w=300&amp;h=121\" style=\"height:121px; width:300px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n</div>', 'Content', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `app_contents_rights`
--

CREATE TABLE `app_contents_rights` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `app_menu`
--

CREATE TABLE `app_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `app_menu`
--

INSERT INTO `app_menu` (`id`, `name`) VALUES
(1, 'Principal'),
(2, 'Footer');

-- --------------------------------------------------------

--
-- Structure de la table `app_menu_page`
--

CREATE TABLE `app_menu_page` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `app_menu_page`
--

INSERT INTO `app_menu_page` (`id`, `menu_id`, `page_id`, `position`) VALUES
(1, 1, 5, '5'),
(2, 1, 2, '1.1'),
(3, 2, 1, '1'),
(4, 1, 1, '1'),
(5, 1, 8, '2'),
(6, 1, 9, '3'),
(7, 1, 10, '4'),
(8, 1, 11, '6 text_right');

-- --------------------------------------------------------

--
-- Structure de la table `app_page`
--

CREATE TABLE `app_page` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seotitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seodesc` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seokeywords` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headerImage` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `app_page`
--

INSERT INTO `app_page` (`id`, `name`, `slug`, `class`, `seotitle`, `seodesc`, `seokeywords`, `headerImage`, `locked`) VALUES
(1, 'ACCUEIL', 'home', NULL, 'Accueil', 'Seo Description', 'Keywords', NULL, 0),
(2, 'Présentation', 'presentation', NULL, 'Présentation', 'Description Présentation', 'Keywords Présentation', NULL, 0),
(3, 'Default Contents', 'default', NULL, NULL, NULL, NULL, NULL, 0),
(4, 'Connexion', 'login', NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Contact', 'contact', NULL, NULL, NULL, NULL, NULL, 0),
(6, 'Articles', 'articles', NULL, NULL, NULL, NULL, NULL, 1),
(7, 'Article', 'article', NULL, NULL, NULL, NULL, NULL, 1),
(8, 'Des infos', 'des_infos', NULL, NULL, NULL, NULL, NULL, 1),
(9, 'Des gens', 'des_gens', NULL, NULL, NULL, NULL, NULL, 0),
(10, 'Des Idées', 'des_idees', NULL, NULL, NULL, NULL, NULL, 0),
(11, 'AccesScribe', 'accesscribe', NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `app_pages_rights`
--

CREATE TABLE `app_pages_rights` (
  `page_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `app_pages_rights`
--

INSERT INTO `app_pages_rights` (`page_id`, `group_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3);

-- --------------------------------------------------------

--
-- Structure de la table `app_page_content`
--

CREATE TABLE `app_page_content` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `app_page_content`
--

INSERT INTO `app_page_content` (`id`, `page_id`, `content_id`, `position`) VALUES
(1, 2, 5, '1'),
(2, 3, 3, 'Menu'),
(3, 3, 2, 'Header'),
(4, 4, 4, '1'),
(5, 5, 6, '1'),
(6, 3, 7, 'Footer'),
(7, 6, 8, '1'),
(8, 7, 9, '1'),
(9, 9, 8, '1 #typeArticle.name=Des gens'),
(10, 8, 8, '1 #typeArticle.name=Des infos'),
(11, 10, 8, '1 #typeArticle.name=Des idées'),
(12, 1, 10, '1'),
(13, 1, 8, '2 #typeArticle.name=Des infos;nbbypage=3'),
(14, 1, 8, '3 #typeArticle.name=Des gens;nbbypage=3'),
(15, 1, 8, '4 #typeArticle.name=Des idées;nbbypage=3'),
(16, 1, 8, '5 #publishedAt=2017;nbbypage=3'),
(17, 1, 8, '6 #publishedAt=2016;nbbypage=3'),
(18, 11, 11, '1');

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `owner` int(11) DEFAULT NULL,
  `li_types_articles` int(11) NOT NULL,
  `resource_rights` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_size` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `publishedat` datetime DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `owner`, `li_types_articles`, `resource_rights`, `title`, `photo_name`, `photo_size`, `content`, `updated_at`, `publishedat`, `isActive`) VALUES
(1, NULL, 1, 3, 'Titre', '5b0e872a0a315_index.png', 4011, '<p>Contenu de l&#39;article</p>', '2018-05-30 13:12:42', '2018-05-29 00:00:00', 1),
(2, 1, 2, 3, 'Les migrants dans les Alpes', '5b0e87595582c_migrantsalp.jpg', 23473, '<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">Chaque nuit, malgr&eacute; le froid, des&nbsp; personnes&nbsp; marchent&nbsp; dans&nbsp; la&nbsp; montagne&nbsp; pour&nbsp; traverser&nbsp; la fronti&egrave;re&nbsp; entre&nbsp; l&rsquo;Italie&nbsp; et la France.</span></div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">Ce&nbsp; sont&nbsp; des&nbsp; migrants,&nbsp; des&nbsp; jeunes&nbsp; hommes&nbsp; qui&nbsp; viennent&nbsp; d&rsquo;Afrique&nbsp; pour&nbsp; vivre en&nbsp; Europe.&nbsp; Ils&nbsp; sont&nbsp; arriv&eacute;s&nbsp; en&nbsp; Italie&nbsp; par&nbsp; bateau,&nbsp; ils&nbsp; veulent&nbsp; entrer&nbsp; en&nbsp; France&nbsp; pour travailler.</span></div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">Certains&nbsp; sont&nbsp; mineurs,&nbsp; et&nbsp; la&nbsp; France&nbsp; doit&nbsp; les&nbsp; accueillir&nbsp; et&nbsp; les&nbsp; aider.</span></div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">voir&nbsp; article&nbsp; &gt;&gt;&gt;&gt;&nbsp; &nbsp;<a href=\"https://accessinfos.wordpress.com/2018/01/24/moi-issa-migrant/\"><img alt=\"\" class=\"alignnone wp-image-2142\" src=\"https://accessinfos.files.wordpress.com/2018/01/migrant-issa.png?w=39&amp;h=59\" style=\"height:59px; width:39px\" /></a>&nbsp; Moi,&nbsp; Issa,&nbsp; migrant.</span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">Comme&nbsp; Issa,&nbsp;&nbsp;&nbsp; ces migrants&nbsp; viennent&nbsp; souvent&nbsp; de pays &nbsp; d&rsquo;Afrique&nbsp; o&ugrave;&nbsp; on&nbsp; parle&nbsp; fran&ccedil;ais&nbsp; :&nbsp; Mali, C&ocirc;te d&rsquo;Ivoire&hellip;</span></div>\r\n</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">&nbsp;<img alt=\"\" class=\"aligncenter size-medium wp-image-2327\" src=\"https://accessinfos.files.wordpress.com/2018/04/alpes.jpg?w=300&amp;h=221\" style=\"float:right; height:221px; margin-left:10px; margin-right:10px; width:300px\" /></span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">Mais&nbsp; ils&nbsp; n&rsquo;ont&nbsp; pas&nbsp; l&rsquo;autorisation&nbsp; de&nbsp; passer&nbsp; la&nbsp; fronti&egrave;re&nbsp; par&nbsp; la&nbsp; route,&nbsp; alors&nbsp; la&nbsp; nuit,&nbsp; ils&nbsp; montent&nbsp; dans&nbsp; la&nbsp; montagne&nbsp; &agrave;&nbsp; pied.&nbsp; Il&nbsp; fait&nbsp; tr&egrave;s&nbsp; froid,&nbsp; il&nbsp; y a&nbsp; de&nbsp; la&nbsp; neige.</span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\"><img alt=\"\" class=\"aligncenter size-medium wp-image-2331\" src=\"https://accessinfos.files.wordpress.com/2018/04/migrantssolidaire.jpg?w=300&amp;h=205\" style=\"float:left; height:205px; margin-left:10px; margin-right:10px; width:300px\" /></span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">En&nbsp; France,&nbsp; pr&egrave;s&nbsp; de la&nbsp; fronti&egrave;re,&nbsp; des&nbsp; personnes&nbsp; les&nbsp; aident.&nbsp; Dans&nbsp; les&nbsp; Hautes-Alpes,&nbsp; un&nbsp; refuge&nbsp; solidaire&nbsp; a&nbsp; ouvert&nbsp; pour&nbsp; &eacute;viter&nbsp; que&nbsp; des&nbsp; migrants&nbsp; meurent&nbsp; de&nbsp; froid.&nbsp; On&nbsp; leur&nbsp; donne&nbsp; des&nbsp; v&ecirc;tements&nbsp; chauds&nbsp; et&nbsp; &agrave;&nbsp; manger.&nbsp; A&nbsp; Brian&ccedil;on,&nbsp; plus&nbsp; de&nbsp; 1000&nbsp; habitants&nbsp; ont&nbsp; h&eacute;berg&eacute;&nbsp; des&nbsp; migrants.</span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">Ensuite&nbsp; ils&nbsp; prennent&nbsp; le train&nbsp; pour&nbsp; aller&nbsp; &agrave;&nbsp; Marseille,&nbsp; Lyon&nbsp; ou&nbsp; Paris.</span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\"><img alt=\"\" class=\"aligncenter size-medium wp-image-2330\" src=\"https://accessinfos.files.wordpress.com/2018/04/migrantsstop.jpg?w=300&amp;h=190\" style=\"float:left; height:190px; margin-left:10px; margin-right:10px; width:300px\" />Samedi&nbsp; 21&nbsp; avril,&nbsp; des&nbsp; militants&nbsp; d&rsquo;extr&ecirc;me-droite&nbsp; ont&nbsp; bloqu&eacute;&nbsp; un&nbsp; passage.&nbsp; Ils&nbsp; ne&nbsp; veulent&nbsp; pas&nbsp; que&nbsp; les&nbsp; migrants&nbsp; entrent&nbsp; en&nbsp; France.</span></div>\r\n</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">&nbsp;<img alt=\"\" class=\"aligncenter size-medium wp-image-2329\" src=\"https://accessinfos.files.wordpress.com/2018/04/migrantssolidaires.jpg?w=300&amp;h=256\" style=\"float:right; height:256px; margin-left:10px; margin-right:10px; width:300px\" /></span></div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">Pendant&nbsp; ce&nbsp; temps,&nbsp; &agrave;&nbsp; Gap,&nbsp; 200&nbsp; personnes&nbsp; ont&nbsp; manifest&eacute;&nbsp; pour&nbsp; la&nbsp; solidarit&eacute;&nbsp; et&nbsp; l&rsquo;accueil&nbsp; des&nbsp; migrants.</span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">G&eacute;rard&nbsp; Collomb,&nbsp; le&nbsp; ministre&nbsp; de&nbsp; l&rsquo;Int&eacute;rieur,&nbsp; critique&nbsp; tous&nbsp; les&nbsp; militants&nbsp; :&nbsp; ceux&nbsp; qui&nbsp; refusent&nbsp; l&rsquo;entr&eacute;e&nbsp; des&nbsp; migrants&nbsp; et&nbsp; ceux&nbsp; qui&nbsp; les&nbsp; accueillent.&nbsp; Il&nbsp; dit&nbsp; qu&rsquo;il&nbsp; va&nbsp; envoyer&nbsp; davantage&nbsp; de&nbsp; policiers&nbsp; &agrave;&nbsp; la&nbsp; fronti&egrave;re.</span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">A&nbsp; mon avis,&nbsp; les&nbsp; jeunes&nbsp; Africains&nbsp; devraient&nbsp; avoir&nbsp; le&nbsp; droit&nbsp; de&nbsp; venir&nbsp; en&nbsp; Europe,&nbsp; comme&nbsp; les&nbsp; jeunes&nbsp; Europ&eacute;ens&nbsp; qui&nbsp; peuvent&nbsp; voyager&nbsp; partout.</span></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div><span style=\"font-family:Tahoma,Geneva,sans-serif\">En savoir plus : <a href=\"https://www.1jour1actu.com/france/dans-les-alpes-les-habitants-se-mobilisent-pour-les-migrants-15054/\">https://www.1jour1actu.com/france/dans-les-alpes-les-habitants-se-mobilisent-pour-les-migrants-15054/</a></span></div>\r\n\r\n<div>\r\n<p><span style=\"font-family:Tahoma,Geneva,sans-serif\">Pour compl&eacute;ter, voir cet article :</span></p>\r\n\r\n<h3><span style=\"font-family:Tahoma,Geneva,sans-serif\"><a href=\"http://cequejendis.fr.gd/Ce-que-j-h-en-dis.htm\" rel=\"noopener\" target=\"_blank\"><big>Les Fran&ccedil;ais.e.s voyagent </big></a><br />\r\n<a href=\"http://cequejendis.fr.gd/Ce-que-j-h-en-dis.htm\" rel=\"noopener\" target=\"_blank\"><big>Les Africain.e.s migrent</big></a></span></h3>\r\n</div>\r\n\r\n<p>&nbsp;</p>', '2018-06-07 16:15:00', '2018-04-29 00:00:00', 1),
(3, NULL, 2, 3, 'Les personnes transgenres', '5b0ea01d25f33_transid.jpg', 9590, '<p>A la naissance,&nbsp; si&nbsp; le b&eacute;b&eacute;&nbsp; a&nbsp; un&nbsp; p&eacute;nis,&nbsp; on dit que&nbsp; c&rsquo;est un gar&ccedil;on,&nbsp; et&nbsp; qu&rsquo;il&nbsp; deviendra un&nbsp; homme.</p>\r\n\r\n<p>Si&nbsp; le&nbsp; b&eacute;b&eacute;&nbsp; a&nbsp; une&nbsp; vulve,&nbsp; on dit&nbsp; que&nbsp; c&rsquo;est une fille,&nbsp; qu&rsquo;elle&nbsp; deviendra&nbsp; une&nbsp; femme.</p>\r\n\r\n<p><img alt=\"\" class=\"aligncenter wp-image-2260\" src=\"https://accessinfos.files.wordpress.com/2018/03/transbc3a9bc3a9.jpg?w=119&amp;h=117\" style=\"float:left; height:117px; margin-left:10px; margin-right:10px; width:119px\" /></p>\r\n\r\n<p>Mais&nbsp; il&nbsp; arrive&nbsp; que&nbsp; l&rsquo;enfant,&nbsp; en&nbsp; grandissant,&nbsp; se&nbsp; sente&nbsp; diff&eacute;rent&nbsp; :</p>\r\n\r\n<p>il&nbsp; a&nbsp; un&nbsp; corps&nbsp; de&nbsp; fille et&nbsp; il&nbsp; se&nbsp; rend&nbsp; compte&nbsp; qu&rsquo;il&nbsp; est&nbsp; un&nbsp; gar&ccedil;on.&nbsp; Ou&nbsp; &agrave;&nbsp; l&rsquo;inverse,&nbsp; elle&nbsp; a&nbsp; un&nbsp; corps&nbsp; de&nbsp; gar&ccedil;on&nbsp; et&nbsp; se&nbsp; rend&nbsp; compte&nbsp; qu&rsquo;elle&nbsp; est&nbsp; une&nbsp; fille.&nbsp; Il&nbsp; arrive&nbsp; qu&rsquo;une&nbsp; personne&nbsp; ne&nbsp; se sente&nbsp; ni&nbsp; gar&ccedil;on,&nbsp; ni&nbsp; fille,&nbsp; ou&nbsp; les&nbsp; deux.</p>\r\n\r\n<p>C&rsquo;est&nbsp; une&nbsp; personne&nbsp;<strong> transgenre</strong>.&nbsp; C&rsquo;est&nbsp; rare&nbsp; et&nbsp; c&rsquo;est&nbsp; difficile&nbsp; &agrave;&nbsp; comprendre&nbsp; pour&nbsp; les&nbsp; autres,&nbsp; pour&nbsp; leur&nbsp; famille.</p>\r\n\r\n<p>Une personne transgenre&nbsp; ne se reconna&icirc;t&nbsp; pas&nbsp; dans&nbsp; le&nbsp; genre&nbsp; &laquo;&nbsp;femme&nbsp;&raquo;&nbsp; ou&nbsp; &laquo;&nbsp;homme&nbsp;&raquo; &nbsp; qu&rsquo;on&nbsp; lui&nbsp; a donn&eacute;&nbsp; &agrave;&nbsp; sa naissance.</p>\r\n\r\n<p>Pour&nbsp; les&nbsp; personnes&nbsp; transgenres,&nbsp; c&rsquo;est&nbsp; une&nbsp; souffrance&nbsp; de&nbsp; ne&nbsp; pas&nbsp; &ecirc;tre&nbsp; reconnues&nbsp; par&nbsp; leur&nbsp; entourage&nbsp; pour&nbsp; ce&nbsp; qu&rsquo;elles&nbsp; sont.&nbsp; Leur&nbsp; corps&nbsp; n&rsquo;est&nbsp; pas&nbsp; adapt&eacute;&nbsp; &agrave;&nbsp; leur&nbsp; identit&eacute;.</p>\r\n\r\n<p>Ce&nbsp; n&rsquo;est&nbsp; pas&nbsp; une&nbsp; maladie,&nbsp; et&nbsp; ce&nbsp; n&rsquo;est&nbsp; pas&nbsp; une&nbsp; mode.&nbsp;&nbsp; De plus&nbsp; en plus&nbsp; de&nbsp; personnes&nbsp; disent &nbsp; &ecirc;tre transgenres,&nbsp;&nbsp;&nbsp; parce&nbsp; que&nbsp; la parole&nbsp; se lib&egrave;re&nbsp; dans&nbsp; notre&nbsp; soci&eacute;t&eacute;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" class=\"alignright size-medium wp-image-2250\" src=\"https://accessinfos.files.wordpress.com/2018/03/sohan-19.jpg?w=213&amp;h=300\" style=\"float:left; height:300px; margin-left:10px; margin-right:10px; width:213px\" />En&nbsp; grandissant,&nbsp;&nbsp; elles&nbsp;&nbsp; d&eacute;cident&nbsp;&nbsp; parfois&nbsp;&nbsp; de&nbsp; l&rsquo;annoncer&nbsp; &agrave; leur entourage&nbsp; et&nbsp; de&nbsp; faire&nbsp; des &nbsp; changements physiques,&nbsp; &agrave; l&rsquo;aide&nbsp; de la m&eacute;decine, &nbsp;&nbsp; pour&nbsp; se sentir mieux&nbsp;&nbsp; dans leur identit&eacute;.</p>\r\n\r\n<p>Souvent,&nbsp; la&nbsp; personne &nbsp; transgenre&nbsp; change &nbsp; de&nbsp; pr&eacute;nom &nbsp; : &nbsp; par exemple,&nbsp;&nbsp; Nicolas &nbsp; devient&nbsp; St&eacute;phanie, &nbsp; Catherine&nbsp; devient&nbsp;&nbsp; Killian.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" class=\"alignright wp-image-2258\" src=\"https://accessinfos.files.wordpress.com/2018/03/transcni.jpg?w=248&amp;h=195\" style=\"float:right; height:195px; margin-left:10px; margin-right:10px; width:248px\" /></p>\r\n\r\n<p>Elle peut&nbsp; demander&nbsp; au&nbsp; m&eacute;decin&nbsp; psychiatre&nbsp; la&nbsp; possibilit&eacute;&nbsp; de&nbsp; prendre&nbsp; des&nbsp; hormones,&nbsp;&nbsp; et&nbsp; subir&nbsp; des&nbsp; op&eacute;rations&nbsp; chirurgicales.</p>\r\n\r\n<ul>\r\n	<li>Une&nbsp; femme&nbsp; transgenre&nbsp; qui&nbsp; avait&nbsp; un&nbsp; corps&nbsp; de&nbsp; gar&ccedil;on&nbsp;&nbsp; aura&nbsp; moins&nbsp; de&nbsp; poils,&nbsp; moins&nbsp; de&nbsp; muscles,&nbsp; elle&nbsp; aura&nbsp; des&nbsp; seins,&nbsp;&nbsp; elle&nbsp; peut&nbsp; faire&nbsp; une&nbsp; op&eacute;ration&nbsp; pour&nbsp; enlever&nbsp; son&nbsp; sexe&nbsp; d&rsquo;homme.</li>\r\n	<li>Un&nbsp; homme&nbsp; transgenre&nbsp; qui&nbsp; avait&nbsp; un&nbsp; corps&nbsp; de&nbsp; fille&nbsp; aura&nbsp; plus&nbsp; de&nbsp; poils,&nbsp; plus&nbsp; de&nbsp; muscles,&nbsp; la&nbsp; voix&nbsp; plus&nbsp; grave.&nbsp; Il&nbsp; peut&nbsp; faire&nbsp; une&nbsp; op&eacute;ration&nbsp; pour&nbsp; enlever&nbsp; les&nbsp; seins, transformer son sexe.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>On&nbsp; peut&nbsp; demander&nbsp; un&nbsp; changement&nbsp; officiel&nbsp; d&rsquo;&eacute;tat&nbsp; civil,&nbsp;&nbsp; pour&nbsp; avoir&nbsp; une&nbsp; carte&nbsp; d&rsquo;identit&eacute; &nbsp; avec&nbsp; le&nbsp; sexe&nbsp; qui&nbsp; convient.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ces personnes sont&nbsp; souvent&nbsp; moqu&eacute;es,&nbsp; discrimin&eacute;es.&nbsp;&nbsp; Dans&nbsp; beaucoup&nbsp; de&nbsp; pays,&nbsp; elles&nbsp; n&rsquo;ont&nbsp; pas&nbsp; le&nbsp; droit&nbsp; de&nbsp; changer&nbsp; d&rsquo;identit&eacute;.&nbsp; On parle de&nbsp; <strong>transphobie</strong>.&nbsp; Des&nbsp; personnes&nbsp; trans&nbsp; se&nbsp; font&nbsp; licencier,&nbsp; ou&nbsp; ne&nbsp; peuvent&nbsp; pas&nbsp; trouver&nbsp; de&nbsp; travail. &nbsp; Souvent,&nbsp; elles&nbsp; sont&nbsp; rejet&eacute;es&nbsp; par&nbsp; leur&nbsp; famille,&nbsp; insult&eacute;es&nbsp; dans&nbsp; la&nbsp; rue&nbsp; ou&nbsp; sur&nbsp; les&nbsp; r&eacute;seaux&nbsp; sociaux.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>En France,&nbsp; depuis&nbsp; novembre&nbsp; 2016,&nbsp; la&nbsp; loi&nbsp; dit :</strong></p>\r\n\r\n<p>&nbsp;&raquo; Toute personne&nbsp; peut demander&nbsp; &agrave; changer&nbsp; de&nbsp; pr&eacute;nom.</p>\r\n\r\n<p>Le changement de pr&eacute;nom&nbsp; se fait&nbsp; &agrave; la mairie.</p>\r\n\r\n<p>&nbsp;&raquo; Toute personne&nbsp; peut&nbsp; demander&nbsp; &agrave;&nbsp; changer&nbsp; son&nbsp; sexe&nbsp; &agrave;&nbsp; l&rsquo;Etat civil&nbsp; (pour&nbsp; ses&nbsp; papiers).</p>\r\n\r\n<p>Le changement&nbsp; de&nbsp; sexe&nbsp; se&nbsp; fait&nbsp; au&nbsp; Tribunal.</p>\r\n\r\n<p>La&nbsp; transphobie&nbsp; est&nbsp; interdite&nbsp; par&nbsp; la&nbsp; loi&nbsp; et&nbsp; doit&nbsp; &ecirc;tre&nbsp; punie.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Les&nbsp; personnes&nbsp; transgenres &nbsp;&nbsp; demandent&nbsp; &agrave;&nbsp; &ecirc;tre&nbsp; plus&nbsp; libres,&nbsp; plus&nbsp; autonomes :</p>\r\n\r\n<ul>\r\n	<li>&nbsp;pouvoir&nbsp; prendre&nbsp; un&nbsp; traitement&nbsp; hormonal&nbsp; plus&nbsp; rapidement,</li>\r\n	<li>pouvoir&nbsp; changer&nbsp; de&nbsp; sexe&nbsp; &agrave;&nbsp; l&rsquo;Etat Civil&nbsp; sans&nbsp; l&rsquo;avis&nbsp; d&rsquo;un&nbsp; juge.</li>\r\n</ul>\r\n\r\n<p>Il&nbsp; est&nbsp; important&nbsp; de &nbsp; comprendre&nbsp; et&nbsp; accepter &nbsp; les&nbsp; personnes&nbsp; transgenres, &nbsp; elles&nbsp; ne&nbsp; choisissent&nbsp; pas&nbsp; leur&nbsp; situation,&nbsp;&nbsp; elles&nbsp; souhaitent &nbsp; vivre&nbsp; et&nbsp; travailler &nbsp; comme&nbsp; tout&nbsp; le monde.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" class=\"alignnone wp-image-2251\" src=\"https://accessinfos.files.wordpress.com/2018/03/transgenre.jpg?w=144&amp;h=147\" style=\"height:147px; width:144px\" /><a href=\"https://www.psychologue.net/articles/que-signifie-etre-transgenre\" rel=\"nofollow\">https://www.psychologue.net/articles/que-signifie-etre-transgenre</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://www.sos-transphobie.org\" rel=\"noopener\" target=\"_blank\"><img alt=\"\" class=\"aligncenter wp-image-2257\" src=\"https://accessinfos.files.wordpress.com/2018/03/transos.jpg?w=394&amp;h=92\" style=\"height:92px; width:394px\" /></a></p>\r\n\r\n<p>&nbsp;</p>', '2018-05-30 14:59:09', '2018-03-24 00:00:00', 1),
(4, 1, 1, 3, 'DZIONQOV', NULL, NULL, '<p>test</p>\r\n\r\n<div class=\"call__item col-md-4 col-sm-4 col-xs-12\">\r\n<div class=\"call__item__inner call__item__inner--body\"><img alt=\"\" class=\"img-responsive\" src=\"https://www.generations-futures.fr/wp-content/thumbnails/uploads/2017/11/faucet-1684902_1920-tt-width-250-height-250-crop-1-bgcolor-ffffff.jpg\" style=\"height:250px; width:250px\" />\r\n<div class=\"call__category\">LOI EGA PESTICIDES EAU</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-6 col-sm-6\">\r\n<div class=\"form-dept form-dept__container\">Votre d&eacute;partement\r\n<div class=\"form__inner row--flexbox\">\r\n<form method=\"post\">\r\n<div class=\"dept-container\">34 - H&eacute;rault</div>\r\n</form>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"call__list\">\r\n<div class=\"row row--flexbox\">\r\n<div class=\"col-md-6 col-sm-6\">\r\n<div class=\"form-dept form-dept__container\">&nbsp;</div>\r\n\r\n<div class=\"form-dept__content\">\r\n<h2>Projet de loi sur l&rsquo;alimentation suite aux Etats G&eacute;n&eacute;raux de l&rsquo;alimentation</h2>\r\n\r\n<p>La mise en place obligatoire d&rsquo;Agriculture biologique dans les bassins versants des captages grenelle dans lesquels aucun plan d&rsquo;action n&rsquo;a encore &eacute;t&eacute; mis en place&nbsp;! voir <a href=\"http://www.onema.fr/sites/default/files/captages-cpa.pdf\">le document de l&rsquo;ONEMA </a>de 2015 montrant la faible avanc&eacute;e de la protection de ces captages pourtant prioritaires&nbsp;!</p>\r\n\r\n<div class=\"block-border\">\r\n<p><a href=\"https://www.generations-futures.fr/agir/interpellation/glyphosate/\"><strong>TWEETEZ!</strong></a></p>\r\n\r\n<p><strong>Interpellez&nbsp;vos s&eacute;nateurs et demandez leur de proposer et soutenir un amendement pour que&nbsp;</strong>&laquo;&nbsp;Les captages d&rsquo;eau class&eacute;s prioritaires par rapport aux pollutions agricoles non pourvus de plans d&rsquo;actions soient dot&eacute;s de tels plans au plus tard le 1<sup>er</sup> janvier 2020. Les zones de protection pr&eacute;vues par ces plans pr&eacute;voient qu&rsquo;au moins 50% de leur surface agricole est conduite en agriculture biologique. .&nbsp;&laquo;&nbsp;</p>\r\n\r\n<p><strong>Alors &agrave; vos clics, &agrave; vos hashtags!</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"deputies-container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\n<h2>&nbsp;</h2>\r\n</div>\r\n</div>\r\n</div>', '2018-06-07 18:23:51', '2018-06-07 00:00:00', 1),
(5, NULL, 3, 3, 'nouvel', '5b195c4b18167_migrantsalp.jpg', 23473, '<div class=\"call__item col-md-4 col-sm-4 col-xs-12\">\r\n<div class=\"call__item__inner call__item__inner--body\"><img alt=\"\" class=\"img-responsive\" src=\"https://www.generations-futures.fr/wp-content/thumbnails/uploads/2017/11/faucet-1684902_1920-tt-width-250-height-250-crop-1-bgcolor-ffffff.jpg\" style=\"height:250px; width:250px\" />\r\n<div class=\"call__category\">LOI EGA PESTICIDES EAU</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-md-6 col-sm-6\">\r\n<div class=\"form-dept form-dept__container\">Votre d&eacute;partement\r\n<div class=\"form__inner row--flexbox\">\r\n<form method=\"post\">\r\n<div class=\"dept-container\">34 - H&eacute;rault</div>\r\n</form>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"call__list\">\r\n<div class=\"row row--flexbox\">\r\n<div class=\"col-md-6 col-sm-6\">\r\n<div class=\"form-dept form-dept__container\">&nbsp;</div>\r\n\r\n<div class=\"form-dept__content\">\r\n<h2>Projet de loi sur l&rsquo;alimentation suite aux Etats G&eacute;n&eacute;raux de l&rsquo;alimentation</h2>\r\n\r\n<p>La mise en place obligatoire d&rsquo;Agriculture biologique dans les bassins versants des captages grenelle dans lesquels aucun plan d&rsquo;action n&rsquo;a encore &eacute;t&eacute; mis en place&nbsp;! voir <a href=\"http://www.onema.fr/sites/default/files/captages-cpa.pdf\">le document de l&rsquo;ONEMA </a>de 2015 montrant la faible avanc&eacute;e de la protection de ces captages pourtant prioritaires&nbsp;!</p>\r\n\r\n<div class=\"block-border\">\r\n<p><a href=\"https://www.generations-futures.fr/agir/interpellation/glyphosate/\"><strong>TWEETEZ!</strong></a></p>\r\n\r\n<p><strong>Interpellez&nbsp;vos s&eacute;nateurs et demandez leur de proposer et soutenir un amendement pour que&nbsp;</strong>&laquo;&nbsp;Les captages d&rsquo;eau class&eacute;s prioritaires par rapport aux pollutions agricoles non pourvus de plans d&rsquo;actions soient dot&eacute;s de tels plans au plus tard le 1<sup>er</sup> janvier 2020. Les zones de protection pr&eacute;vues par ces plans pr&eacute;voient qu&rsquo;au moins 50% de leur surface agricole est conduite en agriculture biologique. .&nbsp;&laquo;&nbsp;</p>\r\n\r\n<p><strong>Alors &agrave; vos clics, &agrave; vos hashtags!</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"deputies-container\">\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\n<h2>&nbsp;</h2>\r\n</div>\r\n</div>\r\n</div>', '2018-06-07 18:24:43', '2018-06-07 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `carousel`
--

CREATE TABLE `carousel` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_size` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `article` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `authorname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `publishedat` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `comment`
--

INSERT INTO `comment` (`id`, `article`, `owner`, `authorname`, `title`, `content`, `publishedat`, `updated_at`, `isActive`) VALUES
(1, 5, 1, NULL, 'nul', 'zdzqddzq qzdzqdqzdqz dqzdqz d zdzqddzq qzdzqdqzdqz dqzdqz d zdzqddzq qzdzqdqzdqz dqzdqz d zdzqddzq qzdzqdqzdqz dqzdqz d\r\ndzadz \r\ndzda ezfezfezefe ezfze\r\nzef zefzefezfz', '2018-06-08 00:00:00', '2018-06-08 17:51:19', 1),
(2, 5, NULL, NULL, 'Titre zaeredzdz', 'zzfafzazfafaz\r\n zafza fa\r\nzf\r\n za\r\nfza\r\nza fzafzafazfzafza azfzafzafazf', '2018-06-08 17:54:41', NULL, 1),
(5, 5, NULL, 'louis', 'PAS D\'accord!', 'azdiozadoizdaziodn', '2018-06-12 09:23:55', '2018-06-12 09:24:12', 1),
(6, 5, NULL, 'mecnice', 'uun', 'oioijjioa\r\nfza\r\nza fzafzafazfzafza azfzafzafazf iuuiuu', '2018-06-12 09:25:52', '2018-06-12 09:26:03', 1),
(9, 1, NULL, 'sdssd', 'QS', 'DFDSfdd', '2018-06-20 13:34:15', '2018-06-20 13:35:54', 1),
(10, 1, NULL, 'sdssd', 'QSsddffds', 'DFDSfdd', '2018-06-20 13:35:31', '2018-06-20 13:35:57', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_group`
--

CREATE TABLE `fos_user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fos_user_group`
--

INSERT INTO `fos_user_group` (`id`, `name`, `roles`) VALUES
(3, 'All', 'a:0:{}'),
(4, 'User', 'a:1:{i:0;s:9:\"ROLE_USER\";}'),
(5, 'Gestionnaire', 'a:1:{i:0;s:15:\"ROLE_ADMIN_USER\";}');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_user`
--

CREATE TABLE `fos_user_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`, `image_name`, `image_size`) VALUES
(1, 'louis', 'louis', 'louis.watrin@gmail.com', 'louis.watrin@gmail.com', 1, 'veAYIXSUNf/.UnWiYr/K.toab4po0GFd8mfjrLKRqec', '7iGtISjE8widHnBawmQcCy5vIKarZhyssic3gtFINA1Gn8ZQLhORHiVI3bsLlSxPooXZI9iFv3Tp9rZqO8BeCQ==', '2018-06-22 12:45:13', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '2018-03-04 15:35:07', '2018-06-22 12:45:13', NULL, 'Louis', 'Watrin', NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_user_group`
--

CREATE TABLE `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `f_field`
--

CREATE TABLE `f_field` (
  `id` int(11) NOT NULL,
  `fieldtype_id` int(11) DEFAULT NULL,
  `property` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `listname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  `info` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `limitnb` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `f_field`
--

INSERT INTO `f_field` (`id`, `fieldtype_id`, `property`, `listname`, `label`, `placeholder`, `mandatory`, `info`, `limitnb`) VALUES
(1, 1, 'title', NULL, 'Titre', NULL, 1, NULL, NULL),
(2, 3, 'author', 'ApplicationSonataUserBundle:User.username#enabled=true', 'Auteur', NULL, 0, NULL, NULL),
(3, 9, 'photoFile', NULL, 'Illustration', NULL, 0, NULL, NULL),
(4, 22, 'content', NULL, 'Contenu', NULL, 0, NULL, NULL),
(5, 5, 'typeArticle', 'Liste=types_articles', 'Catégorie', NULL, 1, NULL, NULL),
(6, 3, 'article', 'SiteBundle\\Entity\\Article.title', 'Article', NULL, 1, NULL, NULL),
(7, 12, 'publishedAt', NULL, 'Date de publication', NULL, 0, NULL, NULL),
(8, 2, 'isActive', NULL, 'Visible', NULL, 0, NULL, NULL),
(9, 7, 'content', NULL, 'Commentaire', NULL, 1, NULL, 1000);

-- --------------------------------------------------------

--
-- Structure de la table `f_fieldtype`
--

CREATE TABLE `f_fieldtype` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `f_fieldtype`
--

INSERT INTO `f_fieldtype` (`id`, `name`, `base_type`, `component`) VALUES
(1, 'Text', 'string', 'text'),
(2, 'Boolean', 'boolean', 'boolean'),
(3, 'Select simple', 'object', 'select_simple'),
(4, 'Select [multiple]', 'object[]', 'select_multiple'),
(5, 'RadioList', 'object', 'radio'),
(6, 'CheckList', 'object[]', 'checklist'),
(7, 'Textarea', 'string', 'textarea'),
(8, 'Lien', 'url', 'link'),
(9, 'Image', 'image', 'image'),
(11, 'Nombre', 'integer', 'number'),
(12, 'Date', 'datetime', 'datetime'),
(13, 'Program_Objective', 'Entity[]', 'TableObjectivesType'),
(14, 'Inactif', 'string', 'inactif'),
(15, 'Program_nbByYear', 'Entity[]', 'TableNbByYearType'),
(16, 'RadioList_classic', 'object', 'radio'),
(17, 'Email', 'string', 'email'),
(18, 'Year', 'integer', 'year'),
(19, 'LocalisationType', 'Entity[]', 'LocalisationType'),
(20, 'ImageArray', 'Entity[]', 'ImageArray'),
(21, 'FileArray', 'Entity[]', 'FileArray'),
(22, 'Editeur de texte', 'string', 'TextEditor'),
(23, 'Rights', 'Entity[]', 'Rights'),
(24, 'FileUpload', 'file', 'file');

-- --------------------------------------------------------

--
-- Structure de la table `f_form`
--

CREATE TABLE `f_form` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `f_form`
--

INSERT INTO `f_form` (`id`, `name`, `title`, `entity`) VALUES
(1, 'article', 'Formulaire Article', 'SiteBundle\\Entity\\Article'),
(2, 'comment', 'Commentaires', 'SiteBundle\\Entity\\Comment');

-- --------------------------------------------------------

--
-- Structure de la table `f_formfield`
--

CREATE TABLE `f_formfield` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `info` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `f_formfield`
--

INSERT INTO `f_formfield` (`id`, `form_id`, `field_id`, `mandatory`, `position`, `info`) VALUES
(1, 1, 1, 1, 1, NULL),
(2, 1, 3, 0, 2, NULL),
(3, 1, 4, 1, 3, NULL),
(4, 1, 2, 0, 4, NULL),
(5, 1, 5, 1, 5, NULL),
(6, 2, 1, 0, 2, NULL),
(7, 2, 2, 0, 3, NULL),
(9, 2, 9, 0, 4, NULL),
(10, 2, 6, 0, 1, NULL),
(11, 2, 7, 0, 5, NULL),
(12, 2, 8, 0, 6, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `f_formfieldrights`
--

CREATE TABLE `f_formfieldrights` (
  `id` int(11) NOT NULL,
  `formfield_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `geom`
--

CREATE TABLE `geom` (
  `id` int(11) NOT NULL,
  `SHAPE` geometry NOT NULL COMMENT '(DC2Type:geometry)',
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_list`
--

CREATE TABLE `g_list` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `g_list`
--

INSERT INTO `g_list` (`id`, `name`, `title`) VALUES
(1, 'listest', 'Test'),
(2, 'types_articles', 'Catégorie d\'article');

-- --------------------------------------------------------

--
-- Structure de la table `g_listitem`
--

CREATE TABLE `g_listitem` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `list_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `elem_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `g_listitem`
--

INSERT INTO `g_listitem` (`id`, `parent_id`, `list_id`, `name`, `icon`, `description`, `elem_order`) VALUES
(1, NULL, 2, 'Des infos', NULL, NULL, 1),
(2, NULL, 2, 'Des gens', NULL, NULL, 2),
(3, NULL, 2, 'Des idées', NULL, NULL, 3),
(4, NULL, 2, 'Roman', NULL, NULL, 4),
(5, 4, 2, 'Croc Blanc', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Structure de la table `media__gallery`
--

CREATE TABLE `media__gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `default_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media__gallery_media`
--

CREATE TABLE `media__gallery_media` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media__media`
--

CREATE TABLE `media__media` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_size` int(11) DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) DEFAULT NULL,
  `cdn_flush_identifier` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_flush_at` datetime DEFAULT NULL,
  `cdn_status` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `media__media`
--

INSERT INTO `media__media` (`id`, `name`, `description`, `enabled`, `provider_name`, `provider_status`, `provider_reference`, `provider_metadata`, `width`, `height`, `length`, `content_type`, `content_size`, `copyright`, `author_name`, `context`, `cdn_is_flushable`, `cdn_flush_identifier`, `cdn_flush_at`, `cdn_status`, `updated_at`, `created_at`) VALUES
(1, 'migrantsalp.jpg', NULL, 0, 'sonata.media.provider.image', 1, 'b7bfd2b751123bf7c6a01e730e4874df5032da3b.jpeg', '{\"filename\":\"migrantsalp.jpg\"}', 365, 321, NULL, 'image/jpeg', 23473, NULL, NULL, 'my-context', NULL, NULL, NULL, NULL, '2018-06-07 18:21:06', '2018-06-07 18:21:06');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `acl_classes`
--
ALTER TABLE `acl_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`);

--
-- Index pour la table `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  ADD KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  ADD KEY `IDX_46C8B806EA000B10` (`class_id`),
  ADD KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  ADD KEY `IDX_46C8B806DF9183C9` (`security_identity_id`);

--
-- Index pour la table `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  ADD KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`);

--
-- Index pour la table `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  ADD KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  ADD KEY `IDX_825DE299C671CEA1` (`ancestor_id`);

--
-- Index pour la table `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`);

--
-- Index pour la table `app_content`
--
ALTER TABLE `app_content`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `app_contents_rights`
--
ALTER TABLE `app_contents_rights`
  ADD PRIMARY KEY (`content_id`,`group_id`),
  ADD KEY `IDX_D358BDA384A0A3ED` (`content_id`),
  ADD KEY `IDX_D358BDA3FE54D947` (`group_id`);

--
-- Index pour la table `app_menu`
--
ALTER TABLE `app_menu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `app_menu_page`
--
ALTER TABLE `app_menu_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_742A195BCCD7E912` (`menu_id`),
  ADD KEY `IDX_742A195BC4663E4` (`page_id`);

--
-- Index pour la table `app_page`
--
ALTER TABLE `app_page`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `app_pages_rights`
--
ALTER TABLE `app_pages_rights`
  ADD PRIMARY KEY (`page_id`,`group_id`),
  ADD KEY `IDX_6E64B08DC4663E4` (`page_id`),
  ADD KEY `IDX_6E64B08DFE54D947` (`group_id`);

--
-- Index pour la table `app_page_content`
--
ALTER TABLE `app_page_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C62BC1BDC4663E4` (`page_id`),
  ADD KEY `IDX_C62BC1BD84A0A3ED` (`content_id`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E66CF60E67C` (`owner`),
  ADD KEY `IDX_23A0E66B038C595` (`li_types_articles`),
  ADD KEY `IDX_23A0E66C99C3BF9` (`resource_rights`);

--
-- Index pour la table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C23A0E66` (`article`),
  ADD KEY `IDX_9474526CCF60E67C` (`owner`);

--
-- Index pour la table `fos_user_group`
--
ALTER TABLE `fos_user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`);

--
-- Index pour la table `fos_user_user`
--
ALTER TABLE `fos_user_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_C560D761C05FB297` (`confirmation_token`);

--
-- Index pour la table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `IDX_B3C77447A76ED395` (`user_id`),
  ADD KEY `IDX_B3C77447FE54D947` (`group_id`);

--
-- Index pour la table `f_field`
--
ALTER TABLE `f_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1505AEC6163BE712` (`fieldtype_id`);

--
-- Index pour la table `f_fieldtype`
--
ALTER TABLE `f_fieldtype`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `f_form`
--
ALTER TABLE `f_form`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `f_formfield`
--
ALTER TABLE `f_formfield`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EF0115A85FF69B7D` (`form_id`),
  ADD KEY `IDX_EF0115A8443707B0` (`field_id`);

--
-- Index pour la table `f_formfieldrights`
--
ALTER TABLE `f_formfieldrights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_462DAA8A11386F6` (`formfield_id`),
  ADD KEY `IDX_462DAA8AFE54D947` (`group_id`);

--
-- Index pour la table `geom`
--
ALTER TABLE `geom`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `g_list`
--
ALTER TABLE `g_list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `g_listitem`
--
ALTER TABLE `g_listitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5B8B8678727ACA70` (`parent_id`),
  ADD KEY `IDX_5B8B86783DAE168B` (`list_id`);

--
-- Index pour la table `media__gallery`
--
ALTER TABLE `media__gallery`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_80D4C5414E7AF8F` (`gallery_id`),
  ADD KEY `IDX_80D4C541EA9FDD75` (`media_id`);

--
-- Index pour la table `media__media`
--
ALTER TABLE `media__media`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `acl_classes`
--
ALTER TABLE `acl_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `acl_entries`
--
ALTER TABLE `acl_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `app_content`
--
ALTER TABLE `app_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `app_menu`
--
ALTER TABLE `app_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `app_menu_page`
--
ALTER TABLE `app_menu_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `app_page`
--
ALTER TABLE `app_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `app_page_content`
--
ALTER TABLE `app_page_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `fos_user_group`
--
ALTER TABLE `fos_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `fos_user_user`
--
ALTER TABLE `fos_user_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `f_field`
--
ALTER TABLE `f_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `f_fieldtype`
--
ALTER TABLE `f_fieldtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `f_form`
--
ALTER TABLE `f_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `f_formfield`
--
ALTER TABLE `f_formfield`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `f_formfieldrights`
--
ALTER TABLE `f_formfieldrights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `geom`
--
ALTER TABLE `geom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `g_list`
--
ALTER TABLE `g_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `g_listitem`
--
ALTER TABLE `g_listitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `media__gallery`
--
ALTER TABLE `media__gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `media__media`
--
ALTER TABLE `media__media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`);

--
-- Contraintes pour la table `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `app_contents_rights`
--
ALTER TABLE `app_contents_rights`
  ADD CONSTRAINT `FK_D358BDA384A0A3ED` FOREIGN KEY (`content_id`) REFERENCES `app_content` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D358BDA3FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `app_menu_page`
--
ALTER TABLE `app_menu_page`
  ADD CONSTRAINT `FK_742A195BC4663E4` FOREIGN KEY (`page_id`) REFERENCES `app_page` (`id`),
  ADD CONSTRAINT `FK_742A195BCCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `app_menu` (`id`);

--
-- Contraintes pour la table `app_pages_rights`
--
ALTER TABLE `app_pages_rights`
  ADD CONSTRAINT `FK_6E64B08DC4663E4` FOREIGN KEY (`page_id`) REFERENCES `app_page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6E64B08DFE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `app_page_content`
--
ALTER TABLE `app_page_content`
  ADD CONSTRAINT `FK_C62BC1BD84A0A3ED` FOREIGN KEY (`content_id`) REFERENCES `app_content` (`id`),
  ADD CONSTRAINT `FK_C62BC1BDC4663E4` FOREIGN KEY (`page_id`) REFERENCES `app_page` (`id`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E66B038C595` FOREIGN KEY (`li_types_articles`) REFERENCES `g_listitem` (`id`),
  ADD CONSTRAINT `FK_23A0E66C99C3BF9` FOREIGN KEY (`resource_rights`) REFERENCES `fos_user_group` (`id`),
  ADD CONSTRAINT `FK_23A0E66CF60E67C` FOREIGN KEY (`owner`) REFERENCES `fos_user_user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C23A0E66` FOREIGN KEY (`article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_9474526CCF60E67C` FOREIGN KEY (`owner`) REFERENCES `fos_user_user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `f_field`
--
ALTER TABLE `f_field`
  ADD CONSTRAINT `FK_1505AEC6163BE712` FOREIGN KEY (`fieldtype_id`) REFERENCES `f_fieldtype` (`id`);

--
-- Contraintes pour la table `f_formfield`
--
ALTER TABLE `f_formfield`
  ADD CONSTRAINT `FK_EF0115A8443707B0` FOREIGN KEY (`field_id`) REFERENCES `f_field` (`id`),
  ADD CONSTRAINT `FK_EF0115A85FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `f_form` (`id`);

--
-- Contraintes pour la table `f_formfieldrights`
--
ALTER TABLE `f_formfieldrights`
  ADD CONSTRAINT `FK_462DAA8A11386F6` FOREIGN KEY (`formfield_id`) REFERENCES `f_formfield` (`id`),
  ADD CONSTRAINT `FK_462DAA8AFE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`);

--
-- Contraintes pour la table `g_listitem`
--
ALTER TABLE `g_listitem`
  ADD CONSTRAINT `FK_5B8B86783DAE168B` FOREIGN KEY (`list_id`) REFERENCES `g_list` (`id`),
  ADD CONSTRAINT `FK_5B8B8678727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `g_listitem` (`id`);

--
-- Contraintes pour la table `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
