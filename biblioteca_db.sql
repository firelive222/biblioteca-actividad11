-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2026 a las 02:15:56
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
-- Base de datos: `biblioteca_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(80) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo`, `autor`, `categoria`) VALUES
(1, 'El principito', 'Antoine de Saint-Exupéry', 'Novela'),
(2, 'Cien años de soledad', 'Gabriel García Márquez', 'Novela'),
(3, 'Aprender SQL', 'Equipo SENA', 'Educativo'),
(4, 'Don Quijote', 'Miguel de Cervantes', 'Clásico'),
(5, 'La Odisea', 'Homero', 'Clásico'),
(6, 'Matemáticas básicas', 'Carlos Pérez', 'Educativo'),
(7, 'El túnel', 'Ernesto Sabato', 'Novela'),
(8, 'La metamorfosis', 'Franz Kafka', 'Ficción'),
(9, 'Código limpio', 'Robert C. Martin', 'Tecnología'),
(10, 'Python básico', 'Equipo técnico', 'Tecnología'),
(11, 'Java desde cero', 'Equipo técnico', 'Tecnología'),
(12, 'Fundamentos de HTML', 'Equipo SENA', 'Educativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion_prevista` date DEFAULT NULL,
  `fecha_devolucion_real` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `id_usuario`, `id_libro`, `fecha_prestamo`, `fecha_devolucion_prevista`, `fecha_devolucion_real`) VALUES
(1, 1, 1, '2026-10-01', '2026-10-15', NULL),
(2, 2, 2, '2026-10-02', '2026-10-16', NULL),
(3, 3, 3, '2026-10-03', '2026-10-17', NULL),
(4, 4, 4, '2026-10-04', '2026-10-18', NULL),
(5, 5, 5, '2026-10-05', '2026-10-19', NULL),
(6, 6, 6, '2026-10-06', '2026-10-20', NULL),
(7, 7, 7, '2026-10-07', '2026-10-21', NULL),
(8, 8, 8, '2026-10-08', '2026-10-22', NULL),
(9, 9, 9, '2026-10-09', '2026-10-23', NULL),
(10, 10, 10, '2026-10-10', '2026-10-24', NULL),
(11, 11, 11, '2026-10-11', '2026-10-25', NULL),
(12, 12, 12, '2026-10-12', '2026-10-26', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `documento`, `telefono`) VALUES
(1, 'Ana Ruiz', '1001', '3101111111'),
(2, 'Carlos Pérez', '1002', '3102222222'),
(3, 'Laura Gómez', '1003', '3103333333'),
(4, 'Juan Torres', '1004', '3104444444'),
(5, 'María López', '1005', '3105555555'),
(6, 'Pedro Díaz', '1006', '3106666666'),
(7, 'Sofía Castro', '1007', '3107777777'),
(8, 'Andrés Rojas', '1008', '3108888888'),
(9, 'Camila Mora', '1009', '3109999999'),
(10, 'Daniel Silva', '1010', '3110000000'),
(11, 'Valentina Ruiz', '1011', '3121111111'),
(12, 'Sebastián León', '1012', '3122222222'),
(13, 'jhohan', '12345678910', NULL),
(14, 'claudia', '123456123', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
