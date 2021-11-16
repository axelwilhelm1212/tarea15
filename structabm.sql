-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.21-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla cursofulls.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cuit` int(11) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fec_nac` date NOT NULL,
  `fk_iddomicilio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `FK_clientes_domicilio` (`fk_iddomicilio`),
  CONSTRAINT `FK_clientes_domicilio` FOREIGN KEY (`fk_iddomicilio`) REFERENCES `domicilio` (`iddomicilio`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla cursofulls.clientes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`idcliente`, `nombre`, `cuit`, `telefono`, `correo`, `fec_nac`, `fk_iddomicilio`) VALUES
	(1, 'Axel', 2044, 1162758144, 'axelowilhelm1021@gmail.com', '2022-05-24', 1),
	(2, 'Luca', 2147483647, NULL, 'axelito@gmail.com', '2001-11-18', 1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla cursofulls.domicilio
CREATE TABLE IF NOT EXISTS `domicilio` (
  `iddomicilio` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `piso` int(11) NOT NULL DEFAULT 0,
  `letra` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `numero` int(11) DEFAULT 0,
  `cp` int(11) DEFAULT NULL,
  `fk_idlocalidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddomicilio`),
  KEY `fk_idlocalidad` (`fk_idlocalidad`),
  CONSTRAINT `FK__localidad` FOREIGN KEY (`fk_idlocalidad`) REFERENCES `localidad` (`idlocalidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla cursofulls.domicilio: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
INSERT INTO `domicilio` (`iddomicilio`, `calle`, `piso`, `letra`, `numero`, `cp`, `fk_idlocalidad`) VALUES
	(1, 'Valparaiso', 21, 'z', 1614, 1615, 2);
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;

-- Volcando estructura para tabla cursofulls.localidad
CREATE TABLE IF NOT EXISTS `localidad` (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_idprovincia` int(11) DEFAULT 0,
  PRIMARY KEY (`idlocalidad`),
  KEY `FK__provincia` (`fk_idprovincia`),
  CONSTRAINT `FK__provincia` FOREIGN KEY (`fk_idprovincia`) REFERENCES `provincia` (`idprovincia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla cursofulls.localidad: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` (`idlocalidad`, `nombre`, `fk_idprovincia`) VALUES
	(2, 'Marambio', 1);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;

-- Volcando estructura para tabla cursofulls.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMarca` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla cursofulls.marca: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`idMarca`, `nombreMarca`) VALUES
	(1, 'Logitech'),
	(2, 'HP'),
	(3, 'Lenovo'),
	(4, 'kodak'),
	(5, 'Dell');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para tabla cursofulls.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `precio` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `fk_idtipoproducto` int(11) NOT NULL,
  `fk_idmarca` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_idmarca` (`fk_idmarca`),
  KEY `FK_productos_tipoproducto` (`fk_idtipoproducto`),
  CONSTRAINT `FK_productos_marca` FOREIGN KEY (`fk_idmarca`) REFERENCES `marca` (`idMarca`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_productos_tipoproducto` FOREIGN KEY (`fk_idtipoproducto`) REFERENCES `tipoproducto` (`idtipoproducto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla cursofulls.productos: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`idproducto`, `nombre`, `cantidad`, `precio`, `descripcion`, `imagen`, `fk_idtipoproducto`, `fk_idmarca`) VALUES
	(0, 'Mouse', 20, 2000.000000, 'Un mouse', 'img', 1, 1),
	(14, 'Thinkpad X', 10, 300000.000000, 'Dos en uno Lenovo', 'imagen', 2, 3),
	(15, 'Impresora láser', 2, 10000.000000, ' Una impresora láser', 'img', 2, 5),
	(17, 'Impresora clásica', 5, 12000.000000, ' Una impresora clásica', 'img', 2, 5),
	(18, 'Escaner', 10, 15000.000000, ' Un escaner', 'img', 2, 1),
	(19, 'Mousepad', 8, 3000.000000, ' Un mousepad', 'img', 4, 4),
	(20, 'Auriculares', 3, 1000.000000, ' Unos auriculares con cable', 'img', 3, 5),
	(21, 'Auriculares inalambricos', 200, 2000.000000, ' Unos auriculares sin cable', 'img', 3, 3),
	(22, 'Parlante', 3, 5000.000000, 'Parlante chico', 'img', 2, 3);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla cursofulls.provincia
CREATE TABLE IF NOT EXISTS `provincia` (
  `idprovincia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idprovincia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla cursofulls.provincia: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` (`idprovincia`, `nombre`) VALUES
	(1, 'Antartida');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;

-- Volcando estructura para tabla cursofulls.tipoproducto
CREATE TABLE IF NOT EXISTS `tipoproducto` (
  `idtipoproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipoproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla cursofulls.tipoproducto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` (`idtipoproducto`, `nombre`) VALUES
	(1, 'periferico'),
	(2, 'equipo'),
	(3, 'sillas'),
	(4, 'accesiorios'),
	(5, 'sillas'),
	(6, 'accesiorios');
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;

-- Volcando estructura para tabla cursofulls.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contraseña` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla cursofulls.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
