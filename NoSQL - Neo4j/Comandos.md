# Comandos Cypher e Suas Funções

## Introdução
Cypher é a linguagem de consulta utilizada pelo Neo4j para interagir com o banco de dados de grafos. 
Abaixo está uma tabela com alguns comandos comuns e suas respectivas funções.

## Tabela de Comandos
| Comando               | Função                                                                                   |
|-----------------------|------------------------------------------------------------------------------------------|
| `MATCH (n:Label)`     | Encontra todos os nós com o rótulo `Label`.                                              |
| `CREATE (n:Label {props})` | Cria um novo nó com o rótulo `Label` e as propriedades especificadas em `props`.           |
| `SET n.prop = value`  | Define ou atualiza a propriedade `prop` do nó `n` com o valor `value`.                    |
| `RETURN n`            | Retorna o nó `n` ou os resultados da consulta.                                            |
| `DELETE n`            | Remove o nó `n` do banco de dados.                                                       |
| `MERGE (n:Label {props})` | Encontra ou cria um nó com o rótulo `Label` e as propriedades especificadas em `props`.   |
| `MATCH (n)-[r:REL]->(m)` | Encontra nós `n` e `m` e a relação `r` entre eles.                                       |
| `CREATE (n)-[r:REL]->(m)` | Cria uma relação `REL` entre os nós `n` e `m`.                                          |
| `REMOVE n.prop`       | Remove a propriedade `prop` do nó `n`.                                                   |
| `WHERE n.prop = value` | Adiciona uma condição à consulta para filtrar resultados onde `n.prop` é igual a `value`.  |
| `RETURN COUNT(n)`     | Retorna a contagem de nós `n` que correspondem à consulta.                                |

## Exemplos de Uso
### 1. Encontrar todos os nós com o rótulo `Client`
MATCH (n:Client)
RETURN n


### 2. Criar um novo nó Client com propriedades
CREATE (n:Client {nome: 'Igor', age: 28, hobbies: ['viajar', 'comer']})
RETURN n


### 3. Atualizar a propriedade nome de um nó Client
MATCH (n:Client {nome: 'Igor'})
SET n.nome = 'Manoel'
RETURN n


### 4. Adicionar uma propriedade id a um nó existente
MATCH (n:Client {nome: 'Igor'})
SET n.id = '1'
RETURN n


### 5. Encontrar e atualizar um nó Client com base na propriedade id
MATCH (n:Client {id: '1'})
SET n.nome = 'Manoel'
RETURN n


### 6. Remover um nó Client do banco de dados
MATCH (n:Client {id: '1'})
DELETE n


Link: https://sandbox.neo4j.com/