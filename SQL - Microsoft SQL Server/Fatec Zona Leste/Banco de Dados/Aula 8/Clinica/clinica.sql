CREATE DATABASE clinica
GO
USE clinica
GO
CREATE TABLE paciente (
numBeneficiario INT NOT NULL,
nome VARCHAR(100) NOT NULL,
logradouro VARCHAR(200) NOT NULL,
numero int NOT NULL,
cep CHAR(8) NOT NULL,
complemento VARCHAR(255) NOT NULL,
telefone VARCHAR(11)
PRIMARY KEY(numBeneficiario)
)
GO
CREATE TABLE especialidade (
id INT NOT NULL, 
especialidade VARCHAR(100)
PRIMARY KEY(id)
)
GO
CREATE TABLE medico (
codigo INT NOT NULL,
nome VARCHAR(100) NOT NULL,
logradouro VARCHAR(200) NOT NULL,
numero INT NOT NULL,
cep CHAR(8) NOT NULL,
complemento VARCHAR(255) NOT NULL,
contato VARCHAR(11) NOT NULL,
especialidadeId INT NOT NULL
PRIMARY KEY(codigo)
FOREIGN KEY(especialidadeId) REFERENCES especialidade(id)
)
GO
CREATE TABLE consulta(
pacienteNumBeneficiario INT NOT NULL,
medicoCodigo INT NOT NULL,
dataHora DATETIME NOT NULL,
observacao VARCHAR(255)
PRIMARY KEY(pacienteNumBeneficiario, medicoCodigo, dataHora)
FOREIGN KEY(pacienteNumBeneficiario) REFERENCES paciente(numBeneficiario),
FOREIGN KEY(medicoCodigo) REFERENCES medico(codigo)
)