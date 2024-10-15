CREATE DATABASE maternidade
GO
USE maternidade
GO
CREATE TABLE mae (
idMae INT IDENTITY(1001,1) NOT NULL,
nome VARCHAR(60) NOT NULL,
logradouroEndereco VARCHAR(100) NOT NULL,
numeroEndereco INT NOT NULL CHECK (numeroEndereco >= 0),
cepEndereco CHAR(8) NOT NULL CHECK (LEN(cepEndereco) = 8),
complementoEndereco VARCHAR(200) NOT NULL,
telefone CHAR(10) NOT NULL CHECK (LEN(telefone) = 10),
dataNascimento DATETIME NOT NULL,
PRIMARY KEY (idMae)
)
GO
CREATE TABLE bebe (
idBebe INT IDENTITY(1,1) NOT NULL,
nome VARCHAR(60) NOT NULL,
dataNascimento DATETIME NOT NULL DEFAULT GETDATE(),
altura DECIMAL(7,2) NOT NULL CHECK (altura >= 0),
peso DECIMAL(4,3) NOT NULL CHECK (peso >= 0),
idMae INT NOT NULL,
PRIMARY KEY (idBebe),
FOREIGN KEY (idMae) REFERENCES mae(idMae)
)
GO
CREATE TABLE medico (
crmMedico INT NOT NULL,
crmUF CHAR(2) NOT NULL,
nome VARCHAR(60) NOT NULL,
telefoneCelular CHAR(11) NOT NULL CHECK (LEN(telefoneCelular) = 11),
especialidade VARCHAR(30) NOT NULL,
PRIMARY KEY (crmMedico, crmUF),
UNIQUE (telefoneCelular)
)
GO
CREATE TABLE bebeMedico (
bebeId INT NOT NULL,
medicoCRM INT NOT NULL,
medicoUF CHAR(2) NOT NULL,
maeId INT NOT NULL,
PRIMARY KEY (bebeId, medicoCRM, medicoUF, maeId),
FOREIGN KEY (bebeId) REFERENCES bebe(idBebe),
FOREIGN KEY (medicoCRM, medicoUF) REFERENCES medico(crmMedico, crmUF),
FOREIGN KEY (maeId) REFERENCES mae(idMae)
)