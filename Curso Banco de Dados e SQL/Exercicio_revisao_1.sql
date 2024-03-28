SHOW DATABASES;

CREATE DATABASE livraria;

USE livraria;

CREATE TABLE livros (
    titulo VARCHAR(100),
    autor VARCHAR(50),
    sexo CHAR(1),
    num_paginas INT,
    editora VARCHAR(100),
    uf_editora CHAR(2),
    valor FLOAT,   
    ano_publicacao CHAR(4)
);

STATUS; -- Mostra em qual DataBase está conectado.

INSERT INTO livros VALUES
    ('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 'RJ', 49.9, '2009')
;

INSERT INTO livros VALUES
    ('SQL para leigos', 'João Nunes', 'M', 450, 'Addison', 'SP', 98, '2018'),
    ('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 'RJ', 45, '2008'),
    ('Pessoas Efetivas', 'Eduardo Santos', 'M', 390,'Beta', 'RJ', 78.99, '2018'),
    ('Habitos Saudaveis', 'Eduardo Santos', 'M', 630, 'Beta', 'RJ', 150.98, '2019'),
    ('A Casa Marrom', 'Hermes Macedo', 'M', 250, ' Bubba', 'MG', 60, '2016')
    ('Estacio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 'ES', 100, '2015'),
    ('Pra sempre amigas', 'Leda Silva', 'F', 510, 'Insignia', 'ES', 78.98, '2011'),
    ('Copas Inesquecíveis', 'Marco Alcantara', 'M', 200, 'Larson', 'RS', 130.98, '2018'),
    ('O Poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 'RS', 56.58, '2017')
;


                                            -- TRABALHANDO COM SELECT

-- 1 – Trazer todos os dados.
SELECT * FROM livros;

/*
+----------------------+-------------------+------+-------------+-------------+------------+--------+----------------+
| titulo               | autor             | sexo | num_paginas | editora     | uf_editora | valor  | ano_publicacao |
+----------------------+-------------------+------+-------------+-------------+------------+--------+----------------+
| Cavaleiro Real       | Ana Claudia       | F    |         465 | Atlas       | RJ         |   49.9 | 2009           |
| SQL para leigos      | João Nunes        | M    |         450 | Addison     | SP         |     98 | 2018           |
| Receitas Caseiras    | Celia Tavares     | F    |         210 | Atlas       | RJ         |     45 | 2008           |
| Pessoas Efetivas     | Eduardo Santos    | M    |         390 | Beta        | RJ         |  78.99 | 2018           |
| Habitos Saudaveis    | Eduardo Santos    | M    |         630 | Beta        | RJ         | 150.98 | 2019           |
| A Casa Marrom        | Hermes Macedo     | M    |         250 |  Bubba      | MG         |     60 | 2016           |
| Estacio Querido      | Geraldo Francisco | M    |         310 | Insignia    | ES         |    100 | 2015           |
| Pra sempre amigas    | Leda Silva        | F    |         510 | Insignia    | ES         |  78.98 | 2011           |
| Copas Inesquecíveis  | Marco Alcantara   | M    |         200 | Larson      | RS         | 130.98 | 2018           |
| O Poder da mente     | Clara Mafra       | F    |         120 | Continental | RS         |  56.58 | 2017           |
+----------------------+-------------------+------+-------------+-------------+------------+--------+----------------+
*/



-- 2 – Trazer o nome do livro e o nome da editora
SELECT titulo, editora FROM livros;
/*
+----------------------+-------------+
| titulo               | editora     |
+----------------------+-------------+
| Cavaleiro Real       | Atlas       |
| SQL para leigos      | Addison     |
| Receitas Caseiras    | Atlas       |
| Pessoas Efetivas     | Beta        |
| Habitos Saudaveis    | Beta        |
| A Casa Marrom        |  Bubba      |
| Estacio Querido      | Insignia    |
| Pra sempre amigas    | Insignia    |
| Copas Inesquecíveis  | Larson      |
| O Poder da mente     | Continental |
+----------------------+-------------+
*/



-- 3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.
SELECT titulo, uf_editora FROM livros
WHERE sexo = 'M';

/*
+----------------------+------------+
| titulo               | uf_editora |
+----------------------+------------+
| SQL para leigos      | SP         |
| Pessoas Efetivas     | RJ         |
| Habitos Saudaveis    | RJ         |
| A Casa Marrom        | MG         |
| Estacio Querido      | ES         |
| Copas Inesquecíveis  | RS         |
+----------------------+------------+
*/


-- 4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.
SELECT titulo, num_paginas FROM livros
WHERE sexo = 'F';

/*
+-------------------+-------------+
| titulo            | num_paginas |
+-------------------+-------------+
| Cavaleiro Real    |         465 |
| Receitas Caseiras |         210 |
| Pra sempre amigas |         510 |
| O Poder da mente  |         120 |
+-------------------+-------------+
*/


-- 5 – Trazer os valores dos livros das editoras de São Paulo.
SELECT titulo, autor, editora FROM livros
WHERE uf_editora = 'SP';

/*
+-----------------+-------------+---------+
| titulo          | autor       | editora |
+-----------------+-------------+---------+
| SQL para leigos | João Nunes  | Addison |
+-----------------+-------------+---------+
*/



-- 6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).
