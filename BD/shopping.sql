-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2021 a las 03:30:29
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shopping`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '0e0ce2c32f1b101a0647eb616399272e', '2017-01-24 16:21:18', '22-06-2020 10:14:35 PM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Accesorios', 'Accesorios', '2017-01-24 19:17:37', '27-10-2021 10:38:45 AM'),
(4, 'Electronico', 'Productos Electronicos', '2017-01-24 19:19:32', ''),
(5, 'Mobilario', 'Mobiliario para tu casa u oficina.', '2017-01-24 19:19:54', '27-10-2021 10:44:06 AM'),
(6, 'Componentes', 'Componentes de PC', '2017-02-20 19:18:52', '27-10-2021 10:11:44 AM'),
(7, 'Impresoras', 'Impresoras Multifuncionales, De formato Ancho y más.', '2021-10-27 15:44:59', '28-11-2021 08:42:23 PM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productPriceBeforeDiscount` decimal(10,2) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` decimal(10,2) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 4, 3, 'Micromax 81cm (32) HD Ready LED TV  (32T6175MHD, 2 x HDMI, 2 x USB)', 'Micromax test', '299.00', '0.00', '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">General</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Sales Package</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">1 TV Unit, Remote Controller, Battery (For Remote Controller), Quick Installation Guide and User Manual: All in One, Wall Mount Support</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Model Name</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">32T6175MHD</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Display Size</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">81 cm (32)</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Screen Type</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">LED</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">HD Technology &amp; Resolutiontest</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">HD Ready, 1366 x 768</li></ul></li></ul>', 'micromax1.jpeg', 'micromax main image.jpg', 'micromax main image.jpg', '20.00', 'En Stock', '2017-01-30 16:54:35', ''),
(2, 4, 4, 'Apple iPhone 6 (Silver, 16 GB)', 'Apple INC', '36990.00', '0.00', '<div class=\"_2PF8IO\" style=\"box-sizing: border-box; margin: 0px 0px 0px 110px; padding: 0px; flex: 1 1 0%; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px;\"><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">1 GB RAM | 16 GB ROM |</li><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">4.7 inch Retina HD Display</li><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">8MP Primary Camera | 1.2MP Front</li><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Li-Ion Battery</li><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">A8 Chip with 64-bit Architecture and M8 Motion Co-processor Processor</li></ul></div>', 'apple-iphone-6-1.jpeg', 'apple-iphone-6-2.jpeg', 'apple-iphone-6-3.jpeg', '0.00', 'In Stock', '2017-01-30 16:59:00', ''),
(3, 4, 4, 'Redmi Note 4 (Gold, 32 GB)  (With 3 GB RAM)', 'Redmi', '10999.00', '0.00', '<br><div><ol><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>4100 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 625 64-bit Processor<br></li></ol></div>', 'mi-redmi-note-4-1.jpeg', 'mi-redmi-note-4-2.jpeg', 'mi-redmi-note-4-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:03:15', ''),
(4, 4, 4, 'Lenovo K6 Power (Silver, 32 GB) ', 'Lenovo', '9999.00', '0.00', '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>4000 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 430 Processor<br></li></ul>', 'lenovo-k6-power-k33a42-1.jpeg', 'lenovo-k6-power-k33a42-2.jpeg', 'lenovo-k6-power-k33a42-3.jpeg', '45.00', 'In Stock', '2017-02-04 04:04:43', ''),
(5, 4, 4, 'Lenovo Vibe K5 Note (Gold, 32 GB)  ', 'Lenovo', '11999.00', '0.00', '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>3500 mAh Li-Ion Polymer Battery<br></li><li>Helio P10 64-bit Processor<br></li></ul>', 'lenovo-k5-note-pa330010in-1.jpeg', 'lenovo-k5-note-pa330116in-2.jpeg', 'lenovo-k5-note-pa330116in-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:06:17', ''),
(6, 4, 4, 'Micromax Canvas Mega 4G', 'Micromax', '6999.00', '0.00', '<ul><li>3 GB RAM | 16 GB ROM |<br></li><li>5.5 inch HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>2500 mAh Battery<br></li><li>MT6735 Processor<br></li></ul>', 'micromax-canvas-mega-4g-1.jpeg', 'micromax-canvas-mega-4g-2.jpeg', 'micromax-canvas-mega-4g-3.jpeg', '35.00', 'In Stock', '2017-02-04 04:08:07', ''),
(7, 4, 4, 'SAMSUNG Galaxy On5', 'SAMSUNG', '7490.00', '0.00', '<ul><li>1.5 GB RAM | 8 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch HD Display<br></li><li>8MP Primary Camera | 5MP Front<br></li><li>2600 mAh Li-Ion Battery<br></li><li>Exynos 3475 Processor<br></li></ul>', 'samsung-galaxy-on7-sm-1.jpeg', 'samsung-galaxy-on5-sm-2.jpeg', 'samsung-galaxy-on5-sm-3.jpeg', '20.00', 'In Stock', '2017-02-04 04:10:17', ''),
(8, 4, 4, 'OPPO A57', 'OPPO', '14990.00', '0.00', '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 256 GB<br></li><li>5.2 inch HD Display<br></li><li>13MP Primary Camera | 16MP Front<br></li><li>2900 mAh Battery<br></li><li>Qualcomm MSM8940 64-bit Processor<br></li></ul>', 'oppo-a57-na-original-1.jpeg', 'oppo-a57-na-original-2.jpeg', 'oppo-a57-na-original-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:11:54', ''),
(9, 4, 5, 'Affix Back Cover for Mi Redmi Note 4', 'Techguru', '259.00', '0.00', '<ul><li>Suitable For: Mobile<br></li><li>Material: Polyurethane<br></li><li>Theme: No Theme<br></li><li>Type: Back Cover<br></li><li>Waterproof<br></li></ul>', 'amzer-amz98947-original-1.jpeg', 'amzer-amz98947-original-2.jpeg', 'amzer-amz98947-original-3.jpeg', '10.00', 'In Stock', '2017-02-04 04:17:03', ''),
(11, 4, 6, 'Acer ES 15 Pentium Quad Core', 'Acer', '19990.00', '0.00', '<ul><li>Intel Pentium Quad Core Processor ( )<br></li><li>4 GB DDR3 RAM<br></li><li>Linux/Ubuntu Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul>', 'acer-aspire-notebook-original-1.jpeg', 'acer-aspire-notebook-original-2.jpeg', 'acer-aspire-notebook-original-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:26:17', ''),
(12, 4, 6, 'Micromax Canvas Laptab II (WIFI) Atom 4th Gen', 'Micromax', '10999.00', '0.00', '<ul><li>Intel Atom Processor ( 4th Gen )<br></li><li>2 GB DDR3 RAM<br></li><li>32 bit Windows 10 Operating System<br></li><li>11.6 inch Touchscreen Display<br></li></ul>', 'micromax-lt777w-2-in-1-laptop-original-1.jpeg', 'micromax-lt777w-2-in-1-laptop-original-2.jpeg', 'micromax-lt777w-2-in-1-laptop-original-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:28:17', ''),
(13, 4, 6, 'HP Core i5 5th Gen', 'HP', '41990.00', '0.00', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">HP Core i5 5th Gen - (4 GB/1 TB HDD/Windows 10 Home/2 GB Graphics) N8M28PA 15-ac123tx Notebook</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(15.6 inch, Turbo SIlver, 2.19 kg)</span><br><div><ul><li>Intel Core i5 Processor ( 5th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'hp-notebook-original-1.jpeg', 'hp-notebook-original-2.jpeg', 'hp-notebook-original-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:30:24', ''),
(14, 4, 6, 'Lenovo Ideapad 110 APU Quad Core A6 6th Gen', 'Lenovo', '22990.00', '0.00', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">Lenovo Ideapad 110 APU Quad Core A6 6th Gen - (4 GB/500 GB HDD/Windows 10 Home) 80TJ00D2IH IP110 15ACL Notebook</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(15.6 inch, Black, 2.2 kg)</span><br><div><ul><li>AMD APU Quad Core A6 Processor ( 6th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>500 GB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'lenovo-ideapad-notebook-original-1.jpeg', 'lenovo-ideapad-notebook-original-2.jpeg', 'lenovo-ideapad-notebook-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:32:15', ''),
(15, 3, 8, 'The Wimpy Kid Do -It- Yourself Book', 'ABC', '205.00', '250.00', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">The Wimpy Kid Do -It- Yourself Book</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(English, Paperback, Jeff Kinney)</span><br><div><ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Penguin Books Ltd<br></li><li>ISBN: 9780141339665, 0141339667<br></li><li>Edition: 1<br></li></ul></div>', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', '50.00', 'In Stock', '2017-02-04 04:35:13', ''),
(16, 3, 8, 'Thea Stilton and the Tropical Treasure ', 'XYZ', '240.00', '0.00', '<ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Scholastic<br></li><li>ISBN: 9789351032083, 9351032086<br></li><li>Edition: 2015<br></li><li>Pages: 176<br></li></ul>', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '30.00', 'In Stock', '2017-02-04 04:36:23', ''),
(17, 5, 9, 'Induscraft Solid Wood King Bed With Storage', 'Induscraft', '32566.00', '0.00', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">Induscraft Solid Wood King Bed With Storage</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(Finish Color - Honey Brown)</span><br><div><ul><li>Material Subtype: Rosewood (Sheesham)<br></li><li>W x H x D: 1850 mm x 875 mm x 2057.5 mm<br></li><li>Floor Clearance: 8 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-1.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-2.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:40:37', ''),
(18, 5, 10, 'Nilkamal Ursa Metal Queen Bed', 'Nilkamal', '6523.00', '0.00', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">@home by Nilkamal Ursa Metal Queen Bed</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(Finish Color - NA)</span><br><div><ul><li>Material Subtype: Carbon Steel<br></li><li>W x H x D: 1590 mm x 910 mm x 2070 mm<br></li><li>Floor Clearance: 341 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-1.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-2.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-3.jpeg', '0.00', 'In Stock', '2017-02-04 04:42:27', ''),
(19, 6, 12, 'EVGA GeForce RTX 3090 FTW3 ULTRA GAMING 24GB GDDR6X', 'EVGA', '1500.00', '1800.00', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Boost Clock: 1800 MHz</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Memory Clock: 19500 MHz Effective</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">CUDA Cores: 10496</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Bus Type: PCIe 4.0</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Memory Detail: 24576MB GDDR6X</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Memory Bit Width: 384 Bit</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Memory Bandwidth: 936 GB/s</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">LED Logo: ARGB</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Height: 5.38 in - 136.75mm</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Length: 11.81 in - 300mm</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Width: 2.75 Slots</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">750 Watt or greater power supply.</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">PCI Express, PCI Express 2.0, PCI Express</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">3.0 or PCI Express 4.0 compliant motherboard with one graphics slot.</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Three available 8-pin or 6+2pin PCIe power dongles</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Windows 10 64bit</span><br>', '1152-evga-geforce-rtx-3090-ftw3-ultra-gaming-24gb-gddr6x.jpg', '3800-evga-geforce-rtx-3090-ftw3-ultra-gaming-24gb-gddr6x-mejor-precio.jpg', '2379-evga-geforce-rtx-3090-ftw3-ultra-gaming-24gb-gddr6x-comprar.jpg', '45.00', 'In Stock', '2017-03-10 20:16:03', ''),
(20, 6, 13, 'MSI B450 TOMAHAWK MAX II', 'MSI', '86.00', '100.00', '<p style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\">De estilo militar con diseño de disipador de calor extendido para una mejor solución térmica, además de DDR4 Boost, Core Boost, Turbo M.2 y conector USB 3.2 Gen2</p><h2 style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-top: 20px; margin-bottom: 8px; line-height: 1.1; color: rgb(68, 68, 68); font-weight: 300; font-size: 20px; font-family: Montserrat, sans-serif;\">Características:</h2><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Admite AMD Ryzen ™ / Ryzen ™ de 1.ª, 2.ª y 3.ª generación con gráficos Radeon ™ Vega y AMD Ryzen ™ de 2.ª generación con gráficos Radeon ™ / Athlon ™ con procesadores de escritorio Radeon ™ Vega Graphics para Socket AM4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Admite memoria DDR4, hasta 4133 (OC) MHz</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Diseño de disipador de calor extendido: el disipador de calor PWM extendido de MSI y el diseño de circuito mejorado garantizan que incluso los procesadores de alta gama funcionen a máxima velocidad.</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Experiencia de juego ultrarrápida: 1x TURBO M.2, AMD Turbo USB 3.2 GEN2, tecnología Store MI</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Core Boost: con un diseño premium y un diseño de energía totalmente digital para admitir más núcleos y proporcionar un mejor rendimiento.</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">DDR4 Boost: tecnología avanzada para entregar señales de datos puros para el mejor rendimiento y estabilidad de juego.</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">MULTI-GPU: Con ranuras STEEL ARMOR PCI-E. Admite AMD Crossfire ™ de 2 vías</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Aumento de audio: recompense sus oídos con calidad de sonido de estudio para la experiencia de audio más envolvente.</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Botón Flash BIOS: simplemente use una llave USB para actualizar cualquier BIOS en segundos, sin instalar una CPU, memoria o tarjeta gráfica.</li></ul><h2 style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-top: 20px; margin-bottom: 8px; line-height: 1.1; color: rgb(68, 68, 68); font-weight: 300; font-size: 20px; font-family: Montserrat, sans-serif;\">Especificaciones:</h2><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Procesador</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Fabricante de procesador: AMD</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Socket de procesador: Zócalo AM4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Procesador compatible: AMD Ryzen 3, AMD Ryzen 5, AMD Ryzen 7, 3rd Generation AMD Ryzen 9</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Máx.número de procesador SMP: 1</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Memoria</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">tipos de memoria compatibles: DDR4-SDRAM</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de ranuras de memoria: 4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de ranuras de memoria: DIMM</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Canales de memoria: Dual-channel</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">ECC: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">No ECC: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Velocidades de reloj de memoria soportadas: 1866,2133,2400,2667,2800,2933,3000,3066,3200,3466,4000,4133 MHz</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Memoria interna máxima: 128 GB</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Reguladores del almacenaje</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipos de unidades de almacenamiento admitidas: HDD &amp; SSD</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Interfaces de disco de almacenamiento soportados: Serial ATA III</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Niveles RAID: 0,1,10</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Gráficos</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Máxima resolución: 4096 x 2160 Pixeles</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Interno I/O</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">USB 2.0, conectores: 2</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conectores USB 3.2 Gen 1 (3.1 Gen 1): 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de conectores SATA III: 6</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de audio en panel frontal: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de panel delantero: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de potencia ATX (24 pines): Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de ventilador CPU: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de conectores a ventilador de chasis: 4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de instrusión a chasis: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector TPM: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cabecera de puerto serie: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector eléctrico de 12&nbsp;V: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector para tiras LED RGB: Si</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Panel trasero Puertos de I/O (entrada/salida)</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos USB 2.0: 2</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos tipo A USB 3.2 Gen 1 (3.1 Gen 1): 2</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos tipo A USB 3.2 Gen 2 (3.1 Gen 2): 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos tipo C USB 3.2 Gen 2 (3.1 Gen 2): 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Ethernet LAN (RJ-45) cantidad de puertos: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Puerto de ratón PS/2: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de puertos HDMI: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Versión HDMI: 2.1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos DVI-D: 1</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Conexión</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Ethernet: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de interfaz ethernet: Gigabit Ethernet</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Controlador LAN: Realtek 8111H</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Wifi: No</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Características</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Chipset: AMD B450</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Chip de sonido: Realtek ALC892 / Realtek ALC897</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Canales de salida de audio: 7.1 canales</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Componente para: PC</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Factor de forma: ATX</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Familia del chipset: AMD</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Ranuras de expansión</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">PCI Express x1 (Gen 3.x) ranuras: 3</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">PCI Express x16 Gen (2.x) ranuras: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">PCI Express x16 Gen (3.x) ranuras: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de ranuras M.2 (M): 1</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">BIOS</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Jumper Clear CMOS: Si</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Peso y dimensiones</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Ancho: 305 mm</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Profundidad: 244 mm</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Contenido del embalaje</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cables incluidos: SATA</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Controladores incluidos: Si</li></ul></ul>', '1155-msi-b450-tomahawk-max-ii.jpg', '3122-msi-b450-tomahawk-max-ii-mejor-precio.jpg', '5684-msi-b450-tomahawk-max-ii-caracteristicas.jpg', '10.00', 'En Stock', '2017-03-10 20:19:22', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Accesorios para TV', '2017-01-26 16:24:52', '28-11-2021 09:13:25 PM'),
(3, 4, 'Televisores', '2017-01-26 16:29:09', '28-11-2021 09:13:47 PM'),
(4, 4, 'Dispositivos Moviles', '2017-01-30 16:55:48', ''),
(5, 4, 'Accesorios Moviles', '2017-02-04 04:12:40', ''),
(6, 4, 'Laptops', '2017-02-04 04:13:00', ''),
(7, 4, 'Computadoras de Escritorio (Desktop)', '2017-02-04 04:13:27', '28-11-2021 09:35:23 PM'),
(8, 3, 'Audífonos & Headsets', '2017-02-04 04:13:54', '27-10-2021 10:39:20 AM'),
(9, 5, 'Sillas', '2017-02-04 04:36:45', '27-10-2021 10:40:30 AM'),
(10, 5, 'Mesas', '2017-02-04 04:37:02', '27-10-2021 10:40:48 AM'),
(12, 6, 'Tarjetas Graficas', '2017-03-10 20:12:59', '27-10-2021 12:14:37 PM'),
(13, 6, 'Motherboards', '2021-10-27 17:14:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1),
(24, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-22 13:49:46', NULL, 0),
(25, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-22 13:54:27', '22-06-2020 07:42:06 PM', 1),
(26, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-22 20:37:14', NULL, 1),
(27, 'platea21@platea21.com', 0x3a3a3100000000000000000000000000, '2020-06-23 00:58:24', '22-06-2020 08:40:53 PM', 1),
(28, 'platea21@platea21.com', 0x3a3a3100000000000000000000000000, '2020-06-23 01:45:10', NULL, 1),
(29, 'platea21@platea21.com', 0x3a3a3100000000000000000000000000, '2020-06-23 03:23:26', NULL, 0),
(30, 'platea21@platea21.com', 0x3a3a3100000000000000000000000000, '2020-06-23 03:23:36', NULL, 1),
(31, 'jorgerodriguez@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 03:51:36', NULL, 1),
(32, 'jorgerodriguez@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 05:51:47', '29-11-2021 01:16:54 AM', 1),
(33, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 06:19:55', '29-11-2021 01:20:16 AM', 1),
(34, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 06:21:37', '29-11-2021 02:27:47 PM', 1),
(35, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 19:27:52', '29-11-2021 04:09:40 PM', 1),
(36, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 21:09:54', '29-11-2021 04:14:35 PM', 1),
(37, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 21:14:39', '29-11-2021 04:16:30 PM', 1),
(38, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 21:17:15', '29-11-2021 04:19:20 PM', 1),
(39, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-29 21:20:55', NULL, 1),
(40, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-30 01:23:49', '29-11-2021 09:09:23 PM', 1),
(41, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-30 02:11:48', '29-11-2021 09:26:03 PM', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(5, 'Jorge Rodriguez', 'jorgerodriguez@mail.com', 54328765, 'be8ef5d622c2d9e1572f2b1322164ab9', 'Panamá\r\nJ 33', 'Panamá', 'Panamá', 0, 'Panamá\r\nJ 33', 'Panamá', 'Panamá', 0, '2021-11-29 03:51:28', NULL),
(6, 'Suyitza Castillo', 'suyitzacast@mail.com', 63459802, '949377b685014ca1f0324c963f642f37', 'Panamá\r\nJ 33', 'Panamá', 'Panamá', 0, 'Panamá\r\nJ 33', 'Panamá', 'Panamá', 0, '2021-11-29 06:18:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(2, 4, 12, '2020-06-23 03:05:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
