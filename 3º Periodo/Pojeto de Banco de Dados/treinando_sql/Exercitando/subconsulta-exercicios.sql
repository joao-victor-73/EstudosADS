-- 1. Escreva uma consulta que retorne todos os produtos cujo preço está acima do preço médio de todos os produtos.

SELECT nomeProduto, marca, preco, em_estoque FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos);


-- 2. Escreva uma consulta que retorne todos os clientes que não fizeram nenhum pedido.

SELECT * FROM cliente
WHERE id_cliente NOT IN (SELECT fk_idCliente FROM pedidos);
