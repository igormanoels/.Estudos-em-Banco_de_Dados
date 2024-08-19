import os
import pyodbc
import pandas as pd
import matplotlib.pyplot as plt

os.system('cls')
server = 'LABC10-NOTE04'
database = 'e_commerce'

# conecta com o BD
conn = pyodbc.connect('DRIVER={SQL Server};SERVER='+server+';DATABASE='+database)

# executa a consulta no BD
df = pd.read_sql_query('''SELECT usuario.nome,
endereco.logradouro,
endereco.numero,
endereco.bairro,
endereco.cidade,
pedido.dataVenda,
pedido.tipoPagamento,
produto.nomeProduto,
itemPedido.quantidadeVendida,
itemPedido.valor,
itemPedido.valorTotal
FROM usuario 
INNER JOIN endereco
ON usuario.id_usuario = endereco.id_usuario
INNER JOIN pedido
ON usuario.id_usuario = pedido.id_usuario
INNER JOIN itemPedido
ON itemPedido.id_pedido = pedido.id_pedido
INNER JOIN produto
ON produto.id_produto = itemPedido.id_produto''', conn)

# agrupar por produto e calcular as quantidades vendidas
# def_grouped = df.groupby('nomeProduto')['quantidadeVendida'].sum()
# def_grouped = df.groupby('nome')['quantidadeVendida'].sum()
# def_grouped = df.groupby('nome')['valorTotal'].sum()
def_grouped = df.groupby('cidade')['tipoPagamento'].sum()

# Order produtos por quantidades vendidas e selecionar os 10 primeiros
produtos_top10 = df_grouped.sort_values(ascending=False).head(10)

# Ajustando o tamanho da figura
plt.figure(figsize=(15,15))

# Criar o gráfico de barras horizontal
plt.barh(produtos_top10.index, produtos_top10.values)
plt.xlabel('Quantidade Vendida')
plt.ylabel('Nome do Produto')
plt.title('10 Produtos com mais Vendas')
plt.gca().invert_yaxis() # inverter o eixo y oara mostrar o produtos com mais vendas no topo
plt.show()
