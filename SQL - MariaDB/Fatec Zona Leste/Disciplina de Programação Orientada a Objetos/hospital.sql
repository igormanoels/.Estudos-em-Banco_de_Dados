CREATE DATABASE hospital;

USE hospital;

CREATE TABLE pessoa (
    cpf VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE doador (
    pessoaCpf VARCHAR(20) PRIMARY KEY,
    tipoSangue CHAR(3) NOT NULL,
    FOREIGN KEY (pessoaCpf) REFERENCES pessoa(cpf)
);

CREATE TABLE paciente (
    pessoaCpf VARCHAR(20) PRIMARY KEY,
    FOREIGN KEY (pessoaCpf) REFERENCES pessoa(cpf)
);

CREATE TABLE funcionario (
    registro INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    usuario VARCHAR(20) NOT NULL UNIQUE,
    senha VARCHAR(20) DEFAULT '123HOSPITAL'
);

CREATE TABLE medico (
    crm VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE especialidade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    especialidade VARCHAR(40) NOT NULL
);

CREATE TABLE agendamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dataAgendamento DATE NOT NULL,
    horario CHAR(5) NOT NULL,
    sala INT NOT NULL,
    pessoaCpf VARCHAR(20) NOT NULL,
    funcionarioRegistro INT NOT NULL,
    FOREIGN KEY (pessoaCpf) REFERENCES pessoa(cpf),
    FOREIGN KEY (funcionarioRegistro) REFERENCES funcionario(registro)
);

CREATE TABLE doacao (
    agendamentoId INT PRIMARY KEY,
    FOREIGN KEY (agendamentoId) REFERENCES agendamento(id)
);

CREATE TABLE exames (
    agendamentoId INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(200),
    FOREIGN KEY (agendamentoId) REFERENCES agendamento(id)
);

CREATE TABLE consulta (
    agendamentoId INT PRIMARY KEY,
    descricao VARCHAR(60),
    medicoCrm VARCHAR(20) NOT NULL,
    especialidadeId INT NOT NULL,
    FOREIGN KEY (agendamentoId) REFERENCES agendamento(id),
    FOREIGN KEY (medicoCrm) REFERENCES medico(crm),
    FOREIGN KEY (especialidadeId) REFERENCES especialidade(id)
);

CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicamento VARCHAR(40) NOT NULL,
    quantidade INT NOT NULL,
    fornecedor VARCHAR(40) NOT NULL,
    funcionarioRegistro INT NOT NULL,
    FOREIGN KEY (funcionarioRegistro) REFERENCES funcionario(registro)
);

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    situacao VARCHAR(20) DEFAULT 'pendente',
    dataPedido DATE NOT NULL,
    dataEntrega DATE NOT NULL
);

CREATE TABLE receita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dataReceita DATE NOT NULL,
    medicoCrm VARCHAR(20) NOT NULL,
    FOREIGN KEY (medicoCrm) REFERENCES medico(crm)
);

CREATE TABLE estoquePedido (
    estoqueId INT NOT NULL,
    pedidoId INT NOT NULL,
    PRIMARY KEY (estoqueId, pedidoId),
    FOREIGN KEY (estoqueId) REFERENCES estoque(id),
    FOREIGN KEY (pedidoId) REFERENCES pedido(id)
);

CREATE TABLE receitaEstoque (
    estoqueId INT NOT NULL,
    receitaId INT NOT NULL,
    PRIMARY KEY (estoqueId, receitaId),
    FOREIGN KEY (estoqueId) REFERENCES estoque(id),
    FOREIGN KEY (receitaId) REFERENCES receita(id)
);


CREATE USER 'pooUser'@'%' IDENTIFIED BY '123456'; -- CRIA UM NOVO USUARIO
GRANT ALL PRIVILEGES ON hospital.* TO 'pooUser'@'%'; -- DA PERMISSÃO
FLUSH PRIVILEGES;