CREATE DATABASE lanchonete_pateta;

USE lanchonete_pateta;

CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nomeProduto VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL,
    quant INT NOT NULL,
    data DATE,
    hora TIME
);

/*
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| nomeProduto | varchar(100) | NO   |     | NULL    |                |
| preco       | float        | NO   |     | NULL    |                |
| quant       | int          | NO   |     | NULL    |                |
| data        | date         | YES  |     | NULL    |                |
| hora        | time         | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
*/