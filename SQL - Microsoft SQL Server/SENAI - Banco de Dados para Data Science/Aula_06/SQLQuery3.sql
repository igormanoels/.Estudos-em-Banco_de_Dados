USE e_commerce;

-- DESAFIO CRIAR UM SELECT QUE ENVOLVE 5 TABELAS
-- usuario, endereco, pedido, produto, itemPedido
SELECT 
usuario.nome, endereco.logradouro, endereco.numero, endereco.bairro, endereco.cidade,
pedido.tipoPagamento, produto.nomeProduto, itemPedido.quantidadeVendida, 
itemPedido.valor, itemPedido.valorTotal
FROM usuario 
INNER JOIN endereco 
ON usuario.id_usuario = endereco.id_usuario
INNER JOIN pedido
ON usuario.id_usuario = pedido.id_usuario
INNER JOIN itemPedido
ON itemPedido.id_pedido = pedido.id_pedido
INNER JOIN produto
ON produto.id_produto = itemPedido.id_produto;


