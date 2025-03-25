-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2025 a las 12:08:39
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
-- Base de datos: `reto3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitros`
--

CREATE TABLE `arbitros` (
  `Arb_id` int(11) NOT NULL,
  `Arb_Nficha` varchar(10) NOT NULL CHECK (`Arb_Nficha` regexp '^[0-9]{4}-[0-9]{4}[A-Za-z]$'),
  `Arb_nombre_completo` varchar(255) NOT NULL,
  `Arb_nacionalidad` varchar(3) NOT NULL DEFAULT 'ESP',
  `Arb_titulacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `arbitros`
--

INSERT INTO `arbitros` (`Arb_id`, `Arb_Nficha`, `Arb_nombre_completo`, `Arb_nacionalidad`, `Arb_titulacion`) VALUES
(1, '1000-1000A', 'Angel Torres', 'ESP', 'Nivel A'),
(2, '2000-2000B', 'Pierre Dubois', 'FRA', 'Nivel B'),
(3, '3000-3000C', 'Hans Muller', 'GER', 'Nivel C'),
(4, '4000-4000D', 'Marco Rossi', 'ITA', 'Nivel A'),
(5, '5000-5000E', 'Joao Silva', 'POR', 'Nivel B'),
(6, '6000-6000F', 'John Smith', 'USA', 'Nivel C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `Equ_id` int(11) NOT NULL,
  `Equ_nombre` varchar(255) NOT NULL,
  `Equ_entrenador` varchar(255) NOT NULL,
  `Equ_fundacion` date NOT NULL,
  `Equ_victorias` smallint(5) UNSIGNED DEFAULT 0,
  `Equ_derrotas` smallint(5) UNSIGNED DEFAULT 0,
  `Equ_puntos_totales` smallint(5) UNSIGNED DEFAULT 0,
  `Equ_total_partidos` smallint(5) UNSIGNED DEFAULT 0,
  `Equ_id_foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`Equ_id`, `Equ_nombre`, `Equ_entrenador`, `Equ_fundacion`, `Equ_victorias`, `Equ_derrotas`, `Equ_puntos_totales`, `Equ_total_partidos`, `Equ_id_foto`) VALUES
(1, 'Dinamo Moscu', 'Carlos Garcia', '2001-01-01', 6, 4, 252, 10, 'A1'),
(2, 'Modena Volley', 'Luis Martinez', '2002-01-01', 4, 6, 230, 10, 'B1'),
(3, 'Sada Cruzeiro', 'Javier Lopez', '2003-01-01', 3, 7, 233, 10, 'C1'),
(4, 'Zenit Kazan', 'Antonio Fernandez', '2004-01-01', 7, 3, 247, 10, 'D1'),
(5, 'Perugia Volley', 'Manuel Rodriguez', '2005-01-01', 5, 5, 225, 10, 'E1'),
(6, 'Bolivar Voley', 'Sergio Sanchez', '2006-01-01', 5, 5, 247, 10, 'F1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `Jor_id` int(11) NOT NULL,
  `Jor_jugado` tinyint(1) NOT NULL DEFAULT 0,
  `Jor_id_temporada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`Jor_id`, `Jor_jugado`, `Jor_id_temporada`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 0, 1),
(7, 0, 1),
(8, 0, 1),
(9, 1, 1),
(10, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `Jug_id` int(11) NOT NULL,
  `Jug_Nficha` varchar(10) NOT NULL CHECK (`Jug_Nficha` regexp '^[0-9]{4}-[0-9]{4}[A-Za-z]$'),
  `Jug_nombre_completo` varchar(255) NOT NULL,
  `Jug_nacimiento` date NOT NULL DEFAULT '2000-01-01',
  `Jug_dorsal` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `Jug_posicion` varchar(255) NOT NULL,
  `Jug_altura` float(3,2) NOT NULL,
  `Jug_peso` smallint(5) UNSIGNED NOT NULL,
  `Jug_foto` smallint(5) UNSIGNED DEFAULT 0,
  `Jug_nacionalidad` varchar(3) DEFAULT 'ESP',
  `Jug_id_equipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`Jug_id`, `Jug_Nficha`, `Jug_nombre_completo`, `Jug_nacimiento`, `Jug_dorsal`, `Jug_posicion`, `Jug_altura`, `Jug_peso`, `Jug_foto`, `Jug_nacionalidad`, `Jug_id_equipo`) VALUES
(1, '1001-1001A', 'Carlos Lopez', '1995-11-12', 13, 'Armador', 1.85, 82, 0, 'ESP', 1),
(2, '1001-1002B', 'Javier Torres', '1998-11-26', 5, 'Opuesto', 1.98, 84, 0, 'ESP', 1),
(3, '1001-1003C', 'Luis Martinez', '1990-01-07', 1, 'Receptor 1', 1.79, 97, 0, 'ESP', 1),
(4, '1001-1004D', 'Juan Perez', '1995-03-10', 19, 'Receptor 2', 2.05, 88, 0, 'ESP', 1),
(5, '1001-1005E', 'Antonio Gomez', '1995-12-15', 20, 'Central', 1.79, 94, 0, 'ESP', 1),
(6, '1001-1006F', 'Fernando Ruiz', '1996-08-04', 4, 'Libero', 1.74, 83, 0, 'ESP', 1),
(7, '1001-1007G', 'Manuel Diaz', '1986-05-16', 18, 'Armador', 2.01, 100, 0, 'ESP', 1),
(8, '1001-1008H', 'Sergio Sanchez', '1997-12-08', 21, 'Opuesto', 1.74, 69, 0, 'ESP', 1),
(9, '1001-1009I', 'David Hernandez', '1985-11-08', 29, 'Receptor 1', 1.96, 72, 0, 'ESP', 1),
(10, '1001-1010J', 'Jorge Ramos', '1999-01-04', 22, 'Receptor 2', 1.99, 87, 0, 'ESP', 1),
(11, '1001-1011K', 'Raul Fernandez', '1999-08-14', 11, 'Central', 2.00, 91, 0, 'ESP', 1),
(12, '1001-1012L', 'Angel Gutierrez', '1990-10-23', 26, 'Libero', 1.85, 100, 0, 'ESP', 1),
(13, '1002-2001A', 'Mario Lopez', '1995-01-12', 2, 'Armador', 1.87, 81, 0, 'ESP', 2),
(14, '1002-2002B', 'Pedro Garcia', '1998-05-25', 4, 'Opuesto', 1.93, 88, 0, 'ESP', 2),
(15, '1002-2003C', 'Juan Gomez', '1992-03-17', 5, 'Receptor 1', 1.96, 85, 0, 'ESP', 2),
(16, '1002-2004D', 'Manuel Torres', '1993-07-21', 6, 'Receptor 2', 1.98, 78, 0, 'ESP', 2),
(17, '1002-2005E', 'Pablo Sanchez', '1991-10-02', 7, 'Central', 2.01, 90, 0, 'ESP', 2),
(18, '1002-2006F', 'David Ruiz', '1997-12-18', 8, 'Libero', 1.75, 72, 0, 'ESP', 2),
(19, '1002-2007G', 'Alberto Herrera', '1994-09-09', 10, 'Armador', 1.88, 87, 0, 'ESP', 2),
(20, '1002-2008H', 'Rafael Moreno', '1999-06-06', 11, 'Opuesto', 1.89, 80, 0, 'ESP', 2),
(21, '1002-2009I', 'Lucas Castro', '1990-11-13', 12, 'Receptor 1', 1.94, 84, 0, 'ESP', 2),
(22, '1002-2010J', 'Andres Vega', '1996-02-28', 13, 'Receptor 2', 1.92, 79, 0, 'ESP', 2),
(23, '1002-2011K', 'Carlos Rojas', '1993-04-14', 14, 'Central', 2.03, 88, 0, 'ESP', 2),
(24, '1002-2012L', 'Victor Jimenez', '1995-08-20', 15, 'Libero', 1.76, 74, 0, 'ESP', 2),
(25, '1003-3001A', 'Sergio Navarro', '1994-04-11', 1, 'Armador', 1.86, 83, 0, 'ESP', 3),
(26, '1003-3002B', 'Adrian Perez', '1996-06-14', 3, 'Opuesto', 1.90, 86, 0, 'ESP', 3),
(27, '1003-3003C', 'Jorge Medina', '1993-12-19', 9, 'Receptor 1', 1.95, 89, 0, 'ESP', 3),
(28, '1003-3004D', 'Luis Blanco', '1991-03-21', 17, 'Receptor 2', 1.97, 82, 0, 'ESP', 3),
(29, '1003-3005E', 'Antonio Ortega', '1990-05-31', 18, 'Central', 2.00, 91, 0, 'ESP', 3),
(30, '1003-3006F', 'Francisco Gil', '1998-09-16', 20, 'Libero', 1.73, 76, 0, 'ESP', 3),
(31, '1003-3007G', 'Angel Marin', '1995-11-27', 22, 'Armador', 1.84, 80, 0, 'ESP', 3),
(32, '1003-3008H', 'Miguel Serrano', '1999-01-09', 23, 'Opuesto', 1.92, 87, 0, 'ESP', 3),
(33, '1003-3009I', 'Ricardo Romero', '1997-07-04', 24, 'Receptor 1', 1.96, 85, 0, 'ESP', 3),
(34, '1003-3010J', 'Daniel Ponce', '1998-10-13', 25, 'Receptor 2', 1.91, 83, 0, 'ESP', 3),
(35, '1003-3011K', 'Ruben Campos', '1996-02-07', 26, 'Central', 2.02, 89, 0, 'ESP', 3),
(36, '1003-3012L', 'Ivan Alvarez', '1995-03-22', 28, 'Libero', 1.78, 78, 0, 'ESP', 3),
(37, '1004-4001A', 'Oscar Vidal', '1993-07-01', 2, 'Armador', 1.87, 81, 0, 'ESP', 4),
(38, '1004-4002B', 'Marcos Villa', '1994-06-15', 3, 'Opuesto', 1.93, 85, 0, 'ESP', 4),
(39, '1004-4003C', 'Alejandro Moya', '1990-11-29', 4, 'Receptor 1', 1.92, 83, 0, 'ESP', 4),
(40, '1004-4004D', 'Enrique Cano', '1995-12-11', 5, 'Receptor 2', 1.94, 86, 0, 'ESP', 4),
(41, '1004-4005E', 'Hugo Cordero', '1997-09-10', 6, 'Central', 1.99, 92, 0, 'ESP', 4),
(42, '1004-4006F', 'Diego Marin', '1996-08-18', 7, 'Libero', 1.74, 73, 0, 'ESP', 4),
(43, '1004-4007G', 'Roberto Peña', '1991-02-25', 8, 'Armador', 1.89, 85, 0, 'ESP', 4),
(44, '1004-4008H', 'Victor Reyes', '1998-01-15', 9, 'Opuesto', 1.91, 82, 0, 'ESP', 4),
(45, '1004-4009I', 'Fernando Bravo', '1993-10-23', 10, 'Receptor 1', 1.95, 88, 0, 'ESP', 4),
(46, '1004-4010J', 'Alfonso Sanchez', '1999-03-27', 11, 'Receptor 2', 1.93, 87, 0, 'ESP', 4),
(47, '1004-4011K', 'Cristian Leon', '1994-05-30', 12, 'Central', 2.01, 90, 0, 'ESP', 4),
(48, '1004-4012L', 'Alfredo Campos', '1992-08-05', 13, 'Libero', 1.76, 75, 0, 'ESP', 4),
(49, '1005-5001A', 'Jose Ortega', '1993-04-02', 1, 'Armador', 1.86, 80, 0, 'ESP', 5),
(50, '1005-5002B', 'Carlos Molina', '1995-07-19', 3, 'Opuesto', 1.94, 88, 0, 'ESP', 5),
(51, '1005-5003C', 'Luis Paredes', '1991-09-21', 5, 'Receptor 1', 1.92, 83, 0, 'ESP', 5),
(52, '1005-5004D', 'Mario Velasco', '1996-02-17', 8, 'Receptor 2', 1.95, 86, 0, 'ESP', 5),
(53, '1005-5005E', 'Ricardo Carrasco', '1998-03-09', 10, 'Central', 1.99, 92, 0, 'ESP', 5),
(54, '1005-5006F', 'Manuel Vidal', '1994-06-14', 12, 'Libero', 1.75, 74, 0, 'ESP', 5),
(55, '1005-5007G', 'Diego Navarro', '1990-08-11', 15, 'Armador', 1.87, 81, 0, 'ESP', 5),
(56, '1005-5008H', 'Jorge Palacios', '1997-11-23', 18, 'Opuesto', 1.93, 86, 0, 'ESP', 5),
(57, '1005-5009I', 'Adrian Dominguez', '1999-01-10', 20, 'Receptor 1', 1.94, 85, 0, 'ESP', 5),
(58, '1005-5010J', 'Victor Lopez', '1992-12-31', 23, 'Receptor 2', 1.96, 89, 0, 'ESP', 5),
(59, '1005-5011K', 'Angel Rios', '1991-05-19', 25, 'Central', 2.02, 90, 0, 'ESP', 5),
(60, '1005-5012L', 'Francisco Vargas', '1996-10-06', 27, 'Libero', 1.78, 76, 0, 'ESP', 5),
(61, '1006-6001A', 'Alberto Guzman', '1993-06-15', 2, 'Armador', 1.89, 83, 0, 'ESP', 6),
(62, '1006-6002B', 'Miguel Varela', '1995-01-19', 4, 'Opuesto', 1.92, 85, 0, 'ESP', 6),
(63, '1006-6003C', 'Oscar Romero', '1992-11-25', 6, 'Receptor 1', 1.91, 84, 0, 'ESP', 6),
(64, '1006-6004D', 'Ruben Nieto', '1994-05-07', 9, 'Receptor 2', 1.94, 87, 0, 'ESP', 6),
(65, '1006-6005E', 'Andres Castaño', '1996-09-09', 11, 'Central', 1.98, 90, 0, 'ESP', 6),
(66, '1006-6006F', 'Hugo Santiago', '1990-07-22', 14, 'Libero', 1.77, 78, 0, 'ESP', 6),
(67, '1006-6007G', 'Pedro Vargas', '1997-03-29', 17, 'Armador', 1.88, 82, 0, 'ESP', 6),
(68, '1006-6008H', 'Samuel Ruiz', '1999-10-03', 21, 'Opuesto', 1.95, 88, 0, 'ESP', 6),
(69, '1006-6009I', 'Felipe Peña', '1991-12-18', 24, 'Receptor 1', 1.97, 86, 0, 'ESP', 6),
(70, '1006-6010J', 'Fernando Serrano', '1998-04-27', 26, 'Receptor 2', 1.93, 84, 0, 'ESP', 6),
(71, '1006-6011K', 'Raul Perez', '1992-02-14', 28, 'Central', 2.01, 91, 0, 'ESP', 6),
(72, '1006-6012L', 'Ivan Martinez', '1995-08-05', 30, 'Libero', 1.79, 80, 0, 'ESP', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `Par_id` int(11) NOT NULL,
  `Par_jugado` tinyint(1) NOT NULL DEFAULT 0,
  `Par_sets_loc` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `Par_puntos_loc` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `Par_sets_vis` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `Par_puntos_vis` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `Par_equipo_loc` int(11) NOT NULL,
  `Par_equipo_vis` int(11) NOT NULL,
  `Par_Arbitro_1` varchar(10) NOT NULL,
  `Par_Arbitro_2` varchar(10) DEFAULT NULL,
  `Par_id_jornada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`Par_id`, `Par_jugado`, `Par_sets_loc`, `Par_puntos_loc`, `Par_sets_vis`, `Par_puntos_vis`, `Par_equipo_loc`, `Par_equipo_vis`, `Par_Arbitro_1`, `Par_Arbitro_2`, `Par_id_jornada`) VALUES
(1, 0, 3, 25, 1, 23, 1, 6, '2000-2000B', '6000-6000F', 1),
(2, 1, 3, 25, 0, 18, 2, 5, '1000-1000A', '5000-5000E', 1),
(3, 1, 2, 24, 3, 26, 3, 4, '4000-4000D', '3000-3000C', 1),
(4, 0, 3, 25, 1, 23, 6, 4, '1000-1000A', '2000-2000B', 2),
(5, 0, 2, 24, 3, 26, 5, 3, '3000-3000C', '4000-4000D', 2),
(6, 1, 3, 25, 0, 18, 1, 2, '5000-5000E', '6000-6000F', 2),
(7, 0, 3, 29, 1, 27, 2, 6, '1000-1000A', '3000-3000C', 3),
(8, 1, 2, 23, 3, 25, 3, 1, '2000-2000B', '4000-4000D', 3),
(9, 1, 3, 25, 2, 22, 4, 5, '5000-5000E', '6000-6000F', 3),
(10, 1, 3, 25, 0, 17, 6, 5, '1000-1000A', '2000-2000B', 4),
(11, 1, 3, 30, 1, 28, 1, 4, '3000-3000C', '4000-4000D', 4),
(12, 0, 2, 22, 3, 25, 2, 3, '5000-5000E', '6000-6000F', 4),
(13, 1, 3, 25, 0, 19, 3, 6, '1000-1000A', '4000-4000D', 5),
(14, 1, 3, 25, 2, 22, 4, 2, '2000-2000B', '5000-5000E', 5),
(15, 1, 3, 25, 0, 21, 5, 1, '3000-3000C', '6000-6000F', 5),
(16, 1, 3, 26, 1, 24, 6, 1, '4000-4000D', '5000-5000E', 6),
(17, 0, 3, 25, 2, 22, 5, 2, '1000-1000A', '6000-6000F', 6),
(18, 1, 3, 25, 0, 18, 4, 3, '2000-2000B', '3000-3000C', 6),
(19, 1, 3, 28, 2, 26, 4, 6, '3000-3000C', '5000-5000E', 7),
(20, 1, 2, 20, 3, 25, 3, 5, '1000-1000A', '6000-6000F', 7),
(21, 0, 3, 27, 0, 25, 2, 1, '2000-2000B', '4000-4000D', 7),
(22, 1, 3, 25, 0, 18, 6, 2, '4000-4000D', '5000-5000E', 8),
(23, 1, 3, 29, 1, 27, 1, 3, '1000-1000A', '6000-6000F', 8),
(24, 0, 3, 25, 0, 17, 5, 4, '2000-2000B', '3000-3000C', 8),
(25, 1, 3, 26, 2, 24, 5, 6, '5000-5000E', '4000-4000D', 9),
(26, 0, 3, 25, 0, 23, 4, 1, '3000-3000C', '6000-6000F', 9),
(27, 0, 2, 20, 3, 25, 3, 2, '1000-1000A', '2000-2000B', 9),
(28, 1, 3, 27, 1, 25, 6, 3, '1000-1000A', '2000-2000B', 10),
(29, 1, 2, 22, 3, 25, 2, 4, '3000-3000C', '4000-4000D', 10),
(30, 0, 3, 25, 0, 18, 1, 5, '5000-5000E', '6000-6000F', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas`
--

CREATE TABLE `temporadas` (
  `Tem_id` int(11) NOT NULL,
  `Tem_cantidad_jornadas` smallint(6) NOT NULL DEFAULT 10,
  `Tem_cantidad_equipos` smallint(6) NOT NULL DEFAULT 6,
  `Tem_nombre` varchar(255) NOT NULL DEFAULT 'Temporada',
  `Tem_iniciado` tinyint(1) NOT NULL DEFAULT 0,
  `Tem_finalizado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `temporadas`
--

INSERT INTO `temporadas` (`Tem_id`, `Tem_cantidad_jornadas`, `Tem_cantidad_equipos`, `Tem_nombre`, `Tem_iniciado`, `Tem_finalizado`) VALUES
(1, 10, 6, 'Temporada 2023', 1, 1),
(2, 10, 6, 'Temporada 2024', 0, 0),
(3, 10, 6, 'Temporada 2025', 0, 0),
(4, 10, 6, 'Temporada2026', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbitros`
--
ALTER TABLE `arbitros`
  ADD PRIMARY KEY (`Arb_id`),
  ADD UNIQUE KEY `Arb_Nficha` (`Arb_Nficha`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`Equ_id`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`Jor_id`),
  ADD KEY `Jor_id_temporada` (`Jor_id_temporada`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`Jug_id`),
  ADD KEY `Jug_id_equipo` (`Jug_id_equipo`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`Par_id`),
  ADD KEY `Par_equipo_loc` (`Par_equipo_loc`),
  ADD KEY `Par_equipo_vis` (`Par_equipo_vis`),
  ADD KEY `Par_Arbitro_1` (`Par_Arbitro_1`),
  ADD KEY `Par_Arbitro_2` (`Par_Arbitro_2`),
  ADD KEY `Par_id_jornada` (`Par_id_jornada`);

--
-- Indices de la tabla `temporadas`
--
ALTER TABLE `temporadas`
  ADD PRIMARY KEY (`Tem_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arbitros`
--
ALTER TABLE `arbitros`
  MODIFY `Arb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `Equ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `Jor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `Jug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `Par_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `temporadas`
--
ALTER TABLE `temporadas`
  MODIFY `Tem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD CONSTRAINT `jornadas_ibfk_1` FOREIGN KEY (`Jor_id_temporada`) REFERENCES `temporadas` (`Tem_id`);

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`Jug_id_equipo`) REFERENCES `equipos` (`Equ_id`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`Par_equipo_loc`) REFERENCES `equipos` (`Equ_id`),
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`Par_equipo_vis`) REFERENCES `equipos` (`Equ_id`),
  ADD CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`Par_Arbitro_1`) REFERENCES `arbitros` (`Arb_Nficha`),
  ADD CONSTRAINT `partidos_ibfk_4` FOREIGN KEY (`Par_Arbitro_2`) REFERENCES `arbitros` (`Arb_Nficha`),
  ADD CONSTRAINT `partidos_ibfk_5` FOREIGN KEY (`Par_id_jornada`) REFERENCES `jornadas` (`Jor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
