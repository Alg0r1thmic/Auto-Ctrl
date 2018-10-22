-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-10-2018 a las 00:27:12
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `AutoCtrl`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes_fisicos`
--

CREATE TABLE `componentes_fisicos` (
  `id_componente` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `costo` double(4,4) NOT NULL,
  `fecha_compra` date NOT NULL,
  `frecuencia_uso` int(11) DEFAULT NULL,
  `Vehiculo_Placa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conductor`
--

CREATE TABLE `Conductor` (
  `id_Conductor` int(11) NOT NULL,
  `Nombre` varchar(55) NOT NULL,
  `Apellido` varchar(55) NOT NULL,
  `Edad` int(11) NOT NULL,
  `DNI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Conductor`
--

INSERT INTO `Conductor` (`id_Conductor`, `Nombre`, `Apellido`, `Edad`, `DNI`) VALUES
(1, 'Alex', 'Cordova', 20, 76427343),
(2, 'jesus', 'lazo', 20, 45349867),
(4, 'raul', 'totocayo', 21, 78675645);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estado_Conductor`
--

CREATE TABLE `Estado_Conductor` (
  `id_Conductor` int(11) NOT NULL,
  `Presion_Arterial` int(11) NOT NULL,
  `Conductor_id_Conductor` int(11) NOT NULL,
  `estado_animo` varchar(100) NOT NULL,
  `situacion_id_situacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estado_Vehiculo`
--

CREATE TABLE `Estado_Vehiculo` (
  `placa` varchar(12) NOT NULL,
  `Gasolina` double(3,3) NOT NULL,
  `Llantas` binary(1) NOT NULL,
  `Temperatura_motor` double(3,3) NOT NULL,
  `Hora` time NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ia`
--

CREATE TABLE `ia` (
  `id_ia` int(11) NOT NULL,
  `vehiculoxcarrera_id_participacion` int(11) NOT NULL,
  `situacionxmovimiento_id_accion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimiento` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `dificultad` varchar(50) DEFAULT NULL,
  `costo_mecanico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Ojo que se busca dar mejoras en los moviemientos, llevarlos al límite, para poder ganar la carrera';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientoxcomponentes_fisicos`
--

CREATE TABLE `movimientoxcomponentes_fisicos` (
  `componentes_fisicos_id_componente` int(11) NOT NULL,
  `movimientos_id_movimiento` int(11) NOT NULL,
  `id_mov_cf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recorrido`
--

CREATE TABLE `Recorrido` (
  `id_recorrido` int(11) NOT NULL,
  `latitud` double(4,4) NOT NULL,
  `longitud` double(4,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situacion`
--

CREATE TABLE `situacion` (
  `id_situacion` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `valida` tinyint(1) DEFAULT NULL,
  `fecha_hora` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Input del IA';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situacionxmovimientoxcf`
--

CREATE TABLE `situacionxmovimientoxcf` (
  `situacion_id_situacion` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `id_accion` int(11) NOT NULL,
  `movimientoxcomponentes_fisicos_id_mov_cf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Resultado del IA';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ubicacion_Vehiculo`
--

CREATE TABLE `Ubicacion_Vehiculo` (
  `placa` varchar(12) NOT NULL,
  `latitud` double(4,4) NOT NULL,
  `longitud` double(4,4) NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `Recorrido_id_recorrido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User`
--

CREATE TABLE `User` (
  `nombreUsuario` varchar(20) NOT NULL,
  `correo` char(55) NOT NULL,
  `password` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `User`
--

INSERT INTO `User` (`nombreUsuario`, `correo`, `password`) VALUES
('alex', 'alex@gamil.com', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vehiculo`
--

CREATE TABLE `Vehiculo` (
  `Marca` int(11) NOT NULL,
  `Placa` int(11) NOT NULL,
  `Ubicacion_Vehiculo_placa` varchar(12) NOT NULL,
  `Estado_Vehiculo_placa` varchar(12) NOT NULL,
  `id_Conductor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculoxcarrera`
--

CREATE TABLE `vehiculoxcarrera` (
  `Vehiculo_Placa` int(11) NOT NULL,
  `carrera_id_carrera` int(11) NOT NULL,
  `id_participacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `componentes_fisicos`
--
ALTER TABLE `componentes_fisicos`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `componentes_fisicos_Vehiculo` (`Vehiculo_Placa`);

--
-- Indices de la tabla `Conductor`
--
ALTER TABLE `Conductor`
  ADD PRIMARY KEY (`id_Conductor`);

--
-- Indices de la tabla `Estado_Conductor`
--
ALTER TABLE `Estado_Conductor`
  ADD PRIMARY KEY (`id_Conductor`),
  ADD KEY `Estado_Conductor_Conductor` (`Conductor_id_Conductor`),
  ADD KEY `Estado_Conductor_situacion` (`situacion_id_situacion`);

--
-- Indices de la tabla `Estado_Vehiculo`
--
ALTER TABLE `Estado_Vehiculo`
  ADD PRIMARY KEY (`placa`);

--
-- Indices de la tabla `ia`
--
ALTER TABLE `ia`
  ADD PRIMARY KEY (`id_ia`),
  ADD KEY `ia_situacionxmovimiento` (`situacionxmovimiento_id_accion`),
  ADD KEY `ia_vehiculoxcarrera` (`vehiculoxcarrera_id_participacion`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `movimientoxcomponentes_fisicos`
--
ALTER TABLE `movimientoxcomponentes_fisicos`
  ADD PRIMARY KEY (`id_mov_cf`),
  ADD KEY `movimientoxcomponentes_fisicos_componentes_fisicos` (`componentes_fisicos_id_componente`),
  ADD KEY `movimientoxcomponentes_fisicos_movimientos` (`movimientos_id_movimiento`);

--
-- Indices de la tabla `Recorrido`
--
ALTER TABLE `Recorrido`
  ADD PRIMARY KEY (`id_recorrido`);

--
-- Indices de la tabla `situacion`
--
ALTER TABLE `situacion`
  ADD PRIMARY KEY (`id_situacion`);

--
-- Indices de la tabla `situacionxmovimientoxcf`
--
ALTER TABLE `situacionxmovimientoxcf`
  ADD PRIMARY KEY (`id_accion`),
  ADD KEY `situacionxmovimiento_movimientoxcomponentes_fisicos` (`movimientoxcomponentes_fisicos_id_mov_cf`),
  ADD KEY `situacionxmovimiento_situacion` (`situacion_id_situacion`);

--
-- Indices de la tabla `Ubicacion_Vehiculo`
--
ALTER TABLE `Ubicacion_Vehiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `Ubicacion_Vehiculo_Recorrido` (`Recorrido_id_recorrido`);

--
-- Indices de la tabla `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`nombreUsuario`);

--
-- Indices de la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  ADD PRIMARY KEY (`Placa`),
  ADD KEY `Vehiculo_Estado_Vehiculo` (`Estado_Vehiculo_placa`),
  ADD KEY `Vehiculo_Ubicacion_Vehiculo` (`Ubicacion_Vehiculo_placa`);

--
-- Indices de la tabla `vehiculoxcarrera`
--
ALTER TABLE `vehiculoxcarrera`
  ADD PRIMARY KEY (`id_participacion`),
  ADD KEY `vehiculoxcarrera_Vehiculo` (`Vehiculo_Placa`),
  ADD KEY `vehiculoxcarrera_carrera` (`carrera_id_carrera`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `componentes_fisicos`
--
ALTER TABLE `componentes_fisicos`
  ADD CONSTRAINT `componentes_fisicos_Vehiculo` FOREIGN KEY (`Vehiculo_Placa`) REFERENCES `Vehiculo` (`Placa`);

--
-- Filtros para la tabla `Estado_Conductor`
--
ALTER TABLE `Estado_Conductor`
  ADD CONSTRAINT `Estado_Conductor_Conductor` FOREIGN KEY (`Conductor_id_Conductor`) REFERENCES `Conductor` (`id_Conductor`),
  ADD CONSTRAINT `Estado_Conductor_situacion` FOREIGN KEY (`situacion_id_situacion`) REFERENCES `situacion` (`id_situacion`);

--
-- Filtros para la tabla `ia`
--
ALTER TABLE `ia`
  ADD CONSTRAINT `ia_situacionxmovimiento` FOREIGN KEY (`situacionxmovimiento_id_accion`) REFERENCES `situacionxmovimientoxcf` (`id_accion`),
  ADD CONSTRAINT `ia_vehiculoxcarrera` FOREIGN KEY (`vehiculoxcarrera_id_participacion`) REFERENCES `vehiculoxcarrera` (`id_participacion`);

--
-- Filtros para la tabla `movimientoxcomponentes_fisicos`
--
ALTER TABLE `movimientoxcomponentes_fisicos`
  ADD CONSTRAINT `movimientoxcomponentes_fisicos_componentes_fisicos` FOREIGN KEY (`componentes_fisicos_id_componente`) REFERENCES `componentes_fisicos` (`id_componente`),
  ADD CONSTRAINT `movimientoxcomponentes_fisicos_movimientos` FOREIGN KEY (`movimientos_id_movimiento`) REFERENCES `movimientos` (`id_movimiento`);

--
-- Filtros para la tabla `situacionxmovimientoxcf`
--
ALTER TABLE `situacionxmovimientoxcf`
  ADD CONSTRAINT `situacionxmovimiento_movimientoxcomponentes_fisicos` FOREIGN KEY (`movimientoxcomponentes_fisicos_id_mov_cf`) REFERENCES `movimientoxcomponentes_fisicos` (`id_mov_cf`),
  ADD CONSTRAINT `situacionxmovimiento_situacion` FOREIGN KEY (`situacion_id_situacion`) REFERENCES `situacion` (`id_situacion`);

--
-- Filtros para la tabla `Ubicacion_Vehiculo`
--
ALTER TABLE `Ubicacion_Vehiculo`
  ADD CONSTRAINT `Ubicacion_Vehiculo_Recorrido` FOREIGN KEY (`Recorrido_id_recorrido`) REFERENCES `Recorrido` (`id_recorrido`);

--
-- Filtros para la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  ADD CONSTRAINT `Vehiculo_Estado_Vehiculo` FOREIGN KEY (`Estado_Vehiculo_placa`) REFERENCES `Estado_Vehiculo` (`placa`),
  ADD CONSTRAINT `Vehiculo_Ubicacion_Vehiculo` FOREIGN KEY (`Ubicacion_Vehiculo_placa`) REFERENCES `Ubicacion_Vehiculo` (`placa`);

--
-- Filtros para la tabla `vehiculoxcarrera`
--
ALTER TABLE `vehiculoxcarrera`
  ADD CONSTRAINT `vehiculoxcarrera_Vehiculo` FOREIGN KEY (`Vehiculo_Placa`) REFERENCES `Vehiculo` (`Placa`),
  ADD CONSTRAINT `vehiculoxcarrera_carrera` FOREIGN KEY (`carrera_id_carrera`) REFERENCES `carrera` (`id_carrera`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
