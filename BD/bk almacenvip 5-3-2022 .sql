-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2022 a las 08:44:17
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
-- Base de datos: `almacenvip`
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
  `categoryCode` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `categoryCode`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 0, 'Smartphones', 'Telefonía', '2017-01-24 19:17:37', '07-12-2021 09:15:35 PM'),
(4, 0, 'Perifericos', 'Perifericos en general', '2017-01-24 19:19:32', '07-12-2021 09:12:23 PM'),
(5, 0, 'Mobiliario', 'Mobiliario para tu casa u oficina.', '2017-01-24 19:19:54', '08-12-2021 12:07:03 AM'),
(6, 0, 'Componentes', 'Componentes de PC', '2017-02-20 19:18:52', '27-10-2021 10:11:44 AM'),
(8, 0, 'Redes', 'Dispositivos para conectarse a la red.', '2021-12-07 02:55:00', NULL),
(9, 0, 'Consolas', 'Todo Tipo de consolas', '2021-12-07 02:55:34', NULL),
(10, 0, 'Ordenadores', 'Laptops y Desktop', '2021-12-07 03:00:33', NULL),
(11, 0, 'Accesorios', '', '2021-12-08 02:14:16', '07-12-2021 09:15:44 PM'),
(13, 0, 'Alm. Externo', '', '2021-12-14 02:21:44', NULL);

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

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 6, '19', 1, '2022-03-03 03:16:40', NULL, 'Denegado'),
(2, 6, '19', 1, '2022-03-03 15:40:19', NULL, NULL);

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

--
-- Volcado de datos para la tabla `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 1, 'Denegado', 'No puede elegir más de 1 producto', '2022-03-03 04:18:01');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `productCode` int(11) DEFAULT NULL,
  `productLocation` varchar(25) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productAvailability` int(10) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category`, `productCode`, `productLocation`, `productName`, `productCompany`, `productPrice`, `productDescription`, `productImage1`, `productAvailability`, `unit`, `postingDate`, `updationDate`) VALUES
(19, 6, 100001, NULL, 'EVGA GeForce RTX 3090 FTW3 ULTRA GAMING 24GB GDDR6X', 'EVGA', '1500.00', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Boost Clock: 1800 MHz</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Memory Clock: 19500 MHz Effective</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">CUDA Cores: 10496</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Bus Type: PCIe 4.0</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Memory Detail: 24576MB GDDR6X</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Memory Bit Width: 384 Bit</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Memory Bandwidth: 936 GB/s</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">LED Logo: ARGB</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Height: 5.38 in - 136.75mm</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Length: 11.81 in - 300mm</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Width: 2.75 Slots</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">750 Watt or greater power supply.</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">PCI Express, PCI Express 2.0, PCI Express</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">3.0 or PCI Express 4.0 compliant motherboard with one graphics slot.</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Three available 8-pin or 6+2pin PCIe power dongles</span><br><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Windows 10 64bit</span><br>', '1152-evga-geforce-rtx-3090-ftw3-ultra-gaming-24gb-gddr6x.jpg', 1, 1, '2017-03-11 01:16:03', ''),
(20, 6, 100002, NULL, 'MSI B450 TOMAHAWK MAX II', 'MSI', '86.00', '<p style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\">De estilo militar con diseño de disipador de calor extendido para una mejor solución térmica, además de DDR4 Boost, Core Boost, Turbo M.2 y conector USB 3.2 Gen2</p><h2 style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-top: 20px; margin-bottom: 8px; line-height: 1.1; color: rgb(68, 68, 68); font-weight: 300; font-size: 20px; font-family: Montserrat, sans-serif;\">Características:</h2><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Admite AMD Ryzen ™ / Ryzen ™ de 1.ª, 2.ª y 3.ª generación con gráficos Radeon ™ Vega y AMD Ryzen ™ de 2.ª generación con gráficos Radeon ™ / Athlon ™ con procesadores de escritorio Radeon ™ Vega Graphics para Socket AM4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Admite memoria DDR4, hasta 4133 (OC) MHz</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Diseño de disipador de calor extendido: el disipador de calor PWM extendido de MSI y el diseño de circuito mejorado garantizan que incluso los procesadores de alta gama funcionen a máxima velocidad.</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Experiencia de juego ultrarrápida: 1x TURBO M.2, AMD Turbo USB 3.2 GEN2, tecnología Store MI</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Core Boost: con un diseño premium y un diseño de energía totalmente digital para admitir más núcleos y proporcionar un mejor rendimiento.</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">DDR4 Boost: tecnología avanzada para entregar señales de datos puros para el mejor rendimiento y estabilidad de juego.</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">MULTI-GPU: Con ranuras STEEL ARMOR PCI-E. Admite AMD Crossfire ™ de 2 vías</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Aumento de audio: recompense sus oídos con calidad de sonido de estudio para la experiencia de audio más envolvente.</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Botón Flash BIOS: simplemente use una llave USB para actualizar cualquier BIOS en segundos, sin instalar una CPU, memoria o tarjeta gráfica.</li></ul><h2 style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-top: 20px; margin-bottom: 8px; line-height: 1.1; color: rgb(68, 68, 68); font-weight: 300; font-size: 20px; font-family: Montserrat, sans-serif;\">Especificaciones:</h2><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Procesador</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Fabricante de procesador: AMD</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Socket de procesador: Zócalo AM4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Procesador compatible: AMD Ryzen 3, AMD Ryzen 5, AMD Ryzen 7, 3rd Generation AMD Ryzen 9</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Máx.número de procesador SMP: 1</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Memoria</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">tipos de memoria compatibles: DDR4-SDRAM</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de ranuras de memoria: 4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de ranuras de memoria: DIMM</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Canales de memoria: Dual-channel</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">ECC: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">No ECC: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Velocidades de reloj de memoria soportadas: 1866,2133,2400,2667,2800,2933,3000,3066,3200,3466,4000,4133 MHz</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Memoria interna máxima: 128 GB</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Reguladores del almacenaje</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipos de unidades de almacenamiento admitidas: HDD &amp; SSD</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Interfaces de disco de almacenamiento soportados: Serial ATA III</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Niveles RAID: 0,1,10</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Gráficos</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Máxima resolución: 4096 x 2160 Pixeles</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Interno I/O</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">USB 2.0, conectores: 2</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conectores USB 3.2 Gen 1 (3.1 Gen 1): 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de conectores SATA III: 6</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de audio en panel frontal: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de panel delantero: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de potencia ATX (24 pines): Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de ventilador CPU: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de conectores a ventilador de chasis: 4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector de instrusión a chasis: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector TPM: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cabecera de puerto serie: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector eléctrico de 12&nbsp;V: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Conector para tiras LED RGB: Si</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Panel trasero Puertos de I/O (entrada/salida)</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos USB 2.0: 2</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos tipo A USB 3.2 Gen 1 (3.1 Gen 1): 2</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos tipo A USB 3.2 Gen 2 (3.1 Gen 2): 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos tipo C USB 3.2 Gen 2 (3.1 Gen 2): 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Ethernet LAN (RJ-45) cantidad de puertos: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Puerto de ratón PS/2: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de puertos HDMI: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Versión HDMI: 2.1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cantidad de puertos DVI-D: 1</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Conexión</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Ethernet: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de interfaz ethernet: Gigabit Ethernet</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Controlador LAN: Realtek 8111H</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Wifi: No</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Características</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Chipset: AMD B450</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Chip de sonido: Realtek ALC892 / Realtek ALC897</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Canales de salida de audio: 7.1 canales</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Componente para: PC</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Factor de forma: ATX</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Familia del chipset: AMD</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Ranuras de expansión</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">PCI Express x1 (Gen 3.x) ranuras: 3</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">PCI Express x16 Gen (2.x) ranuras: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">PCI Express x16 Gen (3.x) ranuras: 1</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Número de ranuras M.2 (M): 1</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">BIOS</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Jumper Clear CMOS: Si</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Peso y dimensiones</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Ancho: 305 mm</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Profundidad: 244 mm</li></ul></ul><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Contenido del embalaje</span></li><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Cables incluidos: SATA</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Controladores incluidos: Si</li></ul></ul>', '1155-msi-b450-tomahawk-max-ii.jpg', 1, 1, '2017-03-11 01:19:22', ''),
(21, 6, NULL, NULL, 'Team Group T Force Delta RGB DDR4 3600MHz PC4 28800 16GB 2x8GB CL18 Negro', 'Team Group', '80.00', '<div><font color=\"#888888\" face=\"Open Sans, arial, sans-serif\" size=\"3\"><b>Caracteristicas</b></font></div><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 0px; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Latencia CAS: 18</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Memoria interna: 16 GB</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Diseño de memoria (módulos x tamaño): 2 x 8 GB</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de memoria interna: DDR4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Velocidad de memoria del reloj: 3600 MHz</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Forma de factor de memoria: 288-pin DIMM</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de memoria con búfer: Unregistered (unbuffered)</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">ECC: No</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Voltaje de memoria: 1.35 V</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Retroiluminación: Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Color de luz de fondo: RGB</li></ul>', '1670-team-group-t-force-delta-rgb-ddr4-3600mhz-pc4-28800-16gb-2x8gb-cl18-negro.jpg', 1, 1, '2021-12-07 09:08:45', NULL),
(22, 6, NULL, NULL, 'Corsair Vengeance LPX DDR4 3200 PC4 25600 16GB 2X8GB CL16 Negro', 'Corsair', '73.00', '<div><font color=\"#888888\" face=\"Open Sans, arial, sans-serif\" size=\"4\"><b style=\"\">Caracteristica</b></font></div><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 0px; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Latencia CAS: 16</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Memoria interna: 16 GB</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de memoria interna: DDR4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Velocidad de memoria del reloj: 3200 MHz</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Componente para: PC/servidor</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Forma de factor de memoria: 288-pin DIMM</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Diseño de memoria (módulos x tamaño): 2 x 8 GB</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de enfriamiento: Disipador térmico</li></ul>', 'corsair-vengeance-lpx-ddr4-3200-pc4-25600-16gb-2x8gb-cl16-negro-comprar.jpg', 1, 0, '2021-12-07 09:12:53', NULL),
(23, 6, NULL, NULL, 'Corsair Vengeance RGB Pro Optimizado AMD DDR4 3200 16GB 2x8GB CL16', 'Corsair', '94.00', '<div><font color=\"#888888\" face=\"Open Sans, arial, sans-serif\" size=\"4\"><b style=\"\">Caracteristicas</b></font></div><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 0px; padding-left: 15px; color: rgb(136, 136, 136); font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Memoria interna: 16 GB</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Tipo de memoria interna: DDR4</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Velocidad de memoria del reloj: 3200 MHz</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Componente para: PC/servidor</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Forma de factor de memoria: 288-pin DIMM</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Diseño de memoria (módulos x tamaño): 2 x 8 GB</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Voltaje de memoria: 1.35 V</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Intel® Extreme Memory Profile (XMP): Si</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Versión del perfil Intel XMP (Extreme Memory Profile): 2,0</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Voltaje de SPD: 1.2 V</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Latencia de SPD: 43</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Velocidad de SPD: 2666 MHz</li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\">Productos compatibles: Intel 200 Series,Intel 300 Series,AMD 300 Series,AMD 400 Series,AMD X570</li></ul>', 'corsair-vengeance-rgb-pro-optimizado-amd-ddr4-3200-16gb-2x8gb-cl16-opiniones.jpg', 0, 0, '2021-12-07 09:15:38', NULL),
(24, 6, NULL, NULL, 'GSkill Trident Z RGB DDR4 3200 PC4 25600 16GB 2x8GB CL16', 'G.skill', '126.00', '<div><font face=\"Open Sans, arial, sans-serif\" size=\"4\" color=\"#000000\">Caracteristicas</font></div><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Tipo de la memoria: DDR4</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Capacidad: 16GB (2x8GB)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Multi-Channel: Kit de doble canal</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Velocidad Probada: 3200 MHz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Latencia Probada: 16-18-18-38</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Voltaje Probada: 1.35 V</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Dimensiones: 16 x 13,7 x 1.4 cm</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Peso: 186g</font></li></ul>', '1140771.jpg', 0, 0, '2021-12-07 18:13:24', NULL),
(25, 6, NULL, NULL, 'MSI Z490 A PRO', 'MSI', '154.00', '<div><font face=\"Open Sans, arial, sans-serif\" size=\"4\" color=\"#000000\">Caracteristicas</font></div><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Model Name Z490-A PRO</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">CPU Support Supports 10th Gen Intel® Core™ and Pentium® Gold /Celeron® processors</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">CPU Socket LGA 1200</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Chipset Intel® Z490 Chipset</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Graphics Interface 2x PCI-E 3.0 x16 slotsSupport 2-way AMD® CrossFire™ Technology</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Display Interface DisplayPort, HDMI - Requires Processor Graphics</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Memory Support 4 DIMMs, Dual Channel DDR4-4800(OC)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Expansion Slots: 3x PCIe 3.0 x1 slots</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Storage 2x Turbo M.2 slots (Gen3 x4) 6x SATA 6Gb/s</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">USB ports 2x USB 3.2 Gen 2 10Gbps (1 Type-A + 1 Type-C), 7x USB 3.2 Gen 1 5Gbps (6 Type-A + 1 Type-C), 6x USB 2.0</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">LAN Realtek® 8125B 2.5G LAN</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Audio 8-Channel(7.1) HD Audio with Audio Boost</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Form Factor ATX</font></li></ul>', '1316-msi-z490-a-pro.jpg', 0, 0, '2021-12-07 18:21:00', NULL),
(26, 6, NULL, NULL, 'MSI B460M PRO-VDH WIFI', 'MSI', '90.00', '<div><font face=\"Open Sans, arial, sans-serif\" size=\"4\" color=\"#000000\"><b style=\"\">Caracteristicas</b></font></div><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">CPU</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports 10th Gen Intel® Core™ and Pentium® Gold / Celeron® processors for LGA 1200 socket. 1 2</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Please go to intel.com for compatibility information.</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Onboard graphics output are disabled when using the F SKU processors.</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Chipset</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Intel® B460 Chipset</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Memory</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">4x DDR4 memory slots supporting up 128GB 1</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Intel® Core™ i7/ i9</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Support DDR4-2933 Memory (Max.)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Intel® Core™ i5 (Below)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports DDR4-2666 Memory (Max.)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports Dual-Channel mode</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports non-ECC, un-buffered memory</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports Intel® Extreme Memory Profile (XMP)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">See supported memory</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Please refer www.msi.com for more information on compatible memory.</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Expansion Slot</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x PCIe 3.0 x16 slot (from CPU)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">2x PCIe x1 slots (from PCH)</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Onboard Graphics</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x HDMI port, supporting a maximum resolution of 4096x2160 @ 30Hz, 2560x1600 @ 60Hz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x DVI-D port, supports a maximum resolution of 1920x1200 @ 60Hz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x VGA port, supports a maximum resolution of 2048x1536 @ 50Hz, 2048x1280 @ 60Hz, 1920x1200 @ 60Hz</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Audio</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Realtek® ALC892 Codec</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">7.1-Channel High Definition Audio</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">LAN</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x Realtek® RTL8111H Gigabit LAN Controller</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Storage</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Intel® B460 Chipset</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">4x SATA 6Gb/s ports 1</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">2x M.2 slots (Key M)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">M2_1 supports up to PCIe 3.0 x4 and SATA 6Gb/s, 2242/ 2260/ 2280/ 22110 storage devices 1</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">M2_2 supports up to PCIe 3.0 x4, 2242/ 2260/ 2280 storage devices</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Intel® Optane™ Memory Ready 2</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports Intel® Smart Response Technology for Intel Core™ processors</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">SATA1 will be unavailable when installing M.2 SATA SSD in the M2_1 slot.</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Before using Intel® Optane™ memory modules, please ensure that you have updated the drivers and BIOS to the latest version from MSI website.</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">RAID</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Intel® B460 Chipset</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports RAID 0, RAID 1, RAID 5 and RAID 10 for SATA storage devices</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Wireless LAN &amp; Bluetooth®</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Intel® 3168NGW</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">The Wireless module is pre-installed in the M.2 (Key-E) slot</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports 802.11 a/ b/ g/ n/ ac</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Supports Bluetooth® 4.2</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">USB</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Intel® B460 Chipset</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">6x USB 3.2 Gen 1 5Gbps ports (4 Type-A ports on the back panel, 2 ports through the internal USB connector)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">6x USB 2.0 ports (2 Type-A ports on the back panel, 4 ports through the internal USB 2.0 connectors)</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Form Factor</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">mATX Form Factor</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">9.6 in. x 9.6 in. (24.4 cm x 24.4 cm)</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Internal connectors</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x 24-pin ATX main power connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x 8-pin ATX 12V power connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">4x SATA 6Gb/s connectors</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x USB 3.2 Gen 1 5Gbps connector (support additional 2 USB 3.2 Gen 1 5Gbps ports)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">2x USB 2.0 connectors (support additional 4 USB 2.0 ports)</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x 4-pin CPU fan connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x 4-pin water pump connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">2x 4-pin system fan connectors</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x front panel audio connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">2x system panel connectors</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x parallel port connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x serial port connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x Chassis Intrusion connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x Clear CMOS jumper</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x 4-pin RGB LED connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x 3-pin RAINBOW LED connector</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">1x TPM module connector</font></li></ul></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Back panel Connectors</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Keyboard / Mouse</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">VGA</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">LAN</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">USB 2.0</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">DVI-D</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">HDMI</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">USB 3.2 Gen 1 5Gbps Type-A</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">USB 3.2 Gen 1 5Gbps Type-A</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Wireless / Bluetooth</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Audio Connectors</font></li></ul></li></ul>', '1256-asus-tuf-gaming-b550-plus-wi-fi.jpg', 0, 0, '2021-12-07 18:37:00', NULL);
INSERT INTO `products` (`id`, `category`, `productCode`, `productLocation`, `productName`, `productCompany`, `productPrice`, `productDescription`, `productImage1`, `productAvailability`, `unit`, `postingDate`, `updationDate`) VALUES
(27, 6, NULL, NULL, 'AMD Ryzen 7 3800X 3.9GHz ', 'AMD', '305.00', '<div><font face=\"Open Sans, arial, sans-serif\" size=\"4\" color=\"#000000\"><b style=\"\">Caracteristicas</b></font></div><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 1rem; padding-left: 15px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Núcleos de CPU</span>: 8<br></font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Hilos</span>: 16</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Velocidad base de reloj</span>: 3.9GHz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Max Turbo Core Speed</span>:&nbsp;4.5GHz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Caché L2 total:</span>&nbsp;4MB</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Caché L3 total:</span>&nbsp;32MB</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Desbloqueados</span>: Sí</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">CMOS</span>: TSMC 7nm FinFET</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Package</span>: AM4</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Versión de PCI Express</span>: PCIe 4.0 x16</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Solución térmica:&nbsp;</span>Wraith Prism with RGB LED</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\">Default TDP / TDP</span>: 105W</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><span style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; font-weight: 700;\"><font color=\"#000000\">Memoria:</font></span><ul style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; padding-left: 15px;\"><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Velocidad máxima de memoria: 3200MHz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Interfaz de memoria: DDR4</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px;\"><font color=\"#000000\">Canales de memoria: 2</font></li></ul></li></ul>', '7-3.jpg', 0, 0, '2021-12-07 18:44:44', NULL),
(28, 6, NULL, NULL, 'AMD Ryzen 7 5800X 3.8GHz', 'AMD', '369.00', '<font face=\"Open Sans, arial, sans-serif\" size=\"4\" color=\"#000000\"><b style=\"\">Caracteristicas</b></font><div><font face=\"Open Sans, arial, sans-serif\" color=\"#000000\"><br></font><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\"># de núcleos de CPU 8<br></font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\"># de hilos 16</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Reloj base 3.8GHz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Reloj de aumento máx. Hasta 4.7GHz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Caché L2 total 4MB</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Caché L3 total 32MB</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Desbloqueados Sí</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">CMOS TSMC 7nm FinFET</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Package AM4</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Versión de PCI Express PCIe 4.0</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Solución térmica (PIB) Not included</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">TDP/TDP predeterminado 105W</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Memoria</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Velocidad máxima de memoria Up to 3200MHz</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Tipo de memoria DDR4</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Funcionalidades principales</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Tecnologías compatibles Tecnología AMD StoreMI</font></li><li style=\"box-sizing: inherit; -webkit-font-smoothing: antialiased; margin-bottom: 6px; font-family: &quot;Open Sans&quot;, arial, sans-serif;\"><font color=\"#000000\">Utilidad AMD Ryzen™ Master AMD Ryzen™ VR-Ready Premium</font><br></li></div>', '168-amd-ryzen-7-5800x-38ghz.jpg', 0, 0, '2021-12-07 20:44:39', NULL),
(71, 9, 120000, 'TAB 15', 'Clicsadora', 'Generica', '1.25', '																												clipsadora																										', '955784553690602434bd1a496243b4d8.jpg', 1, 1, '2022-03-04 16:14:45', NULL),
(72, 3, 130000, 'TAB 7', 'Papel Bond 8 1/2 x 11', 'HP', '4.95', 'Papel Bond normal, 500 hojas.', '12.jpeg', 150, 3, '2022-03-05 03:27:45', NULL);

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
(3, 4, 'Televisores', '2017-01-26 16:29:09', '28-11-2021 09:13:47 PM'),
(8, 3, 'Android y Iphone.', '2017-02-04 04:13:54', '27-10-2021 10:39:20 AM'),
(9, 5, 'Sillas', '2017-02-04 04:36:45', '27-10-2021 10:40:30 AM'),
(10, 5, 'Mesas', '2017-02-04 04:37:02', '27-10-2021 10:40:48 AM'),
(12, 6, 'Tarjetas Graficas', '2017-03-10 20:12:59', '27-10-2021 12:14:37 PM'),
(13, 6, 'Motherboards', '2021-10-27 17:14:08', NULL),
(14, 10, 'Laptops', '2021-12-07 03:01:24', NULL),
(15, 10, 'Desktop', '2021-12-07 03:01:48', NULL),
(16, 6, 'Memoria RAM', '2021-12-07 03:02:11', NULL),
(17, 6, 'Fuentes de Poder', '2021-12-07 03:02:24', NULL),
(18, 6, 'Procesadores', '2021-12-07 13:14:25', NULL),
(19, 6, 'Cajas', '2021-12-07 16:57:20', NULL),
(20, 6, 'Disco Duro', '2021-12-07 16:57:41', NULL),
(21, 4, 'Monitores', '2021-12-08 02:13:26', NULL),
(22, 8, 'Routers', '2021-12-09 02:21:21', NULL),
(23, 9, 'Playstation', '2021-12-09 03:03:25', NULL),
(24, 9, 'Nintendo', '2021-12-09 03:03:32', NULL),
(25, 9, 'Xbox', '2021-12-09 03:03:42', NULL),
(28, 13, 'Disco duro externo', '2021-12-14 02:22:04', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `unitType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unit`
--

INSERT INTO `unit` (`id`, `unitType`) VALUES
(1, 'C/U'),
(2, 'CAJA'),
(3, 'RESMA');

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
(41, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-30 02:11:48', '29-11-2021 09:26:03 PM', 1),
(42, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2021-11-30 11:50:50', '30-11-2021 09:09:32 PM', 1),
(43, 'lourdes.moreno@up.ac.pa', 0x3a3a3100000000000000000000000000, '2021-12-09 14:49:33', NULL, 0),
(44, 'lourdes.morenod@up.ac.pa', 0x3a3a3100000000000000000000000000, '2021-12-09 14:49:50', NULL, 1),
(45, 'lourdes.morenod@up.ac.pa', 0x3a3a3100000000000000000000000000, '2021-12-09 14:53:10', NULL, 1),
(46, 'jorgerodriguez@mail.com', 0x3a3a3100000000000000000000000000, '2021-12-12 16:32:12', '12-12-2021 11:42:56 AM', 1),
(47, 'jorgerodriguez@mail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 02:15:11', NULL, 1),
(48, 'jorgerodriguez@mail.com', 0x3a3a3100000000000000000000000000, '2022-01-28 13:40:03', '28-01-2022 08:41:40 AM', 1),
(49, 'jorgerodriguez@mail.com', 0x3a3a3100000000000000000000000000, '2022-01-28 13:47:26', NULL, 1),
(50, 'jorge@mail.com', 0x3a3a3100000000000000000000000000, '2022-03-02 07:44:36', NULL, 0),
(51, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2022-03-02 07:44:56', NULL, 1),
(52, 'suyitzacast@mail.com', 0x3a3a3100000000000000000000000000, '2022-03-03 15:39:30', NULL, 1);

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
(6, 'Suyitza Castillo', 'suyitzacast@mail.com', 63459802, '949377b685014ca1f0324c963f642f37', 'Panamá\r\nJ 33', 'Panamá', 'Panamá', 0, 'Panamá\r\nJ 33', 'Panamá', 'Panamá', 0, '2021-11-29 06:18:18', NULL),
(7, 'Lourdes Moreno', 'lourdes.morenod@up.ac.pa', 6709, 'e10adc3949ba59abbe56e057f20f883e', 'Bella vista, calle Manuel Espinosa Batista. Vicerrectora de investigación y postgrado edificio los gemelos\r\nVicerrectoria de investigación y Postgrado', 'Panamá', 'Panamá', 123456, 'Bella vista, calle Manuel Espinosa Batista. Vicerrectora de investigación y postgrado edificio los gemelos\r\nVicerrectoria de investigación y Postgrado', 'Panamá', 'Panamá', 123456, '2021-12-09 14:49:02', NULL);

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
-- Indices de la tabla `unit`
--
ALTER TABLE `unit`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
