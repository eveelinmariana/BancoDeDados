

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_resto`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cli_id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `dt_nasc` date NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `whatsapp` varchar(11) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cli_id`, `nome`, `sexo`, `dt_nasc`, `nickname`, `senha`, `whatsapp`, `email`) VALUES
(2, 'Brendon', 'M', '1996-07-16', 'Feitosa', '$2y$10$ePQ4bgEgLacStmQIUPkQ/umk9ZTFcokbhr/mlae91otNSuqU9wSq6', '18981077130', 'brendonfeitosa@hotmail.com'),
(3, 'Brendon', 'M', '1996-07-16', 'Feitosa', '$2y$10$pyYUyJzmkL7VhO9Z1FuTdOfYKm6M84/Z2taJLSiwxHtmjgvyMiYXm', '18981077130', 'brendonfeitosa@hotmail.com'),
(4, 'Brendon', 'M', '1996-07-16', 'Feitosa', '$2y$10$von0y6uI9XaYPDJTZZ6PA./D0ljG3yrQZXkBMh/jNsNdAGi7.bihe', '18981077130', 'brendonfeitosa@hotmail.com'),
(5, 'Brendon', 'M', '1996-07-16', 'Feitosa', '$2y$10$RysTkjIS/yoRQpcUXwkftulhezfhR90u470rNk4nJvtqY/aRY5XyK', '18981077130', 'brendonfeitosa@hotmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `end_cod` int(11) NOT NULL,
  `cliente_cli_id` int(11) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `comp` varchar(45) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `ped_num` int(11) NOT NULL,
  `tipo_pagamento_cod` int(11) NOT NULL,
  `cliente_cli_id` int(11) NOT NULL,
  `ped_data` datetime NOT NULL DEFAULT current_timestamp(),
  `valor_total` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `tipo_cod` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `preco` decimal(12,2) NOT NULL,
  `promo` tinyint(1) DEFAULT NULL,
  `image_url` longtext NOT NULL,
  `peso` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_has_pedido`
--

CREATE TABLE `produto_has_pedido` (
  `produto_codigo` int(11) NOT NULL,
  `pedido_ped_num` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valorUinitario` decimal(12,2) NOT NULL,
  `desconto` decimal(12,2) DEFAULT NULL,
  `subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `release`
--

CREATE TABLE `release` (
  `real_id` int(11) NOT NULL,
  `fundacao` mediumtext NOT NULL,
  `de_onde_vimos` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_pagamento`
--

CREATE TABLE `tipo_pagamento` (
  `cod` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`cod`, `nome`) VALUES
(9, 'PIX');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_produto`
--

CREATE TABLE `tipo_produto` (
  `tipo_cod` int(11) NOT NULL,
  `tipo_nome` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tipo_produto`
--

INSERT INTO `tipo_produto` (`tipo_cod`, `tipo_nome`) VALUES
(22, 'Arroz');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `user` (
  `adm_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `user_tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `user`
--

INSERT INTO `user` (`adm_id`, `nome`, `email`, `senha`, `user_tipo`) VALUES
(3, 'Brendon', 'brendonfeitosa@hotmail.com', '$2y$10$/9/1ZxWPhW2xrxKvWXumfe0Mp71oKaQmEPE3xTXVTYneUlkiQ5SBC', 'adm');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cli_id`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`end_cod`),
  ADD KEY `fk_endereco_cliente1` (`cliente_cli_id`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ped_num`,`tipo_pagamento_cod`),
  ADD KEY `fk_pedido_cliente1` (`cliente_cli_id`),
  ADD KEY `fk_pedido_tipo_pagamento1` (`tipo_pagamento_cod`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_pratos_tipo_prato` (`tipo_cod`);

--
-- Índices de tabela `produto_has_pedido`
--
ALTER TABLE `produto_has_pedido`
  ADD PRIMARY KEY (`produto_codigo`,`pedido_ped_num`),
  ADD KEY `fk_produto_has_pedido_pedido1` (`pedido_ped_num`);

--
-- Índices de tabela `release`
--
ALTER TABLE `release`
  ADD PRIMARY KEY (`real_id`);

--
-- Índices de tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  ADD PRIMARY KEY (`cod`);

--
-- Índices de tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  ADD PRIMARY KEY (`tipo_cod`);

--
-- Índices de tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`adm_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `end_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ped_num` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  MODIFY `tipo_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_endereco_cliente1` FOREIGN KEY (`cliente_cli_id`) REFERENCES `cliente` (`cli_id`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_cli_id`) REFERENCES `cliente` (`cli_id`),
  ADD CONSTRAINT `fk_pedido_tipo_pagamento1` FOREIGN KEY (`tipo_pagamento_cod`) REFERENCES `tipo_pagamento` (`cod`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_pratos_tipo_prato` FOREIGN KEY (`tipo_cod`) REFERENCES `tipo_produto` (`tipo_cod`);

--
-- Restrições para tabelas `produto_has_pedido`
--
ALTER TABLE `produto_has_pedido`
  ADD CONSTRAINT `fk_produto_has_pedido_pedido1` FOREIGN KEY (`pedido_ped_num`) REFERENCES `pedido` (`ped_num`),
  ADD CONSTRAINT `fk_produto_has_pedido_produto1` FOREIGN KEY (`produto_codigo`) REFERENCES `produto` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;