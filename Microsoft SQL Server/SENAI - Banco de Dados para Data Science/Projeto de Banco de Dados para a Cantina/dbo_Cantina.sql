----------------------------------------------------------------------------
-- Criando banco de dados
CREATE DATABASE cantina; -- Cria o bando de dados da Cantina
USE cantina;			 -- Faz com que ele entre em uso

----------------------------------------------------------------------------
CREATE TABLE cliente (
	id_cliente INT IDENTITY PRIMARY KEY,
    nome_cliente VARCHAR (150) NOT NULL,
    cpf VARCHAR (11) NOT NULL,
    genero VARCHAR (20) NOT NULL,
    data_nascimento DATE NOT NULL,
    naturalidade VARCHAR (50),
    nacionalidade VARCHAR (50)
); -- Crianção da tabela Cliente

----------------------------------------------------------------------------
CREATE TABLE contato (
	id_contato SMALLINT IDENTITY PRIMARY KEY,
	id_cliente INT,
	telefone VARCHAR (20),
	email VARCHAR (70),
	sala VARCHAR (2),
	CONSTRAINT fk_contato_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
); -- Criando tabela de Contato

----------------------------------------------------------------------------
CREATE TABLE restaurante (
	id_restaurante SMALLINT IDENTITY PRIMARY KEY,
	id_cliente INT,
	CONSTRAINT fk_restaurante_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
); -- Criando tabela de Restaurante

----------------------------------------------------------------------------
CREATE TABLE atendente (
	id_atendente SMALLINT IDENTITY PRIMARY KEY,
	id_restaurante SMALLINT,
	nomeAtendente VARCHAR (150) NOT NULL,
	numRegistro VARCHAR (3) NOT NULL,
	CONSTRAINT fk_atendente_restaurante FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante)
); -- Criando tabela de Atendente

----------------------------------------------------------------------------
CREATE TABLE refeicoes (
	id_refeicoes SMALLINT IDENTITY PRIMARY KEY,
	id_cliente INT,
	id_restaurante SMALLINT,
	id_atendente SMALLINT,
	data_hora DATETIME,
	CONSTRAINT fk_refeicoes_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_refeicoes_restaurante FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante),
	CONSTRAINT fk_refeicoes_atendente FOREIGN KEY (id_atendente) REFERENCES atendente(id_atendente)
); -- Criando tabela de Refeicoes

----------------------------------------------------------------------------
CREATE TABLE categoria (
	id_categoria SMALLINT IDENTITY PRIMARY KEY,
	id_refeicoes SMALLINT,
	id_cliente INT,
	categoria VARCHAR (6) NOT NULL,
	descricao VARCHAR (60) NOT NULL,
	preco DECIMAL (5) NOT NULL,
	quant INT NOT NULL,
	peso FLOAT (5) NOT NULL,
	CONSTRAINT fk_categoria_refeicoes FOREIGN KEY (id_refeicoes) REFERENCES refeicoes(id_refeicoes),
	CONSTRAINT fk_categoria_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
); -- Criando tabela de Categoria

----------------------------------------------------------------------------
CREATE TABLE pagamento (
	id_pagamento SMALLINT IDENTITY PRIMARY KEY,
	id_restaurante SMALLINT,
	id_cliente INT,
	pgmtTotal VARCHAR (6) NOT NULL,
	dataPgmt VARCHAR (60) NOT NULL,
	quantTotal DECIMAL (5) NOT NULL,
	CONSTRAINT fk_pagamento_restaurante FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante),
	CONSTRAINT fk_pagamento_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
); -- Criando tabela de Pagamento


DROP TABLE Cliente;
SELECT* FROM dbo.cliente;

