-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-07-2020 a las 01:56:05
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consulta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion`
--

DROP TABLE IF EXISTS `atencion`;
CREATE TABLE IF NOT EXISTS `atencion` (
  `idAtencion` varchar(50) NOT NULL,
  `idPaciente` varchar(50) NOT NULL,
  `idMedico` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(50) NOT NULL,
  `diagnostico` varchar(50) NOT NULL,
  `receta` varchar(50) NOT NULL,
  PRIMARY KEY (`idAtencion`),
  KEY `idPaciente` (`idPaciente`),
  KEY `idMedico` (`idMedico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `atencion`
--

INSERT INTO `atencion` (`idAtencion`, `idPaciente`, `idMedico`, `fecha`, `hora`, `diagnostico`, `receta`) VALUES
('01', 'guille', 'david11', '2020-07-10', '10:30', 'Posiblemente muera', 'paracetamol'),
('02', 'lala', 'david11', '2020-07-20', '13:20', 'la verdad ni idea', 'supositorio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `idEstado` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idEstado`, `descripcion`) VALUES
('1', 'Aceptado'),
('2', 'Rechazado'),
('3', 'En proceso'),
('4', 'Atendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`usuario`, `password`, `nombre`, `apellido`, `especialidad`) VALUES
('david11', '1234', 'David', 'Goliat', 'Cirugía Pediátrica'),
('DocJean', '1234', 'Jean', 'kalajan', 'Cardiologia'),
('naul01', '1234', 'Ricardo', 'Milos', 'Endoscopia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `rut` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`usuario`, `password`, `nombre`, `apellido`, `rut`) VALUES
('guille', '1234', 'Guillermo', 'Carcamo', '19938064-8'),
('igna', '1234', 'ignacio', 'avila', '19938067-8'),
('lala', '1122', 'carlito', 'corron', '10100187-9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `idReserva` varchar(50) NOT NULL,
  `idPaciente` varchar(50) NOT NULL,
  `idMedico` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(50) NOT NULL,
  `causa` varchar(50) NOT NULL,
  `idEstado` varchar(50) NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `idPaciente` (`idPaciente`),
  KEY `idMedico` (`idMedico`),
  KEY `idEstado` (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idReserva`, `idPaciente`, `idMedico`, `fecha`, `hora`, `causa`, `idEstado`) VALUES
('01', 'guille', 'david11', '2020-07-10', '10:30', 'Dolor al corazón', '4'),
('02', 'guille', 'DocJean', '2020-07-16', '10:30', 'dolor de espalda', '1'),
('03', 'guille', 'david11', '2020-07-23', '13.30', 'cansancio y fatiga', '1'),
('04', 'igna', 'naul01', '2020-08-12', '14:00', 'Fatiga', '3'),
('05', 'guille', 'david11', '2020-06-27', '12:00', 'cansancio', '2'),
('06', 'guille', 'naul01', '2020-08-21', '21:16', 'dolorcito', '3'),
('07', 'lala', 'david11', '2020-07-20', '13:20', 'dolorsito', '4'),
('08', 'igna', 'david11', '2020-08-30', '14:00', 'que me muero', '3'),
('09', 'lala', 'david11', '2020-09-30', '18:00', 'olor a pata', '3');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `atencion`
--
ALTER TABLE `atencion`
  ADD CONSTRAINT `atencion_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`usuario`),
  ADD CONSTRAINT `atencion_ibfk_2` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`usuario`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`usuario`),
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`usuario`),
  ADD CONSTRAINT `reserva_ibfk_4` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
