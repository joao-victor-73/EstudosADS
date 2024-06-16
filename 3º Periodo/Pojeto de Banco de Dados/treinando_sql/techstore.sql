-- Projetinho para praticar os conceitos, comandos e etc em MYSQL 
/*
EMPRESA: TechStore
DESCRIÇÃO: A empresa vende produtos eletrônicos online e precisa de um banco de dados para gerenciar
			informações sobre produtos, clientes, pedidos, forncedores, etc...
*/

CREATE DATABASE bd_techstore;  -- Criando o banco de dados
USE bd_techstore;  -- Comando para usar o bando de dados



-- ========================================================================================
-- 									CRIANDO AS TABELAS
-- ========================================================================================

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
    fk_idCliente INT,
    data_pedido DATETIME
    
    /* Com a fk_idCLiente, todas essas informações abaixo é possivel de se adquirir
    rua_entrega VARCHAR(200),
    bairro_entrega VARCHAR(80),
    cidade_entrega VARCHAR(100),
    estado_entrega VARCHAR(80),
    cep_entrega VARCHAR(40) */
);

/*
-- DELETANDO ANTIGAS COLUNAS DA TABELA PEDIDOS
ALTER TABLE pedidos
DROP COLUMN rua_entrega,
DROP COLUMN bairro_entrega,
DROP COLUMN cidade_entrega,
DROP COLUMN estado_entrega,
DROP COLUMN cep_entrega;
*/
 
 
-- ========================================================================================
-- VENDO SE AS TABELAS ESTÃO CORRETAS

DESC produtos;
DESC cliente;
DESC fornecedor;
DESC pedidos;



-- ========================================================================================
-- 							COLOCANDO AS CONSTRAINT NAS F.K.
-- ========================================================================================

-- TABELA CLIENTE:
ALTER TABLE cliente
ADD CONSTRAINT fk_cliente_Pedido
FOREIGN KEY (fk_idPedido)
REFERENCES pedidos(id_pedido)
ON UPDATE CASCADE
ON DELETE CASCADE;


-- TABELA PRODUTOS:
ALTER TABLE produtos
ADD CONSTRAINT fk_produtos_fornecedor
FOREIGN KEY (fk_idFornecedor)
REFERENCES fornecedor(id_fornecedor)
ON UPDATE CASCADE
ON DELETE CASCADE; 


-- TABELA PEDIDOS
ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_cliente
FOREIGN KEY (fk_idCliente)
REFERENCES cliente(id_cliente)
ON UPDATE CASCADE
ON DELETE CASCADE,

ADD CONSTRAINT fk_pedidos_produto
FOREIGN KEY (fk_idProduto)
REFERENCES produtos(id_produto)
ON UPDATE CASCADE
ON DELETE CASCADE; 




-- ========================================================================================
-- 								INSERINDO REGISTROS NAS TABELAS
-- ========================================================================================
-- Foi utilizado uma biblioteca do python chamada FAKER, com ela, eu consegui adicionar X registros
-- dentro do banco de dados para as tabelas <cliente>, <fornecedor> e <produtos>.


-- ALTERANDO A TABELA DE FORNECEDORES para ajeitar o erro que foi causado com a inserção de dados da biblioteca FAKER
UPDATE fornecedor
SET nomeFornecedor = CASE
	WHEN id_fornecedor = 2 THEN 'Micro Center 2'
	WHEN id_fornecedor = 3 THEN 'Micro Center 3'
	WHEN id_fornecedor = 3 THEN 'Micro Center 3'
	WHEN id_fornecedor = 5 THEN 'Micro Center 4'
	WHEN id_fornecedor = 9 THEN 'Micro Center 5'
	WHEN id_fornecedor = 10 THEN 'Micro Center 6'
	WHEN id_fornecedor = 6 THEN 'Walmart 2'
	WHEN id_fornecedor = 8 THEN 'Walmart 3'
    ELSE nomeFornecedor
END
WHERE id_fornecedor IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);



-- PROJETANDO OS REGISTROS:
SELECT * FROM cliente;
SELECT * FROM produtos;
SELECT * FROM fornecedor;




-- TABELA PEDIDO
INSERT INTO pedidos (fk_idProduto, data_pedido, fk_idCliente) VALUES
(1, '2024-07-01 10:00:00', 2),
(2, '2024-07-01 11:30:00', 3),
(3, '2024-07-01 10:47:40', 4),
(4, '2024-07-01 15:44:12', 5),
(5, '2024-07-01 16:55:59', 6),
(6, '2024-08-01 08:41:44', 7),
(7, '2024-08-01 09:00:44', 8),
(8, '2024-08-01 10:11:10', 9),
(9, '2024-08-01 10:11:55', 10),
(10, '2024-08-01 15:55:01', 11);

SELECT * FROM pedidos;


-- ========================================================================================
-- 							ADICIONANDO VALORES PARA AS FOREIGN KEY
-- ========================================================================================

-- >CLIENTE<
UPDATE cliente
SET fk_idPedido = CASE
    WHEN id_cliente = 2 THEN 1
    WHEN id_cliente = 3 THEN 2
    WHEN id_cliente = 4 THEN 3
    WHEN id_cliente = 5 THEN 4
    WHEN id_cliente = 6 THEN 5
    WHEN id_cliente = 7 THEN 6
    WHEN id_cliente = 8 THEN 7
    WHEN id_cliente = 9 THEN 8
    WHEN id_cliente = 10 THEN 9 
    WHEN id_cliente = 11 THEN 10
    ELSE fk_idPedido
END
WHERE id_cliente IN (2, 3, 4, 5, 6, 7, 8, 9, 10, 11);

-- ========================================================================================

-- > PRODUTOS <
UPDATE produtos
SET fk_idFornecedor = CASE
	WHEN id_produto = 1 THEN 2
	WHEN id_produto = 2 THEN 5
	WHEN id_produto = 3 THEN 4
	WHEN id_produto = 4 THEN 3
	WHEN id_produto = 5 THEN 6
	WHEN id_produto = 6 THEN 9
	WHEN id_produto = 7 THEN 7
	WHEN id_produto = 8 THEN 10
	WHEN id_produto = 9 THEN 8
	WHEN id_produto = 10 THEN 1
    ELSE fk_idFornecedor
END
WHERE id_produto IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

-- ========================================================================================
select * from cliente;
select * from produtos;
select * from fornecedor;
-- ========================================================================================




/*
-- OUTRAS COISAS
DELETE FROM cliente WHERE id_cliente > 10;
DELETE FROM produtos WHERE id_produto > 10;
DELETE FROM fornecedor where id_fornecedor > 0;


ALTER TABLE cliente auto_increment = 0;
ALTER TABLE produtos auto_increment = 0;
ALTER TABLE fornecedor auto_increment = 0;
*/