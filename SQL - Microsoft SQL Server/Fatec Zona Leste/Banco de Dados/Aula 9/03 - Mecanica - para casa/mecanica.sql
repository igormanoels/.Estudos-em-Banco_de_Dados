CREATE DATABASE mecanica
GO
USE mecanica
GO
CREATE TABLE cliente (
idCliente INT IDENTITY(3401,15) NOT NULL,
nome VARCHAR(100) NOT NULL,
logradouroEndereco VARCHAR(200) NOT NULL,
numeroEndereco INT NOT NULL CHECK (numeroEndereco >= 0),
cepEndereco CHAR(8) NOT NULL CHECK (LEN(cepEndereco) = 8),
complementoEndereco VARCHAR(255) NOT NULL,
PRIMARY KEY (idCliente)
)
GO
CREATE TABLE telefoneCliente (
clienteId INT NOT NULL,
telefone VARCHAR(11) NOT NULL CHECK (LEN(telefone) IN (10, 11)),
PRIMARY KEY (clienteId, telefone),
FOREIGN KEY (clienteId) REFERENCES cliente(idCliente)
)
GO
CREATE TABLE categoria (
idCategoria INT NOT NULL IDENTITY(1,1),
categoria VARCHAR(10) NOT NULL UNIQUE,
valorHora DECIMAL(5,2) NOT NULL,
PRIMARY KEY(idCategoria),
CONSTRAINT chk_valorHora CHECK (
	(categoria = 'Estagiário' AND valorHora >= 15.00) OR
    (categoria = 'Nível 1' AND valorHora >= 25.00) OR
    (categoria = 'Nível 2' AND valorHora >= 35.00) OR
    (categoria = 'Nível 3' AND valorHora >= 50.00)
    )
)
GO
CREATE TABLE funcionario (
idFuncionario INT IDENTITY(101,1) NOT NULL,
nome VARCHAR(100) NOT NULL,
logradouroEndereco VARCHAR(200) NOT NULL,
numeroEndereco INT NOT NULL CHECK (numeroEndereco >= 0),
telefone CHAR(11) NOT NULL CHECK (LEN(telefone) = 11),
categoriaHabilitacao CHAR(2) NOT NULL CHECK (categoriaHabilitacao IN ('A', 'B', 'C', 'D', 'E')),
categoriaId INT NOT NULL,
PRIMARY KEY (idFuncionario),
FOREIGN KEY (categoriaId) REFERENCES categoria(idCategoria)
)
GO
CREATE TABLE peca (
idPeca INT IDENTITY(3411,7) NOT NULL,
nome VARCHAR(30) NOT NULL UNIQUE,
preco DECIMAL(4,2) NOT NULL CHECK (preco >= 0),
estoque INT NOT NULL CHECK (estoque >= 10),
PRIMARY KEY (idPeca)
)
GO
CREATE TABLE veiculo (
placa CHAR(7) NOT NULL CHECK (LEN(placa) = 7),
marca VARCHAR(30) NOT NULL,
modelo VARCHAR(30) NOT NULL,
cor VARCHAR(15) NOT NULL,
anoFabricacao INT NOT NULL CHECK (anoFabricacao > 1997),
anoModelo INT NOT NULL,
dataAquisicao DATETIME NOT NULL,
clienteId INT NOT NULL,
PRIMARY KEY (placa),
FOREIGN KEY (clienteId) REFERENCES cliente(idCliente),
CONSTRAINT chk_anoModelo CHECK (anoModelo >= anoFabricacao AND anoModelo <= anoFabricacao + 1)
)
GO
CREATE TABLE reparo (
veiculoPlaca CHAR(7) NOT NULL,
funcionarioId INT NOT NULL,
pecaId INT NOT NULL,
dataReparo DATETIME NOT NULL DEFAULT GETDATE(),
custoTotal DECIMAL(5,2) NOT NULL CHECK (custoTotal >= 0),
tempo INT NOT NULL CHECK (tempo >= 0),
PRIMARY KEY (veiculoPlaca, funcionarioId, pecaId, dataReparo),
FOREIGN KEY (veiculoPlaca) REFERENCES veiculo(placa),
FOREIGN KEY (funcionarioId) REFERENCES funcionario(idFuncionario),
FOREIGN KEY (pecaId) REFERENCES peca(idPeca)
)
