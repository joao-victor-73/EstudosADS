/* 
Para o primeiro momento, vamos criar uma base de dados com a seguinte tabela:

clientes

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)


E para criar um banco de dados usamos o comando:
CREATE DATABASE <nome do banco de dados>; */

CREATE DATABASE clientes;

/*
O ; <ponto e virgula> é um ...
*/

/* Para visualizar os banco de dados já criados e novos: */
SHOW DATABASES;

/*Após criar um banco de dados, vamos começar a utiliza-lo*/
USE clientes;

/* Após dar um 'use' no BD, podemos criar nossas tabelas, editar, excluir e fazer outras coisas nas tabelas */
CREATE TABLE clientes(
    nome VARCHAR(30),
    sexo CHAR(1),
    email VARCHAR(30),
    cpf INT(11),
    telefone VARCHAR(30),
    endereco VARCHAR(100)
);

/* Vamos verificar a criação e a estrutura da tabela criada */
SHOW TABLES;
DESC clientes;

/*
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| nome     | varchar(30)  | YES  |     | NULL    |       |
| sexo     | char(1)      | YES  |     | NULL    |       |
| email    | varchar(30)  | YES  |     | NULL    |       |
| cpf      | int          | YES  |     | NULL    |       |
| telefone | varchar(30)  | YES  |     | NULL    |       |
| endereco | varchar(100) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+    
*/
