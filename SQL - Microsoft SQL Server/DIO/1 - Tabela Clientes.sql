CREATE DATABASE dioClientes
GO
USE dioClientes
GO
--Criação da tabela
CREATE TABLE Clientes (
    Id INT IDENTITY(1,1),
    Nome VARCHAR(255) NULL,
    Sobrenome VARCHAR(255) NULL,
    Email VARCHAR(255) NULL,
    AceitaComunicados INT NULL,
    DataCadastro DATETIME2 NULL,
    PRIMARY KEY (Id)
);


SELECT * FROM Clientes
DROP TABLE Clientes


-- Inserção de dados
INSERT INTO Clientes (Nome, Sobrenome, Email, AceitaComunicados, DataCadastro) VALUES 
('Ken', 'Sánchez', 'email@email.com', 0, '2009-01-07 00:00:00.0000000'),
('Terri', 'Duffy', 'email@email.com', 1, '2008-01-24 00:00:00.0000000'),
('Roberto', 'Tamburello', 'email@email.com', 0, '2007-11-04 00:00:00.0000000'),
('Rob', 'Walters', 'email@email.com', 0, '2007-11-28 00:00:00.0000000'),
('Jill', 'Williams', 'email@email.com', 0, '2009-01-11 00:00:00.0000000'),
('James', 'Hamilton', 'email@email.com', 0, '2009-01-27 00:00:00.0000000'),
('Peter', 'Krebs', 'email@email.com', 0, '2008-11-24 00:00:00.0000000'),
('Guy', 'Gilbert', 'email@email.com', 0, '2006-06-23 00:00:00.0000000'),
('Mark', 'McArthur', 'email@email.com', 1, '2009-01-16 00:00:00.0000000'),
('Britta', 'Simon', 'email@email.com', 0, '2009-01-22 00:00:00.0000000'),
('Bryan', 'Baker', 'email@email.com', 0, '2009-01-14 00:00:00.0000000'),
('Diane', 'Tibbott', 'email@email.com', 0, '2009-01-11 00:00:00.0000000'),
('Kimberly', 'Zimmerman', 'email@email.com', 0, '2010-01-05 00:00:00.0000000'),
('Tom', 'Vande Velde', 'email@email.com', 0, '2010-03-03 00:00:00.0000000'),
('Zheng', 'Mu', 'email@email.com', 0, '2008-11-26 00:00:00.0000000'),
('Ebru', 'Ersan', 'email@email.com', 1, '2009-11-29 00:00:00.0000000'),
('Mindaugas', 'Krapauskas', 'email@email.com', 1, '2009-01-06 00:00:00.0000000'),
('Angela', 'Barbariol', 'email@email.com', 1, '2009-01-13 00:00:00.0000000'),
('Michael', 'Patten', 'email@email.com', 0, '2009-01-24 00:00:00.0000000'),
('Matthias', 'Berndt', 'email@email.com', 0, '2009-01-13 00:00:00.0000000'),
('Samantha', 'Smith', 'email@email.com', 0, '2009-01-28 00:00:00.0000000'),
('Cynthia', 'Randall', 'email@email.com', 0, '2009-01-20 00:00:00.0000000'),
('Jian Shuo', 'Wang', 'email@email.com', 0, '2008-11-30 00:00:00.0000000'),
('Yuhong', 'Li', 'email@email.com', 1, '2009-01-25 00:00:00.0000000'),
('Benjamin', 'Martin', 'email@email.com', 1, '2009-01-20 00:00:00.0000000'),
('Reed', 'Koch', 'email@email.com', 0, '2009-01-26 00:00:00.0000000'),
('Frank', 'Lee', 'email@email.com', 0, '2009-01-10 00:00:00.0000000'),
('Brian', 'Lloyd', 'email@email.com', 0, '2009-01-22 00:00:00.0000000'),
('Tawana', 'Nusbaum', 'email@email.com', 0, '2009-01-29 00:00:00.0000000'),
('Stuart', 'Munson', 'email@email.com', 1, '2008-11-25 00:00:00.0000000'),
('Greg', 'Alderson', 'email@email.com', 0, '2008-11-25 00:00:00.0000000'),
('Scott', 'Gode', 'email@email.com', 0, '2009-01-01 00:00:00.0000000'),
('Kathie', 'Flood', 'email@email.com', 0, '2009-01-20 00:00:00.0000000'),
('Sean', 'Chai', 'email@email.com', 0, '2009-01-15 00:00:00.0000000'),
('Hao', 'Chen', 'email@email.com', 0, '2009-01-30 00:00:00.0000000'),
('Eric', 'Kurjan', 'email@email.com', 1, '2010-01-20 00:00:00.0000000'),
('Erin', 'Hagens', 'email@email.com', 0, '2010-01-24 00:00:00.0000000'),
('Ben', 'Miller', 'email@email.com', 0, '2010-03-02 00:00:00.0000000'),
('Annette', 'Hill', 'email@email.com', 1, '2010-11-29 00:00:00.0000000'),
('David', 'Barber', 'email@email.com', 0, '2009-01-05 00:00:00.0000000'),
('Dan', 'Wilson', 'email@email.com', 0, '2009-01-15 00:00:00.0000000'),
('Milton', 'Albury', 'email@email.com', 0, '2013-07-31 00:00:00.0000000');
