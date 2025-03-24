Adcionando o MySQL como variável de ambiente
windows + r e digitar sysdm.cpl --> ir até variáveis de ambiente --> adcionar ao path o caminho --> C:\Program Files\MySQL\MySQL Server 8.0\bin 


mysql --version                             -- No terminal exibe a versão do MySQL utilizado na máquina

mysql -u nomeUsuario -p                     -- No terminal dá acesso ao MySQL, a partir do usuário cadastrado ou do root

exit;                                       -- Fecha o terminal

SHOW DATABASES;                             -- Exibe todas as tabelas presentes no sistema.

SHOW TABLES;                                -- Exibe as tablelas presentes em um bd

SELECT user FROM mysql.user;                -- Retorna uma lista com os usuários do sistema.

