/* OBS: Para o MySQL o comentario é feito através do # */

/* 
Para o primeiro momento, vamos criar uma base de dados com a seguinte tabela:

CLIENTE

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


/*==========================================================================================*/
/*                                      TIPOS DE DADOS                                      */
/*==========================================================================================*/

/* 
- Todos os bancos de dados possuem tipos que devem ser atribuidos aos dados de uma tabela;

    - Para caracteres literais, temos >CHAR< e >VARCHAR<;
    - Para números temos: >INT< e >FLOAT<;
    - Para objetos, como fotos e documentos, temos: >BLOB<;
    - Para textos extensos temos: >TEXT<;
    - 
- É interessante saber onde utilizar e em qual tipo de dado utilizar, pois assim pode deixar
o banco de dados mais rápido, fácil e dinâmico.
*/


/*==========================================================================================*/
/*                                      INSERÇÃO DE DADOS                                   */
/*==========================================================================================*/

/* Tem 3 maneiras comuns de se inserir dados dentro da tabela, são elas:  */

                                /* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

                                /* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

                                /* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);

