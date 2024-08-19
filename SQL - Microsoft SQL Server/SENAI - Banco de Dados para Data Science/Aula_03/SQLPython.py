import os
import pyodbc 

#pip install odbc para instalar a biblioteca de conexão com o BD
os.system('cls')
server = 'LABC10-NOTE04'
database = 'e_commerce'

#QUANDO OUVER COLOCAR ---> 'UID=usuário;' 'PWD=senha')
conn = pyodbc.connect('DRIVER={SQL Server};SERVER='+server+';DATABASE='+database)


# Criando o cursor para executar a pesquisa dentro do banco de dados
cursor = conn.cursor()

# execução da query de cosulta no SQL Server
cursor.execute('''
               SELECT 
               fornecedor.cnpj, fornecedor.nomeFornecedor, produto.nomeProduto, produto.custo 
               FROM fornecedor INNER JOIN produto 
               ON fornecedor.id_fornecedor = produto.id_fornecedor
               ''')
 #Obtendo resultados da consulta
resultados = cursor.fetchall()

#imprimindo resultado na tela
for linha in resultados:
    cnpj, nome_fornecedor, nome_produto, custo = linha
    print(f'CNPJ: {cnpj} \n NOME FORNECEDOR: {nome_fornecedor} \n NOME PRODUTO: {nome_produto} \n CUSTO: {custo}')
    print('----------------------------------------------------------------------------------')

#Fechamento do cursos e da conexão
cursor.close()
conn.close()