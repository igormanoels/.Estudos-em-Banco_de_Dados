USE vendas;
--1. Consultar a quantidade, valor total e valor total com desconto (25%) dos itens comprados par Maria Clara.
SELECT produto.nome, 
FORMAT(produto.valor_unitario * pedido.quantidade, 'N2') AS valor_total, 
FORMAT(((produto.valor_unitario * pedido.quantidade) * 0.75), 'N2') AS total_com_desconto
FROM produto
INNER JOIN pedido ON pedido.cod_prod = produto.codigo
INNER JOIN cliente ON pedido.cod_cli = cliente.codigo


--2. Consultar quais brinquedos não tem itens em estoque.
SELECT produto.nome 
FROM produto INNER JOIN fornecedor ON produto.cod_forn = fornecedor.codigo
WHERE produto.qtd_estoque >= 0 AND fornecedor.atividade LIKE 'B%'


--3. Consultar quais nome e descrições de produtos que não estão em pedidos
SELECT produto.nome, produto.descricao
FROM produto LEFT JOIN pedido ON pedido.cod_prod = produto.codigo
WHERE pedido.codigo IS NULL


--4. Alterar a quantidade em estoque do faqueiro para 10 peças.
UPDATE produto SET qtd_estoque += 10
WHERE produto.nome = 'faqueiro'
SELECT * FROM produto


--5. Consultar Quantos clientes tem mais de 40 anos.
SELECT 
	COUNT(*) AS 'Total de Cliente com mais de 40 anos'
FROM 
	cliente
WHERE 
	DATEDIFF(YEAR, data_nasc, GETDATE()) > 40


--6. Consultar Nome e telefone (Formatado XXXX-XXXX) dos fornecedores de Brinquedos e Chocolate.
SELECT 
    nome,
    SUBSTRING(CAST(telefone AS VARCHAR(8)), 1, 4) + '-' + 
	SUBSTRING(CAST(telefone AS VARCHAR(8)), 5, 4) AS telefone
FROM 
    fornecedor


--7. Consultar nome e desconto de 25% no preço dos produtos que custam menos de R$50,00
SELECT 
    produto.nome, 
    'R$ ' + CAST(FORMAT((produto.valor_unitario * 0.75), 'N2') AS VARCHAR) AS preço
FROM 
    produto
WHERE 
    produto.valor_unitario < 50


--8. Consultar nome e aumento de 10% no preço dos produtos que custam mais de R$100,00
SELECT 
	produto.nome,
	'R$ ' + CAST(FORMAT((produto.valor_unitario * 1.1), 'N2') AS VARCHAR) AS preço
FROM 
	produto
WHERE
	produto.valor_unitario > 100


--9. Consultar desconto de 15% no valor total de cada produto da venda 99001.
SELECT 
	'R$ ' + CAST(FORMAT(((produto.valor_unitario * pedido.quantidade) * 0.85), 'N2') AS VARCHAR) AS 'valor total'
FROM 
	produto INNER JOIN pedido ON produto.codigo = pedido.cod_prod
WHERE pedido.codigo = 99001


--10. Consultar Código do pedido, nome do cliente e idade atual do cliente
SELECT 
	pedido.codigo, cliente.nome, 
	DATEDIFF(YEAR, cliente.data_nasc, GETDATE()) AS idade
FROM 
	cliente INNER JOIN pedido ON cliente.codigo = pedido.cod_cli


--11. Consultar o nome do fornecedor do produto mais caro
SELECT TOP 1
	fornecedor.nome,  MAX(produto.valor_unitario) AS 'maior valor'
FROM 
	fornecedor INNER JOIN produto ON produto.cod_forn = fornecedor.codigo
GROUP BY 
	fornecedor.nome


--12. Consultar a média dos valores cujos produtos ainda estão em estoque
SELECT 
	'R$' + CAST(FORMAT(AVG(produto.valor_unitario * produto.qtd_estoque), 'N2') AS VARCHAR) AS 'média de preço' 
FROM  
	produto
WHERE
	produto.qtd_estoque > 0


--13. Consultar o nome do cliente, endereço composto por logradouro e número, o valor unitário do produto, 
-- o valor total (Quantidade * valor unitario) da compra do cliente de nome Maria Clara
SELECT 
	cliente.nome, produto.valor_unitario, 
	(produto.valor_unitario * pedido.quantidade) AS 'valor total',
	cliente.logradouro + ', ' + CAST(cliente.numero AS VARCHAR) AS 'endereço'
FROM produto 
INNER JOIN pedido ON produto.codigo = pedido.cod_prod
INNER JOIN cliente ON pedido.cod_cli = cliente.codigo
WHERE cliente.nome  = 'Maria Clara' 


--14. Considerando que o pedido de Maria Clara foi entregue 15/03/2023, 
-- consultar quantos dias houve de atraso. A cláusula do WHERE deve ser o nome da cliente.
SELECT 
	DATEDIFF(DAY, pedido.previsao_ent, '2023-03-15') AS 'dias de atraso'
FROM 
	cliente INNER JOIN pedido ON pedido.cod_cli = cliente.codigo
WHERE
	cliente.nome =  'Maria Clara'


-- 15. Consultar qual a nova data de entrega para o pedido de Alberto% sabendo que se pediu 9 dias a mais. A cláusula do WHERE deve ser o nome do cliente. A data deve ser exibida no formato dd/mm/aaaa.
SELECT 
	CONVERT(VARCHAR, DATEADD(DAY, 9, pedido.previsao_ent), 103) AS 'nova data de entrega'
FROM 
	pedido 
	INNER JOIN cliente ON pedido.cod_cli = cliente.codigo
WHERE
	cliente.nome LIKE 'Alberto%'




