CREATE DATABASE lanchonete_pateta

USE lanchonete_pateta

-- CRIAÇÃO DA TABELA para armazenamento dos registros de pedidos
CREATE TABLE pedidos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2),
    quant INT,
    data_hora DATE
);


-- Inserindo alguns produtos 
INSERT INTO pedidos (nomeProduto, preco, quant, data_hora) VALUES 
('Hamburguer', 15.50, 10, '2024-06-01'),
('Pizza', 30.00, 5, '2024-06-02'),
('Coca-Cola', 5.00, 20, '2024-06-03'),
('Batata Frita', 8.50, 15, '2024-06-04'),
('Salada', 12.00, 8, '2024-06-05'),
('Sanduíche Natural', 10.00, 12, '2024-06-06'),
('Suco de Laranja', 7.50, 10, '2024-06-07'),
('Água Mineral', 3.00, 25, '2024-06-08'),
('Milkshake', 14.00, 7, '2024-06-09'),
('Sorvete', 9.00, 10, '2024-06-10');


SELECT * FROM pedidos;