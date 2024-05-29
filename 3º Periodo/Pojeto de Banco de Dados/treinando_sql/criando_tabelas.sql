-- Projetinho para praticar os conceitos, comandos e etc em MYSQL 
/*
EMPRESA: TechStore
DESCRIÇÃO: A empresa vende produtos eletrônicos online e precisa de um banco de dados para gerenciar
			informações sobre produtos, clientes, pedidos, forncedores, etc...
*/

CREATE DATABASE bd_techstore;
USE bd_techstore;


-- CRIANDO AS TABELAS


CREATE TABLE produtos (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    fk_idFornecedor INT,
    nomeProduto VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10, 2) NOT NULL,
    em_estoque INT NOT NULL
);


CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    fk_idPedido INT,
    nomeCliente VARCHAR(100) NOT NULL,
    rua VARCHAR(200),
    bairro VARCHAR(100),
    cidade VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(100),
    CEP VARCHAR(100)
);


CREATE TABLE fornecedor (
	id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nomeFornecedor VARCHAR(150),
	rua VARCHAR(200),
    bairro VARCHAR(100),
    cidade VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(100),
    CEP VARCHAR(100)
);


CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT, 
    fk_idProduto INT,
    data_pedido DATETIME,
    rua_entrega VARCHAR(200),
    bairro_entrega VARCHAR(80),
    cidade_entrega VARCHAR(100),
    estado_entrega VARCHAR(80),
    cep_entrega VARCHAR(40)
);


DESC produtos;
DESC cliente;
DESC fornecedor;
DESC pedidos;



-- ========================================================================================