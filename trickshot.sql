-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-05-2019 a las 06:12:47
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
-- Base de datos: `trickshot`
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
(1, 'Nike React Element 55.jpg', '¡Descubre las nuevas Nike React Element 55!', 'Las Nike React Element 55 son una combinacion equilibrada de diseño clasico y de innovación para el futuro. La espuma Nike React proporciona una comodidad ligera y elastica, mientras que las almohadillas de goma y la suela exterior extra grande ofrecen un look innovador que llama la atención.                                      \n                                                    \nUN EXPERIMENTO QUE SALIO BIEN.\nLas Nike React Element 55 son una combinacion equilibrada de diseño clasico y de innovacion para el futuro. La espuma Nike React proporciona una comodidad ligera y elastica, mientras que las almohadillas de goma y la suela exterior extragrande ofrecen un look innovador que llama la atención.', 'Zapatillas, Hombre, Mujer', 1, '2019-05-30 00:00:00'),
(2, 'EquipacionNegraValencia.png', 'Compra ya la nueva equipacion del Valencia CF', 'La camiseta de la equipación Valencia CF 2019/20 Stadium Home combina detalles del equipo con un tejido supertranspirable para mantener la frescura y la transpirabilidad en el campo o en las gradas cuando animas a tu equipo.\nNo esperes más y apoya a tu equipo con su escudo en el pecho.', 'Adidas, ValenciaCF, Futbol, Deporte', 1, '2019-05-30 00:00:00'),
(3, 'Nike-Pegasus-36-Trail-2.jpg', 'Las Nike Air Zoom Pegasus 36 Trail vuelven...', 'Cambia el asfalto por los caminos con las icónicas Nike Air Zoom Pegasus 36 Trail. Dale a tus pies un poco de aire fresco con la malla perforada de la parte superior, al tiempo que las unidades Zoom Air dobles de la planta del pie amortiguan tu pisada. La suela exterior cuenta con agarres contrapuestos que optimizan la tracción al subir cuestas.', 'Nike, Zapatillas, Running', 1, '2019-05-30 00:00:00'),
(4, 'SudaderaLilPeep.jpg', 'Nueva sudadera Hip-Hop Lil Peep ya en nuestra tienda', 'Por fin ha llegado lo que todos esperabais, ya esta aquí la sudadera Hip-Hop de Lil Peep a un precio rebajado para los primeras 3.000 unidades. Registrate , entra en tu cuenta y busca el producto. ¿Conseguirás ser de los primeros? Rápido a que esperas, te están adelantando por izquierda y derecha...', 'Hip-Hop, Lil Peep, Adidas, Sudadera', 1, '2019-05-30 00:00:00'),
(5, 'AtletismoNike.jpg', '¡Descubre nuestras nuevas equipaciones para Atletismo!', 'Trickshot puede ofrecer equipaciones para todo tipo de deportes, hoy, hablaremos de nuestras equipaciones de atletismo. Fabricamos las equipaciones totalmente personalizadas mediante sublimación, con la posibilidad de realizar cualquier diseño o modelo que necesite cada club.\n\nNuestras equipaciones están fabricadas con ”Quick dry“ una avanzada tecnología, que transporta la humedad del sudor desde la piel al exterior, la base de micro fibras absorbe la transpiración del cuerpo para dar una mayor comodidad al deportista.', 'Adidas, Nike, Atletismo, Running', 1, '2019-05-30 00:00:00');

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
(3, '2018-12-20 00:00:00', 21, 2),
(4, '2018-12-20 00:00:00', 21, 4),
(5, '2018-12-20 00:00:00', 21, 2),
(11, '2019-04-15 00:00:00', 21, 1),
(33, '2019-05-27 00:00:00', 21, 4);

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
(1, 412124, 20, NULL),
(2, 35, 40, NULL),
(3, 25, 20, NULL),
(4, 35, 40, NULL),
(5, 25, 14, NULL),
(6, 32, 33, NULL),
(7, 5, 20, NULL),
(8, 35, 35, NULL),
(9, 2, 9, NULL),
(10, 33, 36, NULL),
(11, 2, NULL, NULL),
(12, 5, 36, NULL),
(13, 10, 41, NULL),
(14, 32, 33, NULL),
(15, 5, 18, NULL),
(16, 35, 27, NULL),
(17, 3, 5, 3),
(19, 2, 6, 3),
(20, 1, 6, 4),
(21, 1, 8, 4),
(22, 2, 9, 4),
(23, 1, 11, 5),
(24, 1, 10, 5),
(25, 1, 12, 5),
(26, 1, 13, 5),
(27, 1, 6, NULL),
(28, 1, 8, NULL),
(29, 1, 13, NULL),
(30, 1, 12, NULL),
(31, 2, 11, NULL),
(32, 2, 10, NULL),
(33, 3, 14, NULL),
(34, 2, 6, NULL),
(35, 1, 11, NULL),
(36, 1, 10, NULL),
(37, 2, 6, NULL),
(38, 2, 8, NULL),
(39, 1, 14, NULL),
(40, 5, 6, NULL),
(41, 4, 6, 11),
(42, 21, NULL, NULL),
(44, 20, 6, NULL),
(46, 5, 17, NULL),
(47, 1000, 6, NULL),
(48, 50, 25, NULL),
(49, 324, 6, NULL),
(50, 6, 6, NULL),
(51, 241, 45, NULL),
(52, 21, 6, NULL),
(53, 24, 6, NULL),
(54, 4, 6, NULL),
(55, 1, 8, NULL),
(56, 3, 6, NULL),
(57, 2, 6, NULL),
(58, 2, 6, NULL),
(59, 6, 6, 33),
(60, 1, 15, 33),
(61, 3, 6, NULL),
(62, 7, 6, NULL),
(63, 2, 6, NULL),
(64, 2, 6, NULL),
(65, 4, 6, NULL),
(66, 12, 8, NULL),
(67, 3, 6, NULL),
(68, 4, 10, NULL),
(69, 5, 9, NULL),
(72, 2, 5, NULL),
(73, 1, 6, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` longtext COLLATE utf8_unicode_ci,
  `desc` longtext COLLATE utf8_unicode_ci,
  `existencias` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `foto` longtext COLLATE utf8_unicode_ci,
  `id_tipoproducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `desc`, `existencias`, `precio`, `foto`, `id_tipoproducto`) VALUES
(1, 'Nike React Element 55', 'Las Nike React Element 55 son una combinación equilibrada de diseño clásico y de innovación para el futuro. La espuma Nike React proporciona una comodidad ligera y elástica, mientras que las almohadillas de goma y la suela exterior extragrande ofrecen un look innovador que llama la atención.\n\nColor mostrado: Negro/Rosa activo/Blanco/Negro\nModelo: CD6964-001', 2000, 130, 'NRE551.png', 1),
(2, 'Nike React Element 55', 'Las Nike React Element 55 son una combinación equilibrada de diseño clásico y de innovación para el futuro. La espuma Nike React proporciona una comodidad ligera y elástica, mientras que las almohadillas de goma y la suela exterior extragrande ofrecen un look innovador que llama la atención.\r\n\r\nColor mostrado: Negro/Rosa activo/Blanco/Negro\r\nModelo: CD6964-001', 2000, 130, 'NRE551.png', 1),
(3, 'Nike React Element 55', 'Las Nike React Element 55 son una combinación equilibrada de diseño clásico y de innovación para el futuro. La espuma Nike React proporciona una comodidad ligera y elástica, mientras que las almohadillas de goma y la suela exterior extragrande ofrecen un look innovador que llama la atención.\r\n\r\nColor mostrado: Negro/Rosa activo/Blanco/Negro\r\nModelo: CD6964-001', 2000, 130, 'NRE551.png', 1),
(4, 'Nike React Element 55', 'Las Nike React Element 55 son una combinación equilibrada de diseño clásico y de innovación para el futuro. La espuma Nike React proporciona una comodidad ligera y elástica, mientras que las almohadillas de goma y la suela exterior extragrande ofrecen un look innovador que llama la atención.\r\n\r\nColor mostrado: Negro/Rosa activo/Blanco/Negro\r\nModelo: CD6964-001', 2000, 130, 'NRE551.png', 1),
(5, 'Nike React Element 55', 'Las Nike React Element 55 son una combinación equilibrada de diseño clásico y de innovación para el futuro. La espuma Nike React proporciona una comodidad ligera y elástica, mientras que las almohadillas de goma y la suela exterior extragrande ofrecen un look innovador que llama la atención.\r\n\r\nColor mostrado: Negro/Rosa activo/Blanco/Negro\r\nModelo: CD6964-001', 2000, 130, 'NRE551.png', 1),
(6, 'MOCHILA NIKE AZUL', 'La mochila Nike para niño/a cuenta con correas para los hombros regulables y acolchadas y múltiples compartimentos para un transporte cómodo y un espacio organizado.\n\nColor mostrado: Fuerza índigo/Naranja Energía/Gris vasto\nModelo: BA5405-439', 2000, 60, 'MochilaAzulNike.jpg', 8),
(7, 'NIKE JR. MERCURIAL SUPERF', 'Las botas de fútbol Nike Jr. Mercurial Superfly VI Academy By You proporcionan un toque del balón excelente y una tracción segura que favorece la aceleración y los cambios de dirección rápidos en diferentes tipos de condiciones. Añade el color a tu gusto desde el primer elemento hasta el último y dales tu toque personal con una bandera y un texto personalizado.\n\nTecnología Dynamic Fit Collar en la zona del tobillo para una comodidad segura.\nPlaca de tracción para múltiples superficies para uso en campos de hierba corta o superficies artificiales.\nParte superior de tela y material sintético para una mayor durabilidad.\nPlantilla suave para una amortiguación de perfil bajo.', 5000, 90, 'BotasBlancaRojaNike.png', 4),
(8, 'CHELSEA FC 19/20 STADIUM', 'La camiseta de la 1ª equipación Chelsea FC Stadium combina detalles del equipo con un tejido supertranspirable para mantener la frescura y la transpirabilidad en el campo o en las gradas al animar al equipo. El diseño está inspirado en los elementos icónicos de Stamford Bridge, hogar de los Azules desde 1905.\n\nVENTAJAS\n\nTejido Nike Breathe para mantener la transpirabilidad y la comodidad.\nTecnología Dri-FIT para mantener la transpirabilidad y la comodidad.\nEscudo del Chelsea y colores de la 1ª equipación para que muestres el orgullo que sientes por el equipo.\nDETALLES DEL PRODUCTO\n\nAjuste estándar para un toque holgado y cómodo\nTejido: 100 % poliéster reciclado\nLavar a máquina\nDe importación', 500, 90, 'EquipacionChelsea.png', 3),
(9, 'Nike Sportswear', 'La sudadera Nike Sportswear está diseñada con un logotipo Swoosh que cruza el pecho y el brazo para ofrecer un look innovador.\n\nColor mostrado: Mirada Rosa/Negro/Gris oscuro/Mirada Rosa\nModelo: AR3088-668', 500, 60, 'SudaderaNikeGrisRosa.png', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `id` int(11) NOT NULL,
  `desc` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`id`, `desc`) VALUES
(1, 'Zapatillas'),
(2, 'Sudadera'),
(3, 'Equipación'),
(4, 'Botas'),
(5, 'Camiseta'),
(6, 'Pantalon'),
(7, 'Chaqueta'),
(8, 'Mochila');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `desc` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `desc`) VALUES
(1, 'Administrador'),
(2, 'Usuario'),
(3, 'Invitado'),
(4, 'Visitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `dni` longtext COLLATE utf8_unicode_ci,
  `nombre` longtext COLLATE utf8_unicode_ci,
  `ape1` longtext COLLATE utf8_unicode_ci,
  `ape2` longtext COLLATE utf8_unicode_ci,
  `login` longtext COLLATE utf8_unicode_ci,
  `pass` longtext COLLATE utf8_unicode_ci,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id_tipousuario` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `code` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `dni`, `nombre`, `ape1`, `ape2`, `login`, `pass`, `email`, `id_tipousuario`, `active`, `code`) VALUES
(1, '23315568P', 'Sergio', 'Añon', 'Sevilla', 'sergio', 'd04862e82901e105156279e4378d852b412bafa3cf4bde902460d2a9c9fa5293', 'sergio_aries98@hotmail.com', 1, 1, 'p3IEVU7G4qK1ytllLLcW'),
(2, '00000000A', 'Usuario', 'De', 'Prueba', 'usuario', 'f89ca8f7530958a50c0ec892d7e99c64c1a9e3b976d31169770e3618875874c7', 'usuario@compania.com', 2, 1, 'null'),
(4, '00000000C', 'UsuarioDos', 'De', 'Prueba', 'usuario2', 'null', 'null', 2, 1, 'null'),
(6, '00000000C', 'UsuarioTres', 'De', 'Prueba', 'usuario3', 'f89ca8f7530958a50c0ec892d7e99c64c1a9e3b976d31169770e3618875874c7', 'usuario3@compania.com', 2, 1, 'null');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
