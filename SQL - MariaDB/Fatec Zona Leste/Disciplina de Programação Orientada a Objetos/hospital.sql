CREATE DATABASE hospital;

USE hospital

CREATE TABLE pessoa(
    cpf VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefone INT NOT NULL

);

CREATE TABLE doador(
    cpf VARCHAR(30) PRIMARY KEY,
    tipoSangue CHAR(2) NOT NULL

);

CREATE TABLE paciente(
    cpf VARCHAR(30) PRIMARY KEY
);

CREATE TABLE consulta(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(60)  
    consultorio int NOT NULL,
    dataConsulta DATA NOT NULL,
    horario TIME
);

CREATE TABLE especialidade(
    codigo INT PRIMARY KEY, -- Há uma tabela estabelecida pelo crm de 55 itens
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(60)

);

CREATE TABLE doacao(
    id INT AUTO_INCREMENT PRIMARY KEY

);

CREATE TABLE exames(
    id INT AUTO_INCREMENT PRIMARY KEY,

);




CREATE TABLE medico(
    crm VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    telefone INT NOT NULL
);

CREATE TABLE funcionario(
    registro INT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    telefone INT NOT NULL,
    usuario VARCHAR(20) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL
);

CREATE TABLE medicamentos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    quantidade INT NOT NULL,
    fornecedor VARCHAR(40) NOT NULL

);

CREATE TABLE pedidos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    quantidade INT NOT NULL,
    fornecedor VARCHAR(40) NOT NULL,
    situacao varchar(20) DEFAULT 'pendente'

);



