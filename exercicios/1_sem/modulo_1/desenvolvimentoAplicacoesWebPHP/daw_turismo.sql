-- phpMyAdmin SQL Dump
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `daw_turismo`
--
CREATE DATABASE IF NOT EXISTS `daw_turismo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `daw_turismo`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

DROP TABLE IF EXISTS `cidades`;
CREATE TABLE IF NOT EXISTS `cidades` (
`cidade_Cod` int(11) NOT NULL,
  `cidade_Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
`cliente_Cod` int(11) NOT NULL,
  `cliente_Email` varchar(50) NOT NULL,
  `cliente_Senha` char(50) NOT NULL,
  `cliente_Cidade` int(11) NOT NULL,
  `cliente_Nome` varchar(50) NOT NULL,
  `cliente_Foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `clientes`:
--   `cliente_Cidade`
--       `cidades` -> `cidade_Cod`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `hoteis`
--

DROP TABLE IF EXISTS `hoteis`;
CREATE TABLE IF NOT EXISTS `hoteis` (
  `hotel_Cod` int(11) NOT NULL,
  `hotel_Nome` varchar(30) NOT NULL,
  `hotel_Categoria` int(11) NOT NULL COMMENT '1 para básico, 2 para luxo',
  `hotel_Cidade` int(11) NOT NULL,
  `hotel_Diaria` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `hoteis`:
--   `hotel_Cidade`
--       `cidades` -> `cidade_Cod`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservashotel`
--

DROP TABLE IF EXISTS `reservashotel`;
CREATE TABLE IF NOT EXISTS `reservashotel` (
  `reservasHotel_Cliente` int(11) NOT NULL,
  `reservasHotel_Hotel` int(11) NOT NULL,
  `reservasHotel_DataEntrada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reservasHotel_DataSaida` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reservasHotel_PrecoTotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `reservashotel`:
--   `reservasHotel_Cliente`
--       `clientes` -> `cliente_Cod`
--   `reservasHotel_Hotel`
--       `hoteis` -> `hotel_Cod`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservasvoo`
--

DROP TABLE IF EXISTS `reservasvoo`;
CREATE TABLE IF NOT EXISTS `reservasvoo` (
  `reservasVoo_Cliente` int(11) NOT NULL,
  `reservasVoo_Voo` int(11) NOT NULL,
  `reservasVoo_QuantPassageiros` int(11) NOT NULL,
  `reservasVoo_PrecoTotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `reservasvoo`:
--   `reservasVoo_Cliente`
--       `clientes` -> `cliente_Cod`
--   `reservasVoo_Voo`
--       `voos` -> `voo_Cod`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `voos`
--

DROP TABLE IF EXISTS `voos`;
CREATE TABLE IF NOT EXISTS `voos` (
  `voo_Cod` int(11) NOT NULL,
  `voo_CidadeOrigem` int(11) NOT NULL,
  `voo_CidadeDestino` int(11) NOT NULL,
  `voo_Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voo_Preco` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `voos`:
--   `voo_CidadeOrigem`
--       `cidades` -> `cidade_Cod`
--   `voo_CidadeDestino`
--       `cidades` -> `cidade_Cod`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cidades`
--
ALTER TABLE `cidades`
 ADD PRIMARY KEY (`cidade_Cod`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
 ADD PRIMARY KEY (`cliente_Cod`), ADD UNIQUE KEY `cliente_Email` (`cliente_Email`), ADD UNIQUE KEY `cliente_Email_2` (`cliente_Email`), ADD KEY `cliente_Cidade` (`cliente_Cidade`);

--
-- Indexes for table `hoteis`
--
ALTER TABLE `hoteis`
 ADD PRIMARY KEY (`hotel_Cod`), ADD KEY `hotel_Cidade` (`hotel_Cidade`);

--
-- Indexes for table `reservashotel`
--
ALTER TABLE `reservashotel`
 ADD PRIMARY KEY (`reservasHotel_Cliente`,`reservasHotel_Hotel`,`reservasHotel_DataEntrada`,`reservasHotel_DataSaida`), ADD KEY `reservasHotel_Hotel` (`reservasHotel_Hotel`);

--
-- Indexes for table `reservasvoo`
--
ALTER TABLE `reservasvoo`
 ADD PRIMARY KEY (`reservasVoo_Cliente`,`reservasVoo_Voo`), ADD KEY `reservasVoo_Voo` (`reservasVoo_Voo`);

--
-- Indexes for table `voos`
--
ALTER TABLE `voos`
 ADD PRIMARY KEY (`voo_Cod`), ADD KEY `voo_CidadeOrigem` (`voo_CidadeOrigem`,`voo_CidadeDestino`), ADD KEY `voo_CidadeDestino` (`voo_CidadeDestino`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cidades`
--
ALTER TABLE `cidades`
MODIFY `cidade_Cod` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
MODIFY `cliente_Cod` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`cliente_Cidade`) REFERENCES `cidades` (`cidade_Cod`);

--
-- Limitadores para a tabela `hoteis`
--
ALTER TABLE `hoteis`
ADD CONSTRAINT `hoteis_ibfk_1` FOREIGN KEY (`hotel_Cidade`) REFERENCES `cidades` (`cidade_Cod`);

--
-- Limitadores para a tabela `reservashotel`
--
ALTER TABLE `reservashotel`
ADD CONSTRAINT `reservashotel_ibfk_1` FOREIGN KEY (`reservasHotel_Cliente`) REFERENCES `clientes` (`cliente_Cod`),
ADD CONSTRAINT `reservashotel_ibfk_2` FOREIGN KEY (`reservasHotel_Hotel`) REFERENCES `hoteis` (`hotel_Cod`);

--
-- Limitadores para a tabela `reservasvoo`
--
ALTER TABLE `reservasvoo`
ADD CONSTRAINT `reservasvoo_ibfk_1` FOREIGN KEY (`reservasVoo_Cliente`) REFERENCES `clientes` (`cliente_Cod`),
ADD CONSTRAINT `reservasvoo_ibfk_2` FOREIGN KEY (`reservasVoo_Voo`) REFERENCES `voos` (`voo_Cod`);

--
-- Limitadores para a tabela `voos`
--
ALTER TABLE `voos`
ADD CONSTRAINT `voos_ibfk_1` FOREIGN KEY (`voo_CidadeOrigem`) REFERENCES `cidades` (`cidade_Cod`),
ADD CONSTRAINT `voos_ibfk_2` FOREIGN KEY (`voo_CidadeDestino`) REFERENCES `cidades` (`cidade_Cod`);
COMMIT;
