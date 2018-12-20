-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2018 a las 22:32:23
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_twitter`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_hashtags_trends`
--

CREATE TABLE IF NOT EXISTS `tbl_hashtags_trends` (
  `codigo_hashtag` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag` varchar(500) DEFAULT NULL,
  `cantidad_tweets` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_hashtag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_hashtags_trends`
--

INSERT INTO `tbl_hashtags_trends` (`codigo_hashtag`, `hashtag`, `cantidad_tweets`) VALUES
(1, '#InfinityWar', 5000),
(2, '#FueraJOH', 4999),
(3, '#ViscaMotagua', 1254),
(4, '#HalaOlimpia', 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_seguidores`
--

CREATE TABLE IF NOT EXISTS `tbl_seguidores` (
  `codigo_usuario` int(11) NOT NULL,
  `codigo_usuario_sigue` int(11) NOT NULL,
  KEY `fk_tbl_seguidores_tbl_usuarios1_idx` (`codigo_usuario`),
  KEY `fk_tbl_seguidores_tbl_usuarios2_idx` (`codigo_usuario_sigue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_seguidores`
--

INSERT INTO `tbl_seguidores` (`codigo_usuario`, `codigo_usuario_sigue`) VALUES
(1, 2),
(1, 3),
(1, 4),
(4, 1),
(4, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tweets`
--

CREATE TABLE IF NOT EXISTS `tbl_tweets` (
  `codigo_tweet` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_usuario` int(11) NOT NULL,
  `contenido` varchar(2000) DEFAULT NULL,
  `hashtags` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`codigo_tweet`),
  KEY `fk_tbl_tweets_tbl_usuarios_idx` (`codigo_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Volcado de datos para la tabla `tbl_tweets`
--

INSERT INTO `tbl_tweets` (`codigo_tweet`, `codigo_usuario`, `contenido`, `hashtags`, `fecha`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '#InfinityWar #FueraJOH', '2018-04-04'),
(2, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '#InfinityWar #FueraJOH', '2018-04-10'),
(3, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '#InfinityWar #FueraJOH', '2018-04-18'),
(4, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '#InfinityWar #FueraJOH', '2018-04-11'),
(5, 1, 'Nuevo Tweet', '#Probando', '2018-04-28'),
(6, 1, 'Ingresando nuevo tweet', '#Probando', '2018-04-28'),
(7, 1, 'Probando con un nuevo tweet', '#HolaMundo', '2018-04-28'),
(8, 4, 'Necesito las esferas', '#Esferas', '2018-04-28'),
(9, 4, 'Shen Long', '#MuereKrilin', '2018-04-28'),
(10, 4, 'Goku!!!!!', '#SuperSaiyan', '2018-04-28'),
(11, 1, 'Krilin!!!!', '#MuereKrilin', '2018-04-28'),
(12, 3, 'Me veo hermosa', '#Esferas', '2018-04-28'),
(13, 3, 'Vegueta', '#Vegueta', '2018-04-28'),
(14, 3, 'Necesito el radar', '#Esferas', '2018-04-28'),
(15, 2, 'Esponja sal de ahi', '#Peligro', '2018-04-28'),
(16, 2, 'Hola :)', '#Smile', '2018-04-28'),
(17, 2, 'Sonrie :)', '#Adios', '2018-04-28'),
(18, 2, 'Feliz :)', '#Smile', '2018-04-28'),
(19, 2, 'Alegre :)', '#Smile', '2018-04-28'),
(20, 2, 'Laura Sad :(', '#QueSad', '2018-04-28'),
(21, 2, 'Triste :(', '#Sad', '2018-04-28'),
(22, 2, 'Hola', '#Saludar', '2018-04-28'),
(23, 3, ':* Vegueta', '#Amor', '2018-04-28'),
(24, 1, 'Vegueta |**|', '#Hidden', '2018-04-28'),
(25, 2, 'jajaja XD', '#Risa', '2018-04-28'),
(26, 4, ':P Picoro', '#Esferas', '2018-04-28'),
(27, 4, 'Krilin X_X', '#MurioOtraVez', '2018-04-28'),
(28, 3, 'Vegueta :(', '#Sad', '2018-04-28'),
(29, 3, 'Krilin murio', '#Esferas', '2018-04-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  `codigo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `nickname` varchar(200) DEFAULT NULL,
  `url_imagen_perfil` varchar(500) DEFAULT NULL,
  `cantidad_tweets` int(11) DEFAULT NULL,
  `followers` int(11) DEFAULT NULL,
  `following` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`codigo_usuario`, `nombre`, `apellido`, `nickname`, `url_imagen_perfil`, `cantidad_tweets`, `followers`, `following`) VALUES
(1, 'Goku', 'Rodriguez', '@goku', 'img/profile-pics/goku.jpg', 10, 20, 12),
(2, 'Patricio', 'Perez', '@patricio', 'img/profile-pics/patricio.jpg', 5, 25, 12),
(3, 'Bulma', 'Dominguez', '@bulma', 'img/profile-pics/bulma.jpg', 5, 45, 12),
(4, 'Dende', 'Lainez', '@dende', 'img/profile-pics/dende.jpg', 5, 54, 12);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_seguidores`
--
ALTER TABLE `tbl_seguidores`
  ADD CONSTRAINT `fk_tbl_seguidores_tbl_usuarios1` FOREIGN KEY (`codigo_usuario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_seguidores_tbl_usuarios2` FOREIGN KEY (`codigo_usuario_sigue`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_tweets`
--
ALTER TABLE `tbl_tweets`
  ADD CONSTRAINT `fk_tbl_tweets_tbl_usuarios` FOREIGN KEY (`codigo_usuario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
