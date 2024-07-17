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

*Operadores Select*
- = (igualdade)
- <> ou != (desigualdade)
- > (maior que)
- < (menor que)
- >= (maior ou igual que)
- <= (menor ou igual que)
- LIKE (comparação de padrões)
- IN (pertence a uma lista de valores)
- BETWEEN (dentro de um intervalo)
- AND (e lógico)
- OR (ou lógico)

*Normalização de Dados*
- A normalização de dados é um processo no qual se organiza e estrutura um banco de dados relacional de forma a eliminar redundâncias e anomalias, garantindo a consistência e integridade dos dados.
    - Atomicidade: Estabelece que cada valor da tabela deve ser indivisivel/ únicos, por exemplo, endereço é composto por rua e número.
    - Todos os atributos não chave primárias, devem depender totalmente da chave primária.
    - Nenhuma coluna não-chave deve depender de outra coluna nõa-chave.

*Junções*
- INNER JOIN: Retorna apenas as linhas que tem correspondencia em ambas tabelas envolvidas na junção.
- LEFT JOIN: retorna como null os campos da esquerda quando a tabela apontada não tem referencia na outra
- RIGHT JOIN: retorna como null os campos da direita quando a tabela apontada não tem referencia na outra
- FULL JOIN:  retorna todos os campos, null para os vazios

*Sub Consultas*
- Elas permitem realizar consultas mais complexas permitindo que você use o resultado de uma consulta como entrada para outra consulta.

*Funções Agregadoras*
- COUNT: Conta o número de registros.
- SUM: Soma os valores de uma coluna numérica.
- AVG: Calcula a média dos valores de uma coluna numérica.
- MIN: Retorna o valor mínimo de uma coluna.
- MAX: Retorna o valor máximo de uma coluna.

Link: https://app.quickdatabasediagrams.com/#/
Link: https://clients.cloudclusters.io/