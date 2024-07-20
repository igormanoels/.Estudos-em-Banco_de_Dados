# Banco de Dados NoSQL

## Introdução
- Significado: Not Only SQL.
- Engloba uma série de tecnologias que não são relacionais.
- Os bancos de dados não relacionais, fazem uso da pratica de escalabilidade horizontal, particionando os dados em sharding.
- Depende dos clusters para performance.
- Transações BASE 
    - Basically Available: Prioridade na disponibulização de dados
    - Soft-State: Não precisam ser consitentes o tempo todo
    - Eventually Consistent: Em um determinado tempo eles serão consistentes
- Caracteristicas: Flexibilidade, Escalabilidade e Performance

## Tipos de Banco de Dados
- MongoDB (documental, multimodel)
- Redis (Chave-valor, multimodel)
- Cassandra (orientado a coluna)
- NEO4j (orientado a grafo)

- Documentos: Fazem uso de arquivos como JSON ou XML
- Chave-Valor: Armazena dados como pares de chave-valor
- Orientado a Coluna: Mais próximo ao SQL
- Orientado a Grafos: Fazendo uso da estrutura de nós, eles relacionam entidades de maneira complexa afim de mostrar a importancia do dado e relações, comumente utilizada em redes sociais, detecção de fraudes e sistemas de recomendações.

