// Cria um nó, que cumpre o principio de tabela, recebendo as informações dos dados dos clientes
CREATE (:Servicos)

// Cria uma inclusão de valores, baseada em chave valor
CREATE (:Client {nome: "Igor", age: 28, hobbies: ['viajar, comer']}) 

// Realiza a busca de um valor na base de dados
MATCH (Igor) RETURN Igor;

// Amiga é o nome atribuido, a relação que está estabelecida entre os nós, vanessa e Patricia 
// É o mesmo que falar, cria e relaciona
CREATE (:Client {nome: "Patricia", age: 28, hobbies: ['Passear, comer']}) -[:Amiga]-> (:Client {nome: "Vanessa", age: 18, hobbies: ['Viajar, comer']}) 

// Retorna todos as tabelas
MATCH (todos) RETURN todos;

// Busca os nós, e referencia estabelecendo um relacionamento
// é o mesmo que falar, localiza e relaciona
MATCH (Igor:Client {nome: "Igor"}),  (Patricia:Client {nome: "Patricia"}) CREATE (Igor) -[:Casados]-> (Patricia)

// Remove todos os relacionamentos de Vanessa
MATCH (Vanessa:Client {nome: "Vanessa"})-[relaciona:Bloqueado]-() DELETE relaciona

// Remove o nó
MATCH (Vanessa:Client {nome: "Vanessa"}) DELETE Vabessa;

//busca um nó, e faz o update da informação. A clausa return é pra mostar o nó ao final
MATCH (client:Client {nome: 'Igor'}) SET client.nome = ["Manoel"] RETURN client