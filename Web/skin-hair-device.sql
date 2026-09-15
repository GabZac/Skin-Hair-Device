-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2026 a las 21:59:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `skin-hair-device`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`, `orden`) VALUES
(1, 'facial', 'Productos para el cuidado facial', 1),
(2, 'corporal', 'Productos para el cuidado corporal', 2),
(3, 'cabello', 'Productos para el cuidado del cabello', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id_favorito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formularios`
--

CREATE TABLE `formularios` (
  `id_formulario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_completado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_respuesta`
--

CREATE TABLE `opciones_respuesta` (
  `id_opcion` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `letra` varchar(5) NOT NULL,
  `texto_opcion` text NOT NULL,
  `tag` varchar(100) NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opciones_respuesta`
--

INSERT INTO `opciones_respuesta` (`id_opcion`, `id_pregunta`, `letra`, `texto_opcion`, `tag`, `orden`) VALUES
(1, 1, 'A', 'Con brillo aceitoso en todo el rostro y poros abiertos.', 'facial_grasa', 1),
(2, 1, 'B', 'Tirante, opaca y con descamación.', 'facial_seca', 2),
(3, 1, 'C', 'Con brillo en la zona T (frente/nariz) pero seca o normal en las mejillas.', 'facial_mixta', 3),
(4, 1, 'D', 'Normal y equilibrada.', 'facial_normal', 4),
(5, 2, 'A', 'Granitos activos, puntos negros o acné.', 'facial_acne', 1),
(6, 2, 'B', 'Manchas oscuras o tono desparejo.', 'facial_manchas', 2),
(7, 2, 'C', 'Arrugas, líneas de expresión o flacidez.', 'facial_envejecimiento', 3),
(8, 2, 'D', 'Rojez, ardor o sensibilidad extrema.', 'facial_sensible', 4),
(9, 2, 'E', 'Ninguna, busco cuidado básico.', 'facial_basico', 5),
(10, 3, 'A', 'En los pies o talones.', 'corporal_pies', 1),
(11, 3, 'B', 'En las manos.', 'corporal_manos', 2),
(12, 3, 'C', 'En las piernas o brazos.', 'corporal_piernas_brazos', 3),
(13, 3, 'D', 'En ninguna, tengo la piel del cuerpo bien.', 'corporal_normal', 4),
(14, 4, 'A', 'En el pecho o abdomen.', 'corporal_pecho_abdomen', 1),
(15, 4, 'B', 'En los brazos o piernas.', 'corporal_brazos_piernas', 2),
(16, 4, 'C', 'No tengo este problema.', 'corporal_sin_textura', 3),
(17, 5, 'A', 'Sensibilidad, sequedad o propensión a irritaciones.', 'corporal_intimo_sensible', 1),
(18, 5, 'B', 'Solo busco un jabón de cuidado diario equilibrado.', 'corporal_intimo_normal', 2),
(19, 6, 'A', 'Muy graso, se ensucia el mismo día del lavado.', 'cabello_cc_graso', 1),
(20, 6, 'B', 'Seco, me pica y a veces se descama.', 'cabello_cc_seco', 2),
(21, 6, 'C', 'Con caspa visible.', 'cabello_cc_caspa', 3),
(22, 6, 'D', 'Normal o equilibrado.', 'cabello_cc_normal', 4),
(23, 7, 'A', 'Está opaco y sin movimiento, pero no está roto.', 'cabello_necesita_hidratacion', 1),
(24, 7, 'B', 'Está duro, áspero, con frizz y cuesta desenredarlo.', 'cabello_necesita_nutricion', 2),
(25, 7, 'C', 'Está quebradizo, elástico, decolorado o destruido por químicos.', 'cabello_necesita_reparacion', 3),
(26, 7, 'D', 'Está sano y con brillo.', 'cabello_sano', 4),
(27, 8, 'A', 'Sí, se cae mucho desde la raíz o está cada vez más finito.', 'cabello_anticaida', 1),
(28, 8, 'B', 'No, tiene fuerza y cantidad normal.', 'cabello_fuerte', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `bloque` varchar(50) NOT NULL,
  `numero_pregunta` int(11) NOT NULL,
  `texto_pregunta` text NOT NULL,
  `tipo_pregunta` enum('simple','multiple') DEFAULT 'simple',
  `orden` int(11) NOT NULL,
  `activa` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id_pregunta`, `bloque`, `numero_pregunta`, `texto_pregunta`, `tipo_pregunta`, `orden`, `activa`) VALUES
(1, 'facial', 1, '¿Cómo sentís la piel de tu rostro la mayor parte del día?', 'simple', 1, 1),
(2, 'facial', 2, '¿Cuál de estas afecciones específicas presenta tu rostro actualmente?', 'simple', 2, 1),
(3, 'corporal', 3, '¿En qué zonas del cuerpo solés tener resequedad extrema, grietas o descamación?', 'multiple', 3, 1),
(4, 'corporal', 4, '¿Presentás granitos, vellos encarnados o textura rugosa en alguna de estas áreas?', 'simple', 4, 1),
(5, 'corporal', 5, 'Para tu zona íntima, ¿presentás alguna necesidad particular actual?', 'simple', 5, 1),
(6, 'cabello', 6, '¿Cuál es la condición principal de tu cuero cabelludo?', 'simple', 6, 1),
(7, 'cabello', 7, 'Si mirás y tocás el largo y las puntas de tu pelo, ¿cómo lo describirías?', 'simple', 7, 1),
(8, 'cabello', 8, '¿Notás debilidad en el agarre de tu pelo o que perdió volumen?', 'simple', 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `categoria_tipo` enum('facial','corporal','cabello') NOT NULL,
  `id_subcategoria` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `marca`, `precio`, `imagen_url`, `stock`, `categoria_tipo`, `id_subcategoria`, `activo`, `fecha_creacion`) VALUES
(1, 'CeraVe Gel Limpiador Espumoso (473ml)', 'Limpiador en gel para pieles normales a grasas. Elimina el exceso de sebo y refresca la barrera cutánea.', 'CeraVe', 63135.00, 'https://example.com', 50, 'facial', 1, 1, '2026-09-15 19:23:08'),
(2, 'CeraVe Loción Hidratante Facial de Noche PM (52ml)', 'Fórmula ligera libre de aceites con 3 ceramidas esenciales, ácido hialurónico y niacinamida.', 'CeraVe', 42816.00, 'https://example.com', 35, 'facial', 2, 1, '2026-09-15 19:23:08'),
(3, 'La Roche-Posay Effaclar Duo+M (40ml)', 'Tratamiento triple corrección anti-imperfecciones para pieles con tendencia acneica y puntos negros.', 'La Roche-Posay', 48500.00, 'https://example.com', 20, 'facial', 3, 1, '2026-09-15 19:23:08'),
(4, 'ISDIN Fotoprotector Fusion Fluid SPF 50+ (50ml)', 'Protector solar facial de textura fluida ultraligera que se funde con la piel aportando un acabado matificante.', 'ISDIN', 68347.80, 'https://example.com', 40, 'facial', 4, 1, '2026-09-15 19:23:08'),
(5, 'CeraVe Crema Renovadora de Pies (88ml)', 'Exfolia, hidrata y suaviza la piel extremadamente seca, agrietada y rugosa de los pies.', 'CeraVe', 22500.00, 'https://example.com', 15, 'corporal', 1, 1, '2026-09-15 19:23:08'),
(6, 'Eucerin Crema de Manos Advanced Repair (78g)', 'Fórmula enriquecida con ceramidas y factores naturales de hidratación para manos muy secas.', 'Eucerin', 19800.00, 'https://example.com', 25, 'corporal', 2, 1, '2026-09-15 19:23:08'),
(7, 'Eucerin UreaRepair PLUS Loción 10% Urea (250ml)', 'Alivio inmediato de la tirantez y descamación extrema en piernas y brazos. Hidratación por 48 horas.', 'Eucerin', 39500.00, 'https://example.com', 30, 'corporal', 3, 1, '2026-09-15 19:23:08'),
(8, 'Eucerin DermoPure Gel Limpiador Triple Efecto (200ml)', 'Gel de limpieza corporal y facial con ácido salicílico ideal para reducir granitos y textura en pecho y espalda.', 'Eucerin', 34200.00, 'https://example.com', 18, 'corporal', 4, 1, '2026-09-15 19:23:08'),
(9, 'Lactacyd Íntimo Delicado (200ml)', 'Gel de higiene íntima diaria formulado con ácido láctico biológico. Respeta el equilibrio natural.', 'Lactacyd', 14500.00, 'https://example.com', 22, 'corporal', 6, 1, '2026-09-15 19:23:08'),
(10, 'Vichy Dercos Shampoo Anticaspa DS (200ml)', 'Elimina hasta el 100% de la caspa visible desde la primera aplicación y calma la picazón del cuero cabelludo.', 'Vichy', 36000.00, 'https://example.com', 28, 'cabello', 1, 1, '2026-09-15 19:23:08'),
(11, 'Kérastase Nutritive Masquintense (200ml)', 'Tratamiento de nutrición profunda y ultra-concentrada para cabellos extremadamente secos y con frizz.', 'Kérastase', 62000.00, 'https://example.com', 12, 'cabello', 5, 1, '2026-09-15 19:23:08'),
(12, 'L\'Oréal Professionnel Absolut Repair Gold Mask (250ml)', 'Máscara de reparación instantánea para cabellos destruidos, quebradizos o dañados por procesos químicos.', 'L\'Oréal Professionnel', 45000.00, 'https://example.com', 15, 'cabello', 6, 1, '2026-09-15 19:23:08'),
(13, 'Kérastase Genesis Serum Anti-Chute Fortifiant (90ml)', 'Sérum diario anticaída para cabello debilitado que frena la caída desde la raíz y maximiza el volumen.', 'Kérastase', 78000.00, 'https://example.com', 10, 'cabello', 7, 1, '2026-09-15 19:23:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendaciones`
--

CREATE TABLE `recomendaciones` (
  `id_recomendacion` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `puntuacion` int(11) DEFAULT 100,
  `fecha_generacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas_formulario`
--

CREATE TABLE `respuestas_formulario` (
  `id_respuesta` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `fecha_respuesta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias_cabello`
--

CREATE TABLE `subcategorias_cabello` (
  `id_subcategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategorias_cabello`
--

INSERT INTO `subcategorias_cabello` (`id_subcategoria`, `nombre`, `descripcion`) VALUES
(1, 'shampoo', 'Shampoos para todo tipo de cabello'),
(2, 'acondicionador', 'Acondicionadores'),
(3, 'tratamiento_cuero_cabelludo', 'Tratamientos específicos para cuero cabelludo'),
(4, 'tratamiento_hidratacion', 'Tratamientos hidratantes'),
(5, 'tratamiento_nutricion', 'Tratamientos nutritivos'),
(6, 'tratamiento_reparacion', 'Tratamientos reparadores'),
(7, 'tratamiento_anticaida', 'Tratamientos anticaída y crecimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias_corporal`
--

CREATE TABLE `subcategorias_corporal` (
  `id_subcategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategorias_corporal`
--

INSERT INTO `subcategorias_corporal` (`id_subcategoria`, `nombre`, `descripcion`) VALUES
(1, 'crema_pies', 'Cremas y tratamientos para pies'),
(2, 'crema_manos', 'Cremas y tratamientos para manos'),
(3, 'crema_cuerpo', 'Cremas corporales generales'),
(4, 'limpieza_corporal', 'Geles y jabones corporales'),
(5, 'exfoliantes_corporales', 'Exfoliantes y scrubs'),
(6, 'intimo', 'Jabones y productos para zona íntima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias_facial`
--

CREATE TABLE `subcategorias_facial` (
  `id_subcategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategorias_facial`
--

INSERT INTO `subcategorias_facial` (`id_subcategoria`, `nombre`, `descripcion`) VALUES
(1, 'limpieza_facial', 'Limpiadores y jabones faciales'),
(2, 'hidratacion_facial', 'Cremas y lociones hidratantes'),
(3, 'tratamiento_facial', 'Serums, ácidos y tratamientos específicos'),
(4, 'protector_solar_facial', 'Protección solar facial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags_productos`
--

CREATE TABLE `tags_productos` (
  `id_tag_producto` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tags_productos`
--

INSERT INTO `tags_productos` (`id_tag_producto`, `id_producto`, `tag`) VALUES
(1, 1, 'facial_grasa'),
(2, 1, 'facial_mixta'),
(3, 2, 'facial_seca'),
(4, 2, 'facial_normal'),
(5, 3, 'facial_acne'),
(6, 4, 'facial_sensible'),
(7, 4, 'facial_envejecimiento'),
(8, 5, 'corporal_pies'),
(9, 6, 'corporal_manos'),
(10, 7, 'corporal_piernas_brazos'),
(11, 8, 'corporal_pecho_abdomen'),
(12, 8, 'corporal_brazos_piernas'),
(13, 9, 'corporal_intimo_sensible'),
(14, 9, 'corporal_intimo_normal'),
(15, 10, 'cabello_cc_caspa'),
(16, 10, 'cabello_cc_graso'),
(17, 11, 'cabello_necesita_nutricion'),
(18, 12, 'cabello_necesita_reparacion'),
(19, 13, 'cabello_anticaida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id_favorito`),
  ADD UNIQUE KEY `unique_favorito` (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `formularios`
--
ALTER TABLE `formularios`
  ADD PRIMARY KEY (`id_formulario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `opciones_respuesta`
--
ALTER TABLE `opciones_respuesta`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `idx_categoria` (`categoria_tipo`,`id_subcategoria`);

--
-- Indices de la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  ADD PRIMARY KEY (`id_recomendacion`),
  ADD UNIQUE KEY `unique_recomendacion` (`id_formulario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `respuestas_formulario`
--
ALTER TABLE `respuestas_formulario`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `id_opcion` (`id_opcion`);

--
-- Indices de la tabla `subcategorias_cabello`
--
ALTER TABLE `subcategorias_cabello`
  ADD PRIMARY KEY (`id_subcategoria`);

--
-- Indices de la tabla `subcategorias_corporal`
--
ALTER TABLE `subcategorias_corporal`
  ADD PRIMARY KEY (`id_subcategoria`);

--
-- Indices de la tabla `subcategorias_facial`
--
ALTER TABLE `subcategorias_facial`
  ADD PRIMARY KEY (`id_subcategoria`);

--
-- Indices de la tabla `tags_productos`
--
ALTER TABLE `tags_productos`
  ADD PRIMARY KEY (`id_tag_producto`),
  ADD KEY `idx_tag` (`tag`),
  ADD KEY `idx_producto` (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formularios`
--
ALTER TABLE `formularios`
  MODIFY `id_formulario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opciones_respuesta`
--
ALTER TABLE `opciones_respuesta`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  MODIFY `id_recomendacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuestas_formulario`
--
ALTER TABLE `respuestas_formulario`
  MODIFY `id_respuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategorias_cabello`
--
ALTER TABLE `subcategorias_cabello`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `subcategorias_corporal`
--
ALTER TABLE `subcategorias_corporal`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `subcategorias_facial`
--
ALTER TABLE `subcategorias_facial`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tags_productos`
--
ALTER TABLE `tags_productos`
  MODIFY `id_tag_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `formularios`
--
ALTER TABLE `formularios`
  ADD CONSTRAINT `formularios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `opciones_respuesta`
--
ALTER TABLE `opciones_respuesta`
  ADD CONSTRAINT `opciones_respuesta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`) ON DELETE CASCADE;

--
-- Filtros para la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  ADD CONSTRAINT `recomendaciones_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id_formulario`) ON DELETE CASCADE,
  ADD CONSTRAINT `recomendaciones_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `respuestas_formulario`
--
ALTER TABLE `respuestas_formulario`
  ADD CONSTRAINT `respuestas_formulario_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id_formulario`) ON DELETE CASCADE,
  ADD CONSTRAINT `respuestas_formulario_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`),
  ADD CONSTRAINT `respuestas_formulario_ibfk_3` FOREIGN KEY (`id_opcion`) REFERENCES `opciones_respuesta` (`id_opcion`);

--
-- Filtros para la tabla `tags_productos`
--
ALTER TABLE `tags_productos`
  ADD CONSTRAINT `tags_productos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
