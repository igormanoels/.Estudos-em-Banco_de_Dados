----------------------------------------------------------------------------
-- Criando banco de dados
CREATE DATABASE cantina; -- Cria o bando de dados da Cantina
USE cantina;			 -- Faz com que ele entre em uso

----------------------------------------------------------------------------
-- Ações de controle e gestão para o Banco de Dados

DROP TABLE dbo.cliente; -- Comando para excluir uma tabela
DROP DATABASE cantina; -- Comando para excluir o banco de dados por completo
ALTER TABLE categoria DROP COLUMN categoria; -- exclui uma coluna da tabela
ALTER TABLE refeicoes ADD categoria VARCHAR(10) NOT NULL; -- adciona depois de criada uma coluna na tabela
ALTER TABLE consumo ADD data_consumo DATETIME NOT NULL;


----------------------------------------------------------------------------
-- Criando as tabelas do Banco de Dados
CREATE TABLE cliente (
    id_cliente INT IDENTITY PRIMARY KEY,
    nome_cliente VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    genero VARCHAR(20) NOT NULL,
    data_nascimento DATE NOT NULL,
    naturalidade VARCHAR(50),
    nacionalidade VARCHAR(50)
); -- Crianção da tabela Cliente


----------------------------------------------------------------------------
CREATE TABLE contato (
    id_contato INT IDENTITY PRIMARY KEY,
    id_cliente INT,
    telefone VARCHAR(20),
    email VARCHAR(70),
    sala VARCHAR(2),
    CONSTRAINT fk_contato_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
); -- Criando tabela de Contato


----------------------------------------------------------------------------
CREATE TABLE restaurante (
    id_restaurante INT IDENTITY PRIMARY KEY,
    id_cliente INT,
    CONSTRAINT fk_restaurante_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
); -- Criando tabela de Restaurante


----------------------------------------------------------------------------
CREATE TABLE atendente (
    id_atendente INT IDENTITY PRIMARY KEY,
    id_restaurante INT,
    nome_atendente VARCHAR(150) NOT NULL,
    num_registro VARCHAR(3) NOT NULL,
    CONSTRAINT fk_atendente_restaurante FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante)
); -- Criando tabela de Atendente


----------------------------------------------------------------------------
CREATE TABLE refeicao (
    id_refeicao INT IDENTITY PRIMARY KEY,
    id_restaurante INT,
    id_atendente INT,
    categoria VARCHAR(10) NOT NULL, -- Café, Almoço, Jantar
    CONSTRAINT fk_refeicao_restaurante FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante),
    CONSTRAINT fk_refeicao_atendente FOREIGN KEY (id_atendente) REFERENCES atendente(id_atendente)
); -- Criando tabela de Refeicoes


----------------------------------------------------------------------------
CREATE TABLE consumo (
    id_consumo INT IDENTITY PRIMARY KEY,
    id_cliente INT,
    id_refeicao INT,
    descricao VARCHAR(150) NOT NULL, -- Descrição da refeição
    preco DECIMAL(5, 2) NOT NULL, -- Preço da refeição
    peso FLOAT, -- Peso da refeição (opcional)
	data_consumo DATETIME NOT NULL,
    CONSTRAINT fk_consumo_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_consumo_refeicao FOREIGN KEY (id_refeicao) REFERENCES refeicao(id_refeicao)
); -- Criando tabela de Categoria


----------------------------------------------------------------------------
CREATE TABLE pagamento (
    id_pagamento INT IDENTITY PRIMARY KEY,
    id_restaurante INT,
    id_cliente INT,
    pgmt_total DECIMAL(10, 2) NOT NULL, -- Mudança de VARCHAR para DECIMAL
    data_pgmt DATE NOT NULL, -- Mudança de VARCHAR para DATE
    quant_total DECIMAL(5) NOT NULL, -- Mudança de DECIMAL para DECIMAL(5)
    CONSTRAINT fk_pagamento_restaurante FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante),
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
); -- Criando tabela de Pagamento

----------------------------------------------------------------------------
-- Adicionando índices conforme necessário (índices devem ser adicionados com base em padrões de acesso e desempenho)
CREATE INDEX idx_id_cliente_contato ON contato(id_cliente);
CREATE INDEX idx_id_cliente_consumo ON consumo(id_cliente);
CREATE INDEX idx_id_cliente_pagamento ON pagamento(id_cliente);

----------------------------------------------------------------------------
-- Comando para seleção de Tabelas do Banco de Dados
SELECT* FROM dbo.contato; -- Comando para selecionar uma tabela inteira

SELECT cliente.nome_cliente, cliente.cpf, contato.telefone, refeicao.tipo_categoria, consumo.preco, pagamento.quantTotal, pagamento.pgmtTotal
FROM cliente 
INNER JOIN contato 
ON cliente.id_cliente = contato.id_cliente 
INNER JOIN consumo
ON cliente.id_cliente = consumo.id_cliente
INNER JOIN refeicao
ON refeicao.id_refeicao = consumo.id_refeicao
INNER JOIN pagamento
ON pagamento.id_cliente = cliente.id_cliente; -- Comando para selecionar os campos desejados


