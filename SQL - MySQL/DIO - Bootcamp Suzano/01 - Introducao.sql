CREATE DATABASE RegistroDePublicacoes;

SHOW DATABASES;

USE DATABASE RegistroDePublicacoes;

SHOW TABLES;

DROP DATABASE RegistroDePublicacoes;


-- INICIANDO 
CREATE DATABASE Exemplo01;

USE Exemplo01;

CREATE TABLE periodicos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_periodico VARCHAR(100),
    issn_periodico INT,
    id_editora INT
);

CREATE TABLE editora(
    id INT AUTO_INCREMENT,
    nome_editora VARCHAR(100) UNIQUE,
    pais VARCHAR(5),
    PRIMARY(id)
);

ALTER TABLE periodicos ADD CONSTRAINT fk_editora_periodico FOREIGN KEY (id_editora) REFERENCES editora(id);

INSERT INTO editora (nome_editora, pais) VALUES ('IEEE', 'EUA'), ('DataScienceMagazine', 'EUA');

SELECT * FROM editora;

INSERT INTO periodicos(nome_periodico, issn_periodico, id_editora) VALUES ('Special Issue', 12345678, 1);

