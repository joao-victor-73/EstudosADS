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