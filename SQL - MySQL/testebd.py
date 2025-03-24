import mysql.connector
from mysql.connector import Error

def test_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost', 
            database='mydb',  
            user='root',       
            password='123456'  
        )

        if connection.is_connected():
            print('Conexão bem-sucedida ao MySQL!')
            db_info = connection.get_server_info()
            print('Versão do MySQL:', db_info)

    except Error as e:
        print(f'Erro ao conectar ao MySQL: {e}')
    
    finally:
        if connection.is_connected():
            connection.close()
            print('Conexão encerrada.')

test_connection()
