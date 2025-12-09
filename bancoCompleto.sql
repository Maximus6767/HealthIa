-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para health_ia
DROP DATABASE IF EXISTS `health_ia`;
CREATE DATABASE IF NOT EXISTS `health_ia` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `health_ia`;

-- Copiando estrutura para tabela health_ia.cadastros
DROP TABLE IF EXISTS `cadastros`;
CREATE TABLE IF NOT EXISTS `cadastros` (
  `id_cad` int(11) NOT NULL AUTO_INCREMENT,
  `nome_user` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `dt_nasc` date NOT NULL,
  `senha` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela health_ia.cadastros: ~0 rows (aproximadamente)
DELETE FROM `cadastros`;

-- Copiando estrutura para tabela health_ia.contate_nos
DROP TABLE IF EXISTS `contate_nos`;
CREATE TABLE IF NOT EXISTS `contate_nos` (
  `id_contato` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  `email` varchar(111) NOT NULL,
  `assunto` varchar(111) NOT NULL,
  `mensagem` longtext NOT NULL,
  `codigo_instituicao` int(11) NOT NULL,
  PRIMARY KEY (`id_contato`),
  KEY `FK_contate_nos_instituicoes` (`codigo_instituicao`),
  CONSTRAINT `cod_inst` FOREIGN KEY (`codigo_instituicao`) REFERENCES `instituicoes` (`cod_instituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela health_ia.contate_nos: ~2 rows (aproximadamente)
DELETE FROM `contate_nos`;
INSERT INTO `contate_nos` (`id_contato`, `nome`, `email`, `assunto`, `mensagem`, `codigo_instituicao`) VALUES
	(9, 'Felipe Maximus', 'felipe.teste@gmail.com', 'Testando Back', 'To testando o back pra ver se ta show de bolas', 415),
	(10, 'Felipe Maximus', 'felipe.teste@gmail.com', 'Testando Back', 'AOPdsaiodjsapodhasuiohdsaiposdhsaiodapid´0oajda´djaod~çada', 516);

-- Copiando estrutura para tabela health_ia.instituicoes
DROP TABLE IF EXISTS `instituicoes`;
CREATE TABLE IF NOT EXISTS `instituicoes` (
  `id_instituicao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_instituicao` int(11) NOT NULL,
  `nome_instituicao` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_instituicao`),
  KEY `codigo_instituicao` (`cod_instituicao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela health_ia.instituicoes: ~4 rows (aproximadamente)
DELETE FROM `instituicoes`;
INSERT INTO `instituicoes` (`id_instituicao`, `cod_instituicao`, `nome_instituicao`) VALUES
	(1, 516, 'Instituição Health I.A País de Gales'),
	(2, 415, 'Instituição Health I.A Brasil'),
	(3, 333, 'Instituição Health I.A Guatemala'),
	(4, 666, 'Instituição Helath I.A Afeganistão');

-- Copiando estrutura para tabela health_ia.vagas
DROP TABLE IF EXISTS `vagas`;
CREATE TABLE IF NOT EXISTS `vagas` (
  `id_vaga` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(111) NOT NULL DEFAULT '',
  `email` varchar(155) NOT NULL DEFAULT '',
  `qual_vaga` tinytext NOT NULL,
  PRIMARY KEY (`id_vaga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela health_ia.vagas: ~0 rows (aproximadamente)
DELETE FROM `vagas`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
