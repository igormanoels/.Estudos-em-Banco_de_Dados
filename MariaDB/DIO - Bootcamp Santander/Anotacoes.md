# Banco de Dados 
- É um coleção organizada de dados, estruturadas e armazenada de forma eletrônica

## *Tipos*
- Relacionais (SQL)
- Não Relacionais (NoSQL, not onlySQL)
- Orientado a Objetos
- Hierárquico

## *SBGD - Sistema de Gerenciamento de Banco de Dados*
- PostgreSQL
- MySQL
- SQLite
- MariaDB
- Mongo DB

## *CRUD*
- Operações: Create, Read, Update e Delete.

## *Características:
- Relacionamento entre Tabelas
- Linguagem de consulta (SQL)
- Integridade relacional (relacionamento entre as tabelas)
- Normalização de dados (forma da estrutura das colunas)
- Segurança
- Flexibilidade e Extensibilidade (possibilidade de expandir ou alterar)
- Suporte a transações ACID (garantir a consistência das informações)

## *ACID*
Atomicidade: Garante que todas as operações de uma transação sejam ou não executadas. Ou seja, se houver erro, ele não altera as informações.
Consistência: Garante que as informações sejam solidas, e que partam de um estado para outro assegurando a legitimidade das operações.
Isolamento: Garante que todas as operações aconteçam de forma isolada, sem que haja conflitos com operações concorrentes.
Durabilidade: Garante que a alteração de informação seja permanente.

Link: https://www.oracle.com/br/database/what-is-a-relational-database/



## SQL - Structured Query Language

*Organização da SQL*
- DQL: Linguagem de Consulta de Dados (SELECT)
- DML: Linguagem de Manipulação de Dados (INSERT, UPDATE, DELETE)
- DDL: Linguagem de Definição de Dados (CREATE, ALTER, DROP)
- DCL: Linguagem de Controle de Dados (GRAN, REVOKE)
- DTL: Linguagem de Transação de Dados (BEGIN, COMMIT, ROLLBACK)

Link: https://www.sqltutorial.org/

## Modelagem de Banco de Dados Relacionais
- MER (Modelo de Entidade e Relacionamento): é representado através de diagramas chamados Diagramas Entidade-Relacionamento(DER)

*Entidades:* São representações abstratas que trazem de forma clara as entidades e suas funções, ex. usuario, destino, reserva.
*Atributos:* Características e propriedades das entidade, ex: nome, email, senha.
*Relacionamentos:* São as representações das associações entre entidades.

*Tipos de Relacionamentos*
- 1 para 1 (1..1)
- 1 para muitos (1..*)
- muitos para muitos (*..*)

*Tabelas:* Consiste um um conjunto de linhas e colunas, onde as colunas possuem nomes únicos.
*Coluna:* Representa um atributo específico de nome único.
*Registro:* É um registro, também conhecido como linhas ou tupla, basicamente um conjunto de dados de uma tabela.

*Tipos de Dados*
- Inteiros (Integer)
- Decimal/ Numérico (Decimal/Numeric)
- Caractere/Varchar
- Data/Hora (Date/Time)
- Booleano (Boolean)
- Texto longo (Text)

*Restrição de valor*
- NOT NULL  (Quando obrigatório)
- UNIQUE    (Único)
- DEFAOUT   (Automático pelo BD)
- Chaves Primárias  ()
- Chaves Estrangeiras   ()
- Auto Incremento   (Incremento do valor, automático)



Link: https://app.quickdatabasediagrams.com/#/
Link: https://clients.cloudclusters.io/