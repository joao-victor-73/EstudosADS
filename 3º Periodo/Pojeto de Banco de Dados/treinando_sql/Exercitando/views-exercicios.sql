-- 1. Crie uma View chamada vw_produtos_disponiveis que mostre o nomeProduto, 
-- marca, e preco de todos os produtos que estão em estoque 
-- (quantidade em_estoque maior que zero).

CREATE VIEW vw_produtos_disponiveis AS
	SELECT nomeProduto, marca, preco
	FROM produtos
	WHERE em_estoque > 0;
    
SELECT * FROM vw_produtos_disponiveis;


-- 2. Crie uma View chamada vw_pedidos_clientes que mostre o id_pedido, data_pedido, nomeCliente, email, e telefone.

CREATE VIEW vw_pedidos_clientes AS
	SELECT p.id_pedido, p.data_pedido, c.nomeCliente, c.email, c.telefone
	FROM pedidos p
	JOIN cliente c ON p.fk_idCliente = c.id_cliente;

SELECT * FROM vw_pedidos_clientes;