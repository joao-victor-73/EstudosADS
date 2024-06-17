-- 1. Crie um Trigger chamado trg_atualiza_estoque que, após a inserção de 
-- um pedido, diminua a quantidade em_estoque do produto correspondente.

DELIMITER @
CREATE TRIGGER trg_atualiza_estoque
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
   UPDATE produtos
   SET em_estoque = em_estoque - 1
   WHERE id_produto = NEW.fk_idProduto;
END@
DELIMITER ;


-- 							TESTANDO TRIGGER

-- Atualizando o estoque de um produto para zero
UPDATE produtos
SET em_estoque = 0
WHERE id_produto = 1;

-- Tentando inserir um pedido para o produto com estoque zero
INSERT INTO pedidos (fk_idProduto, fk_idCliente, data_pedido)
VALUES (1, 2, '2024-07-02 10:00:00');

-- Reinserir o Estoque para Testes Futuros
UPDATE produtos
SET em_estoque = 10
WHERE id_produto = 1;



-- 2. Crie um Trigger chamado trg_prevent_estoque_negativo que impeça
-- a inserção de um pedido se a quantidade em_estoque do produto for zero ou menor.

DELIMITER @
CREATE TRIGGER trg_prevent_estoque_negativo
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
   DECLARE em_estoque INT;
   SELECT em_estoque INTO em_estoque FROM produtos WHERE id_produto = NEW.fk_idProduto;
   IF em_estoque <= 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Não é possível fazer o pedido. Produto fora de estoque.';
   END IF;
END@
DELIMITER ;