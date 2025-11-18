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
  CONSTRAINT `FK_contate_nos_instituicoes` FOREIGN KEY (`codigo_instituicao`) REFERENCES `instituicoes` (`cod._instituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela health_ia.contate_nos: ~8 rows (aproximadamente)
DELETE FROM `contate_nos`;
INSERT INTO `contate_nos` (`id_contato`, `nome`, `email`, `assunto`, `mensagem`, `codigo_instituicao`) VALUES
	(1, 'Felipe Maximus', 'maxmusteste@gmail.com', 'Problemas com minha receita médica', 'Mensagem para testar meu backend basico de uma tela de contate-nos', 333),
	(2, 'Felipe Maximus', 'maxmusteste@gmail.com', 'Problemas com minha receita médica', 'Mensagem para testar meu backend basico de uma tela de contate-nos', 333),
	(3, 'F dasdadada', 'maxmusteste@gmail.com', 'Problemas com minha receita médica', 'Mensagem para testar meu backend basico de uma tela de contate-nos', 333),
	(4, 'F dasdadada', 'maxmusteste@gmail.com', 'Problemas com minha receita médica', 'Mensagem para testar meu backend basico de uma tela de contate-nos', 333),
	(5, 'sadhsajkfhsfsdjkfsh', 'maxmusteste@gmail.com', 'Problemas com minha receita médica', 'Mensagem para testar meu backend basico de uma tela de contate-nos', 333),
	(6, 'Matheus Oliveira', 'teste@gmail.com', 'Problema com código', 'Problema com meu código de back-end, não está validando os campos necessários para enviar msg', 333),
	(7, 'Matheus Oliveira', 'teste@gmail.com', 'Problema com código <br>', 'Problema com meu código de back-end, não está validando os campos necessários para enviar msg', 333),
	(8, 'Matheus Oliveira', 'teste@gmail.com', 'Problema com código', 'Problema com meu código de back-end, não está validando os campos necessários para enviar msg. <img alt=\'Gatinho fofinho\' id=\'dimg_tXwcadF1uvLWxA-cuobIBQ_13\' src=\'data:image/jpeg;base64,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\' data-csiid=\'tXwcadF1uvLWxA-cuobIBQ_1\' data-atf=\'1\'>', 333);

-- Copiando estrutura para tabela health_ia.instituicoes
DROP TABLE IF EXISTS `instituicoes`;
CREATE TABLE IF NOT EXISTS `instituicoes` (
  `id_instituicao` int(11) NOT NULL AUTO_INCREMENT,
  `cod._instituicao` int(11) NOT NULL,
  `nome_instituicao` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_instituicao`),
  KEY `cod._instituicao` (`cod._instituicao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela health_ia.instituicoes: ~3 rows (aproximadamente)
DELETE FROM `instituicoes`;
INSERT INTO `instituicoes` (`id_instituicao`, `cod._instituicao`, `nome_instituicao`) VALUES
	(1, 516, 'País de Gales'),
	(2, 415, 'Brazil'),
	(3, 333, 'Guatemala');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
