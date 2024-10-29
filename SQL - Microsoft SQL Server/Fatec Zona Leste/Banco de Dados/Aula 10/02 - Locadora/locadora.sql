----------------------------------------------------------------
-- CRIANDO O BANCO DE DADOS
----------------------------------------------------------------
CREATE DATABASE locadora
GO
USE locadora
GO
CREATE TABLE filme (
id INT NOT NULL,
titulo VARCHAR(40) NOT NULL,
ano INT
PRIMARY KEY(id)
CONSTRAINT chk_ano CHECK(ano <= 2021)
)
GO
CREATE TABLE dvd (
num INT NOT NULL,
dataFabricacao DATE,
filmeId INT NOT NULL
PRIMARY KEY(num)
FOREIGN KEY(filmeId) REFERENCES filme(id),
CONSTRAINT chk_dataFabricacao CHECK(dataFabricacao <= '29/10/2024')
)
GO
CREATE TABLE estrela (
id INT NOT NULL,
nome VARCHAR(50) NOT NULL
PRIMARY KEY(id)
)
GO
CREATE TABLE cliente (
numCadastro INT NOT NULL,
nome VARCHAR(70) NOT NULL,
logradouro VARCHAR(150) NOT NULL,
num INT NOT NULL,
cep CHAR(8)
PRIMARY KEY(numCadastro),
CONSTRAINT chk_numEndereco CHECK(num >= 0),
CONSTRAINT chk_cep CHECK(LEN(cep) = 8)
)
GO
CREATE TABLE locacao (
numDVD INT NOT NULL,
numCadastroCliente INT NOT NULL,
dataLocacao DATE NOT NULL DEFAULT GETDATE(),
dataDevolucao DATE NOT NULL,
valor DECIMAL(7,2) NOT NULL
PRIMARY KEY(numDVD, numCadastroCliente, dataLocacao)
FOREIGN KEY(numDVD) REFERENCES dvd(num),
FOREIGN KEY(numCadastroCliente) REFERENCES cliente(numCadastro),
CONSTRAINT chk_devolucao CHECK(dataDevolucao >= dataLocacao),
CONSTRAINT chk_valor CHECK(valor >= 0)
)
GO
CREATE TABLE filmeEstrela (
filmeId INT NOT NULL,
estrelaId INT NOT NULL
PRIMARY KEY(filmeId, estrelaId)
FOREIGN KEY(filmeId) REFERENCES filme(id),
FOREIGN KEY(estrelaId) REFERENCES estrela(id)
)


----------------------------------------------------------------
-- ALTERANDO A TABELA
----------------------------------------------------------------
ALTER TABLE estrela
ALTER COLUMN nome VARCHAR(50) NOT NULL
GO
ALTER TABLE filme
ALTER COLUMN titulo VARCHAR(80) NOT NULL


----------------------------------------------------------------
-- INSERINDO DADOS
----------------------------------------------------------------



