-- 1.    Escreva uma consulta que retorne o `nomeProduto`, `marca`, `preço` e o `nomeFornecedor` para todos os produtos.

DESC produtos;
DESC fornecedor;


SELECT produtos.nomeProduto, produtos.marca, produtos.preco, fornecedor.nomeFornecedor 
FROM produtos
	INNER JOIN fornecedor
	ON produtos.fk_idFornecedor = id_fornecedor;
    
    
-- 2.  Escreva uma consulta que retorne o `id_pedido`, `data_pedido`, `nomeCliente`, `nomeProduto` e `preco`.

DESC pedidos;
DESC cliente;
DESC produtos;

SELECT pedidos.id_pedido, pedidos.data_pedido, cliente.nomeCliente, produtos.nomeProduto, produtos.preco
FROM pedidos
	INNER JOIN cliente
    ON pedidos.fk_idCliente = cliente.id_cliente
		INNER JOIN produtos
		ON pedidos.fk_idProduto = produtos.id_produto;
        

-- 3. Escreva uma consulta que retorne o `nomeProduto` e o número de vezes que cada produto foi pedido. 
-- 	  Ordene pelo número de pedidos em ordem decrescente.

DESC produtos;
DESC pedidos;

SELECT produtos.nomeProduto, COUNT(pedidos.id_pedido) AS Numero_De_Pedidos
FROM produtos
	LEFT JOIN pedidos
    ON produtos.id_produto = pedidos.fk_idProduto
GROUP BY produtos.nomeProduto
ORDER BY Numero_De_Pedidos DESC;


-- 4. Escreva uma consulta que retorne o `nomeCliente`, `email` e `data_pedido` para todos os 
-- clientes, incluindo aqueles que não fizeram pedidos

DESC cliente;
DESC pedidos;

SELECT cliente.nomeCliente, cliente.email, pedidos.data_pedido
FROM cliente
	LEFT JOIN pedidos
    ON cliente.id_cliente = pedidos.fk_idCliente;