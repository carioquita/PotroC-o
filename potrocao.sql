-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/11/2026 às 05:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `potrocao`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `codAgendamento` int(11) NOT NULL,
  `data` date NOT NULL,
  `horario` time NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pendente',
  `observacoes` text DEFAULT NULL,
  `codCli` int(3) NOT NULL,
  `codpet` int(3) NOT NULL,
  `codFun` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agendamento`
--

INSERT INTO `agendamento` (`codAgendamento`, `data`, `horario`, `status`, `observacoes`, `codCli`, `codpet`, `codFun`) VALUES
(1, '2026-11-12', '09:00:00', 'Pendente', 'Banho e escovação.', 4, 1, 2),
(2, '2026-11-12', '10:30:00', 'Confirmado', 'Tosa higiênica.', 4, 2, 2),
(3, '2026-11-13', '09:30:00', 'Pendente', 'Banho completo.', 5, 3, 2),
(4, '2026-11-13', '11:00:00', 'Confirmado', 'Corte de unhas.', 5, 4, 3),
(5, '2026-11-14', '10:00:00', 'Pendente', 'Corte de unhas.', 6, 5, 1),
(6, '2026-11-14', '14:00:00', 'Confirmado', 'Limpeza de ouvidos.', 6, 6, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamento_servico`
--

CREATE TABLE `agendamento_servico` (
  `codigo` int(3) NOT NULL,
  `codAgendamento` int(11) NOT NULL,
  `codServico` int(11) NOT NULL,
  `precoCobrado` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agendamento_servico`
--

INSERT INTO `agendamento_servico` (`codigo`, `codAgendamento`, `codServico`, `precoCobrado`) VALUES
(1, 1, 1, 45.00),
(2, 1, 8, 25.00),
(3, 2, 4, 35.00),
(4, 3, 2, 60.00),
(5, 3, 8, 25.00),
(6, 4, 6, 15.00),
(7, 5, 6, 15.00),
(8, 6, 7, 20.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_produto`
--

CREATE TABLE `categoria_produto` (
  `codCategoria` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `descricao` varchar(225) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria_produto`
--

INSERT INTO `categoria_produto` (`codCategoria`, `nome`, `descricao`, `ativo`) VALUES
(1, 'Rações', 'Alimentos para cães, gatos e outros animais.', 1),
(2, 'Petiscos', 'Biscoitos, snacks e recompensas para pets.', 1),
(3, 'Brinquedos', 'Brinquedos para diversão e enriquecimento animal.', 1),
(4, 'Higiene', 'Shampoos, condicionadores e produtos de higiene.', 1),
(5, 'Acessórios', 'Coleiras, guias, peitorais e acessórios.', 1),
(6, 'Camas e conforto', 'Caminhas, almofadas e cobertores.', 1),
(7, 'Saúde e cuidados', 'Produtos para cuidados gerais dos animais.', 1),
(8, 'Transporte', 'Caixas, bolsas e acessórios para transporte.', 1),
(9, 'Rações', 'Alimentos para cães, gatos e outros animais.', 1),
(10, 'Petiscos', 'Biscoitos, snacks e recompensas para pets.', 1),
(11, 'Brinquedos', 'Brinquedos para diversão e enriquecimento animal.', 1),
(12, 'Higiene', 'Shampoos, condicionadores e produtos de higiene.', 1),
(13, 'Acessórios', 'Coleiras, guias, peitorais e acessórios.', 1),
(14, 'Camas e conforto', 'Caminhas, almofadas e cobertores.', 1),
(15, 'Saúde e cuidados', 'Produtos para cuidados gerais dos animais.', 1),
(16, 'Transporte', 'Caixas, bolsas e acessórios para transporte.', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCli` int(3) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `datanasc` date DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codCli`, `nome`, `email`, `telefone`, `rg`, `cpf`, `cidade`, `datanasc`, `endereco`) VALUES
(4, 'Ana Oliveira', 'ana@email.com', '(19) 99911-2233', NULL, '123.456.789-01', 'Mogi Guaçu', NULL, 'Rua das Flores, 120'),
(5, 'Lucas Martins', 'lucas@email.com', '(19) 99922-3344', NULL, '234.567.890-12', 'Mogi Guaçu', NULL, 'Rua Primavera, 250'),
(6, 'Beatriz Santos', 'beatriz@email.com', '(19) 99933-4455', NULL, '345.678.901-23', 'Mogi Guaçu', NULL, 'Rua das Acácias, 80'),
(7, 'Potroquinho Rosa Calassara', 'potroquinho@gmail.com', '1999333888', '34567890987', '22744556799', 'Mogi Guaçu', '2009-07-03', 'Rua dos Potrocos - 81');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codFun` int(3) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `datanasc` date NOT NULL,
  `cargo` varchar(60) NOT NULL DEFAULT 'Atendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`codFun`, `nome`, `rg`, `email`, `telefone`, `endereco`, `datanasc`, `cargo`) VALUES
(1, 'Mariana Costa', '45.678.912-3', 'mariana@potrocao.com', '(19) 98811-2233', 'Rua das Palmeiras, 100', '1995-04-12', 'Atendente'),
(2, 'Rafael Mendes', '34.567.891-2', 'rafael@potrocao.com', '(19) 98822-3344', 'Rua dos Ipês, 250', '1990-08-23', 'Tosador'),
(3, 'Camila Ferreira', '23.456.789-1', 'camila@potrocao.com', '(19) 98833-4455', 'Rua das Acácias, 80', '1993-11-05', 'Veterinária');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pet`
--

CREATE TABLE `pet` (
  `codpet` int(3) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `especie` varchar(60) NOT NULL,
  `raca` varchar(60) NOT NULL,
  `codCli` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pet`
--

INSERT INTO `pet` (`codpet`, `nome`, `especie`, `raca`, `codCli`) VALUES
(1, 'Mel', 'Cachorro', 'Golden Retriever', 4),
(2, 'Mimi', 'Gato', 'Persa', 4),
(3, 'Thor', 'Cachorro', 'Shih-tzu', 5),
(4, 'Luna', 'Gato', 'Siamês', 5),
(5, 'Bob', 'Cachorro', 'Labrador', 6),
(6, 'Nina', 'Gato', 'Maine Coon', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codProduto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidadeEstoque` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `codCategoria` int(11) NOT NULL,
  `ativo` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`codProduto`, `nome`, `descricao`, `preco`, `quantidadeEstoque`, `codCategoria`, `ativo`) VALUES
(1, 'Ração Premium para Cães 10kg', 'Ração completa para cães adultos.', 129.90, 20, 1, 1),
(2, 'Ração para Gatos 3kg', 'Alimento completo para gatos adultos.', 74.90, 15, 1, 1),
(3, 'Biscoito para Cães', 'Petisco crocante para cães.', 18.90, 30, 2, 1),
(4, 'Petisco para Gatos', 'Snack sabor frango para gatos.', 12.50, 25, 2, 1),
(5, 'Bola de Borracha', 'Brinquedo resistente para cães.', 15.90, 18, 3, 1),
(6, 'Ratinho de Pelúcia', 'Brinquedo de pelúcia para gatos.', 13.90, 22, 3, 1),
(7, 'Shampoo Pet Neutro', 'Shampoo para higiene de cães e gatos.', 24.90, 12, 4, 1),
(8, 'Coleira Ajustável', 'Coleira regulável para cães de pequeno porte.', 29.90, 16, 5, 1),
(9, 'Caminha Confortável P', 'Caminha macia para animais pequenos.', 89.90, 8, 6, 1),
(10, 'Escova para Pelos', 'Escova para cuidados com a pelagem.', 21.90, 14, 7, 1),
(11, 'Caixa de Transporte P', 'Caixa para transporte seguro de animais pequenos.', 119.90, 6, 8, 1),
(12, 'Bolsa de Transporte Pet', 'Bolsa confortável para transporte de pets.', 99.90, 9, 8, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codServico` int(3) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `duracao` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codServico`, `nome`, `descricao`, `preco`, `duracao`, `ativo`) VALUES
(1, 'Banho Pequeno Porte', 'Banho completo para cães de pequeno porte.', 45.00, 45, 1),
(2, 'Banho Médio Porte', 'Banho completo para cães de médio porte.', 60.00, 60, 1),
(3, 'Banho Grande Porte', 'Banho completo para cães de grande porte.', 85.00, 90, 1),
(4, 'Tosa Higiênica', 'Higienização e remoção de pelos em regiões específicas.', 35.00, 30, 1),
(5, 'Tosa Completa', 'Tosa completa conforme as características do animal.', 65.00, 60, 1),
(6, 'Corte de Unhas', 'Corte e cuidado das unhas do animal.', 15.00, 15, 1),
(7, 'Limpeza de Ouvidos', 'Higienização externa dos ouvidos do animal.', 20.00, 15, 1),
(8, 'Escovação de Pelagem', 'Escovação para remoção de pelos soltos e nós.', 25.00, 20, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`codAgendamento`),
  ADD KEY `fk_codCliagenda` (`codCli`),
  ADD KEY `fk_codpetaenda` (`codpet`),
  ADD KEY `codFun` (`codFun`);

--
-- Índices de tabela `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `UK_AGENDAMENTO_SERVICO` (`codAgendamento`,`codServico`),
  ADD KEY `FK_AS_SERVICO` (`codServico`);

--
-- Índices de tabela `categoria_produto`
--
ALTER TABLE `categoria_produto`
  ADD PRIMARY KEY (`codCategoria`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codCli`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codFun`);

--
-- Índices de tabela `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`codpet`),
  ADD KEY `fk_codCli` (`codCli`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codProduto`),
  ADD KEY `fk_codCategoria` (`codCategoria`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codServico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `codAgendamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  MODIFY `codigo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `categoria_produto`
--
ALTER TABLE `categoria_produto`
  MODIFY `codCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codCli` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codFun` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pet`
--
ALTER TABLE `pet`
  MODIFY `codpet` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codServico` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `fk_codCliagenda` FOREIGN KEY (`codCli`) REFERENCES `cliente` (`codCli`),
  ADD CONSTRAINT `fk_codFunagenda` FOREIGN KEY (`codFun`) REFERENCES `funcionario` (`codFun`),
  ADD CONSTRAINT `fk_codpetaenda` FOREIGN KEY (`codpet`) REFERENCES `pet` (`codpet`);

--
-- Restrições para tabelas `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  ADD CONSTRAINT `FK_AS_AGENDAMENTO` FOREIGN KEY (`codAgendamento`) REFERENCES `agendamento` (`codAgendamento`),
  ADD CONSTRAINT `FK_AS_SERVICO` FOREIGN KEY (`codServico`) REFERENCES `servico` (`codServico`);

--
-- Restrições para tabelas `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `fk_codCli` FOREIGN KEY (`codCli`) REFERENCES `cliente` (`codCli`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_codCategoria` FOREIGN KEY (`codCategoria`) REFERENCES `categoria_produto` (`codCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
