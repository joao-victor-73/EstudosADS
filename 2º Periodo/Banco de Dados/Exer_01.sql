/* < Primeira atividade para exercitar o conhecimento das aulas de MySQL de Banco de Dados. >

Neste exercício você irá criar uma base de dados, tabelas, realizar consultas e modificações e, em seguida, limpar o banco de dados.
*/

CREATE DATABASE exercicio_joao_victor;

USE exercicio_joao_victor;

CREATE TABLE dados_pessoais(
    id INT,
    nome VARCHAR(100) NOT NULL,
    idade VARCHAR(3),
    email VARCHAR(100) NOT NULL
);

ALTER TABLE dados_pessoais
CHANGE idade data_nascimento DATE;

ALTER TABLE dados_pessoais
ADD COLUMN altura FLOAT AFTER data_nascimento;

/*
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| id              | int          | YES  |     | NULL    |       |
| nome            | varchar(100) | NO   |     | NULL    |       |
| data_nascimento | date         | YES  |     | NULL    |       |
| altura          | float        | YES  |     | NULL    |       |
| email           | varchar(100) | NO   |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
*/

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


/* ALTERANDO O CAMPO ID*/
ALTER TABLE dados_pessoais
CHANGE COLUMN id id INT(3) NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (id)
AUTO_INCREMENT=01;


/* <FAZENDO AS CONSULTA> */
SELECT * FROM dados_pessoais;

SELECT nome, data_nascimento FROM dados_pessoais;
/*
+-----------------------+-----------------+
| nome                  | data_nascimento |
+-----------------------+-----------------+
| Paula Rodrigues       | 2000-09-08      |
| Rogrigues Souza       | 1999-08-07      |
| Fraciliano Pereira    | NULL            |
| Maria Conceicao       | 1980-04-28      |
| Kaio Henrique         | NULL            |
| Guilherme Vasconcelos | NULL            |
+-----------------------+-----------------+
*/


