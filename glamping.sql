-- Adminer 4.8.1 MySQL 5.5.5-10.4.19-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `c_id` int(2) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `category` (`c_id`, `title`) VALUES
(1,	'風景'),
(2,	'美食'),
(3,	'奢華露營'),
(4,	'超值露營'),
(5,	'風格露營'),
(6,	'深度露營'),
(7,	'限定露營'),
(8,	'照明用具'),
(10,	'周邊'),
(11,	'生活用品'),
(12,	'戶外體驗'),
(14,	'戶外家具'),
(15,	'戶外野炊'),
(16,	'戶外裝飾'),
(17,	'收納用品 '),
(18,	'露營包'),
(19,	'登山鞋'),
(20,	'登山服 '),
(22,	'帳篷'),
(23,	'動態活動'),
(24,	'靜態活動');

DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `d_id` int(6) NOT NULL AUTO_INCREMENT,
  `u_id` int(6) NOT NULL,
  `i_id` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_by` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_id` int(6) DEFAULT NULL,
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `article` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `score` tinyint(1) unsigned DEFAULT NULL,
  `likes` int(4) unsigned DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`d_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `discuss_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `discuss` (`d_id`, `u_id`, `i_id`, `use_by`, `external_id`, `title`, `article`, `score`, `likes`, `created`, `updated`) VALUES
(1,	1,	'24',	NULL,	NULL,	'領隊很熱心',	'超級推薦，領隊很熱心，一直幫忙拍美照，還很藍很美',	5,	NULL,	'2021-08-03 13:49:54',	'2021-08-03 13:49:54'),
(2,	1,	'24',	NULL,	NULL,	'非常漂亮',	'這次去的是日落團,下午太陽有點大,下次想選日出團試試看,教練人很nice,裝備也都很齊全,很推薦',	3,	NULL,	'2021-08-03 13:59:03',	'2021-08-03 13:59:03'),
(3,	2,	'24',	NULL,	NULL,	'sup 日落',	'每一位教練都很親切，照片也拍的非常專業！',	4,	NULL,	'2021-08-03 13:59:03',	'2021-08-03 13:59:03'),
(4,	2,	'24',	NULL,	NULL,	'日落團非常值得參加！！',	'我們參加日落團，聽說日出有滿天星斗超級美，下次想再來，教練很專業隨時注意浪況以及學員狀況，並幫忙拍下很多值得留念的照片，推薦大家一定要參加。',	5,	NULL,	'2021-08-03 14:02:25',	'2021-08-03 14:02:25'),
(5,	1,	'24',	NULL,	NULL,	'相當不錯的體驗',	'教練非常的熱情 因為朋友想潛水 教練也願意配合我們彈性調整 照片也拍的相當多張 雖當天天候不佳 沒辦法看到很美的日落 也不會覺得可惜 讚讚讚',	4,	NULL,	'2021-08-03 14:02:25',	'2021-08-03 14:02:25'),
(6,	1,	'24',	NULL,	NULL,	'超棒的初體驗！！',	'講解很仔細，教練時間安排的很充實，照片很棒教練還會專業指導網美式擺位，隨旁有多個教練也會注意大家的安全，即使不小心被浪拍上岸教練也會馬上追上把你拉回來，結束時還有小點心跟飲品補充體力，跟精美小禮物，真的很貼心！明年夏天還想再去玩！',	4,	NULL,	'2021-08-03 14:02:25',	'2021-08-03 14:02:25'),
(7,	1,	'24',	NULL,	NULL,	'好玩',	'第一次玩很好玩 與家人美好的回憶 超棒的',	4,	NULL,	'2021-08-03 14:02:25',	'2021-08-03 14:02:25'),
(8,	2,	'24',	NULL,	NULL,	'太有趣的體驗了，好玩～',	'教練很有耐心教導動作，隨時注意我們的安全狀況，當天的天氣很好，微風吹的好舒服，真的是非常好的體驗，太好玩啦～推薦大家去體驗看看SUP!',	4,	NULL,	'2021-08-03 14:02:25',	'2021-08-03 14:02:25'),
(9,	2,	NULL,	'o',	1,	'很棒的露營地!!!',	'帳篷整潔又寬敞，營主準備的食材很豐富，炊具、調味料也一應俱全，真的可以輕鬆入住！廁所及衛浴空間乾淨，讓人安心使用！還提供燈條、裝飾品，可以把帳篷裝飾成自己想要的樣子，最特別的是還有空拍服務，真的是很用心的營主！',	4,	NULL,	'2021-08-03 14:03:34',	'2021-08-07 04:45:46'),
(10,	2,	NULL,	'o',	55,	'超好玩',	'下次還想來!',	4,	NULL,	'2021-08-08 19:40:44',	'2021-08-09 14:26:26');

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery` (
  `g_id` int(6) NOT NULL AUTO_INCREMENT,
  `u_id` int(6) NOT NULL,
  `i_id` int(6) NOT NULL,
  `src` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `seq` tinyint(2) unsigned NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`g_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `gallery` (`g_id`, `u_id`, `i_id`, `src`, `title`, `alt`, `seq`, `created`) VALUES
(1,	0,	25,	'015.jpg',	'',	'',	0,	'2021-08-04 12:45:40'),
(2,	0,	26,	'013.jpg',	'',	'',	0,	'2021-08-04 12:45:40'),
(4,	0,	27,	'001.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(5,	0,	28,	'008.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(6,	0,	29,	'017.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(7,	0,	30,	'012.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(8,	0,	31,	'006.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(9,	0,	32,	'014.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(10,	0,	33,	'002.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(11,	0,	34,	'007.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(12,	0,	35,	'018.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(13,	0,	36,	'003.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(14,	0,	37,	'005.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(15,	0,	38,	'009.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(16,	0,	39,	'011.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(17,	0,	24,	'016.jpg',	'',	'',	0,	'2021-08-04 12:57:04'),
(18,	0,	24,	'010.jpg',	'',	'',	1,	'2021-08-04 12:57:04'),
(19,	0,	24,	'004.jpg',	'',	'',	2,	'2021-08-04 12:57:04'),
(27,	0,	32,	'014.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(28,	0,	33,	'002.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(29,	0,	34,	'007.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(30,	0,	35,	'018.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(31,	0,	36,	'003.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(32,	0,	37,	'005.jpg',	'',	'',	0,	'2021-08-04 12:53:32'),
(33,	0,	38,	'009.jpg',	'',	'',	0,	'2021-08-04 12:53:32');

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `i_id` int(6) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `article` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(5) unsigned NOT NULL,
  `created` date NOT NULL,
  `updated` datetime NOT NULL,
  `expired` date DEFAULT NULL,
  `able` tinyint(1) NOT NULL,
  `clicks` int(5) unsigned NOT NULL,
  `sales` int(5) unsigned NOT NULL,
  `stock` int(5) unsigned DEFAULT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `deg_1` tinyint(1) unsigned DEFAULT NULL,
  `deg_2` tinyint(1) unsigned DEFAULT NULL,
  `deg_3` tinyint(1) unsigned DEFAULT NULL,
  `img_src` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `items` (`i_id`, `s_id`, `title`, `subtitle`, `article`, `price`, `created`, `updated`, `expired`, `able`, `clicks`, `sales`, `stock`, `level`, `deg_1`, `deg_2`, `deg_3`, `img_src`, `time`) VALUES
(1,	0,	'手提露營燈',	'攜帶光源',	'氣氛、方便、光源，讓自己成為暗夜裡的行動螢火蟲。',	288,	'2021-04-30',	'2021-04-30 09:02:06',	NULL,	1,	136,	8,	21,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	0,	'太陽能露營燈',	'永續能源愛地球',	'外型現代風格獨特，使用太陽能當作能量來源，就算夜晚中沒電，只要有太陽光照射，即可立即充電。',	530,	'2021-04-30',	'2021-04-30 15:11:04',	NULL,	1,	369,	1,	9,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	0,	'變焦頭燈',	'照明新選擇',	'多段式光度調整，不卡頭髮不限頭型，露營冒險第一推薦。',	365,	'2021-04-30',	'2021-04-30 15:11:26',	NULL,	1,	89,	6,	12,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	0,	'防水登山鞋',	'足部保護裝備',	'輕便好穿，水陸兩用。',	450,	'2021-04-30',	'2021-04-30 15:25:36',	NULL,	1,	56,	2,	13,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	0,	'高筒登山鞋',	'腳都包起來',	'腳部最佳保護，高筒要多高有多高，腿短買家要小心穿起來像褲子。',	400,	'2021-04-30',	'2021-04-30 15:33:36',	NULL,	1,	133,	3,	5,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	0,	'網狀吊床',	'懸吊式睡眠',	'體驗懸空，樹與樹之間的橋樑，睡一場樹樹覺。',	180,	'2021-04-30',	'2021-04-30 15:38:17',	NULL,	1,	201,	6,	3,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	0,	'攜帶摺疊椅',	'戶外座椅',	'不再受限制，我想坐就坐。',	320,	'2021-04-30',	'2021-04-30 15:36:39',	NULL,	1,	239,	6,	12,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	1,	'蒙古包',	'硬漢選擇',	'蒙古包是蒙古族牧民居住的一種房子，適于牧業生產和遊牧生活，採用並改良至我們營區，內帳挑高大空間設計讓您睡得更舒適，堅固的骨架不會因風大使內外帳相黏，提升採光與通風效果、完美遮風擋雨。',	6800,	'2021-04-30',	'2021-04-30 10:01:49',	NULL,	9,	0,	0,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	1,	'標準帳',	'經典選擇',	'採用unrv是台灣的在地露營品牌，1993年以露營車販售起家，之後推出這款「金牌帳篷」成為他們家的經典帳篷，也開始販售其他露營相關裝備，目前已經是台灣常見的帳篷品牌之一。\r\n金牌帳篷相當好搭設，而且空間寬敞、用料實在，可容納4~5\r\n人，帳棚內不必彎腰。',	5400,	'2021-04-30',	'2021-04-30 10:01:49',	NULL,	9,	0,	0,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	0,	'戰術後背包',	'迷彩包',	'真的超大容量嗎，你在裝阿!',	1350,	'2021-04-30',	'2021-04-30 17:09:33',	NULL,	1,	239,	2,	6,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(11,	0,	'荔枝燃木',	'火燒的集木',	'荔枝是籽比較小的，龍眼是籽比較大的。',	850,	'2021-04-30',	'2021-04-30 16:12:37',	NULL,	1,	53,	0,	3,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(12,	1,	'露營車',	'車車',	'來自美國的Airstream，於1931年創立，悠久的歷史及精湛的工藝，讓他被稱做是露營拖車界的勞斯萊斯，裡頭有完備的居家設備，包括電力、瓦斯、水力設備，皆能自主選擇。',	12000,	'2021-04-30',	'2021-05-03 11:52:59',	NULL,	9,	0,	0,	NULL,	2,	NULL,	NULL,	NULL,	NULL,	NULL),
(13,	1,	'印地安帳篷',	'硬啦',	'Nordisk始於1901年，來自北歐丹麥。設計、剪裁簡單，創新。帳篷的命名都取自希臘神話，帳型優美取名浪漫，加上製品主要採用科技材質，適合喜愛高級質感生活的族群。',	7500,	'2021-04-30',	'2021-05-03 11:52:59',	NULL,	9,	0,	0,	NULL,	2,	NULL,	NULL,	NULL,	NULL,	NULL),
(14,	2,	'自助餐',	'自助',	'沒有固定制式菜單，而是依季節或時令供供不同餐點，晚餐內容，主菜有：馬爾地夫烤龍蝦、胡麻味增豬肋條、海膽燒干貝、百草春雞，另外還提供兩種湯品、兩種義大利麵、炒時蔬、野菜沙拉、莫凡彼冰淇淋等。',	2500,	'2021-05-18',	'2021-05-03 11:56:33',	NULL,	9,	0,	0,	NULL,	2,	NULL,	NULL,	NULL,	NULL,	NULL),
(15,	2,	'烤肉',	'烤',	'附有爐蓋的烤肉架的美式燒烤，除了燒烤，還可以當作烤箱使用，蓋上爐蓋悶燒、煙燻食物，甚至是烤披薩，讓您即使在戶外也能運用多種烹調方式，享受烤肉所帶來的樂趣。\r\n烤肉食材是海陸雙拼，依照露營人數供給烤肉食材，主要是梅花豬\r\n肉片、板腱牛燒肉片、鯛魚下巴、活凍棒棒蝦、野生活凍小卷、蔬\r\n菜、吐司及飲料。',	1000,	'2021-05-05',	'2021-05-03 11:56:33',	NULL,	9,	0,	0,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(16,	2,	'炕窯',	'控',	'由園區準備食材，包含特色土窯雞一隻、神秘藥膳一份、特色菇菇包一份、超美味香腸、新鮮雞蛋，甘甜香濃美味地瓜，可親子體驗傳統的烹飪方式。',	850,	'2021-05-04',	'2021-05-03 11:58:04',	NULL,	9,	0,	0,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	3,	'露營燈',	'營',	'來自日本的GENTOS向來是很受當地消費者歡迎的燈具品牌，除了外型好看，更讓人推崇的就是他們對功能的講究。主打暖調的黃光，將LED元件拉長，做出像復古鎢絲燈泡的光源，而且也具備調光功能，可以無段式調整亮度，另外也可模擬蠟燭火焰般，光影搖晃的燈光效果。',	450,	'2021-05-03',	'2021-05-03 11:59:11',	NULL,	9,	0,	0,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(18,	3,	'安全營火',	'營',	'有專業人員生營火，火越大，心越慢，讓露營者可以更體驗露營的氛圍，但營火的注意及滅火須由露營者完成，為了讓營火更容易控制與熄滅，會限制營火的範圍，火焰的高度與直徑都不要超過一公尺，這也更便於烹煮食物貨煮水。',	150,	'2021-05-03',	'2021-05-03 11:59:11',	NULL,	9,	0,	0,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(19,	3,	'露天電影',	'路顛',	'將電影院搬上營區提供木質躺椅、專門的無線耳機和啤酒等，希望「用最有趣且獨特的方式放電影，我們讓看電影這件小事，變得很不一樣。」讓觀影者達到最舒適的享受廣受觀影，坐擁大自然的美景還能一邊欣賞電影，絕對是難得的體驗。',	1250,	'2021-05-05',	'2021-05-03 12:01:26',	NULL,	9,	0,	0,	NULL,	2,	NULL,	NULL,	NULL,	NULL,	NULL),
(24,	4,	'浪漫日落SUP立槳',	'夕陽西沉，艷紅的陽光揮灑海面',	'<ul class=\"p-0 event-description-content\">\n  <li class=\"h3 description-subtitle\">－ 行程資訊 －</li>\n  <li>適用對象: 15 - 60 歲旅客皆可體驗, 但不適合孕婦,心血管疾病患者參與</li>\n  <li>體驗時間: 14:00（請提早 10 分鐘抵達現場）</li>\n  <li>集合地點: 海邊露營區</li>\n  <li>行程時間: 約 3 小時</li>\n</ul>\n<ul class=\"p-0 event-description-content\">\n  <li class=\"h3 description-subtitle\">－ 行程介紹 －</li>\n  <li>浪漫日落團</li>\n  <li>中午過後易有雲霧集散, 出海時會涼快一點,能在日落銀輝下拍照將是此行最大收穫,且能欣賞海岸綿延不絕的壯麗風景</li>\n</ul>\n<ul class=\"p-0 event-description-content\">\n  <li class=\"h3 description-subtitle\">－ 購買須知 －</li>\n  <li>有高血壓, 心臟病, 氣喘的旅客請依身體狀況報名</li>\n  <li>有開刀及其他傷病無法進行激烈運動者請勿報名</li>\n  <li>請自己保管攜帶物品</li>\n  <li>因天氣變化, 無法保證一定可觀賞日落</li>\n</ul>\n <ul class=\"p-0 event-description-content\">\n   <li class=\"h3 description-subtitle\">－ 費用涵蓋項目 －</li>\n   <li>保險</li>\n   <li>5L防潑水袋</li>\n   <li>照片電子檔</li>\n   <li>教練指導</li>\n   <li>全 SUP 裝備</li>\n</ul>\n<ul class=\"p-0 event-description-content\" id=\"canclePolicy\">\n  <li class=\"h3 description-subtitle\">－ 取消政策 －</li>\n  <li>預定日期 7 天前取消: 全額退費</li>\n  <li>預定日期 0 - 6 天前取消: 恕不退費</li>\n  <li class=\"cancel-warning\">需要 2 - 5 個工作日進行取消流程,並依照購買商品之取消政策於 14 個工作日內退款</li>\n</ul>',	900,	'2021-07-05',	'2021-07-13 09:53:46',	NULL,	1,	200,	145,	NULL,	1,	3,	6,	8,	'016.jpg',	'15:00'),
(25,	4,	'晨間日出SUP立槳',	'感受晨曦破曉帶來的感動',	'<ul class=\\\"p-0 event-description-content\\\">  \r\n<li class=\\\"h3 description-subtitle\\\">－ 行程資訊 －</li>\r\n  <li>適用對象: 15 - 60 歲旅客皆可體驗, 但不適合孕婦,心血管疾病患者參與</li>\r\n<li>體驗時間: 05:00（請提早 10 分鐘抵達現場）</li>\r\n  <li>集合地點: 海邊露營區</li>\r\n  <li>行程時間: 約 3 小時</li>\r\n</ul>\r\n<ul class=\\\"p-0 event-description-content\\\">\r\n  <li class=\\\"h3 description-subtitle\\\">－ 行程介紹 －</li>\r\n  <li>破曉日出團</li>\r\n  <li>享受在SUP站板上海中的波浪，在運動的過程中不僅能放鬆身心也能欣賞海光山色。</li>\r\n</ul>\r\n<ul class=\\\"p-0 event-description-content\\\">\r\n  <li class=\\\"h3 description-subtitle\\\">－ 購買須知 －</li>\r\n  <li>有高血壓, 心臟病, 氣喘的旅客請依身體狀況報名</li>\r\n  <li>有開刀及其他傷病無法進行激烈運動者請勿報名</li>\r\n  <li>請自己保管攜帶物品</li>\r\n  <li>因天氣變化, 無法保證一定可觀賞日落</li>\r\n</ul> <ul class=\\\"p-0 event-description-content\\\">\r\n   <li class=\\\"h3 description-subtitle\\\">－ 費用涵蓋項目 －</li>\r\n   <li>保險</li>\r\n   <li>5L防潑水袋</li>\r\n   <li>照片電子檔</li>\r\n   <li>教練指導</li>\r\n   <li>全 SUP 裝備</li>\r\n</ul>\r\n<ul class=\\\"p-0 event-description-content\\\" id=\\\"canclePolicy\\\">\r\n  <li class=\\\"h3 description-subtitle\\\">－ 取消政策 －</li>\r\n  <li>預定日期 7 天前取消: 全額退費</li>\r\n  <li>預定日期 0 - 6 天前取消: 恕不退費</li>\r\n  <li class=\\\"cancel-warning\\\">需要 2 - 5 個工作日進行取消流程,並依照購買商品之取消政策於 14 個工作日內退款</li>\r\n</ul>',	900,	'2021-07-07',	'2021-07-13 09:55:36',	NULL,	1,	500,	20,	NULL,	1,	3,	6,	8,	'015.jpg',	'5:00'),
(26,	4,	'一對一潛水體驗',	'潛水體驗subtitle',	'潛水體驗article',	500,	'2021-07-07',	'2021-07-13 09:55:36',	NULL,	1,	600,	100,	NULL,	1,	4,	4,	6,	'013.jpg',	'15:00'),
(27,	4,	'珊瑚海秘境浮潛',	'浮潛subtitle',	'浮潛article',	1000,	'2021-07-07',	'2021-07-13 09:57:42',	NULL,	1,	123,	15,	NULL,	1,	5,	8,	6,	'001.jpg',	'15:00'),
(28,	4,	'吉普車越野',	'越野subtitle	',	'越野article',	500,	'2021-07-07',	'2021-07-13 09:57:42',	NULL,	1,	58,	26,	NULL,	2,	5,	4,	4,	'008.jpg',	'15:00'),
(29,	4,	'森林秘境探險',	'探險subtitle',	'探險article',	450,	'2021-07-07',	'2021-07-13 09:59:43',	NULL,	1,	268,	13,	NULL,	2,	4,	3,	7,	'017.jpg',	'15:00'),
(30,	4,	'少女的眼淚 - 登山體驗',	'登山體驗subtitle	',	'登山體驗article	',	1500,	'2021-07-13',	'2021-07-13 09:59:43',	NULL,	1,	555,	92,	NULL,	3,	2,	9,	8,	'012.jpg',	'15:00'),
(31,	4,	'登山攻頂體驗',	'攻頂體驗subtitle',	'攻頂體驗article',	2000,	'2021-07-13',	'2021-07-13 10:14:51',	NULL,	1,	12,	2,	NULL,	3,	1,	10,	10,	'006.jpg',	'15:00'),
(32,	5,	'花藝療育DIY',	'療育DIY subtitle	',	'療育DIY article',	400,	'2021-07-01',	'2021-07-13 10:15:41',	NULL,	1,	542,	125,	NULL,	2,	9,	3,	6,	'014.jpg',	'15:00'),
(33,	5,	'森林冥想瑜珈',	'冥想瑜珈subtitle	',	'冥想瑜珈article',	300,	'2021-07-01',	'2021-07-13 10:15:41',	NULL,	1,	412,	128,	NULL,	2,	8,	2,	5,	'002.jpg',	'15:00'),
(34,	5,	'沙灘瑜珈體驗',	'沙灘瑜珈subtitle',	'沙灘瑜珈article	',	300,	'2021-07-02',	'2021-07-13 10:18:12',	NULL,	1,	269,	48,	NULL,	1,	7,	2,	1,	'007.jpg',	'15:00'),
(35,	5,	'夜間觀星體驗',	'觀星體驗subtitle',	'觀星體驗article',	200,	'2021-07-03',	'2021-07-13 10:18:12',	NULL,	1,	477,	93,	NULL,	2,	6,	1,	4,	'018.jpg',	'15:00'),
(36,	5,	'潮間帶生態導覽',	'生態導覽subtitle',	'生態導覽article	',	300,	'2021-07-13',	'2021-07-13 10:20:55',	NULL,	1,	789,	68,	NULL,	1,	6,	2,	3,	'003.jpg',	'15:00'),
(37,	5,	'野炊手作料理',	'手作料理subtitle	',	'手作料理article',	700,	'2021-07-13',	'2021-07-13 10:20:55',	NULL,	1,	230,	45,	NULL,	2,	7,	5,	2,	'005.jpg',	'15:00'),
(38,	5,	'芳療尋味之旅',	'尋味之旅subtitle	',	'尋味之旅article',	360,	'2021-07-13',	'2021-07-13 10:24:15',	NULL,	1,	522,	78,	NULL,	2,	10,	2,	2,	'009.jpg',	'15:00'),
(39,	5,	'洄瀾珍食自然療育',	'自然療育subtitle	',	'自然療育article',	999,	'2021-07-13',	'2021-07-13 10:24:15',	NULL,	1,	156,	5,	NULL,	3,	10,	7,	6,	'011.jpg',	'15:00'),
(40,	0,	'奢華露營',	'美照生產地',	'灌木環繞仙氣旺盛的地方，無光害的星空夜景以及拍照必備的極美帳篷',	0,	'2021-07-15',	'2021-07-15 14:17:59',	NULL,	0,	0,	0,	NULL,	2,	7,	6,	5,	'029.jpg',	NULL),
(41,	0,	'美式露營',	'原民風情',	'一泊兩食 | 早餐 + 晚餐，生態教學與手工體驗，純白的印地安帳篷',	0,	'2021-07-15',	'2021-07-15 14:17:59',	NULL,	0,	0,	0,	NULL,	2,	7,	7,	5,	'023.jpg',	NULL),
(42,	0,	'質感露營',	'聽海的聲音',	'最佳海景伴海聲入眠，海邊活動體驗，露營車含有冷氣加獨立衛浴\r\n',	0,	'2021-07-15',	'2021-07-15 14:17:59',	NULL,	0,	0,	0,	NULL,	1,	7,	7,	6,	'001.jpg',	NULL),
(43,	0,	'海岸露營',	'海景第一排',	'擁抱一望無際的海岸線，主廚嚴選優質美食饗宴，獨立衛浴&高級歐舒丹備品',	0,	'2021-07-15',	'2021-07-15 14:17:59',	NULL,	0,	0,	0,	NULL,	1,	8,	7,	4,	'030.jpg',	NULL),
(44,	0,	'懶人露營',	'夢幻露營車',	'美劇夢幻露營車即刻入住，手作DIY窯烤體驗，附贈飯店及豪華寢具',	0,	'2021-07-15',	'2021-07-15 14:26:33',	NULL,	0,	0,	0,	NULL,	2,	8,	7,	5,	'007.jpg',	NULL),
(45,	0,	'輕鬆露營',	'極簡主義',	'露營車附有小廚房可料理，享受自然不怕蚊蟲干擾，露營車含有冷氣加獨立衛浴',	0,	'2021-07-15',	'2021-07-15 14:26:33',	NULL,	0,	0,	0,	NULL,	2,	7,	6,	5,	'015.jpg',	NULL),
(46,	0,	'悠閒露營',	'享受自然',	'一泊兩食 | 早餐 + 晚餐，享受慢速生活步調，海邊活動體驗',	0,	'2021-07-15',	'2021-07-15 14:26:33',	NULL,	0,	0,	0,	NULL,	1,	6,	5,	6,	'004.jpg',	NULL),
(47,	0,	'療癒露營',	'浪漫花園',	'草地野餐下午茶，享受露天電影浪漫氛圍，拍照必備純白極美帳篷',	0,	'2021-07-15',	'2021-07-15 14:31:42',	NULL,	0,	0,	0,	NULL,	2,	6,	5,	7,	'002.jpg',	NULL),
(48,	0,	'登山野營',	'擁抱自然',	'登山新手亦可挑戰，免背公糧、帳篷、睡袋，清晨可以看雲海入夜又有星辰夜景',	0,	'2021-07-15',	'2021-07-15 14:31:42',	NULL,	0,	0,	0,	NULL,	3,	4,	5,	7,	'009.jpg',	NULL),
(49,	0,	'樂活露營',	'森林自然風',	'免背公糧、帳篷、睡袋，體驗生態教學與無光害星空夜景，滿滿自然芬多精',	0,	'2021-07-15',	'2021-07-15 14:31:42',	NULL,	0,	0,	0,	NULL,	3,	4,	5,	8,	'005.jpg',	NULL),
(50,	0,	'山中野營',	'風光旖旎',	'登山新手亦可挑戰，專人代理入山許可，紮營、野炊、山野浮誇料理',	0,	'2021-07-15',	'2021-07-15 14:31:42',	NULL,	0,	0,	0,	NULL,	3,	3,	5,	8,	'011.jpg',	NULL),
(51,	0,	'深度野營',	'山巒連綿',	'需有露營經驗才可報名，專人代理入山許可，紮營、野炊、山野浮誇料理',	0,	'2021-07-15',	'2021-07-15 14:35:52',	NULL,	0,	0,	0,	NULL,	3,	3,	5,	9,	'014.jpg',	NULL),
(52,	0,	'姊妹淘露營',	'仙女群聚',	'限女生的露營，享受只屬於姊妹淘的露營，期間限定9/2~9/16',	0,	'2021-07-15',	'2021-07-15 14:36:54',	NULL,	0,	0,	0,	NULL,	2,	6,	5,	6,	'033.jpg',	NULL),
(53,	0,	'夏季限定',	'水上活動',	'一泊三食 | 早餐 +  午餐 +晚餐，體驗SUP、衝浪或潛水，期間限定 7/1~9/30',	0,	'2021-07-15',	'2021-07-15 14:36:54',	NULL,	0,	0,	0,	NULL,	1,	5,	6,	5,	'035.jpg',	NULL),
(54,	0,	'秋季限定',	'滿山楓紅',	'最新活動搶先開跑預購，食慾之秋特色秋季料理，期間限定 10/25~12/31',	0,	'2021-07-15',	'2021-07-15 14:36:54',	NULL,	0,	0,	0,	NULL,	2,	6,	7,	6,	'036.jpg',	NULL),
(55,	0,	'絕美婚紗',	'婚紗攝影',	'山景海景皆可拍，拍攝婚紗以小時計費，如有婚宴場地需求可另洽談9/2~9/16',	0,	'2021-07-15',	'2021-07-15 14:36:54',	NULL,	0,	0,	0,	NULL,	2,	7,	8,	3,	'034.jpg',	NULL),
(56,	0,	'海邊區',	'海',	'全台唯一最近距離海景露營區，擁抱一望無際的海岸線，海邊戲水、探索生態、觀看日落、享用美食 ......，熱愛大海的人等著您來體驗！',	0,	'0000-00-00',	'2021-07-19 17:35:43',	NULL,	0,	0,	0,	NULL,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(57,	0,	'草原區',	'',	'海拔 150 公尺，面積 4,500 坪，四周有山嵐環繞，四季皆有不同的景致可欣賞，其中，又以秋季的楓紅最為迷人。\r\n營區地勢平坦，適合奔跑、野餐、進行各式活動，且處處皆有大自然的造景藝術，適合全家大家小一同遊玩。',	0,	'0000-00-00',	'2021-07-19 17:35:43',	NULL,	0,	0,	0,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL),
(58,	0,	'山頂區',	'',	'海拔約在1200公尺上，最大特色是超寬闊且無死角的景致，天氣晴朗時，可以遠眺到雲海，夜晚更可欣賞滿天星空，絕對稱得是上百萬景觀。',	0,	'0000-00-00',	'2021-07-19 17:35:43',	NULL,	0,	0,	0,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `items_cat`;
CREATE TABLE `items_cat` (
  `ic_id` int(6) NOT NULL AUTO_INCREMENT,
  `i_id` int(6) DEFAULT NULL,
  `c_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`ic_id`),
  UNIQUE KEY `i_id` (`i_id`,`c_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `items_cat_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `category` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_cat_ibfk_2` FOREIGN KEY (`i_id`) REFERENCES `items` (`i_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `items_cat` (`ic_id`, `i_id`, `c_id`) VALUES
(1,	24,	23),
(2,	25,	23),
(3,	26,	23),
(4,	27,	23),
(5,	28,	23),
(6,	29,	23),
(7,	30,	23),
(8,	31,	23),
(9,	32,	24),
(10,	33,	24),
(11,	34,	24),
(12,	35,	24),
(13,	36,	24),
(14,	37,	24),
(15,	38,	24),
(16,	39,	24),
(17,	40,	3),
(18,	41,	3),
(19,	42,	3),
(20,	43,	3),
(21,	44,	4),
(22,	45,	4),
(23,	46,	4),
(24,	47,	4),
(25,	48,	6),
(26,	49,	6),
(27,	50,	6),
(28,	51,	6),
(29,	52,	7),
(30,	53,	7),
(31,	54,	7),
(32,	55,	7);

DROP TABLE IF EXISTS `ordered`;
CREATE TABLE `ordered` (
  `o_id` int(6) NOT NULL AUTO_INCREMENT,
  `u_id` int(6) DEFAULT NULL,
  `i_id` int(6) DEFAULT NULL,
  `total` int(5) unsigned NOT NULL,
  `level` int(6) DEFAULT NULL,
  `person` int(2) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `prime` tinyint(1) unsigned NOT NULL,
  `s_id` tinyint(2) unsigned DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `img_src` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `u_id` (`u_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `ordered_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ordered` (`o_id`, `u_id`, `i_id`, `total`, `level`, `person`, `start`, `end`, `prime`, `s_id`, `title`, `message`, `created`, `img_src`) VALUES
(6,	2,	29,	0,	2,	0,	'0000-00-00',	NULL,	4,	98,	'森林秘境探險',	'',	'2021-08-05 00:18:26',	NULL),
(7,	2,	30,	0,	3,	0,	'0000-00-00',	NULL,	4,	98,	'少女的眼淚 - 登山體驗',	'',	'2021-08-05 00:18:58',	NULL),
(8,	2,	25,	0,	1,	0,	'0000-00-00',	NULL,	4,	98,	'晨間日出SUP立槳',	'',	'2021-08-05 00:19:13',	'015.jpg'),
(9,	2,	24,	0,	1,	0,	'0000-00-00',	NULL,	4,	98,	'浪漫日落SUP立槳',	'',	'2021-08-05 00:19:58',	'016.jpg'),
(10,	2,	24,	0,	1,	0,	'0000-00-00',	NULL,	4,	98,	'浪漫日落SUP立槳',	'',	'2021-08-05 00:20:10',	'016.jpg'),
(11,	2,	24,	0,	1,	0,	'0000-00-00',	NULL,	4,	98,	'浪漫日落SUP立槳',	'',	'2021-08-05 00:22:18',	'016.jpg'),
(12,	2,	31,	0,	3,	0,	'0000-00-00',	NULL,	4,	98,	'登山攻頂體驗',	'',	'2021-08-05 11:31:20',	NULL),
(13,	2,	30,	0,	3,	0,	'0000-00-00',	NULL,	4,	98,	'少女的眼淚 - 登山體驗',	'',	'2021-08-05 11:33:28',	NULL),
(14,	NULL,	24,	0,	1,	0,	'0000-00-00',	NULL,	4,	98,	'浪漫日落SUP立槳',	'',	'2021-08-05 12:33:15',	'016.jpg'),
(15,	NULL,	26,	0,	1,	0,	'0000-00-00',	NULL,	4,	98,	'一對一潛水體驗',	'',	'2021-08-05 15:25:54',	NULL),
(28,	NULL,	40,	4000,	2,	36,	'0000-00-00',	NULL,	7,	NULL,	'奢華露營',	'',	'2021-08-05 16:57:30',	NULL),
(29,	NULL,	41,	4500,	2,	36,	NULL,	NULL,	7,	NULL,	'奢華露營',	'',	'2021-08-05 16:57:30',	NULL),
(30,	NULL,	42,	5000,	1,	3,	NULL,	NULL,	7,	NULL,	'奢華露營',	'',	'2021-08-05 16:57:30',	NULL),
(31,	NULL,	43,	5400,	1,	1,	NULL,	NULL,	7,	NULL,	'奢華露營',	'',	'2021-08-05 16:57:30',	NULL),
(32,	NULL,	44,	5500,	2,	37,	NULL,	NULL,	7,	NULL,	'超值露營',	'',	'2021-08-05 16:57:30',	NULL),
(33,	NULL,	45,	5000,	2,	3,	NULL,	NULL,	7,	NULL,	'超值露營',	'',	'2021-08-05 16:57:30',	NULL),
(34,	NULL,	46,	4800,	1,	1,	NULL,	NULL,	7,	NULL,	'超值露營',	'',	'2021-08-05 16:57:30',	NULL),
(35,	NULL,	47,	6000,	2,	2,	NULL,	NULL,	7,	NULL,	'超值露營',	'',	'2021-08-05 16:57:30',	NULL),
(36,	NULL,	48,	5000,	3,	1,	NULL,	NULL,	7,	NULL,	'深度露營',	'',	'2021-08-05 16:57:30',	NULL),
(37,	NULL,	49,	4200,	3,	2,	NULL,	NULL,	7,	NULL,	'深度露營',	'',	'2021-08-05 16:57:30',	NULL),
(38,	NULL,	50,	4000,	3,	2,	NULL,	NULL,	7,	NULL,	'深度露營',	'',	'2021-08-05 16:57:30',	NULL),
(39,	NULL,	51,	3800,	3,	1,	NULL,	NULL,	7,	NULL,	'深度露營',	'',	'0000-00-00 00:00:00',	NULL),
(40,	NULL,	52,	4800,	2,	3,	NULL,	NULL,	7,	NULL,	'限定露營',	'',	'2021-08-05 17:07:58',	NULL),
(41,	NULL,	53,	5600,	1,	2,	NULL,	NULL,	7,	NULL,	'限定露營',	'',	'2021-08-05 17:07:58',	NULL),
(42,	NULL,	54,	5600,	2,	1,	NULL,	NULL,	7,	NULL,	'限定露營',	NULL,	'2021-08-05 17:07:58',	NULL),
(43,	NULL,	55,	7800,	2,	2,	NULL,	NULL,	7,	NULL,	'限定露營',	NULL,	'2021-08-05 17:07:58',	NULL),
(45,	2,	24,	900,	1,	1,	'2021-08-05',	NULL,	4,	98,	'浪漫日落SUP立槳',	'',	'2021-08-05 22:08:06',	'016.jpg'),
(48,	2,	NULL,	7950,	57,	1,	'2021-08-06',	'2021-08-07',	3,	99,	'草原區 | 蒙古包 | 烤肉 | 安全營火',	'',	'2021-08-05 23:07:58',	NULL),
(50,	2,	24,	900,	1,	1,	'2021-08-06',	NULL,	4,	98,	'浪漫日落SUP立槳',	'',	'2021-08-06 10:30:57',	'016.jpg'),
(55,	2,	24,	900,	1,	1,	'2021-08-08',	NULL,	4,	20,	'浪漫日落SUP立槳',	'',	'2021-08-07 04:40:25',	'016.jpg'),
(58,	NULL,	24,	900,	1,	1,	'2021-08-07',	NULL,	4,	98,	'浪漫日落SUP立槳',	'',	'2021-08-07 13:32:54',	'016.jpg'),
(65,	2,	30,	1500,	3,	1,	'2021-08-09',	NULL,	4,	10,	'少女的眼淚 - 登山體驗',	'',	'2021-08-09 16:35:36',	'012.jpg'),
(66,	2,	39,	999,	3,	1,	'2021-08-09',	NULL,	4,	10,	'洄瀾珍食自然療育',	'',	'2021-08-09 16:41:24',	'011.jpg'),
(90,	2,	NULL,	15650,	57,	3,	'2021-08-11',	'2021-08-12',	3,	98,	'草原區 | 蒙古包 | 自助餐 | 露營燈',	'',	'2021-08-09 21:47:51',	NULL),
(93,	2,	NULL,	11250,	56,	1,	'2021-08-12',	'2021-08-12',	3,	98,	'海邊區 | 印地安帳篷 | 自助餐 | 露天電影',	'',	'2021-08-09 23:41:34',	NULL),
(94,	2,	24,	900,	1,	1,	'2021-08-09',	NULL,	4,	98,	'浪漫日落SUP立槳',	'',	'2021-08-09 23:41:53',	'016.jpg');

DROP TABLE IF EXISTS `ordered_detail`;
CREATE TABLE `ordered_detail` (
  `o_id` int(6) NOT NULL,
  `i_id` int(6) NOT NULL,
  `price` int(5) unsigned NOT NULL,
  `quantity` tinyint(2) unsigned NOT NULL,
  `ship_date` date DEFAULT NULL,
  UNIQUE KEY `o_id` (`o_id`,`i_id`,`ship_date`),
  KEY `i_id` (`i_id`),
  CONSTRAINT `ordered_detail_ibfk_1` FOREIGN KEY (`i_id`) REFERENCES `items` (`i_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordered_detail_ibfk_2` FOREIGN KEY (`o_id`) REFERENCES `ordered` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ordered_detail` (`o_id`, `i_id`, `price`, `quantity`, `ship_date`) VALUES
(34,	8,	6800,	1,	NULL),
(34,	15,	1000,	1,	NULL),
(34,	18,	150,	1,	NULL),
(37,	9,	3000,	1,	NULL),
(37,	16,	850,	1,	NULL),
(37,	19,	1250,	1,	NULL),
(44,	8,	6800,	1,	'2021-08-10'),
(44,	18,	150,	3,	'2021-08-10'),
(44,	15,	1000,	3,	'2021-08-10'),
(45,	9,	5400,	1,	'2021-08-11'),
(45,	14,	2500,	3,	'2021-08-11'),
(45,	19,	1250,	3,	'2021-08-11'),
(46,	8,	6800,	1,	'2021-08-10'),
(46,	15,	1000,	3,	'2021-08-10'),
(46,	18,	150,	3,	'2021-08-10'),
(47,	13,	7500,	1,	'2021-08-10'),
(47,	16,	850,	2,	'2021-08-10'),
(47,	19,	1250,	2,	'2021-08-10'),
(48,	13,	7500,	0,	'2021-08-10'),
(48,	15,	1000,	1,	'2021-08-10'),
(48,	19,	1250,	1,	'2021-08-10'),
(28,	8,	6800,	1,	NULL),
(28,	15,	1000,	1,	NULL),
(28,	18,	150,	1,	NULL),
(29,	8,	6800,	1,	NULL),
(29,	15,	1000,	1,	NULL),
(29,	18,	150,	1,	NULL),
(30,	8,	6800,	1,	NULL),
(30,	15,	1000,	1,	NULL),
(30,	18,	150,	1,	NULL),
(31,	8,	6800,	1,	NULL),
(31,	15,	1000,	1,	NULL),
(31,	18,	150,	1,	NULL),
(32,	8,	6800,	1,	NULL),
(32,	15,	1000,	1,	NULL),
(32,	18,	150,	1,	NULL),
(33,	8,	6800,	1,	NULL),
(33,	15,	1000,	1,	NULL),
(33,	18,	150,	1,	NULL),
(35,	8,	6800,	1,	NULL),
(35,	15,	1000,	1,	NULL),
(35,	18,	150,	1,	NULL),
(36,	8,	6800,	1,	NULL),
(36,	15,	1000,	1,	NULL),
(36,	18,	150,	1,	NULL),
(38,	8,	6800,	1,	NULL),
(38,	15,	1000,	1,	NULL),
(38,	18,	150,	1,	NULL),
(39,	8,	6800,	1,	NULL),
(39,	15,	1000,	1,	NULL),
(39,	18,	150,	1,	NULL),
(40,	8,	6800,	1,	NULL),
(40,	15,	1000,	1,	NULL),
(40,	18,	150,	1,	NULL),
(41,	8,	6800,	1,	NULL),
(41,	15,	1000,	1,	NULL),
(41,	18,	150,	1,	NULL),
(42,	8,	6800,	1,	NULL),
(42,	15,	1000,	1,	NULL),
(42,	18,	150,	1,	NULL),
(43,	8,	6800,	1,	NULL),
(43,	15,	1000,	1,	NULL),
(43,	18,	150,	1,	NULL),
(55,	24,	900,	1,	'2021-08-08'),
(58,	24,	900,	1,	'2021-08-07'),
(65,	30,	1500,	1,	'2021-08-09'),
(66,	39,	999,	1,	'2021-08-09'),
(90,	8,	6800,	1,	'2021-08-11'),
(90,	14,	2500,	3,	'2021-08-11'),
(90,	17,	450,	3,	'2021-08-11'),
(94,	24,	900,	1,	'2021-08-09');

DROP TABLE IF EXISTS `ordered_pay`;
CREATE TABLE `ordered_pay` (
  `o_id` int(6) NOT NULL,
  `method` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(6) unsigned NOT NULL,
  `created` datetime NOT NULL,
  KEY `o_id` (`o_id`),
  CONSTRAINT `ordered_pay_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `ordered` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `o_id` int(6) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `stay` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `occupy` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `rooms` (`id`, `o_id`, `level`, `stay`, `occupy`) VALUES
(1,	44,	57,	0,	'2021-08-13'),
(2,	48,	57,	1,	'2021-08-06'),
(3,	49,	56,	0,	'2021-08-07'),
(4,	54,	57,	0,	'2021-08-08'),
(5,	61,	56,	0,	'2021-08-09'),
(6,	67,	57,	0,	'2021-08-12'),
(7,	67,	56,	0,	'2021-08-11'),
(8,	68,	56,	0,	'2021-08-11'),
(9,	68,	56,	0,	'2021-08-11'),
(10,	69,	57,	1,	'2021-08-21'),
(11,	70,	57,	1,	'2021-08-21'),
(12,	71,	57,	0,	'2021-08-24'),
(13,	97,	56,	0,	'2021-08-11'),
(14,	97,	56,	1,	'2021-08-17'),
(15,	97,	56,	1,	'2021-08-17'),
(16,	97,	57,	1,	'2021-08-21'),
(17,	97,	57,	1,	'2021-08-21'),
(18,	97,	57,	1,	'2021-08-22'),
(19,	97,	57,	1,	'2021-08-22');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `u_id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `zip` int(6) DEFAULT NULL,
  `address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` int(5) DEFAULT 0,
  `role` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `visited` datetime NOT NULL DEFAULT current_timestamp(),
  `deg_1` int(2) unsigned DEFAULT NULL,
  `deg_2` int(2) unsigned DEFAULT NULL,
  `deg_3` int(2) unsigned DEFAULT NULL,
  `totp` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`u_id`, `username`, `password`, `first_name`, `last_name`, `email`, `tel`, `gender`, `birthday`, `zip`, `address`, `invoice`, `points`, `role`, `created`, `visited`, `deg_1`, `deg_2`, `deg_3`, `totp`) VALUES
(1,	'shipmaster',	'1234',	'孟竹',	'李',	'dara@test.com',	'0963251478',	2,	'1994-06-17',	111001,	'至善路二段221號',	'eGUI',	NULL,	1,	'2021-07-16 14:08:11',	'2021-07-16 14:08:11',	NULL,	NULL,	NULL,	NULL),
(2,	'crew',	'1234',	'美琳',	'林',	'crew@gmail.com',	'0987654321',	2,	'1976-12-07',	974042,	'山嶺18號',	'B2C',	320,	1,	'2021-07-16 14:08:11',	'2021-08-12 00:26:27',	1,	1,	5,	NULL),
(3,	'fang',	'1234',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	'2021-08-10 23:33:52',	'2021-08-10 23:33:52',	NULL,	NULL,	NULL,	'XOT2COWW3BAFRJP3F6RTSW3O22SMCX72'),
(4,	'',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	1,	'2021-08-10 23:45:10',	'2021-08-10 23:45:10',	NULL,	NULL,	NULL,	'2ZWQSMDKV3XO5JGU25UCSEWXEXRRNFSF');

DROP TABLE IF EXISTS `users_likes`;
CREATE TABLE `users_likes` (
  `u_id` int(6) NOT NULL,
  `able` tinyint(1) DEFAULT NULL,
  `i_id` int(6) NOT NULL,
  UNIQUE KEY `u_id_2` (`u_id`,`i_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `users_likes_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_likes` (`u_id`, `able`, `i_id`) VALUES
(2,	1,	24),
(2,	0,	25),
(2,	0,	26),
(2,	0,	27),
(2,	1,	28),
(2,	0,	29),
(2,	0,	30),
(2,	0,	31),
(2,	0,	32),
(2,	0,	33),
(2,	0,	34),
(2,	0,	36),
(2,	0,	39);

DROP TABLE IF EXISTS `users_points`;
CREATE TABLE `users_points` (
  `u_id` int(6) NOT NULL,
  `points` int(6) NOT NULL,
  `reason` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `received` date NOT NULL,
  `expired` date DEFAULT NULL,
  KEY `u_id` (`u_id`),
  CONSTRAINT `users_points_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_points` (`u_id`, `points`, `reason`, `received`, `expired`) VALUES
(2,	50,	'滿1000及可折抵',	'2020-07-17',	'2021-08-17'),
(2,	10,	'滿1000及可折抵',	'2021-08-06',	'2022-08-06');

-- 2021-08-11 17:26:41