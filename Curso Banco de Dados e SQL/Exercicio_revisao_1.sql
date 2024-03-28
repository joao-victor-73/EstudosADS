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