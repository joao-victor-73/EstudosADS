/* < Primeira atividade para exercitar o conhecimento das aulas de MySQL de Banco de Dados. >

Neste exercício você irá criar uma base de dados, tabelas, realizar consultas e modificações e, em seguida, limpar o banco de dados.
*/

CREATE DATABASE exercicio_joao_victor;

USE exercicio_joao_victor;

CREATE TABLE dados_pessoais (
    id INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    idade INT,
    email VARCHAR(50) NOT NULL
);

SHOW TABLES;

DESC dados_pessoais;

/*
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | NO   | PRI | NULL    |       |
| nome  | varchar(30) | NO   |     | NULL    |       |
| idade | int         | YES  |     | NULL    |       |
| email | varchar(50) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
*/

ALTER TABLE dados_pessoais
CHANGE idade data_nascimento DATE;

DESC dados_pessoais;

/* 
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| id              | int         | NO   | PRI | NULL    |       |
| nome            | varchar(30) | NO   |     | NULL    |       |
| data_nascimento | date        | YES  |     | NULL    |       |
| email           | varchar(50) | NO   |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
*/

ALTER TABLE dados_pessoais
ADD COLUMN altura FLOAT AFTER data_nascimento;

/*1º Método */
INSERT INTO dados_pessoais VALUES (01, 'Paula Rodrigues', '2000-09-08', 1.50, 'paula122@email.com');

INSERT INTO dados_pessoais VALUES (02, 'Rogrigues Souza', '1999-08-07', 1.80, 'rSouza@email.com');


/*2º Método */
INSERT INTO dados_pessoais (id, nome, data_nascimento, email) VALUES (03, 'Maria Conceicao', '1980-04-28', 'conMaria@email.com');

INSERT INTO dados_pessoais (id, nome, email) VALUES (04, 'Fraciliano Pereira', 'Pereira_Fra@email.com');

/*3º Método */
INSERT INTO dados_pessoais (id, nome, email) VALUES 
    (05, 'Kaio Henrique', 'henrique@email.com'),
    (06, 'Guilherme Vasconcelos', 'gui_gui@email.com');

/* Deixando a chave primaria como AUTO_INCREMENT*/
ALTER TABLE dados_pessoais
CHANGE COLUMN id id INT AUTO_INCREMENT;

/* <Adicionando registros na tabela> */
INSERT INTO dados_pessoais (nome, data_nascimento, altura, email) VALUES
    ('Henrique Souza', '2020-03-20', 1.58, 'souzinha@email.com'),
    ('Paola Castelino', '1980-07-20', 1.69, 'castel@email.com'),
    ('Rubson Joab', '1999-08-24', 1.80, 'joabbb@email.com'),
    ('Kallyane Silva', '2003-09-01', 1.55, 'kaka_silva@email.com'); 


/* <CONSULTA TRAZENDO TODOS OS REGISTROS> */
SELECT * FROM dados_pessoais;

/*
+----+-----------------------+-----------------+--------+-----------------------+
| id | nome                  | data_nascimento | altura | email
    |
+----+-----------------------+-----------------+--------+-----------------------+
|  1 | Paula Rodrigues       | 2000-09-08      |    1.5 | paula122@email.com    |
|  2 | Rogrigues Souza       | 1999-08-07      |    1.8 | rSouza@email.com      |
|  3 | Maria Conceicao       | 1980-04-28      |   NULL | conMaria@email.com    |
|  4 | Fraciliano Pereira    | NULL            |   NULL | Pereira_Fra@email.com |
|  5 | Kaio Henrique         | NULL            |   NULL | henrique@email.com    |
|  6 | Guilherme Vasconcelos | NULL            |   NULL | gui_gui@email.com     |
|  7 | Henrique Souza        | 2020-03-20      |   1.58 | souzinha@email.com    |
|  8 | Paola Castelino       | 1980-07-20      |   1.69 | castel@email.com      |
|  9 | Rubson Joab           | 1999-08-24      |    1.8 | joabbb@email.com      |
| 10 | Kallyane Silva        | 2003-09-01      |   1.55 | kaka_silva@email.com  |
+----+-----------------------+-----------------+--------+-----------------------+
*/

SELECT nome, data_nascimento FROM dados_pessoais;
/*
+-----------------------+-----------------+
| nome                  | data_nascimento |
+-----------------------+-----------------+
| Paula Rodrigues       | 2000-09-08      |
| Rogrigues Souza       | 1999-08-07      |
| Maria Conceicao       | 1980-04-28      |
| Fraciliano Pereira    | NULL            |
| Kaio Henrique         | NULL            |
| Guilherme Vasconcelos | NULL            |
| Henrique Souza        | 2020-03-20      |
| Paola Castelino       | 1980-07-20      |
| Rubson Joab           | 1999-08-24      |
| Kallyane Silva        | 2003-09-01      |
+-----------------------+-----------------+
*/

/* Trazendo a data no formato DD-MM-AAAA */
SELECT nome, DATE_FORMAT(data_nascimento, "%d/%m/%Y") FROM dados_pessoais;
/*
+-----------------------+------------------------------------------+
| nome                  | DATE_FORMAT(data_nascimento, "%d/%m/%Y") |
+-----------------------+------------------------------------------+
| Paula Rodrigues       | 08/09/2000                               |
| Rogrigues Souza       | 07/08/1999                               |
| Maria Conceicao       | 28/04/1980                               |
| Fraciliano Pereira    | NULL                                     |
| Kaio Henrique         | NULL                                     |
| Guilherme Vasconcelos | NULL                                     |
| Henrique Souza        | 20/03/2020                               |
| Paola Castelino       | 20/07/1980                               |
| Rubson Joab           | 24/08/1999                               |
| Kallyane Silva        | 01/09/2003                               |
+-----------------------+------------------------------------------+
*/

/*Atualizando registros*/
UPDATE dados_pessoais
SET data_nascimento = '1986-10-06'
WHERE id = 04;

UPDATE dados_pessoais
SET data_nascimento = '2002-09-09'
WHERE id = 05;

UPDATE dados_pessoais
SET data_nascimento = '2005-12-25'
WHERE id = 06;

UPDATE dados_pessoais
SET altura = 1.71
WHERE id = 03;

/*uma consulta que mostre apenas as atualizações realizadas*/
SELECT id, nome, data_nascimento, altura FROM dados_pessoais
WHERE id > 02 AND id < 07;
/* <Como eu sei quais os id foram alterados, posso usar operadores lógicos
    para especificar até onde quero ver o SELECT, mas preciso ver uma 
    maneira correta para fazer um SELECT especifico.> */


/* Fazendo uma consulta geral com a data formatada*/
SELECT *, DATE_FORMAT(data_nascimento, "%d/%m/%Y") FROM dados_pessoais;

/*
+----+-----------------------+-----------------+--------+-----------------------+------------------------------------------+
| id | nome                  | data_nascimento | altura | email                 | DATE_FORMAT(data_nascimento, "%d/%m/%Y") |
+----+-----------------------+-----------------+--------+-----------------------+------------------------------------------+
|  1 | Paula Rodrigues       | 2000-09-08      |    1.5 | paula122@email.com    | 08/09/2000
   |
|  2 | Rogrigues Souza       | 1999-08-07      |    1.8 | rSouza@email.com      | 07/08/1999
   |
|  3 | Maria Conceicao       | 1980-04-28      |   1.71 | conMaria@email.com    | 28/04/1980
   |
|  4 | Fraciliano Pereira    | 1986-10-06      |   NULL | Pereira_Fra@email.com | 06/10/1986
   |
|  5 | Kaio Henrique         | 2002-09-09      |   NULL | henrique@email.com    | 09/09/2002
   |
|  6 | Guilherme Vasconcelos | 2005-12-25      |   NULL | gui_gui@email.com     | 25/12/2005
   |
|  7 | Henrique Souza        | 2020-03-20      |   1.58 | souzinha@email.com    | 20/03/2020
   |
|  8 | Paola Castelino       | 1980-07-20      |   1.69 | castel@email.com      | 20/07/1980
   |
|  9 | Rubson Joab           | 1999-08-24      |    1.8 | joabbb@email.com      | 24/08/1999
   |
| 10 | Kallyane Silva        | 2003-09-01      |   1.55 | kaka_silva@email.com  | 01/09/2003
   |
+----+-----------------------+-----------------+--------+-----------------------+------------------------------------------+
*/

/* Apague 2 registros específicos da tabela. Apague os ids 3 e 13. */
DELETE FROM dados_pessoais WHERE id = 3;

SELECT * FROM dados_pessoais
WHERE id < 06;
/*
+----+-----------------------+-----------------+--------+-----------------------+
| id | nome                  | data_nascimento | altura | email                 |
+----+-----------------------+-----------------+--------+-----------------------+
|  1 | Paula Rodrigues       | 2000-09-08      |    1.5 | paula122@email.com    |
|  2 | Rogrigues Souza       | 1999-08-07      |    1.8 | rSouza@email.com      |
|  4 | Fraciliano Pereira    | 1986-10-06      |   NULL | Pereira_Fra@email.com |
|  5 | Kaio Henrique         | 2002-09-09      |   NULL | henrique@email.com    |
+----+-----------------------+-----------------+--------+-----------------------+
*/

