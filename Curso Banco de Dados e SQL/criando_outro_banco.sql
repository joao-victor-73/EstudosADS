CREATE DATABASE comercio;

USE comercio;

CREATE TABLE cliente(
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    email VARCHAR(50) UNIQUE,
    cpf VARCHAR(15) UNIQUE
);

CREATE TABLE endereco (
    idendereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    fk_idcliente INT UNIQUE, -- essa será a chave estrangeira
    -- Ela é UNIQUE por que, uma pessoa poderá apenas ter um endereço (relacionamento 1:1)

    FOREIGN KEY(fk_idcliente) REFERENCES cliente(idcliente) -- Essa é a regra para o registro da chave estrangeira    
);

CREATE TABLE telefone(
    idtelefone INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('RES', 'COM', 'CEL') NOT NULL, -- RES -> residencial , COM -> comercial, CEL -> celular
    numero VARCHAR(10) NOT NULL,
    fk_idcliente INT,

    FOREIGN KEY(fk_idcliente) REFERENCES cliente(idcliente)  -- Essa é a regra para o registro da chave estrangeira
);

/* INSERINDO VALORES NA TABELA >CLIENTE< */
INSERT INTO cliente(nome, sexo, email, cpf) VALUE
    ('João', 'M', 'joao@ig.com', '15815615715'),
    ('Carlos', 'M', 'carlos@ig.com', '74458898755'),
    ('Ana', 'F', 'Ana@ig.com', '51236698811'),
    ('Clara', 'F', NULL, '65932125588'),
    ('Jorge', 'M', 'jorgeif@gmail.com', '87445663222'),
    ('Celia', 'F', 'jcelia@gmail.com', '56695235711');


/*
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| idendereco   | int         | NO   | PRI | NULL    | auto_increment |
| rua          | varchar(30) | NO   |     | NULL    |                |
| bairro       | varchar(30) | NO   |     | NULL    |                |
| cidade       | varchar(30) | NO   |     | NULL    |                |
| estado       | char(2)     | NO   |     | NULL    |                |
| fk_idcliente | int         | YES  | UNI | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
*/


/* INSERINDO VALORES NA TABELA >ENDERECO< */
INSERT INTO endereco(rua, bairro, cidade, estado, fk_idcliente) VALUES
    ('Rua antonio SA', 'Centro', 'Belo Horizonte', 'MG', 4),
    ('Rua capitão hermes', 'Centro', 'Rio de Janeiro', 'RJ', 1),
    ('Rua Presidente Vargas', 'Jardins', 'São Paulo', 'SP', 3),
    ('Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ', 2),
    ('Rua do ouvidor', 'Flamengo', 'Rio de Janeiro', 'RJ', 6),
    ('Rua Uruguaiana', 'Centro', 'Vitoria', 'ES', 5);

/*
+------------+-----------------------+----------+----------------+--------+--------------+
| idendereco | rua                   | bairro   | cidade         | estado | fk_idcliente |
+------------+-----------------------+----------+----------------+--------+--------------+
|          7 | Rua antonio SA        | Centro   | Belo Horizonte | MG     |            4 |
|          8 | Rua capitão hermes    | Centro   | Rio de Janeiro | RJ     |            1 |
|          9 | Rua Presidente Vargas | Jardins  | São Paulo      | SP     |            3 |
|         10 | Rua Alfandega         | Estacio  | Rio de Janeiro | RJ     |            2 |
|         11 | Rua do ouvidor        | Flamengo | Rio de Janeiro | RJ     |            6 |
|         12 | Rua Uruguaiana        | Centro   | Vitoria        | ES     |            5 |
+------------+-----------------------+----------+----------------+--------+--------------+
*/


/* INSERINDO VALORES NA TABELA >TELEFONE< */
INSERT INTO telefone(tipo, numero, fk_idcliente) VALUES
    ('CEL', '849878445', 5),
    ('RES', '545151235', 5),
    ('CEL', '115464741', 1),
    ('COM', '156484231', 2),
    ('RES', '415165165', 1),
    ('CEL', '512651651', 3),
    ('CEL', '132065165', 2),
    ('COM', '165165189', 1),
    ('RES', '151618949', 3),
    ('RES', '879841213', 5),
    ('CEL', '632184987', 2);

/*
+------------+------+-----------+--------------+
| idtelefone | tipo | numero    | fk_idcliente |
+------------+------+-----------+--------------+
|          1 | CEL  | 849878445 |            5 |
|          2 | RES  | 545151235 |            5 |
|          3 | CEL  | 115464741 |            1 |
|          4 | COM  | 156484231 |            2 |
|          5 | RES  | 415165165 |            1 |
|          6 | CEL  | 512651651 |            3 |
|          7 | CEL  | 132065165 |            2 |
|          8 | COM  | 165165189 |            1 |
|          9 | RES  | 151618949 |            3 |
|         10 | RES  | 879841213 |            5 |
|         11 | CEL  | 632184987 |            2 |
+------------+------+-----------+--------------+
*/