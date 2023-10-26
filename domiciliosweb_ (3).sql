-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2023 a las 17:32:14
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `domiciliosweb_`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_usuario` (IN `idUsuario` VARCHAR(30), IN `tipoDocUsuario` VARCHAR(20), IN `noDocUsuario` VARCHAR(50), IN `nombreUsuario` VARCHAR(50), IN `apellidoUsuario` VARCHAR(80), IN `direccionUsuario` VARCHAR(20), IN `telefonoUsuario` VARCHAR(20), IN `correoUsuario` VARCHAR(20), IN `claveUsuario` VARCHAR(20))  NO SQL
INSERT INTO `usuario`(`idUsuario`, `tipoDocUsuario`, `noDocUsuario`, `nombreUsuario`, `apellidoUsuario`, `direccionUsuario`, `telefonoUsuario`, `correoUsuario`, `passwordUsuario`, `fotoUsuario`, `estadoUsuario`, `idRolUsuarioFK`) VALUES ('',tipo,nodoc,nombre,apellido,direccion,telefono,correo,clave,'','activo',rol)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_usuarios` (IN `id` INT)  NO SQL
DELETE FROM usuario WHERE idUsuario=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_usuario` (IN `nombreusua` VARCHAR(30), IN `apellido` VARCHAR(20), IN `tipodoc` VARCHAR(50), IN `nodoc` VARCHAR(50), IN `direccion` VARCHAR(80), IN `telefono` VARCHAR(20), IN `correo` VARCHAR(20), IN `clave` VARCHAR(20), IN `rol` INT)  NO SQL
INSERT INTO `usuario`(`idUsuario`, `tipoDocUsuario`, `noDocUsuario`, `nombreUsuario`, `apellidoUsuario`, `direccionUsuario`, `telefonoUsuario`, `correoUsuario`, `passwordUsuario`, `fotoUsuario`, `estadoUsuario`, `idRolUsuarioFK`) VALUES ('',tipodoc,nodoc,nombreusua,apellido,direccion,telefono,correo,clave,'','activo',rol)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL,
  `idProductoFK` int(11) NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  `precioProducto` double NOT NULL,
  `subtotalProducto` double NOT NULL,
  `idPedidoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `idDomicilio` int(11) NOT NULL,
  `horaDomicilio` time NOT NULL,
  `estadoDomicilio` varchar(30) NOT NULL,
  `idPedidoFK` int(11) NOT NULL,
  `idDomiciliarioFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fechaPedido` date NOT NULL,
  `horaPedido` time NOT NULL,
  `totalPedido` double NOT NULL,
  `estadoPedido` varchar(30) NOT NULL,
  `pedidoaDomicilio` char(3) NOT NULL,
  `idUsuarioFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `descripProducto` varchar(100) NOT NULL,
  `precioProducto` double NOT NULL,
  `categoriaProducto` varchar(40) NOT NULL,
  `estadoProducto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolusuario`
--

CREATE TABLE `rolusuario` (
  `idRolUsuario` int(11) NOT NULL,
  `descripRolUsuario` varchar(30) NOT NULL,
  `estadoRolUsuario` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rolusuario`
--

INSERT INTO `rolusuario` (`idRolUsuario`, `descripRolUsuario`, `estadoRolUsuario`) VALUES
(1, 'Administrador', 'Activo'),
(2, 'Cliente', 'Activo'),
(3, 'domiciliario', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `tipoDocUsuario` varchar(30) NOT NULL,
  `noDocUsuario` varchar(20) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `apellidoUsuario` varchar(50) NOT NULL,
  `direccionUsuario` varchar(80) NOT NULL,
  `telefonoUsuario` varchar(20) NOT NULL,
  `correoUsuario` varchar(20) NOT NULL,
  `passwordUsuario` varchar(20) NOT NULL,
  `fotoUsuario` varchar(200) NOT NULL,
  `estadoUsuario` varchar(30) NOT NULL,
  `idRolUsuarioFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `tipoDocUsuario`, `noDocUsuario`, `nombreUsuario`, `apellidoUsuario`, `direccionUsuario`, `telefonoUsuario`, `correoUsuario`, `passwordUsuario`, `fotoUsuario`, `estadoUsuario`, `idRolUsuarioFK`) VALUES
(0, 'cc', '1141589777', 'karen ', 'Garavito ', 'cra 120B #140 55', '3133998756', 'karengg99@gmail.com', 'karengg22', '', 'activo', 2),
(1, 'CC', '1019605858', 'Andres', 'Ramos', 'Calle 75b#62-52', '3025414360', 'aramos@gmail.com', 'andrea2006', '', 'activo', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idDetallePedido`),
  ADD KEY `idproductoFK` (`idProductoFK`),
  ADD KEY `idPedidoFK` (`idPedidoFK`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`idDomicilio`),
  ADD KEY `idDomiciliarioFK` (`idDomiciliarioFK`),
  ADD KEY `idPedidoFK` (`idPedidoFK`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `rolusuario`
--
ALTER TABLE `rolusuario`
  ADD PRIMARY KEY (`idRolUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRolUsuarioFk` (`idRolUsuarioFK`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`idPedidoFK`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `detallepedido` (`idPedidoFK`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `detallepedido` (`idProductoFK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRolUsuarioFK`) REFERENCES `rolusuario` (`idRolUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
