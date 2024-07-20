# Comandos Cassandra e Suas Funções

## Introdução
Cassandra é um banco de dados NoSQL distribuído altamente escalável e sem um único ponto de falha. Abaixo está uma tabela com alguns comandos comuns e suas respectivas funções.

## Tabela de Comandos
| Comando                                   | Função                                                                                       |
|-------------------------------------------|----------------------------------------------------------------------------------------------|
| `CREATE KEYSPACE keyspace_name`           | Cria um novo keyspace.                                                                       |
| `USE keyspace_name`                       | Seleciona um keyspace para ser usado.                                                        |
| `CREATE TABLE table_name`                 | Cria uma nova tabela dentro de um keyspace.                                                  |
| `INSERT INTO table_name`                  | Insere um novo registro em uma tabela.                                                       |
| `SELECT * FROM table_name`                | Seleciona todos os registros de uma tabela.                                                  |
| `UPDATE table_name`                       | Atualiza registros em uma tabela.                                                            |
| `DELETE FROM table_name`                  | Remove registros de uma tabela.                                                              |
| `ALTER TABLE table_name`                  | Altera a estrutura de uma tabela existente.                                                  |
| `DROP TABLE table_name`                   | Remove uma tabela de um keyspace.                                                            |
| `CREATE INDEX ON table_name (column_name)`| Cria um índice em uma coluna específica de uma tabela.                                       |
| `TRUNCATE table_name`                     | Remove todos os registros de uma tabela, mas mantém a estrutura da tabela.                   |
| `BATCH`                                   | Executa múltiplas operações em uma transação atômica.                                        |
| `DESCRIBE keyspace_name`                  | Mostra a estrutura de um keyspace ou uma tabela.                                             |


## Exemplos de Uso
### 1. Criar um keyspace
CREATE KEYSPACE my_keyspace
WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};


### 2. Selecionar um keyspace para uso
USE my_keyspace;


### 3. Criar uma tabela
CREATE TABLE clients (
    id UUID PRIMARY KEY,
    nome TEXT,
    age INT,
    hobbies LIST<TEXT>
);


### 4. Inserir um novo registro na tabela
INSERT INTO clients (id, nome, age, hobbies)
VALUES (uuid(), 'Igor', 28, ['viajar', 'comer']);


### 5. Selecionar todos os registros da tabela
SELECT * FROM clients;


### 6. Atualizar um registro na tabela
UPDATE clients
SET nome = 'Manoel'
WHERE id = <UUID do registro>;


### 7. Remover um registro da tabela
DELETE FROM clients
WHERE id = <UUID do registro>;


### 8. Alterar a estrutura de uma tabela existente
ALTER TABLE clients
ADD email TEXT;


### 9. Remover uma tabela de um keyspace
DROP TABLE clients;


### 10. Criar um índice em uma coluna específica
CREATE INDEX ON clients (nome);


### 11. Remover todos os registros de uma tabela, mantendo sua estrutura
TRUNCATE clients;


### 12. Executar múltiplas operações em uma transação atômica
BEGIN BATCH
INSERT INTO clients (id, nome, age, hobbies) VALUES (uuid(), 'Ana', 25, ['ler', 'escrever']);
UPDATE clients SET age = 29 WHERE id = <UUID do registro>;
APPLY BATCH;


### 13. Mostrar a estrutura de um keyspace ou tabela
DESCRIBE my_keyspace;


link: https://www.katacoda.com/