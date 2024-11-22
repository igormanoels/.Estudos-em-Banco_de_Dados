-# COMANDOS PARA USAR NO MARIADB


- Exibe os bancos de dados existentes 

SHOW DATABASES; 

<br/>

- Exibe as tabelas dentro do banco de dados

USE DATABASE nome_do_banco;

SHOW TABLES;


CREATE USER 'pooUser'@'%' IDENTIFIED BY '123456'; -- CRIA UM NOVO USUARIO
GRANT ALL PRIVILEGES ON hospital.* TO 'pooUser'@'%'; -- DA PERMISSÃO
FLUSH PRIVILEGES;


- Para um banco local:
jdbc:mariadb://localhost:3306/hospital

- Para um servidor remoto:
jdbc:mariadb://'ip':3306/hospital

##
*Link da versão:* [MariaDB Server 10.5.27](https://mariadb.org/download/?t=mariadb&p=mariadb&r=10.5.27&os=windows&cpu=x86_64&pkg=msi&mirror=fder)
##
<img src="https://github.com/igormanoels/.Estudos-em-Banco_de_Dados/blob/main/SQL%20-%20MariaDB/Fatec%20Zona%20Leste/Disciplina%20de%20Programa%C3%A7%C3%A3o%20Orientada%20a%20Objetos/vFinal.png">
