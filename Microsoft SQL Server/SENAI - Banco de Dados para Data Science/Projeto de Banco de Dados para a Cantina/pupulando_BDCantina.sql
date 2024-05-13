use cantina;
----------------------------------------------------------------------------
-- Dados para a tabela de Cliente
INSERT INTO cliente (nome_cliente, cpf, genero, data_nascimento, naturalidade, nacionalidade) 
VALUES
    ('João da Silva', '12345678901', 'Masculino', '1990-05-15', 'São Paulo', 'Brasileiro'),
    ('Maria Oliveira', '98765432109', 'Feminino', '1985-08-20', 'Rio de Janeiro', 'Brasileiro'),
    ('Ana Santos', '45678901234', 'Feminino', '1993-03-10', 'Salvador', 'Brasileiro'),
    ('Pedro Souza', '56789012345', 'Masculino', '1988-11-25', 'Belo Horizonte', 'Brasileiro'),
    ('Luiza Pereira', '23456789012', 'Feminino', '1996-07-05', 'Recife', 'Brasileiro'),
    ('Carlos Costa', '67890123456', 'Masculino', '1999-01-30', 'Porto Alegre', 'Brasileiro'),
    ('Diego Fernandez', '34567890123', 'Masculino', '1983-09-12', 'Buenos Aires', 'Argentino'),
    ('Sofia Ramirez', '45678901234', 'Feminino', '1987-04-28', 'Córdoba', 'Argentino'),
    ('Klaus Müller', '56789012345', 'Masculino', '1980-12-03', 'Berlim', 'Alemão'),
    ('Élise Dubois', '67890123456', 'Feminino', '1984-06-17', 'Paris', 'Francês');


-- Dados para a tabela de Contato
INSERT INTO contato (id_cliente, telefone, email, sala)
VALUES 
    (1, '(11) 98765-4321', 'joao.silva@example.com', '41'),
    (2, '(21) 12345-6789', 'maria.oliveira@example.com', '42'),
    (3, '(71) 55555-5555', 'ana.santos@example.com', '43'),
    (4, '(31) 99999-9999', 'pedro.souza@example.com', '44'),
    (5, '(81) 77777-7777', 'luiza.pereira@example.com', '45'),
    (6, '(51) 33333-3333', 'carlos.costa@example.com', '46'),
    (7, '(54) 77777-7777', 'diego.fernandez@example.com', '47'),
    (8, '(54) 88888-8888', 'sofia.ramirez@example.com', '48'),
    (9, '(49) 5555-5555', 'klaus.muller@example.com', '49'),
    (10, '(33) 9999-9999', 'elise.dubois@example.com', '50');


-- Dados para a tabela de Restaurante
INSERT INTO restaurante (id_cliente)
VALUES 
    (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);


-- Dados para a tabela de Atendente
INSERT INTO atendente (id_restaurante, nome_atendente, num_registro)
VALUES 
    (1, 'Ana Silva', '128'),
    (1, 'Pedro Santos', '245'),
    (1, 'Maria Oliveira', '393');


-- Dados para a tabela de Refeição






SELECT* FROM restaurante;
SELECT* FROM atendente;




