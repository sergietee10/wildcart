-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-05-2019 a las 06:26:03
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wildcart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `foto` longtext,
  `titulo` longtext,
  `contenido` longtext,
  `etiquetas` longtext,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`id`, `foto`, `titulo`, `contenido`, `etiquetas`, `id_usuario`, `fecha`) VALUES
(6, 'NRE555.png', 'Las nuevas Nike F18', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure', 'Nike, Deportivas', 5, '2019-05-20 00:00:00'),
(8, 'NRE555.png', 'aaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssss', 'aaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaassssssssssssssssss', 'AASAS aSASDA', 5, '2019-05-20 00:00:00'),
(9, 'NRE555.png', 'Lorem Ipsum is simply dummy text of the printing and typeset', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n\nWhere does it come from?\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the w', 'Lorem Impsum', 5, '2019-05-20 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `iva`, `id_usuario`) VALUES
(1, '2018-10-18 00:00:00', 21, 26),
(3, '2018-12-20 00:00:00', 21, 4),
(4, '2018-12-20 00:00:00', 21, 4),
(5, '2018-12-20 00:00:00', 21, 4),
(6, '2018-12-20 00:00:00', 21, 9),
(7, '2018-12-20 00:00:00', 21, 9),
(8, '2018-12-20 00:00:00', 21, 9),
(9, '2018-12-20 00:00:00', 21, 11),
(10, '2018-12-20 00:00:00', 21, 11),
(11, '2019-04-15 00:00:00', 21, 4),
(13, '2019-05-08 00:00:00', 21, 7),
(14, '2019-05-08 00:00:00', 32, 6),
(16, '2019-05-13 00:00:00', 21, 6),
(19, '2019-05-13 00:00:00', 21, 4),
(26, '2019-05-13 00:00:00', 231, NULL),
(27, '2019-05-13 00:00:00', 321, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `linea`
--

INSERT INTO `linea` (`id`, `cantidad`, `id_producto`, `id_factura`) VALUES
(1, 412124, 20, 1),
(2, 35, 40, 1),
(3, 25, 20, NULL),
(4, 35, 40, NULL),
(5, 25, 14, 1),
(6, 32, 33, 1),
(7, 5, 20, 1),
(8, 35, 35, 1),
(9, 2, 9, 1),
(10, 33, 36, 1),
(11, 2, NULL, 1),
(12, 5, 36, 1),
(13, 10, 41, 1),
(14, 32, 33, 1),
(15, 5, 18, 1),
(16, 35, 27, 1),
(17, 3, 5, 3),
(19, 2, 6, 3),
(20, 1, 6, 4),
(21, 1, 8, 4),
(22, 2, 9, 4),
(23, 1, 11, 5),
(24, 1, 10, 5),
(25, 1, 12, 5),
(26, 1, 13, 5),
(27, 1, 6, 6),
(28, 1, 8, 6),
(29, 1, 13, 6),
(30, 1, 12, 6),
(31, 2, 11, 7),
(32, 2, 10, 7),
(33, 3, 14, 7),
(34, 2, 6, 8),
(35, 1, 11, 8),
(36, 1, 10, 9),
(37, 2, 6, 9),
(38, 2, 8, 9),
(39, 1, 14, 9),
(40, 5, 6, 10),
(41, 4, 6, 11),
(42, 21, NULL, NULL),
(44, 20, 6, NULL),
(46, 5, 17, NULL),
(47, 1000, 6, 16),
(48, 50, 25, 16),
(49, 324, 6, NULL),
(50, 6, 6, 19),
(51, 241, 45, 26),
(52, 21, 6, 26),
(53, 24, 6, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `foto` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tipoproducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `desc`, `existencias`, `precio`, `foto`, `id_tipoproducto`) VALUES
(5, 'F5Q', 'sistema tren', 0, 555, 'NRE551.png', 2),
(6, 'DFVT52', 'soporte trenes', 2232, 47.8422, 'fondo7.jpg', 4),
(8, '63P', 'soporte tren', 1, 19.7761, 'Foto', 5),
(9, 'D3Q', 'estación capilar', 0, 18.4308, 'Foto', 5),
(10, 'DP5', 'soporte trabajo', 0, 59.195, 'Foto', 5),
(11, 'D3Q', 'estación capilar', 0, 7.28635, 'Foto', 3),
(12, '84D', 'soporte coche', 0, 99.2651, 'Foto', 5),
(13, '63P', 'estación capilar', 0, 54.5215, 'Foto', 1),
(14, 'F5Q', 'estación capilar', 1, 48.6204, 'Foto', 3),
(15, 'D3Q', 'estación coche', 4, 81.4187, 'Foto', 4),
(16, 'DP5', 'estación capilar', 1, 36.5949, 'Foto', 2),
(17, 'DP5', 'sistema tubos', 5, 78.5043, 'Foto', 4),
(18, 'F5Q', 'sistema coche', 4, 48.0388, 'Foto', 1),
(19, '84D', 'soporte tubos', 5, 68.3279, 'Foto', 4),
(20, 'D3Q', 'tubo tren', 5, 31.5055, 'Foto', 1),
(21, 'DP5', 'sistema coche', 4, 23.1419, 'Foto', 1),
(22, 'DP5', 'estación capilar', 5, 26.0196, 'Foto', 3),
(23, 'DP5', ' accesorio tren', 1, 90.3579, 'Foto', 2),
(24, '63P', ' accesorio tubos', 1, 34.9397, 'Foto', 2),
(25, '63P', 'sistema tren', 4, 60.3961, 'Foto', 4),
(26, '84D', 'soporte tubos', 2, 80.6043, 'Foto', 2),
(27, '84D', 'estación capilar', 5, 65.1577, 'Foto', 2),
(28, '84D', ' accesorio tren', 4, 0.498876, 'Foto', 1),
(29, '84D', ' accesorio trabajo', 5, 20.8368, 'Foto', 4),
(30, '84D', 'estación tubos', 2, 94.6108, 'Foto', 5),
(31, 'F5Q', ' accesorio tren', 2, 26.1544, 'Foto', 5),
(32, '63P', 'sistema coche', 5, 4.43592, 'Foto', 1),
(33, '63P', 'tubo coche', 2, 96.3322, 'Foto', 1),
(34, 'F5Q', 'estación tren', 5, 96.7795, 'Foto', 3),
(35, '84D', 'estación trabajo', 4, 54.2391, 'Foto', 4),
(36, 'F5Q', ' accesorio trabajo', 3, 40.0438, 'Foto', 3),
(37, 'D3Q', 'soporte tren', 3, 13.1319, 'Foto', 3),
(38, 'DP5', 'soporte tubos', 5, 97.1192, 'Foto', 2),
(39, '63P', 'soporte coche', 3, 70.2735, 'Foto', 1),
(40, 'D3Q', 'sistema trabajo', 3, 17.2992, 'Foto', 1),
(41, 'F5Q', 'estación capilar', 4, 87.4507, 'Foto', 1),
(42, 'F5Q', ' accesorio coche', 5, 89.8129, 'Foto', 4),
(43, 'DP5', 'soporte tubos', 5, 63.0283, 'Foto', 1),
(44, '63P', 'sistema tren', 4, 23.6205, 'Foto', 3),
(45, '123454123', 'Nike React Element 55', 2551, 130, 'NRE551.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`id`, `desc`) VALUES
(1, 'Metal'),
(2, 'Madera'),
(3, 'Ma'),
(4, 'Hola'),
(5, 'eefwf'),
(6, 'asdasdee'),
(7, 'Pene'),
(10, 'Casco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `desc`) VALUES
(1, 'Administrador'),
(2, 'Usuario'),
(3, 'Root'),
(4, 'Invitado'),
(5, 'Visitante'),
(6, 'Profesor'),
(7, 'Caramelo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `dni` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ape1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ape2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_tipousuario` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `dni`, `nombre`, `ape1`, `ape2`, `login`, `pass`, `email`, `id_tipousuario`, `active`, `code`) VALUES
(4, '14756425L', 'Sergio', 'Anyon', 'Sevilla', 'sergio', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '', 2, 1, ''),
(5, '78245162A', 'Admin', 'Sergio', 'Anyon', 'admin', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '', 1, 1, ''),
(6, '04142308K', 'Maria', 'Perez', 'Gomez', 'jascas', 'null', 'null', 1, 0, 'null'),
(7, '04631408j', 'Marcos', 'Pozuelo', 'Perez', 'carlos', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '', 2, 0, ''),
(8, '54698532S', 'Lidia', 'Perez', 'Escribano', 'javilo', 'null', 'null', 4, 0, 'null'),
(9, '04631408j', 'Pedro', 'Gomez', 'Escribano', 'jesus', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '', 2, 0, ''),
(10, '14756425l', 'Lidia', 'Escribano', 'Gomez', 'javi', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '', 2, 0, ''),
(11, '04631408j', 'Lidia', 'Pozuelo', 'Perez', 'ramon', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '', 2, 0, ''),
(13, '04631408A', 'Lidia', 'Perez', 'Pozuelo', 'us2asd', 'null', 'null', 5, 0, 'null'),
(14, '04631408A', 'Lidia', 'Escribano', 'Escribano', 'usua6as', 'null', 'null', 5, 0, 'null'),
(15, '54698532o', 'Marcos', 'Belmonte', 'Perez', 'usua95f', NULL, '', NULL, 0, ''),
(16, '7845162f', 'Maria', 'Belmonte', 'Martinez', 'us2', NULL, '', 2, 0, ''),
(17, '04631408j', 'Lidia', 'Gomez', 'Martinez', 'usua95f', NULL, '', 2, 0, ''),
(18, '54698532o', 'Pedro', 'Martinez', 'Escribano', 'us2', NULL, '', NULL, 0, ''),
(19, '7845162f', 'Hector', 'Martinez', 'Belmonte', 'usuar5', NULL, '', 2, 0, ''),
(20, '04631408j', 'Lidia', 'Gomez', 'Escribano', 'usuar5', NULL, '', 2, 0, ''),
(21, '7845162f', 'Maria', 'Escribano', 'Belmonte', 'usuar5', NULL, '', 2, 0, ''),
(22, '7845162f', 'Lidia', 'Belmonte', 'Martinez', 'usuar5', NULL, '', NULL, 0, ''),
(23, '7845162f', 'Alex', 'Martinez', 'Martinez', 'usu435', NULL, '', NULL, 0, ''),
(24, '14756425l', 'Lidia', 'Pozuelo', 'Perez', 'usu435', NULL, '', 2, 0, ''),
(25, '7845162f', 'Lidia', 'Gomez', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(26, '04631408j', 'Pedro', 'Martinez', 'Belmonte', 'usua6', NULL, '', NULL, 0, ''),
(27, '54698532o', 'Maria', 'Perez', 'Escribano', 'usu435', NULL, '', 2, 0, ''),
(28, '04631408j', 'Maria', 'Pozuelo', 'Martinez', 'us2', NULL, '', 2, 0, ''),
(29, '04631408j', 'Marcos', 'Belmonte', 'Gomez', 'usua6', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '', 2, 0, ''),
(30, '7845162f', 'kevin', 'Perez', 'Belmonte', 'us2', NULL, '', NULL, 0, ''),
(31, '7845162f', 'Hector', 'Belmonte', 'Belmonte', 'usua6', NULL, '', NULL, 0, ''),
(32, '04631408j', 'Pedro', 'Gomez', 'Pozuelo', 'us2', NULL, '', NULL, 0, ''),
(33, '54698532o', 'Hector', 'Pozuelo', 'Escribano', 'usu435', NULL, '', 2, 0, ''),
(34, '54698532o', 'Pedro', 'Perez', 'Martinez', 'usuar5', NULL, '', NULL, 0, ''),
(35, '7845162f', 'Marcos', 'Martinez', 'Pozuelo', 'usuar5', NULL, '', NULL, 0, ''),
(36, '04631408j', 'Lidia', 'Martinez', 'Martinez', 'usua95f', NULL, '', 2, 0, ''),
(37, '54698532o', 'Hector', 'Belmonte', 'Gomez', 'usuar5', NULL, '', 2, 0, ''),
(38, '54698532o', 'Alex', 'Perez', 'Belmonte', 'usua95f', NULL, '', 2, 0, ''),
(39, '7845162f', 'kevin', 'Gomez', 'Escribano', 'us2', NULL, '', 2, 0, ''),
(40, '04631408j', 'kevin', 'Belmonte', 'Perez', 'usu435', NULL, '', NULL, 0, ''),
(41, '54698532o', 'Hector', 'Pozuelo', 'Martinez', 'usu435', NULL, '', NULL, 0, ''),
(42, '7845162f', 'Hector', 'Belmonte', 'Gomez', 'usua6', NULL, '', 2, 0, ''),
(43, '54698532o', 'Hector', 'Belmonte', 'Perez', 'us2', NULL, '', NULL, 0, ''),
(44, '04631408j', 'kevin', 'Escribano', 'Gomez', 'us2', NULL, '', NULL, 0, ''),
(45, '14756425l', 'kevin', 'Martinez', 'Pozuelo', 'us2', NULL, '', NULL, 0, ''),
(46, '7845162f', 'kevin', 'Gomez', 'Perez', 'usu435', NULL, '', 2, 0, ''),
(47, '14756425l', 'Maria', 'Perez', 'Perez', 'usu435', NULL, '', 2, 0, ''),
(48, '7845162f', 'Alex', 'Gomez', 'Martinez', 'us2', NULL, '', NULL, 0, ''),
(49, '7845162f', 'Maria', 'Pozuelo', 'Pozuelo', 'usua6', NULL, '', 2, 0, ''),
(50, '04631408j', 'Lidia', 'Belmonte', 'Martinez', 'usu435', NULL, '', 2, 0, ''),
(51, '54698532o', 'Maria', 'Gomez', 'Gomez', 'usu435', NULL, '', 2, 0, ''),
(52, '14756425l', 'Marcos', 'Gomez', 'Gomez', 'usua6', NULL, '', NULL, 0, ''),
(53, '7845162f', 'Lidia', 'Gomez', 'Belmonte', 'usua95f', NULL, '', 2, 0, ''),
(54, '14756425l', 'kevin', 'Martinez', 'Pozuelo', 'us2', NULL, '', 2, 0, ''),
(55, '14756425l', 'Pedro', 'Perez', 'Martinez', 'usua6', NULL, '', 2, 0, ''),
(56, '7845162f', 'Lidia', 'Belmonte', 'Belmonte', 'us2', NULL, '', NULL, 0, ''),
(57, '14756425l', 'Pedro', 'Belmonte', 'Belmonte', 'us2', NULL, '', 2, 0, ''),
(58, '04631408j', 'Maria', 'Belmonte', 'Belmonte', 'usu435', NULL, '', 2, 0, ''),
(59, '04631408j', 'Marcos', 'Pozuelo', 'Gomez', 'usua95f', NULL, '', 2, 0, ''),
(60, '54698532o', 'Maria', 'Pozuelo', 'Escribano', 'usuar5', NULL, '', 2, 0, ''),
(61, '54698532o', 'Alex', 'Perez', 'Pozuelo', 'usua95f', NULL, '', NULL, 0, ''),
(62, '14756425l', 'Pedro', 'Escribano', 'Perez', 'usua95f', NULL, '', NULL, 0, ''),
(63, '54698532o', 'Hector', 'Martinez', 'Martinez', 'usua95f', NULL, '', 2, 0, ''),
(64, '7845162f', 'Maria', 'Perez', 'Pozuelo', 'us2', NULL, '', 2, 0, ''),
(65, '04631408j', 'Maria', 'Martinez', 'Perez', 'us2', NULL, '', 2, 0, ''),
(66, '14756425l', 'Alex', 'Perez', 'Perez', 'usu435', NULL, '', NULL, 0, ''),
(67, '7845162f', 'Pedro', 'Pozuelo', 'Gomez', 'usua6', NULL, '', 2, 0, ''),
(68, '04631408j', 'Pedro', 'Martinez', 'Martinez', 'us2', NULL, '', NULL, 0, ''),
(69, '54698532o', 'Pedro', 'Pozuelo', 'Martinez', 'us2', NULL, '', 2, 0, ''),
(70, '14756425l', 'Maria', 'Gomez', 'Gomez', 'usua95f', NULL, '', 2, 0, ''),
(71, '14756425l', 'Alex', 'Escribano', 'Martinez', 'usua6', NULL, '', 2, 0, ''),
(72, '14756425l', 'Marcos', 'Martinez', 'Belmonte', 'usu435', NULL, '', NULL, 0, ''),
(73, '14756425l', 'Lidia', 'Pozuelo', 'Belmonte', 'usuar5', NULL, '', 2, 0, ''),
(74, '7845162f', 'Marcos', 'Perez', 'Escribano', 'usua6', NULL, '', 2, 0, ''),
(75, '7845162f', 'Maria', 'Belmonte', 'Escribano', 'usua6', NULL, '', NULL, 0, ''),
(76, '54698532o', 'Marcos', 'Martinez', 'Belmonte', 'usuar5', NULL, '', 2, 0, ''),
(77, '04631408j', 'Marcos', 'Pozuelo', 'Pozuelo', 'usu435', NULL, '', NULL, 0, ''),
(78, '14756425l', 'kevin', 'Belmonte', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(79, '54698532o', 'kevin', 'Martinez', 'Martinez', 'usuar5', NULL, '', 2, 0, ''),
(80, '04631408j', 'Maria', 'Escribano', 'Pozuelo', 'usua95f', NULL, '', 2, 0, ''),
(81, '7845162f', 'Marcos', 'Martinez', 'Pozuelo', 'usua95f', NULL, '', NULL, 0, ''),
(82, '14756425l', 'Alex', 'Perez', 'Gomez', 'usua95f', NULL, '', NULL, 0, ''),
(83, '7845162f', 'Pedro', 'Belmonte', 'Perez', 'usua95f', NULL, '', NULL, 0, ''),
(84, '04631408j', 'Hector', 'Escribano', 'Gomez', 'usu435', NULL, '', NULL, 0, ''),
(85, '7845162f', 'kevin', 'Belmonte', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(86, '04631408j', 'Alex', 'Gomez', 'Belmonte', 'usua95f', NULL, '', NULL, 0, ''),
(87, '7845162f', 'kevin', 'Martinez', 'Gomez', 'usu435', NULL, '', 2, 0, ''),
(88, '14756425l', 'Pedro', 'Gomez', 'Belmonte', 'usua6', NULL, '', NULL, 0, ''),
(89, '7845162f', 'Hector', 'Martinez', 'Pozuelo', 'us2', NULL, '', NULL, 0, ''),
(90, '14756425l', 'Maria', 'Gomez', 'Martinez', 'usu435', NULL, '', 2, 0, ''),
(91, '7845162f', 'Maria', 'Perez', 'Martinez', 'usua95f', NULL, '', 2, 0, ''),
(92, '04631408j', 'Pedro', 'Martinez', 'Escribano', 'usua95f', NULL, '', NULL, 0, ''),
(93, '14756425l', 'kevin', 'Pozuelo', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(94, '04631408j', 'Hector', 'Martinez', 'Belmonte', 'usu435', NULL, '', NULL, 0, ''),
(95, '7845162f', 'Pedro', 'Pozuelo', 'Perez', 'usu435', NULL, '', NULL, 0, ''),
(96, '14756425l', 'Maria', 'Perez', 'Perez', 'usuar5', NULL, '', NULL, 0, ''),
(97, '04631408j', 'Lidia', 'Belmonte', 'Escribano', 'usuar5', NULL, '', NULL, 0, ''),
(98, '14756425l', 'Maria', 'Perez', 'Escribano', 'us2', NULL, '', NULL, 0, ''),
(99, '7845162f', 'Pedro', 'Gomez', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(100, '04631408j', 'Marcos', 'Pozuelo', 'Perez', 'usua6', NULL, '', NULL, 0, ''),
(101, '7845162f', 'Lidia', 'Gomez', 'Gomez', 'usu435', NULL, '', 2, 0, ''),
(102, '04631408j', 'Pedro', 'Pozuelo', 'Belmonte', 'usua6', NULL, '', 2, 0, ''),
(103, '54698532o', 'Pedro', 'Martinez', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(104, '14756425l', 'Alex', 'Martinez', 'Martinez', 'us2', NULL, '', 2, 0, ''),
(105, '7845162f', 'Pedro', 'Escribano', 'Escribano', 'usua6', NULL, '', 2, 0, ''),
(106, '04631408j', 'Lidia', 'Pozuelo', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(107, '54698532o', 'kevin', 'Escribano', 'Pozuelo', 'usua95f', NULL, '', NULL, 0, ''),
(108, '54698532o', 'kevin', 'Pozuelo', 'Gomez', 'usu435', NULL, '', NULL, 0, ''),
(109, '7845162f', 'Alex', 'Belmonte', 'Perez', 'usua95f', NULL, '', 2, 0, ''),
(110, '54698532o', 'Marcos', 'Escribano', 'Pozuelo', 'usu435', NULL, '', NULL, 0, ''),
(111, '7845162f', 'Pedro', 'Gomez', 'Martinez', 'us2', NULL, '', 2, 0, ''),
(112, '54698532o', 'Hector', 'Escribano', 'Perez', 'usua95f', NULL, '', NULL, 0, ''),
(113, '7845162f', 'Maria', 'Pozuelo', 'Pozuelo', 'usua6', NULL, '', NULL, 0, ''),
(114, '7845162f', 'Marcos', 'Pozuelo', 'Pozuelo', 'usua95f', NULL, '', 2, 0, ''),
(115, '54698532o', 'Pedro', 'Martinez', 'Gomez', 'usu435', NULL, '', 2, 0, ''),
(116, '14756425l', 'kevin', 'Belmonte', 'Perez', 'us2', NULL, '', NULL, 0, ''),
(117, '04631408j', 'Alex', 'Martinez', 'Escribano', 'us2', NULL, '', NULL, 0, ''),
(118, '7845162f', 'Alex', 'Escribano', 'Perez', 'usua95f', NULL, '', 2, 0, ''),
(119, '04631408j', 'Lidia', 'Gomez', 'Martinez', 'usuar5', NULL, '', 2, 0, ''),
(120, '14756425l', 'Maria', 'Martinez', 'Pozuelo', 'us2', NULL, '', 2, 0, ''),
(121, '04631408j', 'kevin', 'Gomez', 'Martinez', 'usuar5', NULL, '', 2, 0, ''),
(122, '04631408j', 'kevin', 'Martinez', 'Martinez', 'usu435', NULL, '', 2, 0, ''),
(123, '04631408j', 'Maria', 'Martinez', 'Pozuelo', 'usua6', NULL, '', NULL, 0, ''),
(124, '14756425l', 'kevin', 'Pozuelo', 'Gomez', 'usua6', NULL, '', NULL, 0, ''),
(125, '14756425l', 'kevin', 'Martinez', 'Escribano', 'usua6', NULL, '', NULL, 0, ''),
(126, '7845162f', 'Alex', 'Gomez', 'Pozuelo', 'usua6', NULL, '', 2, 0, ''),
(127, '54698532o', 'Maria', 'Martinez', 'Perez', 'usuar5', NULL, '', 2, 0, ''),
(128, '04631408j', 'Alex', 'Martinez', 'Pozuelo', 'usua95f', NULL, '', 2, 0, ''),
(129, '04631408j', 'kevin', 'Pozuelo', 'Pozuelo', 'usua6', NULL, '', NULL, 0, ''),
(130, '7845162f', 'Pedro', 'Gomez', 'Escribano', 'usua6', NULL, '', NULL, 0, ''),
(131, '14756425l', 'Lidia', 'Escribano', 'Pozuelo', 'us2', NULL, '', NULL, 0, ''),
(132, '7845162f', 'Marcos', 'Perez', 'Pozuelo', 'usua6', NULL, '', 2, 0, ''),
(133, '54698532o', 'Lidia', 'Belmonte', 'Martinez', 'usua95f', NULL, '', NULL, 0, ''),
(134, '7845162f', 'Hector', 'Belmonte', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(135, '14756425l', 'kevin', 'Martinez', 'Escribano', 'usua95f', NULL, '', 2, 0, ''),
(136, '54698532o', 'kevin', 'Pozuelo', 'Escribano', 'usuar5', NULL, '', NULL, 0, ''),
(137, '04631408j', 'Alex', 'Martinez', 'Pozuelo', 'us2', NULL, '', NULL, 0, ''),
(138, '14756425l', 'Maria', 'Martinez', 'Perez', 'usu435', NULL, '', 2, 0, ''),
(139, '54698532o', 'kevin', 'Pozuelo', 'Pozuelo', 'usuar5', NULL, '', 2, 0, ''),
(140, '04631408j', 'Pedro', 'Gomez', 'Pozuelo', 'usuar5', NULL, '', NULL, 0, ''),
(141, '54698532o', 'Marcos', 'Pozuelo', 'Martinez', 'usua95f', NULL, '', 2, 0, ''),
(142, '54698532o', 'Hector', 'Escribano', 'Belmonte', 'usua95f', NULL, '', NULL, 0, ''),
(143, '14756425l', 'Pedro', 'Martinez', 'Martinez', 'usuar5', NULL, '', NULL, 0, ''),
(144, '7845162f', 'Hector', 'Perez', 'Belmonte', 'usu435', NULL, '', NULL, 0, ''),
(145, '7845162f', 'Maria', 'Pozuelo', 'Gomez', 'usuar5', NULL, '', 2, 0, ''),
(146, '14756425l', 'kevin', 'Martinez', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(147, '14756425l', 'kevin', 'Escribano', 'Martinez', 'usuar5', NULL, '', 2, 0, ''),
(148, '04631408j', 'Hector', 'Martinez', 'Perez', 'usu435', NULL, '', 2, 0, ''),
(149, '54698532o', 'Alex', 'Martinez', 'Escribano', 'us2', NULL, '', NULL, 0, ''),
(150, '7845162f', 'Marcos', 'Gomez', 'Martinez', 'usu435', NULL, '', NULL, 0, ''),
(151, '54698532o', 'kevin', 'Pozuelo', 'Gomez', 'usua6', NULL, '', 2, 0, ''),
(152, '7845162f', 'Lidia', 'Perez', 'Escribano', 'usu435', NULL, '', NULL, 0, ''),
(153, '54698532o', 'Lidia', 'Perez', 'Martinez', 'usua95f', NULL, '', 2, 0, ''),
(154, '54698532o', 'Hector', 'Escribano', 'Escribano', 'usua6', NULL, '', NULL, 0, ''),
(155, '04631408j', 'Lidia', 'Martinez', 'Gomez', 'usu435', NULL, '', NULL, 0, ''),
(156, '7845162f', 'Alex', 'Pozuelo', 'Pozuelo', 'us2', NULL, '', NULL, 0, ''),
(157, '54698532o', 'Lidia', 'Pozuelo', 'Perez', 'us2', NULL, '', NULL, 0, ''),
(158, '7845162f', 'Marcos', 'Belmonte', 'Gomez', 'usu435', NULL, '', NULL, 0, ''),
(159, '54698532o', 'Hector', 'Perez', 'Pozuelo', 'us2', NULL, '', NULL, 0, ''),
(160, '54698532o', 'Maria', 'Perez', 'Pozuelo', 'usu435', NULL, '', 2, 0, ''),
(161, '14756425l', 'kevin', 'Escribano', 'Gomez', 'usua6', NULL, '', NULL, 0, ''),
(162, '14756425l', 'Alex', 'Pozuelo', 'Pozuelo', 'usua6', NULL, '', 2, 0, ''),
(163, '7845162f', 'kevin', 'Belmonte', 'Gomez', 'usuar5', NULL, '', 2, 0, ''),
(164, '04631408j', 'Maria', 'Pozuelo', 'Gomez', 'usua6', NULL, '', NULL, 0, ''),
(165, '54698532o', 'Pedro', 'Escribano', 'Pozuelo', 'usua6', NULL, '', 2, 0, ''),
(166, 'null', 'null', 'null', 'null', 'sergio', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_aries98@hotmail.com', 2, 0, ''),
(167, 'null', 'null', 'null', 'null', 'sergio', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_aries98@hotmail.com', 2, 0, ''),
(168, 'null', 'null', 'null', 'null', 'sergio', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_aries98@hotmail.es', 2, 0, ''),
(169, 'null', 'null', 'null', 'null', 'sergioasd', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio@gmai.com', 2, 0, ''),
(170, 'null', 'null', 'null', 'null', 'seasfhioas', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'saesrfa@gaksjd.cs', 2, 0, ''),
(171, 'null', 'null', 'null', 'null', 'asfasfhjkbasd', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'seasfj@gma.com', 2, 0, ''),
(172, 'null', 'null', 'null', 'null', 'asfhioas', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'asd@gmail.cas', 2, 0, ''),
(173, 'null', 'null', 'null', 'null', 'seasdjopfas', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'seeasfd@gas.cs', 2, 0, ''),
(174, 'null', 'null', 'null', 'null', 'saegjoas', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sadaake@fas.cos', 2, 0, ''),
(175, 'null', 'null', 'null', 'null', 'cajskjflasd', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'asflaksdd', 2, 0, ''),
(176, 'null', 'null', 'null', 'null', 'sergiodfgs', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'jaskdlasd', 2, 0, ''),
(177, 'null', 'null', 'null', 'null', 'safjiasdk', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'ñaskjdfdasd', 2, 0, ''),
(178, 'null', 'null', 'null', 'null', 'sdafgasdf', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'asfasfas', 2, 0, ''),
(179, 'null', 'null', 'null', 'null', 'asfasdasd', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'asfasfasf', 2, 0, ''),
(180, 'null', 'null', 'null', 'null', 'saaildhjasod', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'asfjasfdasd', 2, 0, ''),
(181, 'null', 'null', 'null', 'null', 'sergioasda', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_aries9asdas8@hotmail.com', 2, 0, ''),
(182, 'null', 'null', 'null', 'null', 'sergioadasfasd', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_ariesasdasd98@hotmail.com', 2, 0, ''),
(183, 'null', 'null', 'null', 'null', 'sergiafsdfdf', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_aries98asd@hotmail.com', 2, 0, ''),
(184, 'null', 'null', 'null', 'null', 'sassad', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_aries98@hotmasdasdl.com', 2, 0, ''),
(185, 'null', 'null', 'null', 'null', 'sadasd', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'fsdafsa', 2, 0, ''),
(186, 'null', 'null', 'null', 'null', 'sadasfasd', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sdasdaDA', 2, 0, ''),
(187, 'null', 'null', 'null', 'null', 'asxfasf', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'asfasfasc', 2, 0, ''),
(188, 'null', 'null', 'null', 'null', 'sadfsafsa', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'asffasfasf', 2, 0, ''),
(189, 'null', 'null', 'null', 'null', 'fdsgasfasd', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'dsfsdfas', 2, 0, ''),
(190, 'null', 'null', 'null', 'null', 'sergiodfg', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_arisadases98@hotmail.com', 2, 0, ''),
(191, 'null', 'null', 'null', 'null', 'sergioasdfdf', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_ariesfasdas98@hotmail.com', 2, 0, ''),
(192, 'null', 'null', 'null', 'null', 'serafjklas', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergio_ariasdasfes98@hotmail.com', 2, 0, ''),
(193, 'null', 'null', 'null', 'null', 'sergiodsffgs', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'aslfasdfgd', 2, 0, ''),
(194, 'null', 'null', 'null', 'null', 'xzvzxvzx', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'czczxbzxcvzc', 2, 0, ''),
(195, 'null', 'null', 'null', 'null', 'sadasfdsf', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sdasfdsasf', 2, 0, ''),
(196, 'null', 'null', 'null', 'null', 'fgdgassfAS', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'dsfasfasfas', 2, 0, ''),
(197, 'null', 'null', 'null', 'null', 'alemagno', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'alemagno@gmail.com', 2, 0, ''),
(198, 'null', 'null', 'null', 'null', 'askgfjjmas', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'asñflasdasf', 2, 0, ''),
(199, 'null', 'null', 'null', 'null', 'sgasdldkaj', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'ñaslkfasfas', 2, 0, ''),
(200, 'null', 'null', 'null', 'null', 'sergiolas', 'DA8AB09AB4889C6208116A675CAD0B13E335943BD7FC418782D054B32FDFBA04', 'sergiolas@gmail.com', 2, 0, ''),
(201, 'null', 'null', 'null', 'null', 'sergjasko', 'asofljas', 'qlañskfasfas', 2, 0, 'null'),
(203, 'null', 'null', 'null', 'null', 'Javier96', 'javier', 'javiroigdomenech@hotmail.com', 2, 0, 'zOgnrx0oB5hgNdqdNAHX'),
(207, 'null', 'null', 'null', 'null', 'fondoverde', '36033babfb48ec64e197c97fb40d65e6c79f81e04c61aeccef3009e01645ab8d', 'fondoverdemilitar8@gmail.com', 2, 1, 'BtaiR2sUrwTQZ6bUOAd9'),
(209, 'null', 'sdfgsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'null', 'null', 2, 0, 'null'),
(210, 'null', 'sadas', 'asdasd', 'asdasd', 'asdasd', 'null', 'null', 2, 0, 'null');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_factura_usuario1_idx` (`id_usuario`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_linea_producto1_idx` (`id_producto`),
  ADD KEY `fk_linea_factura1_idx` (`id_factura`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_tipoProducto1_idx` (`id_tipoproducto`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_tipoUsuario_idx` (`id_tipousuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `linea`
--
ALTER TABLE `linea`
  ADD CONSTRAINT `fk_linea_factura1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_linea_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_tipoProducto1` FOREIGN KEY (`id_tipoproducto`) REFERENCES `tipoproducto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipoUsuario` FOREIGN KEY (`id_tipousuario`) REFERENCES `tipousuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
