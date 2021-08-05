-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2021 a las 17:46:39
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `caladeco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'Lámpara de techo', 0, '2021-07-14 13:51:33', '2021-07-14 13:51:33'),
(2, 'Pantalla lámpara', 0, '2021-07-14 13:52:05', '2021-07-14 13:52:05'),
(3, 'Posavasos', 0, '2021-07-14 13:52:23', '2021-07-14 13:52:23'),
(4, 'Plato de sitio', 0, '2021-07-14 13:52:34', '2021-07-14 13:52:34'),
(5, 'Camino', 0, '2021-07-14 13:52:46', '2021-07-14 13:52:46'),
(6, 'Tapiz', 0, '2021-07-14 13:52:55', '2021-07-14 13:52:55'),
(7, 'Espejo', 0, '2021-07-14 13:53:25', '2021-07-14 13:53:25'),
(8, 'Contenedor', 0, '2021-07-14 13:53:37', '2021-07-14 13:53:37'),
(9, 'Hojas', 0, '2021-07-14 13:53:45', '2021-07-14 13:53:45'),
(10, 'Porta maceta colgante', 0, '2021-07-14 13:54:07', '2021-07-14 13:54:07'),
(11, 'Guirnaldas', 0, '2021-07-14 13:54:20', '2021-07-14 13:54:20'),
(12, 'Arcoíris', 0, '2021-07-14 13:54:42', '2021-07-14 13:54:42'),
(13, 'Móvil', 0, '2021-07-14 13:54:52', '2021-07-14 13:54:52'),
(14, 'Deco Navidad', 0, '2021-07-14 13:55:07', '2021-07-14 13:55:07'),
(15, 'nueva categoria 2 update', 1, '2021-07-28 12:41:37', '2021-07-28 17:04:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` int(25) NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `telefono`, `direccion`, `eliminado`, `ts_create`, `ts_update`) VALUES
(7, 'Agustina', 'Gibbs', 123456789, 'F. Acosta 1111', 0, '2021-07-17 20:28:45', '2021-07-17 20:28:45'),
(8, 'Mickey', 'Mouse', 123456, 'Castillo de Disney 600', 0, '2021-07-17 20:35:07', '2021-07-17 20:35:07'),
(9, 'Minnie', 'Mouse', 123456, 'Castillo de Disney 600, Dtps 2', 0, '2021-07-17 20:40:46', '2021-08-04 16:16:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_imagenes`
--

CREATE TABLE `empleados_imagenes` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados_imagenes`
--

INSERT INTO `empleados_imagenes` (`id`, `uid`, `id_empleado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, '2cdd8ea5-afda-437b-8d40-3f4e49a59c42.jpeg', 7, 0, '2021-07-17 20:28:45', '2021-07-17 20:28:45'),
(2, 'f2c4f012-8c4e-4e1d-abfc-27e8beb47128.jpeg', 8, 0, '2021-07-17 20:35:07', '2021-07-17 20:35:07'),
(3, '24145d09-f396-47d6-8607-723e26d2f473.png', 9, 0, '2021-07-17 20:40:46', '2021-08-04 17:16:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `modelo` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `modelo`, `descripcion`, `precio`, `stock`, `id_categoria`, `eliminado`, `ts_create`, `ts_update`) VALUES
(11, 'Berta', '25', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Florón de techo metálico. Cable textil. Diámetro 20 cm y altura 20 cm.', 6500, 10, 1, 0, '2021-08-05 11:23:42', '2021-08-05 11:23:42'),
(13, 'Berta', '35', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Florón de techo metálico. Cable textil. Diámetro 30 cm y altura 30 cm.', 7500, 10, 1, 0, '2021-08-05 11:25:15', '2021-08-05 11:27:13'),
(14, 'Agnes', '20/40/30', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Florón de techo metálico. Cable textil. Diámetros 20 cm / 40 cm / 30 cm y altura 30 cm.', 8000, 10, 1, 0, '2021-08-05 11:26:51', '2021-08-05 11:26:51'),
(15, 'Agnes', '30/50/40', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Florón de techo metálico. Cable textil. Diámetros 30 cm / 50 cm / 40 cm y altura 35 cm.', 10000, 10, 1, 0, '2021-08-05 11:28:19', '2021-08-05 11:28:19'),
(16, 'Eva', '20', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Macramé nudo plano + flecos. Florón de techo metálico. Cable textil. Diámetro 20 cm y altura 20 cm + flecos.', 8500, 10, 1, 0, '2021-08-05 11:29:42', '2021-08-05 11:29:42'),
(17, 'Eva', '30', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Macramé nudo plano + flecos. Florón de techo metálico. Cable textil. Diámetro 30 cm y altura 30 cm + flecos.', 10500, 10, 1, 0, '2021-08-05 11:30:38', '2021-08-05 11:30:38'),
(18, 'Eva', '40', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Macramé nudo plano + flecos. Florón de techo metálico. Cable textil. Diámetro 40 cm y altura 40 cm + flecos.', 12500, 10, 1, 0, '2021-08-05 11:31:43', '2021-08-05 11:31:43'),
(19, 'Nina', '30', 'Armazón metálico 4 mm pintado. Borlas de hilo de algodón torcido 27 hebras. Florón de techo metálico. Cable textil. Diámetro 30 cm y altura 25 cm.', 7000, 10, 1, 0, '2021-08-05 11:39:02', '2021-08-05 11:39:02'),
(20, 'Nina', '40', 'Armazón metálico 4 mm pintado. Borlas de hilo de algodón torcido 27 hebras. Florón de techo metálico. Cable textil. Diámetro 40 cm y altura 35 cm.', 7500, 10, 1, 0, '2021-08-05 11:39:53', '2021-08-05 11:39:53'),
(21, 'Elsa', '35', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Florón de techo metálico. Cable textil. Diámetro 35 cm y altura 20 cm.', 4000, 10, 2, 0, '2021-08-05 11:40:59', '2021-08-05 11:40:59'),
(22, 'Elsa', '45', 'Armazón metálico 4 mm pintado. Hilado de yute / Cordón de algodón / Hilado de algodón torcido 27 hebras. Florón de techo metálico. Cable textil. Diámetro 45 cm y altura 30 cm.', 5000, 10, 2, 0, '2021-08-05 11:41:38', '2021-08-05 11:41:53'),
(23, 'Circular', '15 cm', 'Cordón de algodón.', 300, 10, 3, 0, '2021-08-05 11:42:46', '2021-08-05 11:43:18'),
(24, 'Circular', '15 cm', 'Hilo de algodón 27 hebras / Hilo de yute / Nudo festón.', 400, 10, 3, 0, '2021-08-05 11:44:39', '2021-08-05 11:44:39'),
(25, 'Cuadrado', '15 cm', 'Hilo de algodón 27 hebras / Hilo de yute / Nudo festón.', 400, 10, 3, 0, '2021-08-05 11:46:16', '2021-08-05 11:46:16'),
(26, 'Corazón', '15 cm', 'Hilo de algodón 27 hebras / Hilo de yute / Nudo plano.', 400, 10, 3, 0, '2021-08-05 11:47:30', '2021-08-05 11:47:30'),
(27, 'Circular', '30 cm', 'Hilo de algodón trenzado / Hilo de yute trenzado. Diámetro 30 cm.', 1000, 10, 4, 0, '2021-08-05 11:56:09', '2021-08-05 11:56:09'),
(28, 'Circular', '30 cm', 'Hilo de algodón 27 hebras / Hilo de yute / Nudo festón. Diámetro 30 cm + flecos.', 1300, 10, 4, 0, '2021-08-05 11:57:05', '2021-08-05 11:57:05'),
(29, 'Camino', '', 'Hilo de algodón 27 hebras / Hilo de yute / Nudo plano. Ancho 30 cm y largo 80 cm + flecos.', 2500, 10, 5, 0, '2021-08-05 11:58:02', '2021-08-05 11:58:02'),
(30, 'Mona', '', 'Cordón de algodón trenzado / Hilo de algodón 37 hebras. Ancho 80 cm y largo 100 cm. ', 12500, 10, 6, 0, '2021-08-05 11:59:59', '2021-08-05 11:59:59'),
(31, 'Lula', '', 'Cordón de algodón trenzado. Ancho 60 cm y largo 100 cm.', 7500, 10, 6, 0, '2021-08-05 12:01:11', '2021-08-05 12:01:11'),
(32, 'Cala', '', 'Cordón de algodón trenzado. Ancho 40 cm y largo 80 cm.', 6000, 10, 6, 0, '2021-08-05 12:03:38', '2021-08-05 12:03:38'),
(33, 'Flora', '20', 'Hilo de yute. Diámetro espejo 20 cm. Diámetro total 40 cm.', 3500, 10, 7, 0, '2021-08-05 12:04:47', '2021-08-05 12:04:47'),
(34, 'Flora', '30', 'Hilo de yute. Diámetro espejo 30 cm. Diámetro total 50 cm.', 5000, 10, 7, 0, '2021-08-05 12:05:28', '2021-08-05 12:05:28'),
(35, 'Flora', '40', 'Hilo de yute. Diámetro espejo 40 cm. Diámetro total 60 cm.', 6500, 10, 7, 0, '2021-08-05 12:06:19', '2021-08-05 12:06:19'),
(36, 'Helga', '', 'Hilo de algodón torcido 27 hebras. Diámetro espejo 30 cm. Diámetro total 60 cm.', 4000, 10, 7, 0, '2021-08-05 12:07:12', '2021-08-05 12:07:12'),
(37, 'Moha', '', 'Hilo de yute. Diámetro espejo 30 cm. Diámetro total 60 cm.', 4500, 10, 7, 0, '2021-08-05 12:07:45', '2021-08-05 12:07:45'),
(38, 'Cala', '20', 'Hilo de yute. Diámetro espejo 20 cm. Diámetro total 40 cm.', 3000, 10, 7, 0, '2021-08-05 12:09:17', '2021-08-05 12:09:17'),
(39, 'Cala', '30', 'Hilo de yute. Diámetro espejo 30 cm. Diámetro total 50 cm.', 4000, 10, 7, 0, '2021-08-05 12:10:14', '2021-08-05 12:10:14'),
(40, 'Cala', '40', 'Hilo de yute. Diámetro espejo 40 cm. Diámetro total 60 cm.', 5000, 10, 7, 0, '2021-08-05 12:11:01', '2021-08-05 12:11:01'),
(41, 'Contenedor', '', 'Hilo de yute + borlas.', 1500, 10, 8, 0, '2021-08-05 12:13:30', '2021-08-05 12:13:30'),
(42, 'Banano', '150', 'Hilo de yute. Dimensiones hoja 30 cm x 50 cm. Altura total 150 cm.', 1500, 10, 9, 0, '2021-08-05 12:14:42', '2021-08-05 12:17:53'),
(43, 'Banano', '', 'Hilo de yute. Dimensiones hoja 15 cm x 30 cm. Altura total 60 cm.', 900, 10, 1, 0, '2021-08-05 12:15:46', '2021-08-05 12:15:46'),
(44, 'Cola de zorro', '', 'Hilo de yute. Dimensiones hoja 30 cm x 50 cm. Altura total 150 cm.', 1500, 10, 9, 0, '2021-08-05 12:16:22', '2021-08-05 12:16:22'),
(45, 'Banano', '60', 'Hilo de yute. Dimensiones hoja 15 cm x 30 cm. Altura total 60 cm.', 900, 10, 9, 0, '2021-08-05 12:19:03', '2021-08-05 12:19:03'),
(46, 'Monstera', '150', 'Hilo de yute. Dimensiones hoja 30 cm x 50 cm. Altura total 150 cm.', 1500, 10, 9, 0, '2021-08-05 12:21:01', '2021-08-05 12:21:01'),
(47, 'Monstera', '60', 'Hilo de yute. Dimensiones hoja 30 cm x 50 cm. Altura total 60 cm.', 900, 10, 9, 0, '2021-08-05 12:21:56', '2021-08-05 12:21:56'),
(48, 'Banano', 'Para colgar', 'Hilo de yute. Dimensiones hoja 30 cm x 50 cm. (para colgar)', 750, 10, 9, 0, '2021-08-05 12:23:09', '2021-08-05 12:23:09'),
(49, 'Monstera', 'Para colgar', 'Hilo de yute. Dimensiones hoja 30 cm x 50 cm. (para colgar)', 750, 10, 9, 0, '2021-08-05 12:23:55', '2021-08-05 12:23:55'),
(50, 'Rogelio', '', 'Cordón de algodón trenzado + Hilo de algodón torcido 27 hebras. Largo 1 m + flecos.', 1500, 10, 10, 0, '2021-08-05 12:25:01', '2021-08-05 12:25:01'),
(51, 'Guirnalda', '150', 'Hilo de algodón torcido. Lana.150 cm.', 2000, 10, 11, 0, '2021-08-05 12:26:05', '2021-08-05 12:26:56'),
(52, 'Guirnalda', '300', 'Hilo de algodón torcido. Lana.300 cm.', 3500, 10, 11, 0, '2021-08-05 12:26:46', '2021-08-05 12:26:46'),
(53, 'Arcoíris', '', 'Hilo de algodón torcido. Lana. Ancho y largo 30 cm.', 1800, 10, 12, 0, '2021-08-05 12:29:07', '2021-08-05 12:29:07'),
(54, 'Móvil', '', 'Aro de madera Diámetro 30 cm. Detalles en nudo plano espiral con hilo de algodón torcido, arcoíris y borlas de lana.', 3500, 10, 13, 0, '2021-08-05 12:29:39', '2021-08-05 12:29:39'),
(55, 'Snowflakes', '', 'Hilo de algodón torcido 27 hebras.', 700, 10, 14, 0, '2021-08-05 12:30:42', '2021-08-05 12:30:42'),
(56, 'Candycane', '', 'Hilo de algodón torcido + lana.', 700, 10, 14, 0, '2021-08-05 12:31:09', '2021-08-05 12:31:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_imagenes`
--

CREATE TABLE `productos_imagenes` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos_imagenes`
--

INSERT INTO `productos_imagenes` (`id`, `uid`, `id_producto`, `eliminado`, `ts_create`, `ts_update`) VALUES
(6, 'b7c3fa27-27d8-491e-adb1-ec245efada7a.jpeg', 11, 0, '2021-08-05 14:23:42', '2021-08-05 14:23:42'),
(7, '3d4439d3-2a56-4c17-9bb6-5c2e22595f6b.jpeg', 13, 0, '2021-08-05 14:25:15', '2021-08-05 14:25:15'),
(8, '372ac2e0-0165-4ceb-b090-aef15a21ab1d.jpeg', 14, 0, '2021-08-05 14:26:51', '2021-08-05 14:26:51'),
(9, '157b7ed7-2785-4042-9c82-705821550ec0.jpeg', 15, 0, '2021-08-05 14:28:19', '2021-08-05 14:28:19'),
(10, '7119a7c5-3090-4ae2-87d3-2205e5415519.jpeg', 16, 0, '2021-08-05 14:29:42', '2021-08-05 14:29:42'),
(11, '5c7b81f5-04f1-425d-ab9c-2d50b8437f9a.jpeg', 17, 0, '2021-08-05 14:30:38', '2021-08-05 14:30:38'),
(12, '07bf9cd4-c2fd-4b98-af2c-c526b19182da.jpeg', 18, 0, '2021-08-05 14:31:43', '2021-08-05 14:31:43'),
(13, 'c87a7c8d-8a36-4130-9bfd-0cb5c2292f84.jpeg', 19, 0, '2021-08-05 14:39:02', '2021-08-05 14:39:02'),
(14, 'a97a2ae9-b82f-43d8-8a8b-10279fb5130b.jpeg', 20, 0, '2021-08-05 14:39:53', '2021-08-05 14:39:53'),
(15, 'df4afb3f-6461-46b2-a40f-ed17ae463a19.jpeg', 21, 0, '2021-08-05 14:40:59', '2021-08-05 14:40:59'),
(16, '7799812f-5565-4263-bba5-756db0d25313.jpeg', 22, 0, '2021-08-05 14:41:38', '2021-08-05 14:41:38'),
(17, '26f3e557-1d6f-465e-8158-e6d0dfd1ba82.jpeg', 23, 0, '2021-08-05 14:42:46', '2021-08-05 14:42:46'),
(18, '7ac4791d-c838-477d-9af4-97686f154599.jpeg', 24, 0, '2021-08-05 14:44:39', '2021-08-05 14:44:39'),
(19, '39dc7661-c91b-4c9f-83fa-c04462fee981.jpeg', 25, 0, '2021-08-05 14:46:16', '2021-08-05 14:46:16'),
(20, 'd2f3d662-167e-42b0-8710-9ec0dbcd0e0e.jpeg', 26, 0, '2021-08-05 14:47:30', '2021-08-05 14:47:30'),
(21, 'eb619d80-d347-4f85-b427-7be9bffc7c67.jpeg', 27, 0, '2021-08-05 14:56:09', '2021-08-05 14:56:09'),
(22, '0e25c38b-129e-424b-8cb9-6c973d85f000.jpeg', 28, 0, '2021-08-05 14:57:05', '2021-08-05 14:57:05'),
(23, '84625c1b-0cf5-4e45-bf5b-f16c7968da37.jpeg', 29, 0, '2021-08-05 14:58:02', '2021-08-05 14:58:02'),
(24, 'ed20fa44-d779-43f9-b138-6fe05cf66a19.jpeg', 30, 0, '2021-08-05 14:59:59', '2021-08-05 14:59:59'),
(25, '8e3c2a14-bcde-4e19-baaf-cc1aacb6c542.jpeg', 31, 0, '2021-08-05 15:01:11', '2021-08-05 15:01:11'),
(26, '4447558b-da41-4f65-8ee3-0f76c470d2e0.jpeg', 32, 0, '2021-08-05 15:03:38', '2021-08-05 15:03:38'),
(27, 'd4b71bc6-a2a8-4ec1-957a-97c9a16855b5.jpeg', 33, 0, '2021-08-05 15:04:47', '2021-08-05 15:04:47'),
(28, '4f4c46b2-1068-485a-a385-6c580aaa393c.jpeg', 34, 0, '2021-08-05 15:05:28', '2021-08-05 15:05:28'),
(29, '0f77ec7e-4580-475e-a6ec-9b19a0b0d8c7.jpeg', 35, 0, '2021-08-05 15:06:19', '2021-08-05 15:06:19'),
(30, '137cd593-2f58-4d23-a725-854065dda50d.jpeg', 36, 0, '2021-08-05 15:07:12', '2021-08-05 15:07:12'),
(31, '640f0fc4-db4f-4228-84d5-e622973a9374.jpeg', 37, 0, '2021-08-05 15:07:45', '2021-08-05 15:07:45'),
(32, '3f372c74-1840-4037-a4ab-f003d58b4e79.jpeg', 38, 0, '2021-08-05 15:09:17', '2021-08-05 15:09:17'),
(33, '1f3c5b7c-78a1-4103-ad8d-e351af2e735f.jpeg', 39, 0, '2021-08-05 15:10:14', '2021-08-05 15:10:14'),
(34, '29d07404-1de5-44f5-908c-c1608a4137b6.jpeg', 40, 0, '2021-08-05 15:11:01', '2021-08-05 15:11:01'),
(35, '84c32e5b-a266-41cd-8906-491ac554b70a.jpeg', 41, 0, '2021-08-05 15:13:30', '2021-08-05 15:13:30'),
(36, '0bb436d6-797c-4e0f-a444-4a616e6509dc.jpeg', 42, 0, '2021-08-05 15:14:42', '2021-08-05 15:14:42'),
(37, '4efc68f0-301d-458d-8c0b-32d2a2f8aa4d.jpeg', 43, 0, '2021-08-05 15:15:46', '2021-08-05 15:15:46'),
(38, 'cb996085-494f-4fa8-88af-987f96259fb4.jpeg', 44, 0, '2021-08-05 15:16:22', '2021-08-05 15:16:22'),
(39, '252edec0-2a35-48f4-a569-0a4c2ee63d6c.jpeg', 45, 0, '2021-08-05 15:19:03', '2021-08-05 15:19:03'),
(40, 'bd622898-5b9b-414d-b19b-40048702608e.jpeg', 46, 0, '2021-08-05 15:21:01', '2021-08-05 15:21:01'),
(41, 'a97dfdd2-9dc0-4bd3-9c2f-77b9437323e0.jpeg', 47, 0, '2021-08-05 15:21:56', '2021-08-05 15:21:56'),
(42, '1e1dda05-c53c-408e-a4db-38c726be8210.jpeg', 48, 0, '2021-08-05 15:23:09', '2021-08-05 15:23:09'),
(43, '43eb38b3-0401-4e74-936e-e1c8d06ea928.jpeg', 49, 0, '2021-08-05 15:23:55', '2021-08-05 15:23:55'),
(44, '0b4ec7a3-6eea-4883-aed7-e002ec0633ac.jpeg', 50, 0, '2021-08-05 15:25:01', '2021-08-05 15:25:01'),
(45, 'b297e3c3-ce66-417b-95f8-5ba135007556.jpeg', 51, 0, '2021-08-05 15:26:05', '2021-08-05 15:26:05'),
(46, '4d15b35c-0faa-4013-8b2e-4d5bd68fd985.jpeg', 52, 0, '2021-08-05 15:26:46', '2021-08-05 15:26:46'),
(47, '10050f4c-ea63-48df-a186-09b195672cf3.jpeg', 53, 0, '2021-08-05 15:29:07', '2021-08-05 15:29:07'),
(48, '3f5ebb83-6a8c-41f5-86dd-87830e88f255.jpeg', 54, 0, '2021-08-05 15:29:39', '2021-08-05 15:29:39'),
(49, '58e7bb9c-06a0-4c6b-83ff-b70903269d59.jpeg', 55, 0, '2021-08-05 15:30:42', '2021-08-05 15:30:42'),
(50, 'a9f490b6-bd7c-4ba0-bd20-7f3eb98ce2d9.jpeg', 56, 0, '2021-08-05 15:31:09', '2021-08-05 15:31:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `confirmacionCorreo` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` int(25) NOT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `habilitado` tinyint(4) NOT NULL DEFAULT 0,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `pass`, `nombre`, `apellido`, `edad`, `mail`, `confirmacionCorreo`, `telefono`, `admin`, `habilitado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(28, 'Bipperty', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Ignacio', 'Gibbs', 27, 'ignacio.gibbs@gmail.com', 'cc8b0fa0-a5b4-4db9-b1a9-0da8f1596afd', 123456, 0, 1, 0, '2021-07-14 21:23:48', '2021-07-27 21:32:08'),
(29, 'RootAdmin', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Agustina', 'GIbbs', 31, 'cala.macramedeco@gmail.com', '38261002-0a6f-4583-bbb0-4580ea4a9330', 123456789, 1, 1, 0, '2021-07-18 16:17:59', '2021-07-18 16:33:01'),
(31, 'Quimey', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Quimey', 'Goméz', 23, 'rocio.quimey40@gmail.com', 'd194065b-3835-4566-8f2c-113fac190a44', 123456789, 0, 1, 0, '2021-07-28 20:42:08', '2021-07-28 20:43:50');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `productos_imagenes`
--
ALTER TABLE `productos_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `productos_imagenes`
--
ALTER TABLE `productos_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  ADD CONSTRAINT `empleados_imagenes_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `productos_imagenes`
--
ALTER TABLE `productos_imagenes`
  ADD CONSTRAINT `productos_imagenes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
