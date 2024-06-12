-- INSERÇÃO DE DADOS NA TABELA pedidos

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



-- ========================================================================================

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


-- ========================================================================================

-- PROJETANDO OS REGISTROS:
SELECT * FROM cliente;
SELECT * FROM produtos;
SELECT * FROM fornecedor;