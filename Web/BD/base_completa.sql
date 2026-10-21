CREATE DATABASE IF NOT EXISTS `skin-hair device` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `skin-hair device`;
SET NAMES utf8mb4;









SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

















CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;





INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`, `orden`) VALUES
(1, 'facial', 'Productos para el cuidado facial', 1),
(2, 'corporal', 'Productos para el cuidado corporal', 2),
(3, 'cabello', 'Productos para el cuidado del cabello', 3);







CREATE TABLE `favoritos` (
  `id_favorito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;







CREATE TABLE `formularios` (
  `id_formulario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_completado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;







CREATE TABLE `opciones_respuesta` (
  `id_opcion` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `letra` varchar(5) NOT NULL,
  `texto_opcion` text NOT NULL,
  `tag` varchar(100) NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;





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







CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `bloque` varchar(50) NOT NULL,
  `numero_pregunta` int(11) NOT NULL,
  `texto_pregunta` text NOT NULL,
  `tipo_pregunta` enum('simple','multiple') DEFAULT 'simple',
  `orden` int(11) NOT NULL,
  `activa` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;





INSERT INTO `preguntas` (`id_pregunta`, `bloque`, `numero_pregunta`, `texto_pregunta`, `tipo_pregunta`, `orden`, `activa`) VALUES
(1, 'facial', 1, '¿Cómo sentís la piel de tu rostro la mayor parte del día?', 'simple', 1, 1),
(2, 'facial', 2, '¿Cuál de estas afecciones específicas presenta tu rostro actualmente?', 'simple', 2, 1),
(3, 'corporal', 3, '¿En qué zonas del cuerpo solés tener resequedad extrema, grietas o descamación?', 'multiple', 3, 1),
(4, 'corporal', 4, '¿Presentás granitos, vellos encarnados o textura rugosa en alguna de estas áreas?', 'simple', 4, 1),
(5, 'corporal', 5, 'Para tu zona íntima, ¿presentás alguna necesidad particular actual?', 'simple', 5, 1),
(6, 'cabello', 6, '¿Cuál es la condición principal de tu cuero cabelludo?', 'simple', 6, 1),
(7, 'cabello', 7, 'Si mirás y tocás el largo y las puntas de tu pelo, ¿cómo lo describirías?', 'simple', 7, 1),
(8, 'cabello', 8, '¿Notás debilidad en el agarre de tu pelo o que perdió volumen?', 'simple', 8, 1);







CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `Id_Categorias` enum('facial','corporal','cabello') NOT NULL,
  `id_subcategoria` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;





INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `marca`, `precio`, `imagen_url`, `stock`, `Id_Categorias`, `id_subcategoria`, `activo`, `fecha_creacion`) VALUES
(1, 'CeraVe Gel Limpiador Espumoso (473ml)', 'Limpiador en gel para pieles normales a grasas. Elimina el exceso de sebo y refresca la barrera cutánea.', 'CeraVe', 63135.00, 'https://farmacityar.vtexassets.com/arquivos/ids/264266-800-auto?v=638756550184700000&width=800&height=auto&aspect=true', 50, 'facial', 1, 1, '2026-09-15 19:23:08'),
(2, 'CeraVe Loción Hidratante Facial de Noche PM (52ml)', 'Fórmula ligera libre de aceites con 3 ceramidas esenciales, ácido hialurónico y niacinamida.', 'CeraVe', 42816.00, 'https://farmaciajimenez.com/storage/products/cerave-locion-hidratante-de-rostro-52-ml/cerave-locion-hidratante-de-rostro-52-ml.jpg', 35, 'facial', 2, 1, '2026-09-15 19:23:08'),
(3, 'La Roche-Posay Effaclar Duo+M (40ml)', 'Tratamiento triple corrección anti-imperfecciones para pieles con tendencia acneica y puntos negros.', 'La Roche-Posay', 48500.00, 'https://i.ebayimg.com/images/g/kYkAAOSwsLBmhwGR/s-l1600.webp', 20, 'facial', 3, 1, '2026-09-15 19:23:08'),
(4, 'ISDIN Fotoprotector Fusion Fluid SPF 50+ (50ml)', 'Protector solar facial de textura fluida ultraligera que se funde con la piel aportando un acabado matificante.', 'ISDIN', 68347.80, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQfqjRWVD4DL2g-3d_0a7G8mPz6_Z1NGSHVeIdYjNoVg&s=10', 40, 'facial', 4, 1, '2026-09-15 19:23:08'),
(5, 'CeraVe Crema Renovadora de Pies (88ml)', 'Exfolia, hidrata y suaviza la piel extremadamente seca, agrietada y rugosa de los pies.', 'CeraVe', 22500.00, 'https://farmacityar.vtexassets.com/arquivos/ids/246404/224741_crema-renovadora-de-pies-cerave-con-acido-salicilico-x-89-ml_imagen-1.jpg?v=638290868381470000', 15, 'corporal', 1, 1, '2026-09-15 19:23:08'),
(6, 'Eucerin Crema de Manos Advanced Repair (78g)', 'Fórmula enriquecida con ceramidas y factores naturales de hidratación para manos muy secas.', 'Eucerin', 19800.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOfKBPfzhDbYEg0LcXI0LqFif_huJh6ZcBRZ-2HYzYWNr0-cQdf4mwR_qg&s=10', 25, 'corporal', 2, 1, '2026-09-15 19:23:08'),
(7, 'Eucerin UreaRepair PLUS Loción 10% Urea (250ml)', 'Alivio inmediato de la tirantez y descamación extrema en piernas y brazos. Hidratación por 48 horas.', 'Eucerin', 39500.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1peNkwbfLeyfnb96G-3Vcu-tb0rH4y_FiK-m2k5-m8SeJfOE8HVEFeIs&s=10', 30, 'corporal', 3, 1, '2026-09-15 19:23:08'),
(8, 'Eucerin DermoPure Gel Limpiador Triple Efecto (200ml)', 'Gel de limpieza corporal y facial con ácido salicílico ideal para reducir granitos y textura en pecho y espalda.', 'Eucerin', 34200.00, 'https://cdn.farmacialeloir.com.ar/img/articulos/2024/05/imagen1_eucerin_dermopure_gel_limpiador_concentrado_triple_effect_imagen1.webp', 18, 'corporal', 4, 1, '2026-09-15 19:23:08'),
(9, 'Lactacyd Íntimo Delicado (200ml)', 'Gel de higiene íntima diaria formulado con ácido láctico biológico. Respeta el equilibrio natural.', 'Lactacyd', 14500.00, 'https://www.farmaciasiano.com.ar/_next/image?url=https%3A%2F%2Ffmffvtqvtkqhwsukrcjk.supabase.co%2Fstorage%2Fv1%2Fobject%2Fpublic%2Fproductos%2F100100000000039727.webp&w=1920&q=75', 22, 'corporal', 6, 1, '2026-09-15 19:23:08'),
(10, 'Vichy Dercos Shampoo Anticaspa DS (200ml)', 'Elimina hasta el 100% de la caspa visible desde la primera aplicación y calma la picazón del cuero cabelludo.', 'Vichy', 36000.00, 'https://cdn.farmacialeloir.com.ar/img/articulos/vichy_dercos_shampoo_anticaspa_cabello_graso_6_imagen1.jpg', 28, 'cabello', 1, 1, '2026-09-15 19:23:08'),
(11, 'Kérastase Nutritive Masquintense (200ml)', 'Tratamiento de nutrición profunda y ultra-concentrada para cabellos extremadamente secos y con frizz.', 'Kérastase', 62000.00, 'https://www.wapas-online.com/media/catalog/product/cache/d65c7cc710d4291e2e0d207df84ac0d0/m/a/masquistense_cabellos_gruesos_irisome_200_ml_kerastase.jpg', 12, 'cabello', 5, 1, '2026-09-15 19:23:08'),
(12, 'L\'Oréal Professionnel Absolut Repair Gold Mask (250ml)', 'Máscara de reparación instantánea para cabellos destruidos, quebradizos o dañados por procesos químicos.', 'L\'Oréal Professionnel', 45000.00, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0W5AryAcg_mOvX1VA4kmFPtW_3dlPWE6_2aBamxXSkQ&s=10', 15, 'cabello', 6, 1, '2026-09-15 19:23:08'),
(13, 'Kérastase Genesis Serum Anti-Chute Fortifiant (90ml)', 'Sérum diario anticaída para cabello debilitado que frena la caída desde la raíz y maximiza el volumen.', 'Kérastase', 78000.00, 'https://www.kerastase.com.ar/-/media/project/loreal/brand-sites/kerastase/americas/latam/products/genesis/serum-anti-chute-fortifiant/serum-anti-chute-fortifiant-genesis-90ml-01-kerastase_optimized.png?rev=bad6b09c1cd045d4a0529a2f72e34399&cx=0&cy=0&cw=351', 10, 'cabello', 7, 1, '2026-09-15 19:23:08');







CREATE TABLE `recomendaciones` (
  `id_recomendacion` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `puntuacion` int(11) DEFAULT 100,
  `fecha_generacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;







CREATE TABLE `respuestas_formulario` (
  `id_respuesta` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `fecha_respuesta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;







CREATE TABLE `subcategorias` (
  `Id_Subcategorias` int(11) NOT NULL,
  `Id_Categoria` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;





INSERT INTO `subcategorias` (`Id_Subcategorias`, `Id_Categoria`, `Nombre`, `Descripcion`) VALUES
(1, 1, 'limpieza_facial', 'Limpiadores y jabones faciales'),
(2, 1, 'hidratacion_facial', 'Cremas y lociones hidratantes'),
(3, 1, 'tratamiento_facial', 'Serums, ácidos y tratamientos específicos'),
(4, 1, 'protector_solar_facial', 'Protección solar facial'),
(5, 2, 'crema_pies', 'Cremas y tratamientos para pies'),
(6, 2, 'crema_manos', 'Cremas y tratamientos para manos'),
(7, 2, 'crema_cuerpo', 'Cremas corporales generales'),
(8, 2, 'limpieza_corporal', 'Geles y jabones corporales'),
(9, 2, 'exfoliantes_corporales', 'Exfoliantes y scrubs'),
(10, 2, 'intimo', 'Jabones y productos para zona íntima'),
(11, 3, 'shampoo', 'Shampoos para todo tipo de cabello'),
(12, 3, 'acondicionador', 'Acondicionadores'),
(13, 3, 'tratamiento_cuero_cabelludo', 'Tratamientos específicos para cuero cabelludo'),
(14, 3, 'tratamiento_hidratacion', 'Tratamientos hidratantes'),
(15, 3, 'tratamiento_nutricion', 'Tratamientos nutritivos'),
(16, 3, 'tratamiento_reparacion', 'Tratamientos reparadores'),
(17, 3, 'tratamiento_anticaida', 'Tratamientos anticaída y crecimiento');







CREATE TABLE `tags_productos` (
  `id_tag_producto` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;





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







CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;








ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);




ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id_favorito`),
  ADD UNIQUE KEY `unique_favorito` (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);




ALTER TABLE `formularios`
  ADD PRIMARY KEY (`id_formulario`),
  ADD KEY `id_usuario` (`id_usuario`);




ALTER TABLE `opciones_respuesta`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `id_pregunta` (`id_pregunta`);




ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`);




ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `idx_categoria` (`Id_Categorias`,`id_subcategoria`),
  ADD KEY `id_subcategoria` (`id_subcategoria`);




ALTER TABLE `recomendaciones`
  ADD PRIMARY KEY (`id_recomendacion`),
  ADD UNIQUE KEY `unique_recomendacion` (`id_formulario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);




ALTER TABLE `respuestas_formulario`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `id_opcion` (`id_opcion`);




ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`Id_Subcategorias`),
  ADD KEY `Id_Categoria` (`Id_Categoria`),
  ADD KEY `Id_Subcategorias` (`Id_Subcategorias`);




ALTER TABLE `tags_productos`
  ADD PRIMARY KEY (`id_tag_producto`),
  ADD KEY `idx_tag` (`tag`),
  ADD KEY `idx_producto` (`id_producto`);




ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);








ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;




ALTER TABLE `favoritos`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT;




ALTER TABLE `formularios`
  MODIFY `id_formulario` int(11) NOT NULL AUTO_INCREMENT;




ALTER TABLE `opciones_respuesta`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;




ALTER TABLE `preguntas`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;




ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;




ALTER TABLE `recomendaciones`
  MODIFY `id_recomendacion` int(11) NOT NULL AUTO_INCREMENT;




ALTER TABLE `respuestas_formulario`
  MODIFY `id_respuesta` int(11) NOT NULL AUTO_INCREMENT;




ALTER TABLE `subcategorias`
  MODIFY `Id_Subcategorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;




ALTER TABLE `tags_productos`
  MODIFY `id_tag_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;




ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;








ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;




ALTER TABLE `formularios`
  ADD CONSTRAINT `formularios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;




ALTER TABLE `opciones_respuesta`
  ADD CONSTRAINT `opciones_respuesta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`) ON DELETE CASCADE;




ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`Id_Subcategorias`);




ALTER TABLE `recomendaciones`
  ADD CONSTRAINT `recomendaciones_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id_formulario`) ON DELETE CASCADE,
  ADD CONSTRAINT `recomendaciones_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;




ALTER TABLE `respuestas_formulario`
  ADD CONSTRAINT `respuestas_formulario_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id_formulario`) ON DELETE CASCADE,
  ADD CONSTRAINT `respuestas_formulario_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`),
  ADD CONSTRAINT `respuestas_formulario_ibfk_3` FOREIGN KEY (`id_opcion`) REFERENCES `opciones_respuesta` (`id_opcion`);




ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`Id_Categoria`) REFERENCES `categorias` (`id_categoria`);




ALTER TABLE `tags_productos`
  ADD CONSTRAINT `tags_productos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;
UPDATE productos SET id_subcategoria = CASE id_producto WHEN 5 THEN 5 WHEN 6 THEN 6 WHEN 7 THEN 7 WHEN 8 THEN 8 WHEN 9 THEN 10 WHEN 10 THEN 11 WHEN 11 THEN 15 WHEN 12 THEN 16 WHEN 13 THEN 17 ELSE id_subcategoria END WHERE id_producto BETWEEN 5 AND 13;
COMMIT;





USE `skin-hair device`;
SET NAMES utf8mb4;
CREATE TABLE IF NOT EXISTS informacion_productos (id_producto INT NOT NULL PRIMARY KEY, origen_url TEXT NOT NULL, fecha_revision DATE NOT NULL, FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS secciones_productos (id_producto INT NOT NULL, seccion VARCHAR(40) NOT NULL, PRIMARY KEY(id_producto,seccion), INDEX(seccion), FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE productos MODIFY imagen_url TEXT DEFAULT NULL;
START TRANSACTION;
UPDATE productos SET activo=0 WHERE id_producto>13 AND nombre='Kérastase Gloss Absolu Bain Hydra Glaze Shampoo refill Pouch';
UPDATE productos SET activo=0 WHERE id_producto>13 AND nombre='Kérastase Nutritive Masquintense';
UPDATE productos SET nombre='Kérastase Symbiose Intensive Anti-Dandruff Cellular Night Serum' WHERE id_producto>13 AND nombre='Kérastase Symbiose Symbiose Intensive Anti-Dandruff Cellular Night Serum';
UPDATE productos SET activo=0 WHERE id_producto>13 AND nombre='Kérastase Genesis Genesis Sérum Anti-Chute Fortifiant';
UPDATE productos SET nombre='Kérastase Genesis Homme Sérum Anti-Chute Fortifiant' WHERE id_producto>13 AND nombre='Kérastase Genesis Homme Genesis Homme Sérum Anti-Chute Fortifiant';
UPDATE productos SET nombre='Kérastase Chronologiste Sérum de Nuit' WHERE id_producto>13 AND nombre='Kérastase Chronologiste Chronologiste Sérum de Nuit';
UPDATE productos SET nombre='Kérastase Nutritive Nutri-Supplement' WHERE id_producto>13 AND nombre='Kérastase Nutritive Nutritive Nutri-Supplement';
UPDATE productos SET nombre='Kérastase Nutritive Nutri-Supplement Split Ends Serum' WHERE id_producto>13 AND nombre='Kérastase Nutritive Nutritive Nutri-Supplement Split Ends Serum';
UPDATE productos SET activo=0 WHERE id_producto>13 AND nombre='Kérastase Elixir Ultime L''Huile Originale';
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Active Gel','Gel facial para piel con tendencia a imperfecciones.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/11-SEB_1.jpg?v=1788192486','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Active Gel');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Active Gel');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear-active-gel','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_grasa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_grasa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_mixta' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_mixta');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_acne' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_acne');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Gel Moussant','Gel de limpieza para piel mixta a grasa.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/OLD1.1-Sebiaclear-GelMoussant-1004237-SVR-Purificationefficacepourpeauxatendanceacneique.jpg?v=1778586648','facial',1,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Gel Moussant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Gel Moussant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear-gel-moussant-23','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_grasa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_grasa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_mixta' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_mixta');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_acne' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_acne');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Creme Lavante','Crema limpiadora para piel con tendencia acneica.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sebiaclear-CremeLavante-1004J36-SVR-Cremelavantehydratanteapaisanteanti-dessechementanti-imperfections.jpg?v=1727425610','facial',1,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Creme Lavante');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Creme Lavante');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear-creme-lavante','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_acne' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_acne');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Hydra','Hidratante para piel con tendencia acneica.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sebiaclear-Hydra-1004617-SVR-Cremehydratantepourpeauxatendanceacneique.jpg?v=1727425835','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Hydra');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Hydra');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear-hydra-23','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_acne' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_acne');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Mat+Pores','Cuidado facial matificante para piel mixta a grasa.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sebiaclear-Mat_Pores-1004317-SVR-Soinmatifiantpourporesreduits.jpg?v=1727426082','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Mat+Pores');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Mat+Pores');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear-mat-pores-1','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_grasa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_grasa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_mixta' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_mixta');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Sérum','Sérum facial para imperfecciones y cuidado de líneas.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sebiaclear-Serum-1004A16-SVR-Concentrepurifiantanti-imperfections.jpg?v=1727426019','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Sérum');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Sérum');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear-serum','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_acne' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_acne');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_grasa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_grasa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Micro-Peel','Loción exfoliante facial. Revisá las precauciones del fabricante.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sebiaclear-Micro-Peel-1004E16-SVR-Peelingdouxpourunepeaulisseeteclatante.jpg?v=1727426213','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Micro-Peel');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Micro-Peel');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear-micro-peel','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_grasa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_grasa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_mixta' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_mixta');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_acne' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_acne');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Ampoule Flash','Cuidado facial de la línea Sebiaclear para imperfecciones.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sebiaclear-AmpouleFlash-1004G16-SVR-Purifiezetilluminezvotrepeauinstantanementaveccetteampouleeclat_383562a4-1bcd-4e70-b21f-17d3ba866460.jpg?v=1774870474','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Ampoule Flash');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Ampoule Flash');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear_ampoule_flash','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_acne' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_acne');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR HYDRALIANE Creme','Crema hidratante facial.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Hydraliane-Creme-1025117-SVR-Peauhydrateeetrepulpee.gif?v=1727431735','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR HYDRALIANE Creme');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR HYDRALIANE Creme');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/hydraliane-creme','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR HYDRALIANE Riche','Hidratante facial de textura rica.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Hydraliane-CremeRiche-1025517-SVR-Soinhydratantintenseetrepulpant.jpg?v=1727431815','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR HYDRALIANE Riche');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR HYDRALIANE Riche');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/hydraliane-creme-riche','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR HYDRALIANE Legere','Hidratante facial de textura ligera.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Hydraliane-CremeLegere-1025217-SVR-Soinhydratantlegeretrafraichissant.jpg?v=1727431877','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR HYDRALIANE Legere');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR HYDRALIANE Legere');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/hydraliane-creme-legere','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_mixta' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_mixta');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SENSIFINE Extrême','Crema para el cuidado de la piel sensible.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/Extreme_1_1_7ed3ce5a-bcfe-4dfc-9d70-0f192d8479df_1.jpg?v=1764323726','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SENSIFINE Extrême');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SENSIFINE Extrême');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sensifine-extreme','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SENSIFINE Aqua-Gel','Gel hidratante facial para piel sensible.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sensifine-Aqua-Gel-1027716-SVR-Gelhydratantpourpeauxsensibles.jpg?v=1727430109','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SENSIFINE Aqua-Gel');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SENSIFINE Aqua-Gel');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sensifine-aqua-gel','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SENSIFINE Hydra-Creme','Crema hidratante para piel sensible.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sensifine-Hydra-Creme-1027016-SVR-Soinhydratantapaisantpourpeauxsensibles.jpg?v=1727430011','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SENSIFINE Hydra-Creme');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SENSIFINE Hydra-Creme');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sensifine-hydra-creme','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SENSIFINE Nutri-Baume','Bálsamo nutritivo facial.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sensifine-Nutri-Baume-1027816-SVR-Baumenourrissantpourpeauxsensiblesetseches.jpg?v=1727429819','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SENSIFINE Nutri-Baume');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SENSIFINE Nutri-Baume');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sensifine-nutri-baume','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SENSIFINE Dermo-Nettoyant','Limpiador suave de la línea Sensifine.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sensifine-Dermo-Nettoyant-1027426-SVR-Soinnettoyantdouxpourpeauxsensibles.jpg?v=1727430250','facial',1,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SENSIFINE Dermo-Nettoyant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SENSIFINE Dermo-Nettoyant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sensifine-dermo-nettoyant','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SENSIFINE AR Creme','Cuidado facial para piel propensa a rojeces.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sensifine_AR-Creme-1028216-SVR-Soin_apaisant_pour_peaux_reactives_et_rougeurs.jpg?v=1779091617','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SENSIFINE AR Creme');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SENSIFINE AR Creme');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sensifine-ar-creme','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SENSIFINE AR Creme Riche','Crema rica para piel con tendencia a rojeces.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-SensifineAR-CremeRiche-1028516-SVR-Soinapaisantetnourrissantpourpeauxreactives.jpg?v=1727430559','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SENSIFINE AR Creme Riche');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SENSIFINE AR Creme Riche');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sensifine-ar-creme-riche','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR [B3] Ampoule Hydra','Sérum hidratante facial de la línea B3.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/OLD1.1-AB3C-AmpouleHydra-101042.jpg?v=1778586747','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR [B3] Ampoule Hydra');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR [B3] Ampoule Hydra');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/b3-ampoule-hydra','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR [HYALU] Biotic','Gel de cuidado facial hidratante.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Biotic-Hyalu-1031416-SVR-Soinhydratantintensifal_acidehyaluronique_b2e04dd2-ef1b-4b87-983b-af6bbe123f8d.jpg?v=1741618094','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR [HYALU] Biotic');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR [HYALU] Biotic');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/new-hyalubiotic','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR [COLLAGEN]Biotic','Crema facial para el cuidado de la firmeza.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Biotic-Collagen-1031616-SVR-Cremerebondissanteregenerante_1b2b323e-80fd-4909-8d87-43b393f6ca90.jpg?v=1741618577','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR [COLLAGEN]Biotic');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR [COLLAGEN]Biotic');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/new-collagen-biotic','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR [PEPTI] Biotic','Cuidado facial de la línea Pepti Biotic.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Biotic-Pepti-1031217-SVR-Soindermatologiqueapaisantetrenforcantlabarrierecutanee_096c0676-c041-4044-9d67-a9f060debb63.jpg?v=1791298360','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR [PEPTI] Biotic');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR [PEPTI] Biotic');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/new-peptibiotic','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR [CERAMIDES] BIOTIC','Cuidado facial con ceramidas para piel seca.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Biotic-Ceramides-1031A16-SVR-Soinantiageconcupourlespeauxseches.jpg?v=1790930192','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR [CERAMIDES] BIOTIC');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR [CERAMIDES] BIOTIC');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/ceramides-biotic','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR [C20] Biotic','Cuidado facial con vitamina C.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Biotic-C20-1031517-SVR-HautementconcentreenvitamineCpourunteinteclatant_4d9f3c41-bcf2-4663-9211-9fb039bbcac3.jpg?v=1741617931','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR [C20] Biotic');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR [C20] Biotic');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/c20biotic-new','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR CLAIRIAL Day','Cuidado facial para el aspecto de las manchas.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Clairial-Day-1011227-SVR-Illuminezvotreteintetreduisezlestachesaveccesoineclaircissantdejour.jpg?v=1756900014','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR CLAIRIAL Day');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR CLAIRIAL Day');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/clairial-day','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_manchas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_manchas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR CLAIRIAL Ampoule','Sérum facial de la línea Clairial.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Clairial-Ampoule-1011A16-SVR-Concentreanti-tachesanti-pollutionanti-recidive.jpg?v=1727432247','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR CLAIRIAL Ampoule');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR CLAIRIAL Ampoule');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/novedad-clairial-ampoule','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_manchas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_manchas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR CLAIRIAL Creme SPF50+','Crema facial Clairial con FPS 50+.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/SVR_retouche_site_ACDA_Clairial_UV_1080X1350_d400f618-addf-4b46-8dc4-28650ef8acfb.jpg?v=1788171590','facial',4,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR CLAIRIAL Creme SPF50+');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR CLAIRIAL Creme SPF50+');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/clairial-creme-spf50-nueva-formula','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_manchas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_manchas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SUN SECURE Creme SPF50+','Protector solar facial en crema con FPS 50+.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-SunSecure-CremeSPF50_-1029317-SVR-Hauteprotectionsolairepourlevisage.jpg?v=1727422584','facial',4,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SUN SECURE Creme SPF50+');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SUN SECURE Creme SPF50+');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sun-secure-creme-spf50-1','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SUN SECURE Fluide SPF50+','Protector solar facial fluido con FPS 50+.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-SunSecure-FluideSPF50_-1029217-SVR-Protectionsolairelegereetmatifiante.jpg?v=1727422661','facial',4,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SUN SECURE Fluide SPF50+');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SUN SECURE Fluide SPF50+');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sun-secure-fluide-spf50-1','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_mixta' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_mixta');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SUN SECURE Blur SIN PERFUME SPF50+','Protector solar facial sin perfume con FPS 50+.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-SunSecure-BlurSPF50_SansParfum-1029M17-SVR-Protectionsolaireaveceffetfloutant.jpg?v=1727422513','facial',4,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SUN SECURE Blur SIN PERFUME SPF50+');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SUN SECURE Blur SIN PERFUME SPF50+');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sun-secure-blur-sin-perfume-spf50','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR TOPIALYSE Creme','Crema corporal para piel seca; cuidado de zonas externas resecas.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Topialyse-Creme-1002138-SVR-Cremeemollientepourlespeauxsechesetirritees.jpg?v=1770995688','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR TOPIALYSE Creme');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR TOPIALYSE Creme');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/topialyse-creme-1','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_normal');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR TOPIALYSE Baume Protect+','Bálsamo corporal para piel muy seca.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Topialyse-BaumeProtect_-1002427-SVR-Baumeprotecteurpourpeauxsechesetsensibles.jpg?v=1727426737','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR TOPIALYSE Baume Protect+');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR TOPIALYSE Baume Protect+');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/topialyse-baume-protect','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR TOPIALYSE Barrière','Crema de barrera para zonas externas secas e irritadas.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Topialyse-Barriere-1002626-SVR-Soinprotecteurpourpeauxsechesetsensibles.webp?v=1727427479','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR TOPIALYSE Barrière');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR TOPIALYSE Barrière');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/topialyse-barriere','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR TOPIALYSE Mains','Crema para el cuidado de las manos secas.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Topialyse-Mains-1002916-SVR-Soinnourrissantetprotecteurpourlesmains.webp?v=1727427574','corporal',6,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR TOPIALYSE Mains');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR TOPIALYSE Mains');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/topialyse-mains','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR CICAVIT+ Creme mains','Crema de manos de la línea Cicavit+.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Cicavit_-CremeMains-1024816-SVR-Nourrissezetprotegezvosmainsaveccettecremereparatrice.jpg?v=1727430961','corporal',6,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR CICAVIT+ Creme mains');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR CICAVIT+ Creme mains');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/creme-mains-cicavit','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR XERIAL 10 Lait Corps','Loción corporal con urea para piel seca.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Xerial-Lait10-1001247-SVR-Soinhydratant.jpg?v=1727438088','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR XERIAL 10 Lait Corps');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR XERIAL 10 Lait Corps');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/xerial-10-lait-corps-new','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR XERIAL 30 Gel-Creme','Cuidado corporal para zonas con rugosidad. Revisá las indicaciones del fabricante.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Xerial-30GelCreme-1001317-SVR-Soinhydratantpourlespeauxsechesetrugueuses.jpg?v=1727438271','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR XERIAL 30 Gel-Creme');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR XERIAL 30 Gel-Creme');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/xerial-30-gel-creme','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_brazos_piernas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_brazos_piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR XERIAL 30 Creme pieds','Crema específica para pies secos.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Xerial-30CremePieds-1001916-SVR-Soinhydratantetexfoliantpourlespiedssecs.jpg?v=1782892260','corporal',5,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR XERIAL 30 Creme pieds');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR XERIAL 30 Creme pieds');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/xerial-30-creme-pieds','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR XERIAL 50 Extreme Creme Pieds','Cuidado para durezas de los pies. No usar sobre heridas; consultá las precauciones del fabricante.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Xerial-50ExtremeCremePieds-1001526-SVR-Soinintensifpourlespiedssecsetfendilles.jpg?v=1727438143','corporal',5,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR XERIAL 50 Extreme Creme Pieds');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR XERIAL 50 Extreme Creme Pieds');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/xerial-50-extreme-creme-pieds','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR XERIAL Fisuras y Grietas','Cuidado para piel de los pies con fisuras. Consultá si hay dolor o sangrado.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Xerial-Fissure_Crevasses-1001817-SVR-Soinreparateurintensifpourlespied.jpg?v=1727438207','corporal',5,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR XERIAL Fisuras y Grietas');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR XERIAL Fisuras y Grietas');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/xerial-fissures-crevasses-23','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR TOPIALYSE Gel lavant','Gel de limpieza corporal de uso diario.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Topialyse-GelLavant-1002757-SVR-Gelnettoyantdouxpourpeauxsechesetsensibles.jpg?v=1778515139','corporal',8,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR TOPIALYSE Gel lavant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR TOPIALYSE Gel lavant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/topialyse-gel-lavant-1','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_sin_textura' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_sin_textura');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR TOPIALYSE Huile Lavante','Aceite de limpieza corporal para piel seca.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Topialyse-HuileLavante-1002037-SVR-Huilenettoyantedoucepourpeauxsechesetsensibles.jpg?v=1727427000','corporal',8,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR TOPIALYSE Huile Lavante');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR TOPIALYSE Huile Lavante');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/topialyse-huile-micellaire-nuevo','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR TOPIALYSE Baume Lavant','Bálsamo limpiador corporal.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Topialyse-BaumeLavant-1002237-SVR-Baumenettoyantdouxpourpeauxsechesetsensibles.png?v=1727427241','corporal',8,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR TOPIALYSE Baume Lavant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR TOPIALYSE Baume Lavant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/topialyse-baume-lavant','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR SEBIACLEAR Spray Corps','Cuidado corporal para piel con tendencia a imperfecciones.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Sebiaclear-SprayCorps-1004K16-SVR-Soinanti-imperfectionsdos_epaules_decollete.jpg?v=1727426655','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR SEBIACLEAR Spray Corps');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR SEBIACLEAR Spray Corps');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/sebiaclear-spray-corps','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pecho_abdomen' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pecho_abdomen');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_brazos_piernas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_brazos_piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR TOPIALYSE Stick Lèvres','Bálsamo labial en barra.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.2-Topialyse-Levres-1002818-SVR-Baumereparateurpourleslevressechesetgercees_ad9f723a-03b3-4531-8330-5324e13d3d9f.jpg?v=1789377508','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR TOPIALYSE Stick Lèvres');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR TOPIALYSE Stick Lèvres');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/topialyse-stick-levres','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR CICAVIT+ Lèvres','Bálsamo para labios secos.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Cicavit_-Levres-1024716-SVR-Reparezetprotegezvoslevresaveccebaumereparateurnourrissant.jpg?v=1727431191','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR CICAVIT+ Lèvres');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR CICAVIT+ Lèvres');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/cicavit-levres','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR [C-EYE]Biotic','Cuidado específico para el contorno de ojos.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/CEYE_1.png?v=1741618892','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR [C-EYE]Biotic');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR [C-EYE]Biotic');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/c-eye-biotic','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR DENSITIUM Contour des Yeux','Contorno de ojos de la línea Densitium.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Densitium-ContourdesYeux-1020317-SVR-ContourdesYeuxAntiCerneetRelachementPaupieres.jpg?v=1727438862','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR DENSITIUM Contour des Yeux');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR DENSITIUM Contour des Yeux');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/densitium-contour-des-yeux-nuevo','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR Ampoule Relax','Cuidado nocturno para el contorno de ojos.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-AB3C-AmpouleRelax-1031016-SVR-Solutionapaisantepourunepeaudetendueetressourcee.jpg?v=1727428760','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR Ampoule Relax');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR Ampoule Relax');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/ampoule-relax','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR Ampoule Refresh','Cuidado de día para el contorno de ojos.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-AB3C-AmpouleRefresh-1031116-SVR-Revitalisezvotrepeauaveccettesolutionrafraichissante.jpg?v=1727428625','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR Ampoule Refresh');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR Ampoule Refresh');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/ampoule-refresh','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR PALPEBRAL Baume','Bálsamo para el cuidado de párpados sensibles. No trata todas las causas de ojeras.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Palpebral-Baume-1002H16-SVR-Baumevisageetcontourdesyeuxapaisantreparateuranti-grattage.jpg?v=1737031669','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR PALPEBRAL Baume');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR PALPEBRAL Baume');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/palpebral-baume','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'SVR PALPEBRAL Creme','Crema para párpados sensibles. No es un tratamiento específico de manchas.','SVR',NULL,'https://cdn.shopify.com/s/files/1/0257/2156/9366/files/1.1-Palpebral-Creme-1002538-SVR-Soulagezetprotegezvospaupieres.jpg?v=1727428135','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='SVR PALPEBRAL Creme');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='SVR PALPEBRAL Creme');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://es.svr.com/products/palpebral-by-topialyse-creme-nueva-formula','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Blond Absolu Blond Guard','Cuidado capilar de la línea Blond Absolu. Destinado a cabello rubio o decolorado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/blond-absolu/blonde-guard/atf/1-(2).png?rev=786473094fd6475c82cad4643597e773&sc_lang=en','cabello',14,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Blond Absolu Blond Guard');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Blond Absolu Blond Guard');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/blond-absolu/blond-guard/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Blond Absolu Bain Lumière','Shampoo de la línea Blond Absolu. Destinado a cabello rubio o decolorado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/blond-absolu/bain-lumiere/packshot-new.png?rev=51ce7ac860814b3cb0decb462067d142','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Blond Absolu Bain Lumière');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Blond Absolu Bain Lumière');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/blond-absolu/bain-lumiere/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Curl Manifesto Refresh Absolu','Cuidado capilar de la línea Curl Manifesto. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/curl-manifesto/refresh-absolu/refresh-packshot--v-isuel1_new.png?rev=047fbaada0d648d0b1d29ba995857a5d','cabello',14,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Curl Manifesto Refresh Absolu');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Curl Manifesto Refresh Absolu');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/curl-manifesto/refresh-absolu/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive Bain Satin','Shampoo de la línea Nutritive. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/revamp/bain-satin-250ml-ec1.png?rev=d5dad3af41e84434be8c1e5e08f123d5','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive Bain Satin');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive Bain Satin');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/bain-satin/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Gloss Absolu Bain Hydra-Glaze','Shampoo de la línea Gloss Absolu. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/gloss-absolu/bain/packshot-compressed.png?rev=0745fe1d971548c2967be34eb970b6eb','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Gloss Absolu Bain Hydra-Glaze');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Gloss Absolu Bain Hydra-Glaze');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/gloss-absolu/bain-creme-hydra-glaze/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Première Bain Décalcifiant Réparateur','Shampoo de la línea Première. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/premiere/bain-decalcifiant-reparateur/atf/1.png?rev=73a78fe3e7d7472ba1f100c13d91263c','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Première Bain Décalcifiant Réparateur');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Première Bain Décalcifiant Réparateur');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/premiere/bain-decalcifiant-reparateur/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Blond Absolu Bain Ultra-Violet','Shampoo de la línea Blond Absolu. Destinado a cabello rubio o decolorado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/blond-absolu/bain-ultra-violet/packshot.png?rev=356dd8ce902a4ed0b265e648469e8a21','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Blond Absolu Bain Ultra-Violet');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Blond Absolu Bain Ultra-Violet');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/blond-absolu/bain-ultra-violet/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_sano' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_sano');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_fuerte' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_fuerte');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_normal');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Genesis Bain Hydra-Fortifiant','Shampoo de la línea Genesis.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/genesis/packshots/bain-hydra-fortifiant/new/genesis-pdp/2025_ker-bain-hydra-fortifiant-3474636857814.png?rev=36e61d59f6944db4b6e4baa2ed352fdd','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Genesis Bain Hydra-Fortifiant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Genesis Bain Hydra-Fortifiant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis/bain-hydra-fortifiant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_sano' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_sano');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_fuerte' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_fuerte');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_normal');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Symbiose Bain Pureté Anti-Pelliculaire','Shampoo de la línea Symbiose. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/symbiose/product-gallery-images/kerastase-22-symbiose-bain-purete-250ml-inter-recto-ec4-2501.png?rev=501e5576f4f74c5da9c69a8128b9f255','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Symbiose Bain Pureté Anti-Pelliculaire');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Symbiose Bain Pureté Anti-Pelliculaire');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/symbiose/bain-purete/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_graso' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_graso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Symbiose Bain Crème Anti-Pelliculaire','Shampoo de la línea Symbiose. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/symbiose/product-gallery-images/kerastase-22-symbiose-bain-creme-250ml-inter-recto-ec1-2001.png?rev=7ea24056087f43f29fafd4f192b0f8ec','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Symbiose Bain Crème Anti-Pelliculaire');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Symbiose Bain Crème Anti-Pelliculaire');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/symbiose/bain-creme/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Genesis Bain Nutri-Fortifiant','Shampoo de la línea Genesis. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/genesis/bain-hydra-fortifiant-shampoo/gene/genesis/bain-nutri-250/image-10.png?rev=9010a5fbf1184abb872fcbef390f250a','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Genesis Bain Nutri-Fortifiant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Genesis Bain Nutri-Fortifiant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis/bain-nutri-fortifiant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Curl Manifesto Bain Hydratation Douceur','Shampoo de la línea Curl Manifesto. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/curl-manifesto-range/bain-hydratation_packshot_visuel1_new.png?rev=7a3c6752ec664a6eaf6d2fd221ace515','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Curl Manifesto Bain Hydratation Douceur');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Curl Manifesto Bain Hydratation Douceur');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/curl-manifesto/bain-hydratation-douceur/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chroma Absolu Bain Riche Chroma Respect','Shampoo de la línea Chroma Absolu. Destinado a cabello con coloración.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chroma-absolu/bain-riche-chroma-respect/kerastase-21--chroma-absolu--all-format--bain-riche-sans-sulfate--250ml--transparent--recto--ec2-dbd.png?rev=caf302901e61446a9cfbf0573434e4ad','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chroma Absolu Bain Riche Chroma Respect');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chroma Absolu Bain Riche Chroma Respect');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chroma-absolu/bain-riche-chroma-respect/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive Bain Satin Riche','Shampoo de la línea Nutritive. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/bain-satin-riche/packshot-with-stamp.png?rev=44c05a89e651433c9ff569e25107ec6f','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive Bain Satin Riche');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive Bain Satin Riche');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/bain-satin-riche/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chroma Absolu Bain Chroma Respect','Shampoo de la línea Chroma Absolu. Destinado a cabello con coloración.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chroma-absolu/bain-chroma-respect/new-500ml/packshot-bottle-with-stamp.png?rev=7cf1bc59c97347dfa9306a53b3c85919','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chroma Absolu Bain Chroma Respect');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chroma Absolu Bain Chroma Respect');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chroma-absolu/bain-chroma-respect/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Genesis Homme Bain de Masse Épaississant','Shampoo de la línea Genesis Homme. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/genesis-homme/bain-de-masse-epaississant/genesis-homme_bain-de-masse_250ml_03474637077518_recto_packshots-png.png?rev=82814ff6066244d9bccc7f2d327ec20d','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Genesis Homme Bain de Masse Épaississant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Genesis Homme Bain de Masse Épaississant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis-homme/bain-de-masse-epaississant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Genesis Homme Bain de Force Quotidien','Shampoo de la línea Genesis Homme. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/genesis-homme/bain-de-force-quotidien/genesis-homme_bain-de-force_250ml_03474637077525_recto_packshots-png.png?rev=7179fc78a05640948af9dffea0171886','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Genesis Homme Bain de Force Quotidien');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Genesis Homme Bain de Force Quotidien');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis-homme/bain-de-force-quotidien/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Densifique Bain Densité','Shampoo de la línea Densifique. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/densifique/bain-densite/packshot-bottle-with-stamp.png?rev=4c6e68df08c247de84a1868db2f72202','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Densifique Bain Densité');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Densifique Bain Densité');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/densifique/bain-densite/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Soleil Bain Après-Soleil','Shampoo de la línea Soleil. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/soleil/packshots/bain-apres-soleil-soleil-250ml-01-kerastase_new.png?rev=653329a2bddb4f8ba59209b7ea952538','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Soleil Bain Après-Soleil');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Soleil Bain Après-Soleil');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/soleil/bain-apres-soleil/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chronologiste Bain Régénérant','Shampoo de la línea Chronologiste. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chronologiste/bain-regenerant-shampoo/ker_chronologiste_bainregenerantshampoo_productdetail0.png?rev=f0ed459a82ae4f99a4bdc5c3198c3168','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chronologiste Bain Régénérant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chronologiste Bain Régénérant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chronologiste/bain-regenerant-shampoo/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Discipline Bain Fluidéaliste','Shampoo de la línea Discipline.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/discipline/packshots/bain-fluidealiste-discipline-250ml-01-kerastase.png?rev=c760a6fa764941bf87aadeda4c16dc29','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Discipline Bain Fluidéaliste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Discipline Bain Fluidéaliste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/discipline/bain-fluidéaliste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_sano' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_sano');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_fuerte' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_fuerte');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_normal');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Elixir Ultime Bain Elixir Ultime','Shampoo de la línea Elixir Ultime. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/elixir-ultime/packshots/bain-a-l-huile-subliminatrice-elixir-ultime-250ml-01-kerastase.png?rev=6c088539b46c48cba4e1da6cbe035298','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Elixir Ultime Bain Elixir Ultime');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Elixir Ultime Bain Elixir Ultime');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/elixir-ultime/bain-elixir-ultime/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Volumifique Bain Volumifique','Shampoo de la línea Volumifique.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/volumifique/packshots/bain-volumifique-volumifique-250ml-01-kerastase.png?rev=10cff090ccab4c33a9f46f6d0c470b54','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Volumifique Bain Volumifique');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Volumifique Bain Volumifique');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/volumifique/bain-volumifique/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_sano' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_sano');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_fuerte' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_fuerte');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_normal');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Première Fondant Fluidité Réparateur','Acondicionador de la línea Première. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/premiere/fondant-fluidite-reparateur/atf/1.png?rev=bbb21238e209452d8acced3f4f02b968','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Première Fondant Fluidité Réparateur');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Première Fondant Fluidité Réparateur');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/premiere/fondant-fluidite-reparateur/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Bain Vital Dermo-Calm','Shampoo de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/bain-vital-dermo-calm-specifique-250ml-01-kerastase.png?rev=b12ae77c3aa7445a83971c748db33952','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Bain Vital Dermo-Calm');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Bain Vital Dermo-Calm');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/bain-vital-dermo-calm/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_seco' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_seco');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Bain Prévention','Shampoo de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/bain-prevention-specifique-250ml-01-kerastase.png?rev=1075245f89fc4cb3bf44176d18707ec6','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Bain Prévention');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Bain Prévention');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/bain-prevention/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Bain Divalent','Shampoo de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/kerastase---specifique----bain-divalent---flacon-250ml.png?rev=88cb98d478604896979d32dec85490f0','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Bain Divalent');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Bain Divalent');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/bain-divalent/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_graso' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_graso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Blond Absolu Cicaflash','Acondicionador de la línea Blond Absolu. Destinado a cabello rubio o decolorado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/blond-absolu/masque-ultra-violet/atf/cicaflash-transparent.png?rev=f64b7401640a43bb84065bdd4d1a0bda','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Blond Absolu Cicaflash');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Blond Absolu Cicaflash');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/blond-absolu/cicaflash/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Bain Anti-Pelliculaire','Shampoo de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/bain-anti-pelliculaire-specifique-250ml-01-kerastase.png?rev=c930c49d7b22425f961d00f59bb7b888','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Bain Anti-Pelliculaire');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Bain Anti-Pelliculaire');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/bain-anti-pelliculaire/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Bain Force Architecte','Shampoo de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/bain-force-architecte/packshot-with-stamp.png?rev=f308b876cdc24242b949f204aebf68b2','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Bain Force Architecte');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Bain Force Architecte');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/bain-force-architecte/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Bain Extentioniste','Shampoo de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/bain-extentioniste-resistance-250ml-01-kerastase-new.png?rev=78cbf64e1af044229fda0a1be47dc32a','cabello',11,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Bain Extentioniste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Bain Extentioniste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/bain-extentioniste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'shampoo');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive Lait Vital','Acondicionador de la línea Nutritive. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/revamp/lait-vital-packshot-new.png?rev=e7b437b9423f47ad82f99c2a37b44c00','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive Lait Vital');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive Lait Vital');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/lait-vital/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Symbiose Fondant Apaisant Essentiel','Acondicionador de la línea Symbiose. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/symbiose/product-gallery-images/kerastase-22-symbiose-fondant-200ml-inter-recto-ec1-2001.png?rev=36a012982c6349f8a5ae085c50f4b301','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Symbiose Fondant Apaisant Essentiel');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Symbiose Fondant Apaisant Essentiel');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/symbiose/fondant-essentiel/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_seco' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_seco');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Soin Premier Thérapiste','Acondicionador de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/soin-premier-therapiste-resistance-250ml-01-kerastase.png?rev=fb7ab51dddb24042ac3eed6b0fc815e8','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Soin Premier Thérapiste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Soin Premier Thérapiste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/soin-premier-therapiste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Densifique Fondant Densité','Acondicionador de la línea Densifique.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/densifique/packshots/femme/fondant-densite-densifique-200ml-01-kerastase.png?rev=e3ba0d0c1a17496ca300cca19629fdf3','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Densifique Fondant Densité');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Densifique Fondant Densité');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/densifique/fondant-densite/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_sano' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_sano');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_fuerte' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_fuerte');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_normal');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Genesis Fondant Renforçateur','Acondicionador de la línea Genesis. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/genesis/packshots/fondant-renforcateur/kerastase-19---genesis---tube-fondant-200ml-ec1-4301.png?rev=a8550950ed0e4148ae5115c30a733be3','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Genesis Fondant Renforçateur');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Genesis Fondant Renforçateur');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis/fondant-renforcateur/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Curl Manifesto Fondant Hydratation Essentielle','Acondicionador de la línea Curl Manifesto. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/curl-manifesto-range/fondant-hydratation-packshot-visuel1_new.png?rev=e6a98db75d22488980e741f1bf84e9cc','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Curl Manifesto Fondant Hydratation Essentielle');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Curl Manifesto Fondant Hydratation Essentielle');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/curl-manifesto/fondant-hydratation-essentielle/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chroma Absolu Fondant Cica Chroma','Acondicionador de la línea Chroma Absolu. Destinado a cabello con coloración.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chroma-absolu/fondant-cica-chroma/fondant-cica-chroma-t1.png?rev=d76c9d0588cd401cbd847577ce248ae5','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chroma Absolu Fondant Cica Chroma');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chroma Absolu Fondant Cica Chroma');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chroma-absolu/fondant-cica-chroma/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Ciment Anti-Usure','Acondicionador de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/ciment-anti-usure-resistance-200ml-01-kerastase.png?rev=41a0a58fd3824c67bfbdf73db047e833','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Ciment Anti-Usure');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Ciment Anti-Usure');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/ciment-anti-usure/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Discipline Fondant Fluidéaliste','Acondicionador de la línea Discipline.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/discipline/packshots/fondant-fluidealiste-discipline-200ml-01-kerastase.png?rev=1d0a9402689e44e28a30c58efaced1f8','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Discipline Fondant Fluidéaliste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Discipline Fondant Fluidéaliste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/discipline/fondant-fluidéaliste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_sano' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_sano');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_fuerte' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_fuerte');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_normal');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Fondant Extentioniste','Acondicionador de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/fondant-extentioniste-resistance-200ml-01-kerastase.png?rev=854f1d861405498e9a4df2e8ac5cc8f7','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Fondant Extentioniste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Fondant Extentioniste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/fondant-extentioniste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Elixir Ultime Fondant Elixir Ultime','Acondicionador de la línea Elixir Ultime. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/elixir-ultime/packshots/fondant-a-l-huile-subliminatrice-elixir-ultime-200ml-01-kerastase.png?rev=ff57a28824054f68a2c9e942a336e6a0','cabello',12,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Elixir Ultime Fondant Elixir Ultime');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Elixir Ultime Fondant Elixir Ultime');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/elixir-ultime/fondant-elixir-ultime/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'acondicionador');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chronologiste Masque Intense Régénérant','Cuidado capilar de la línea Chronologiste. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chronologiste/packshots/ker_iconics_chronologiste_packshot.png?rev=5c514cfb22f54f4b8e15b73d197f9781','cabello',14,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chronologiste Masque Intense Régénérant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chronologiste Masque Intense Régénérant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chronologiste/masque-intense-regenerant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Symbiose Masque Revitalisant Essentiel','Cuidado capilar de la línea Symbiose. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/symbiose/product-gallery-images/kerastase-22-symbiose-pot-masque-200ml-inter-recto-ec1-2001.png?rev=dd9809515bc9482ca550b106cd86cd44','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Symbiose Masque Revitalisant Essentiel');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Symbiose Masque Revitalisant Essentiel');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/symbiose/masque-essentiel/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
SET @producto = 11;
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/masquintense/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Première Masque Filler Réparateur','Cuidado capilar de la línea Première. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/premiere/masque-filler-reparateur/atf/1.png?rev=1d4e6f7a797146999cf4ca591c52f017','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Première Masque Filler Réparateur');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Première Masque Filler Réparateur');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/premiere/masque-filler-reparateur/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chroma Absolu Masque Chroma Filler','Cuidado capilar de la línea Chroma Absolu. Destinado a cabello con coloración.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chroma-absolu/masque-chroma-filler/masque-chroma-filler-t1.png?rev=a373964779fe4dc59ff412ac5d20e34b','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chroma Absolu Masque Chroma Filler');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chroma Absolu Masque Chroma Filler');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chroma-absolu/masque-chroma-filler/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Genesis Masque Reconstituant','Cuidado capilar de la línea Genesis. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/genesis/packshots/masque-reconstituant/kerastase-19---genesis---pot-200ml---masque-reconstituant-ec1-4301.png?rev=691e9a608f734ceaa7834f40018d8330','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Genesis Masque Reconstituant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Genesis Masque Reconstituant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis/masque-reconstituant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive Masquintense Riche','Cuidado capilar de la línea Nutritive. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/revamp/masquintense-riche-new-packshot.png?rev=3521b9ed4818456fb25863728fb806b6','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive Masquintense Riche');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive Masquintense Riche');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/masquintense-riche/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Curl Manifesto Masque Beurre Haute Nutrition','Cuidado capilar de la línea Curl Manifesto. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/curl-manifesto/masque-beurre-haute-nutrition/masque-packshot-visuel-1_new.png?rev=0b6653c289cf4d138473171a1c9cc453','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Curl Manifesto Masque Beurre Haute Nutrition');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Curl Manifesto Masque Beurre Haute Nutrition');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/curl-manifesto/masque-beurre-haute-nutrition/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Gloss Absolu Masque Crème Hydra-Glaze','Cuidado capilar de la línea Gloss Absolu. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/gloss-absolu/masque/image-68-compressed.png?rev=7df187decb66471a9e86ad2771275d31','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Gloss Absolu Masque Crème Hydra-Glaze');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Gloss Absolu Masque Crème Hydra-Glaze');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/gloss-absolu/masque-creme-hydra-glaze/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Blond Absolu Masque Cicaextreme','Cuidado capilar de la línea Blond Absolu. Destinado a cabello rubio o decolorado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/blond-absolu/revamp/masque-cicaextreme-packshot-new.png?rev=a2db091ebc394729b1abd9dc33807aa7','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Blond Absolu Masque Cicaextreme');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Blond Absolu Masque Cicaextreme');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/blond-absolu/le-masque-cicaextreme/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Masque Réhydratant','Cuidado capilar de la línea Spécifique. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/1-masque-rehydratant-resized-1000.png?rev=53746d738da24c1799a636d76ff905cf','cabello',14,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Masque Réhydratant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Masque Réhydratant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/masque-rehydratant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Masque Hydra-Apaisant','Cuidado capilar de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/masque-hydra-apaisant-specifique-200ml-01-kerastase.png?rev=1d307b5c3e894c0e8daa06bc03c79ccb','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Masque Hydra-Apaisant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Masque Hydra-Apaisant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/masque-hydra-apaisant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_seco' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_seco');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Symbiose Micro-Peeling Cellulaire','Cuidado capilar de la línea Symbiose. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/symbiose/product-gallery-images/kerastase-22-symbiose-micro-peeling-200ml-inter-recto-ec1-2001.png?rev=7a19feb85aba4881a0016a03f768d2fd','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Symbiose Micro-Peeling Cellulaire');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Symbiose Micro-Peeling Cellulaire');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/symbiose/micro-peeling-cellulaire/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Masque Force Architecte','Cuidado capilar de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/masque-force-architecte-resistance-200ml-01-kerastase.png?rev=ad09018c85204f5b9bfcb642af225255','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Masque Force Architecte');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Masque Force Architecte');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/masque-force-architecte/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Soleil Masque Après-Soleil','Cuidado capilar de la línea Soleil. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/soleil/packshots/masque-apres-soleil-soleil-200ml-01-kerastase.png?rev=4abc871bd27c40f092aa58fecd9a8a68','cabello',14,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Soleil Masque Après-Soleil');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Soleil Masque Après-Soleil');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/soleil/masque-apres-soleil/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Masque Extentioniste','Cuidado capilar de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/masque-extentioniste-resistance-200ml-01-kerastase.png?rev=19f35d54c23b4a6f949bbc0b5a6ef5f0','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Masque Extentioniste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Masque Extentioniste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/masque-extentioniste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Première Concentré Décalcifiant Ultra-Réparateur','Cuidado capilar de la línea Première. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/premiere/concentre-decalcifiant-ultra-reparateur/concentre-atf/1.png?rev=dff8e8c475c94fbda40a014c9bbab4c4','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Première Concentré Décalcifiant Ultra-Réparateur');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Première Concentré Décalcifiant Ultra-Réparateur');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/premiere/concentre-decalcifiant-ultra-reparateur/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Masque Thérapiste','Cuidado capilar de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/masque-therapiste-resistance-200ml-01-kerastase.png?rev=a72821d5ae81474c8344a5d7bbd61b38','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Masque Thérapiste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Masque Thérapiste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/masque-therapiste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Elixir Ultime Masque Elixir Ultime','Cuidado capilar de la línea Elixir Ultime. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/elixir-ultime/packshots/masque-d-huile-subliminatrice-elixir-ultime-200ml-01-kerastase.png?rev=f11366ef56e84e07937cd6b71be8cd86','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Elixir Ultime Masque Elixir Ultime');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Elixir Ultime Masque Elixir Ultime');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/elixir-ultime/masque-elixir-ultime/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chronologiste Sérum Universel','Cuidado capilar de la línea Chronologiste. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chronologiste/packshots/serum-chronologiste--200ml-01-kerastase.png?rev=042921ca983041d0a51cbee3e144efb3','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chronologiste Sérum Universel');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chronologiste Sérum Universel');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chronologiste/serum-universel/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Fusio Expertise Scrub Apaisant','Cuidado capilar de la línea Fusio Expertise. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/fusio-scrub/packshots/scrub-apaisant-1-250ml-fusio-scrub-kerastase.png?rev=2ffb845f34424ff1b9ceb9736552a51b','cabello',14,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Fusio Expertise Scrub Apaisant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Fusio Expertise Scrub Apaisant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/fusio-expertise/scrub-apaisant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Première Sérum Filler Fondamental','Cuidado capilar de la línea Première. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/premiere/serum-filler-fondamenta/atf/1.png?rev=6688fa2c11fa4b02a4cca96d4b3014fc','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Première Sérum Filler Fondamental');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Première Sérum Filler Fondamental');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/premiere/serum-filler-fondamental/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Blond Absolu 2% Pure Hyaluronic Acid Serum for Blonde Hair & Scalp','Cuidado capilar de la línea Blond Absolu. Destinado a cabello rubio o decolorado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/blond-absolu/revamp/ha-serum-packshot.png?rev=ad3e6ea00cdd4fcaaf7c62de48e9fae3','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Blond Absolu 2% Pure Hyaluronic Acid Serum for Blonde Hair & Scalp');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Blond Absolu 2% Pure Hyaluronic Acid Serum for Blonde Hair & Scalp');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/blond-absolu/hyaluronic-acid-serum/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Curl Manifesto Crème de Jour Fondamentale','Cuidado capilar de la línea Curl Manifesto. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/curl-manifesto-range/creme-packshot-visuel1_new.png?rev=5ea322a46f81471cb99083a855ed9f64','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Curl Manifesto Crème de Jour Fondamentale');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Curl Manifesto Crème de Jour Fondamentale');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/curl-manifesto/creme-de-jour-fondamentale/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Argile Équilibrante','Cuidado capilar de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/1--argile-equilibrante-optimized-1000.png?rev=fef87ba101a846d9ba2cd870e702ff62','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Argile Équilibrante');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Argile Équilibrante');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/argile-equilibrante/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_graso' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_graso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Densifique Cure Densifique','Cuidado capilar de la línea Densifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas. No reemplaza la evaluación de la causa de la caída.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/densifique/packshots/femme/cure-densifique-densifique-30x6ml-01-kerastase.png?rev=5e255b2e2c0f4c39904013b85f351241','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Densifique Cure Densifique');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Densifique Cure Densifique');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/densifique/cure-densifique/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_anticaida' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_anticaida');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Cure Apaisante','Cuidado capilar de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/cure-apaisante-specifique-30-6ml-01-kerastase.png?rev=98759812ff254264bd1a0562ee2f4446','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Cure Apaisante');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Cure Apaisante');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/cure-apaisante/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_seco' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_seco');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Cure Anti-Pelliculaire','Cuidado capilar de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas. No reemplaza la evaluación de la causa de la caída.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/cure-anti-pelliculaire-specifique-30-6ml-01-kerastase.png?rev=496985d324cb428294f9af5787f77850','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Cure Anti-Pelliculaire');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Cure Anti-Pelliculaire');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/cure-anti-pelliculaire/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Cure Anti-Chute','Cuidado capilar de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas. No reemplaza la evaluación de la causa de la caída.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/cure-anti-chute-specifique-30-6ml-01-kerastase.png?rev=84f0f7b1bc004a7bb621100fd64de60c','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Cure Anti-Chute');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Cure Anti-Chute');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/cure-anti-chute/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_anticaida' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_anticaida');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Sérum Extentioniste','Cuidado capilar de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/serum-extentioniste-resistance-50ml-01-kerastase.png?rev=60f5671cc51c40938ea26a3d99d44b37','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Sérum Extentioniste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Sérum Extentioniste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/serum-extentioniste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Spécifique Sérum Potentialiste','Cuidado capilar de la línea Spécifique. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/specifique/packshots/1--serum-potentialiste-resized-1000.png?rev=e1c08c79084048b7952f31ee499b067f','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Spécifique Sérum Potentialiste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Spécifique Sérum Potentialiste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/specifique/serum-potentialiste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Symbiose Intensive Anti-Dandruff Cellular Night Serum','Cuidado capilar de la línea Symbiose. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/symbiose/product-gallery-images/kerastase-22-symbiose-serum-90ml-inter-recto-ec1-2001.png?rev=0596a90e6af24cbf92d07fe48237ce61','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Symbiose Intensive Anti-Dandruff Cellular Night Serum');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Symbiose Intensive Anti-Dandruff Cellular Night Serum');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/symbiose/serum/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_caspa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_caspa');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
SET @producto = 13;
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis/serum-anti-chute-fortifiant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_anticaida' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_anticaida');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Genesis Homme Sérum Anti-Chute Fortifiant','Cuidado capilar de la línea Genesis Homme. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas. No reemplaza la evaluación de la causa de la caída.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/genesis-homme/serum-anti-chute-fortifiant/genesis-homme_flaconserum_03474637077495_packshots-png.png?rev=5f7ff0db386d47deb0f52a9928b2fd31','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Genesis Homme Sérum Anti-Chute Fortifiant');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Genesis Homme Sérum Anti-Chute Fortifiant');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis-homme/serum-anti-chute-fortifiant/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_anticaida' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_anticaida');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chronologiste Sérum de Nuit','Cuidado capilar de la línea Chronologiste. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chronologiste/packshots/overnight-youth-serum/ker_chronologiste_pdp_packshot_youth_night_serum_3474637332372_1x1_va.png?rev=2d46950bc50645de92faf441157dff41','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chronologiste Sérum de Nuit');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chronologiste Sérum de Nuit');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chronologiste/overnight-youth-serum/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive Nectar Thermique','Cuidado capilar de la línea Nutritive. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/revamp/nectar-thermique-packshot-new.png?rev=fbaf4484f5f64855b154d10599361abd','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive Nectar Thermique');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive Nectar Thermique');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/nectar-thermique/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive Nutri-Supplement','Cuidado capilar de la línea Nutritive. Para el cuidado cosmético del cuero cabelludo; revisá sus indicaciones específicas.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/revamp/gamme-serum-90ml-ec1.png?rev=699c628d7c0d431cae138998dda8b9b8','cabello',13,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive Nutri-Supplement');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive Nutri-Supplement');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/scalp-serum/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_cc_seco' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_cc_seco');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'capilar');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive Nutri-Supplement Split Ends Serum','Cuidado capilar de la línea Nutritive. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/revamp/split-ends-serum-packshot-new.png?rev=6d79d20a46d9475eb64c8308c1c314f4','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive Nutri-Supplement Split Ends Serum');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive Nutri-Supplement Split Ends Serum');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/split-ends-serum/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive 8H Magic Night Serum','Cuidado capilar de la línea Nutritive. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/revamp/night-serum-packshot.jpg?rev=f327989934554a59854c93cfaa120a90','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive 8H Magic Night Serum');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive 8H Magic Night Serum');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/8h-night-repair/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Sérum Thérapiste','Cuidado capilar de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/serum-therapiste-resistance-30ml-01-kerastase.png?rev=8a83b992fb5d4f278abbadcb507300eb','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Sérum Thérapiste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Sérum Thérapiste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/serum-therapiste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chroma Absolu Sérum Chroma Thermique','Cuidado capilar de la línea Chroma Absolu. Destinado a cabello con coloración.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chroma-absolu/serum-chroma-thermique/kerastase-21--chroma-absolu--all-format--leavein--150ml--recto--ec1-dbd-1optimized2.png?rev=81fde4c71da8445a95e983e1253fdf6b','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chroma Absolu Sérum Chroma Thermique');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chroma Absolu Sérum Chroma Thermique');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chroma-absolu/serum-chroma-thermique/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Curl Manifesto Gelée Curl Contour','Cuidado capilar de la línea Curl Manifesto. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/curl-manifesto/gelee-curl-contour/gele-curl-contour---packshot---visuel-1_new.png?rev=30780acfa7df4a11bb2c822e7c7518ea','cabello',14,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Curl Manifesto Gelée Curl Contour');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Curl Manifesto Gelée Curl Contour');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/curl-manifesto/gelee-curl-contour/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Genesis Défense Thermique','Cuidado capilar de la línea Genesis. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/genesis/packshots/defense-thermique/kerastase-19---genesis---defense-thermique-ec1-4301.png?rev=513f311542d548569996afdd441e325d','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Genesis Défense Thermique');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Genesis Défense Thermique');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/genesis/defense-thermique/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Soleil Crème UV Sublime','Cuidado capilar de la línea Soleil. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/soleil/packshots/creme-uv-sublime-soleil-250ml-01-kerastase.png?rev=a17242c1cb114817b7807a3b29aa3979','cabello',14,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Soleil Crème UV Sublime');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Soleil Crème UV Sublime');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/soleil/creme-uv-sublime/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Nutritive Lotion Thermique Sublimatrice','Cuidado capilar de la línea Nutritive. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/nutritive/revamp/lotion-thermique-packshot-new.png?rev=6b3c08fba03c4576976945e1eb3e0c95','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Nutritive Lotion Thermique Sublimatrice');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Nutritive Lotion Thermique Sublimatrice');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/nutritive/lotion-thermique/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Première Huile Gloss Réparatrice','Cuidado capilar de la línea Première. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/premiere/huile-gloss-reparatrice/atf/1.png?rev=d8a103a0a056459db481d6eca7eb2d75','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Première Huile Gloss Réparatrice');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Première Huile Gloss Réparatrice');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/premiere/huile-gloss-reparatrice/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Blond Absolu Huile Cica-Gloss','Cuidado capilar de la línea Blond Absolu. Destinado a cabello rubio o decolorado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/blond-absolu/huile-cicagloss/huile-cicagloss-packshot.jpg?rev=33ec992692df484294f0edf3eb88651b','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Blond Absolu Huile Cica-Gloss');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Blond Absolu Huile Cica-Gloss');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/blond-absolu/huile-cicagloss/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Chroma Absolu Huile Chroma Éclat','Cuidado capilar de la línea Chroma Absolu. Destinado a cabello con coloración.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/chroma-absolu/huile-chroma-eclat/packshot.jpg?rev=61ae15b69fc041d89dde12843cc889a7','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Chroma Absolu Huile Chroma Éclat');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Chroma Absolu Huile Chroma Éclat');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/chroma-absolu/huile-chroma-eclat/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Curl Manifesto Huile Sublime Repair','Cuidado capilar de la línea Curl Manifesto. Destinado a cabello rizado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/curl-manifesto/huile-sublime-repair/huile-packshot-visuel1_new.png?rev=b665a24387dd4ed7b1c87a3209ea818c','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Curl Manifesto Huile Sublime Repair');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Curl Manifesto Huile Sublime Repair');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/curl-manifesto/huile-sublime-repair/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_hidratacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_hidratacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'hidratacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Soleil Huile Sirène','Cuidado capilar de la línea Soleil. Para el cuidado del cabello seco.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/soleil/packshots/huile-sirene-soleil-150ml-01-kerastase.png?rev=2fe112bd0e0e470294d26986eec92a33','cabello',15,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Soleil Huile Sirène');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Soleil Huile Sirène');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/soleil/huile-sirene/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_nutricion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_nutricion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'nutricion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Ciment Thermique','Cuidado capilar de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/ciment-thermique-resistance-200ml-01-kerastase.png?rev=5fb4f981b2684aacbf845470c304ef9c','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Ciment Thermique');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Ciment Thermique');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/ciment-thermique/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Kérastase Résistance Thermique Extentioniste','Cuidado capilar de la línea Résistance. Para cabello debilitado o dañado.','Kérastase',NULL,'https://www.kerastase.com/-/media/project/loreal/brand-sites/kerastase/emea/inter/products/resistance/packshots/thermique-extentioniste-01-kerastase.png?rev=f51a59c39cf74a7a9a9d1fae87117072','cabello',16,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Kérastase Résistance Thermique Extentioniste');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Kérastase Résistance Thermique Extentioniste');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.kerastase.com/products/resistance/thermique-extentioniste/','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'cabello_necesita_reparacion' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='cabello_necesita_reparacion');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'reparacion');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage BARIÉDERM - Cleansing Cica-Gel','Limpiador para la higiene de la piel; consultá las zonas de aplicación del fabricante.','Uriage',NULL,'https://www.uriage.com/system/products/images/207/product_thumb_bariederm-3.png?1652878836','corporal',8,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage BARIÉDERM - Cleansing Cica-Gel');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage BARIÉDERM - Cleansing Cica-Gel');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/bariederm-cica-gel-nettoyant','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_sin_textura' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_sin_textura');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage BARIÉDERM-CICA Cream','Cuidado de la piel de la línea Bariéderm-Cica.','Uriage',NULL,'https://www.uriage.com/system/products/images/206/product_thumb_uriage-bariederm-cica-creme-100ml.png?1626699239','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage BARIÉDERM-CICA Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage BARIÉDERM-CICA Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/bariederm-cica-creme','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_sensible' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_sensible');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage EAU THERMALE - Silky Body Lotion','Hidratante para zonas externas del cuerpo con sequedad. Consultá su modo de uso.','Uriage',NULL,'https://www.uriage.com/system/products/images/195/product_thumb_fr-fr-lait-500.png?1726220366','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage EAU THERMALE - Silky Body Lotion');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage EAU THERMALE - Silky Body Lotion');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/silky-body-lotion','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage HYSÉAC - Cleansing Gel','Limpiador para la higiene de la piel; consultá las zonas de aplicación del fabricante.','Uriage',NULL,'https://www.uriage.com/system/products/images/11/product_thumb_fr-fr-hyseac-gel-nettoyant-150.png?1723628584','corporal',8,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage HYSÉAC - Cleansing Gel');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage HYSÉAC - Cleansing Gel');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/hyseac-gel-nettoyant','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pecho_abdomen' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pecho_abdomen');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_brazos_piernas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_brazos_piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage XÉMOSE - Gentle Cleansing Syndet','Limpiador para la higiene de la piel; consultá las zonas de aplicación del fabricante.','Uriage',NULL,'https://www.uriage.com/system/products/images/110/product_thumb_nouveau-syndet-1.png?1759219456','corporal',8,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage XÉMOSE - Gentle Cleansing Syndet');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage XÉMOSE - Gentle Cleansing Syndet');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/xemose-syndet','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_sin_textura' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_sin_textura');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage XÉMOSE - Lipid-Replenishing Anti-Irritation Cream','Hidratante para zonas externas del cuerpo con sequedad. Consultá su modo de uso.','Uriage',NULL,'https://www.uriage.com/system/products/images/106/product_thumb_nouvel-1.png?1759219806','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage XÉMOSE - Lipid-Replenishing Anti-Irritation Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage XÉMOSE - Lipid-Replenishing Anti-Irritation Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/xemose-creme-emolliente-universelle','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage BARIÉDERM - Cream','Hidratante para zonas externas del cuerpo con sequedad. Consultá su modo de uso.','Uriage',NULL,'https://www.uriage.com/system/products/images/205/product_thumb_uriage-bariederm-creme-isolante-reparatrice.png?1626700257','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage BARIÉDERM - Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage BARIÉDERM - Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/bariederm-creme-1','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage BARIÉDERM-CICA Hand Cream','Crema para el cuidado de las manos.','Uriage',NULL,'https://www.uriage.com/system/products/images/201/product_thumb_uriage-bariederm-cica-creme-mains-isolante-reparatrice.png?1626699557','corporal',6,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage BARIÉDERM-CICA Hand Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage BARIÉDERM-CICA Hand Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/bariederm-hand-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage BARIÉDERM-CICA Lips','Bálsamo para el cuidado de los labios.','Uriage',NULL,'https://www.uriage.com/system/products/images/55/product_thumb_bariederm-cica-levres-15ml-1120-hd-transparent-craiyon.png?1741691959','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage BARIÉDERM-CICA Lips');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage BARIÉDERM-CICA Lips');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/bariederm-levres','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage BARIÉDERM-CICA Ointment Fissures Cracks','Hidratante para zonas externas del cuerpo con sequedad. Consultá su modo de uso.','Uriage',NULL,'https://www.uriage.com/system/products/images/54/product_thumb_uriage-bariederm-cica-onguent-fissures-crevasses.png?1626700765','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage BARIÉDERM-CICA Ointment Fissures Cracks');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage BARIÉDERM-CICA Ointment Fissures Cracks');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/bariederm-fissures-crevasses','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage CLEANSING CREAM','Limpiador para la higiene de la piel; consultá las zonas de aplicación del fabricante.','Uriage',NULL,'https://www.uriage.com/system/products/images/97/product_thumb_creme-lavante.png?1706792811','corporal',8,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage CLEANSING CREAM');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage CLEANSING CREAM');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/creme-lavante-1','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_sin_textura' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_sin_textura');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage EAU THERMALE - Water Hand Cream','Crema para el cuidado de las manos.','Uriage',NULL,'https://www.uriage.com/system/products/images/215/product_thumb_eau-thermale-creme-mains-50ml-1023-hd.png?1738224220','corporal',6,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage EAU THERMALE - Water Hand Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage EAU THERMALE - Water Hand Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/water-hand-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage XÉMOSE - Lipid-Replenishing Anti-Irritation Cerat','Hidratante para zonas externas del cuerpo con sequedad. Consultá su modo de uso.','Uriage',NULL,'https://www.uriage.com/system/products/images/107/product_thumb_nouveau-cerat.png?1759219547','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage XÉMOSE - Lipid-Replenishing Anti-Irritation Cerat');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage XÉMOSE - Lipid-Replenishing Anti-Irritation Cerat');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/xemose-cerat','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage Age Absolu - Collagen booster micro-redensifying serum','Cuidado facial para el aspecto de líneas y firmeza.','Uriage',NULL,'https://www.uriage.com/system/products/images/369/product_thumb_serum.png?1728563129','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage Age Absolu - Collagen booster micro-redensifying serum');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage Age Absolu - Collagen booster micro-redensifying serum');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/age-absolu-collagen-booster-micro-redensifying-serum','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage AGE ABSOLU - Eye contour balm','Cuidado específico para el contorno de ojos.','Uriage',NULL,'https://www.uriage.com/system/products/images/386/product_thumb_blank-variation-01-landscape-16-9-5-removebg-preview.png?1756889675','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage AGE ABSOLU - Eye contour balm');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage AGE ABSOLU - Eye contour balm');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/age-absolu-eye-contour-balm','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage AGE ABSOLU - REDENSIFYING NIGHT CARE','Cuidado facial para el aspecto de líneas y firmeza.','Uriage',NULL,'https://www.uriage.com/system/products/images/335/product_thumb_fr-fr-soin-de-nuit.png?1767969154','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage AGE ABSOLU - REDENSIFYING NIGHT CARE');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage AGE ABSOLU - REDENSIFYING NIGHT CARE');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/age-absolu-redensifying-sleeping-mask','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage AGE ABSOLU - REDENSIFYING ROSY CREAM','Cuidado facial hidratante.','Uriage',NULL,'https://www.uriage.com/system/products/images/334/product_thumb_age-absolu.png?1658157723','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage AGE ABSOLU - REDENSIFYING ROSY CREAM');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage AGE ABSOLU - REDENSIFYING ROSY CREAM');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/redensifying-rosy-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage Cica Daily Repairing cream concentrate','Cuidado facial hidratante.','Uriage',NULL,'https://www.uriage.com/system/products/images/364/product_thumb_cica-daily-concentrecreme-50ml-0923-ld.png?1708361560','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage Cica Daily Repairing cream concentrate');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage Cica Daily Repairing cream concentrate');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/cica-daily-repairing-cream-concentrate','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage Dépiderm - Anti-dark spot brightening booster serum','Cuidado facial orientado al aspecto de las manchas.','Uriage',NULL,'https://www.uriage.com/system/products/images/356/product_thumb_s-rum-anti-taches-booster-eclat.png?1693920075','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage Dépiderm - Anti-dark spot brightening booster serum');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage Dépiderm - Anti-dark spot brightening booster serum');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/anti-dark-spot-brightening-booster-serum','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_manchas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_manchas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage Dépiderm - Anti-dark spot daytime care SPF50+','Cuidado facial orientado al aspecto de las manchas.','Uriage',NULL,'https://www.uriage.com/system/products/images/358/product_thumb_soin-de-jour-anti-taches.png?1693920558','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage Dépiderm - Anti-dark spot daytime care SPF50+');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage Dépiderm - Anti-dark spot daytime care SPF50+');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/depiderm-anti-dark-spot-daytime-care-spf50+','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_manchas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_manchas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage Dépiderm - Anti-dark spot intensive care','Cuidado facial orientado al aspecto de las manchas.','Uriage',NULL,'https://www.uriage.com/system/products/images/357/product_thumb_soin-intensif-anti-taches.png?1693920417','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage Dépiderm - Anti-dark spot intensive care');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage Dépiderm - Anti-dark spot intensive care');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/depiderm-anti-dark-spot-intensive-care','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_manchas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_manchas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage Dépiderm - Corrective eye contour care','Cuidado específico para el contorno de ojos.','Uriage',NULL,'https://www.uriage.com/system/products/images/361/product_thumb_depiderm-soin-cdy-15ml-0323-hd.png?1717077212','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage Dépiderm - Corrective eye contour care');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage Dépiderm - Corrective eye contour care');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/depiderm-corrective-eye-contour-care','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage EAU THERMALE - Water Cream','Cuidado facial hidratante.','Uriage',NULL,'https://www.uriage.com/system/products/images/190/product_thumb_fr-creme-eau-40ml.png?1680697651','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage EAU THERMALE - Water Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage EAU THERMALE - Water Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/light-water-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage EAU THERMALE - Water Eye Contour Cream','Cuidado específico para el contorno de ojos.','Uriage',NULL,'https://www.uriage.com/system/products/images/194/product_thumb_fr-soin-eau-contour-yeux.png?1680698135','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage EAU THERMALE - Water Eye Contour Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage EAU THERMALE - Water Eye Contour Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/water-eye-contour-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage EAU THERMALE - Water Sleeping Mask','Cuidado facial hidratante.','Uriage',NULL,'https://www.uriage.com/system/products/images/217/product_thumb_fr-masque-eau-nuit-50ml.png?1680698519','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage EAU THERMALE - Water Sleeping Mask');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage EAU THERMALE - Water Sleeping Mask');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/water-night-mask','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage H.A. BOOSTER SERUM','Cuidado facial hidratante.','Uriage',NULL,'https://www.uriage.com/system/products/images/354/product_thumb_fr-serum-booster-ha.png?1679391250','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage H.A. BOOSTER SERUM');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage H.A. BOOSTER SERUM');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/h-a-booster-serum','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_seca' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_seca');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_normal' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_normal');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage 3-REGUL+ Global anti-blemish care','Cuidado facial para piel con tendencia a imperfecciones.','Uriage',NULL,'https://www.uriage.com/system/products/images/359/product_thumb_hyseac-regul.png?1723628387','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage 3-REGUL+ Global anti-blemish care');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage 3-REGUL+ Global anti-blemish care');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/3-regul+-global-anti-blemish-care','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_acne' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_acne');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_grasa' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_grasa');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_mixta' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_mixta');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage AGE LIFT - FIRMING SMOOTHING DAY CREAM','Cuidado facial para el aspecto de líneas y firmeza.','Uriage',NULL,'https://www.uriage.com/system/products/images/338/product_thumb_v2.png?1662394526','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage AGE LIFT - FIRMING SMOOTHING DAY CREAM');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage AGE LIFT - FIRMING SMOOTHING DAY CREAM');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/age-lift-firming-smoothing-day-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage AGE LIFT - FIRMING SMOOTHING DAY FLUID','Cuidado facial para el aspecto de líneas y firmeza.','Uriage',NULL,'https://www.uriage.com/system/products/images/341/product_thumb_fluide-jour-v2.png?1662394902','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage AGE LIFT - FIRMING SMOOTHING DAY FLUID');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage AGE LIFT - FIRMING SMOOTHING DAY FLUID');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/age-lift-firming-smoothing-day-fluid','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage AGE LIFT - INTENSIVE FIRMING SMOOTHING SERUM','Cuidado facial para el aspecto de líneas y firmeza.','Uriage',NULL,'https://www.uriage.com/system/products/images/342/product_thumb_s-rum-v2.png?1662395063','facial',2,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage AGE LIFT - INTENSIVE FIRMING SMOOTHING SERUM');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage AGE LIFT - INTENSIVE FIRMING SMOOTHING SERUM');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/age-lift-intensive-firming-smoothing-serum','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piel');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'frente');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'Uriage EAU THERMALE - Lipstick','Bálsamo para el cuidado de los labios.','Uriage',NULL,'https://www.uriage.com/system/products/images/100/product_thumb_uriage-hydratation-stick-levres-hydratant.png?1626179996','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='Uriage EAU THERMALE - Lipstick');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='Uriage EAU THERMALE - Lipstick');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.uriage.com/SG/en/products/stick-levres','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Intensive Moisturizing Lotion','Hidratante para la piel seca del cuerpo y zonas externas resecas.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/skincare/2026/05/iml/12oz/700x785/09-iml-12oz-pdp-700x785-v1.jpg?rev=12e577d453cb434483501d421c4703c6&w=354&hash=C71CD7D5CBE47885A7C7AAD707E4869E','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Intensive Moisturizing Lotion');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Intensive Moisturizing Lotion');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/intensive-moisturizing-lotion','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Intensive Moisturizing Cream','Hidratante para la piel seca del cuerpo y zonas externas resecas.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products/intensive-moisturizing-cream-pdp/intensive-moisturizing-cream-front-700x875-pdp_v1.png?rev=f50e22b351454a998913046d6d5a4447&w=354&hash=3FB83F8CB04990A73522AD759E3FEB93','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Intensive Moisturizing Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Intensive Moisturizing Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/intensive-moisturizing-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Moisturizing Cream','Hidratante para la piel seca del cuerpo y zonas externas resecas.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/skincare/moisturizers/moisturizing-cream/moisturizing-cream-12oz-front.jpg?rev=a6959c87b34f4e7c803db48d2effdaec&w=354&hash=93D7C6044B9636CE626D85395D84CA34','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Moisturizing Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Moisturizing Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/moisturizing-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Daily Moisturizing Lotion','Hidratante para la piel seca del cuerpo y zonas externas resecas.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/skincare/moisturizers/daily-moisturizing-lotion/2025/daily-moisturizing-lotion_front.jpg?rev=289f877c25bd49c28b66385e8e16ce22&w=354&hash=B81FBA99C376B8936D2055EF22F6E1BD','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Daily Moisturizing Lotion');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Daily Moisturizing Lotion');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/daily-moisturizing-lotion','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe SA Cream for Rough & Bumpy Skin','Cuidado corporal para piel áspera. Revisá las precauciones del fabricante.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products/sa-cream-for-rough-and-bumpy-skin/sa-cream_front.jpg?rev=eb7e8aaeff4846c48b5030d6c61c47d6&w=354&hash=163E2941E6813E52984B071BDBAF9D86','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe SA Cream for Rough & Bumpy Skin');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe SA Cream for Rough & Bumpy Skin');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/sa-cream-for-rough-and-bumpy-skin','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_brazos_piernas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_brazos_piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe SA Lotion for Rough & Bumpy Skin','Cuidado corporal para piel áspera. Revisá las precauciones del fabricante.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products/sa-lotion-for-rough-and-bumpy-skin/sa-lotion_front.jpg?rev=24370ce209ce41d3bd90cabbdbc88202&w=354&hash=B47AB01B40F0A2749B44A9DB47792C05','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe SA Lotion for Rough & Bumpy Skin');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe SA Lotion for Rough & Bumpy Skin');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/sa-lotion-for-rough-and-bumpy-skin','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_brazos_piernas' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_brazos_piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Healing Ointment','Hidratante para la piel seca del cuerpo y zonas externas resecas.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/skincare/moisturizers/healing-ointment/2025/healing-ointment_front.jpg?rev=c41d50fa05b34fa59e5affe3b389b681&w=354&hash=D4A7C5252A17AC5069CFE7E1534477F6','corporal',7,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Healing Ointment');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Healing Ointment');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/healing-ointment','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_piernas_brazos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_piernas_brazos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_manos' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_manos');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'corporal_pies' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='corporal_pies');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'brazos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'codos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'espalda');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'torso');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'piernas');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'manos');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'pies');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Skin Renewing Vitamin C Eye Cream','Cuidado específico para el contorno de ojos.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/skincare/moisturizers/skin-renewing-vitamin-c-eye-cream/vitamin-c-eye-cream_front.jpg?rev=a63d40c634a64b898f40c79f7212f198&w=354&hash=E5CA7E4A005AC2D38F7F0860C806F553','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Skin Renewing Vitamin C Eye Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Skin Renewing Vitamin C Eye Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/facial-moisturizers/skin-renewing-vitamin-c-eye-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Skin Renewing Eye Cream','Cuidado específico para el contorno de ojos.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products/skin-renewing-eye-cream/skin-renewing-eye-cream_front.jpg?rev=9a751a43373348fba837c66cfbead482&w=354&hash=A254BFBF11FEAF87987DC574DC5BF77C','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Skin Renewing Eye Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Skin Renewing Eye Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/facial-moisturizers/skin-renewing-eye-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Eye Repair Cream','Cuidado específico para el contorno de ojos.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products/eye-repair-cream/eye-repair-cream_front.jpg?rev=dd87c63af0bc4ac0bde211d91e6f59e6&w=354&hash=5DED255DA6268C925B749FDE23123496','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Eye Repair Cream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Eye Repair Cream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/moisturizers/eye-repair-cream','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_ojeras' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_ojeras');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_envejecimiento' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_envejecimiento');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'ojeras');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'CeraVe Healing Lip Balm','Bálsamo para el cuidado de labios secos.','CeraVe',NULL,'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/skincare/2026/07/healing-lip-balm/001-healing-lip-balm-700x785-v1.jpg?rev=5907788259174ab0a94380ee1bfe1a1d&w=354&hash=268B715EA5C988A1AD12AEE72BFFFEA3','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='CeraVe Healing Lip Balm');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='CeraVe Healing Lip Balm');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.cerave.com/skincare/ointment/healing-ointment-lip-balm','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'NIVEA Bálsamo labial Humectante Original Care','Bálsamo para el cuidado cotidiano de los labios. Consultá los ingredientes si tenés sensibilidad a perfumes.','NIVEA',NULL,'https://img.nivea.com/-/media/miscellaneous/media-center-items/4/4/b/bf1ea457f8c448ff9a2db3c9bd01a1f1-web_1010x1180_transparent_png.png','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='NIVEA Bálsamo labial Humectante Original Care');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='NIVEA Bálsamo labial Humectante Original Care');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.nivea.com.ar/productos/balsamo-labial-humectante-original-care-40060000054780087.html','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'NIVEA Bálsamo Labial Soft Rosé','Bálsamo para el cuidado cotidiano de los labios. Consultá los ingredientes si tenés sensibilidad a perfumes.','NIVEA',NULL,'https://img.nivea.com/-/media/miscellaneous/media-center-items/e/e/5/a8b5cb61f69944e28c15e99f93322d94-web_1010x1180_transparent_png.png','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='NIVEA Bálsamo Labial Soft Rosé');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='NIVEA Bálsamo Labial Soft Rosé');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.nivea.com.ar/productos/balsamo-labial-soft-rose-40060000054920087.html','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'NIVEA Bálsamo Labial Humectante Cherry Shine','Bálsamo para el cuidado cotidiano de los labios. Consultá los ingredientes si tenés sensibilidad a perfumes.','NIVEA',NULL,'https://img.nivea.com/-/media/miscellaneous/media-center-items/c/f/4/24f3b728da434c11b108088f5749403d-web_1010x1180_transparent_png.png','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='NIVEA Bálsamo Labial Humectante Cherry Shine');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='NIVEA Bálsamo Labial Humectante Cherry Shine');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.nivea.com.ar/productos/balsamo-labial-humectante-cherry-shine-40060000055080087.html','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'NIVEA Bálsamo Labial Humectante Blackberry Shine','Bálsamo para el cuidado cotidiano de los labios. Consultá los ingredientes si tenés sensibilidad a perfumes.','NIVEA',NULL,'https://img.nivea.com/-/media/miscellaneous/media-center-items/a/5/1/d8a95c0a48fb448fb9545693e2b2da64-web_1010x1180_transparent_png.png','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='NIVEA Bálsamo Labial Humectante Blackberry Shine');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='NIVEA Bálsamo Labial Humectante Blackberry Shine');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.nivea.com.ar/productos/balsamo-labial-humectante-blackberry-shine-40060000055220087.html','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'NIVEA Bálsamo Labial Humectante Vainilla Buttercream','Bálsamo para el cuidado cotidiano de los labios. Consultá los ingredientes si tenés sensibilidad a perfumes.','NIVEA',NULL,'https://img.nivea.com/-/media/miscellaneous/media-center-items/e/2/0/7c9674583fb346bea01ade562cf03303-web_1010x1180_transparent_png.png','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='NIVEA Bálsamo Labial Humectante Vainilla Buttercream');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='NIVEA Bálsamo Labial Humectante Vainilla Buttercream');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.nivea.com.ar/productos/balsamo-labial-humectante-vainilla-buttercream-40060000055390087.html','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'NIVEA NIVEA Lip Glow 10ml','Bálsamo para el cuidado cotidiano de los labios. Consultá los ingredientes si tenés sensibilidad a perfumes.','NIVEA',NULL,'https://img.nivea.com/-/media/miscellaneous/media-center-items/7/4/b/94df087326ef43e18113047578ae550e-web_1010x1180_transparent_png.png','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='NIVEA NIVEA Lip Glow 10ml');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='NIVEA NIVEA Lip Glow 10ml');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.nivea.com.ar/productos/nivea-lip-glow-10ml-40060001956810087.html','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO productos (nombre,descripcion,marca,precio,imagen_url,Id_Categorias,id_subcategoria,activo) SELECT 'NIVEA Bálsamo Labial Humectante Med Repair FPS 20','Bálsamo para el cuidado cotidiano de los labios. Consultá los ingredientes si tenés sensibilidad a perfumes.','NIVEA',NULL,'https://img.nivea.com/-/media/miscellaneous/media-center-items/d/b/6/cf30840f8cea480ca9386c3d0d947693-screen.jpg','facial',3,1 WHERE NOT EXISTS (SELECT 1 FROM productos WHERE nombre='NIVEA Bálsamo Labial Humectante Med Repair FPS 20');
SET @producto = (SELECT MIN(id_producto) FROM productos WHERE nombre='NIVEA Bálsamo Labial Humectante Med Repair FPS 20');
INSERT INTO informacion_productos (id_producto,origen_url,fecha_revision) VALUES (@producto,'https://www.nivea.com.ar/productos/balsamo-labial-humectante-med-repair-fps-20-40060000054850087.html','2026-10-08') ON DUPLICATE KEY UPDATE origen_url=VALUES(origen_url),fecha_revision=VALUES(fecha_revision);
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_labios' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_labios');
INSERT INTO tags_productos (id_producto,tag) SELECT @producto,'facial_basico' WHERE NOT EXISTS (SELECT 1 FROM tags_productos WHERE id_producto=@producto AND tag='facial_basico');
INSERT IGNORE INTO secciones_productos (id_producto,seccion) VALUES (@producto,'labios');
INSERT INTO preguntas (bloque,numero_pregunta,texto_pregunta,tipo_pregunta,orden,activa) SELECT 'facial',9,'¿Querés incluir cuidados específicos para estas zonas del rostro?','multiple',9,1 WHERE NOT EXISTS (SELECT 1 FROM preguntas WHERE texto_pregunta='¿Querés incluir cuidados específicos para estas zonas del rostro?');
SET @pregunta_zonas = (SELECT MIN(id_pregunta) FROM preguntas WHERE texto_pregunta='¿Querés incluir cuidados específicos para estas zonas del rostro?');
INSERT INTO opciones_respuesta (id_pregunta,letra,texto_opcion,tag,orden) SELECT @pregunta_zonas,'A','Labios secos o agrietados.','facial_labios',1 WHERE NOT EXISTS (SELECT 1 FROM opciones_respuesta WHERE id_pregunta=@pregunta_zonas AND tag='facial_labios');
INSERT INTO opciones_respuesta (id_pregunta,letra,texto_opcion,tag,orden) SELECT @pregunta_zonas,'B','Contorno de ojos y aspecto de ojeras.','facial_ojeras',2 WHERE NOT EXISTS (SELECT 1 FROM opciones_respuesta WHERE id_pregunta=@pregunta_zonas AND tag='facial_ojeras');
INSERT INTO opciones_respuesta (id_pregunta,letra,texto_opcion,tag,orden) SELECT @pregunta_zonas,'C','Ninguna de estas zonas.','facial_sin_zonas',3 WHERE NOT EXISTS (SELECT 1 FROM opciones_respuesta WHERE id_pregunta=@pregunta_zonas AND tag='facial_sin_zonas');
COMMIT;
