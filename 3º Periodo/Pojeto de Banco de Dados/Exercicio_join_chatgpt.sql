-- Exercicio feito com a Base de dados dado na Atividade_Join.sql

-- 1. Liste todos os livros emprestados, incluindo o nome do cliente que os pegou.
        -- Vou usar: titulo, nome do Cliente, data de emprestimo
SELECT c.nome, l.titulo, e.dataEmprestimo FROM livros l
    INNER JOIN emprestimos e
    ON e.fk_idLivro = l.idLivro
        INNER JOIN clientes c
        ON e.fk_idCliente = c.idCliente
ORDER BY c.nome;

/*
+------------------+-----------------------------+----------------+
| nome             | titulo                      | dataEmprestimo |
+------------------+-----------------------------+----------------+
| Carlos Ferreira  | Dom Casmurro                | 2023-02-10     |
| Fernando Almeida | O Pequeno Príncipe          | 2023-03-15     |
| João Silva       | 1984                        | 2023-06-10     |
| Juliana Pereira  | Dom Casmurro                | 2024-02-10     |
| Lúcia Lima       | A Revolução dos Bichos      | 2023-04-20     |
| Lúcia Lima       | A Menina que Roubava Livros | 2023-05-05     |
+------------------+-----------------------------+----------------+
*/



-- 2. Liste todos os clientes que têm livros emprestados.
-- Os clientes 'Maria Souza', 'Pedro Santos' e 'Ana Oliveira' não devem aparecer na consulta, pois não pegaram livros emprestados.

SELECT c.idCliente, c.nome, l.titulo, e.dataEmprestimo, e.dataDevolucao FROM clientes C
    INNER JOIN emprestimos e
    ON e.fk_idCliente = c.idCliente
        INNER JOIN livros l
        ON e.fk_idLivro = l.idLivro
ORDER BY c.idCliente;

/*
+-----------+------------------+-----------------------------+----------------+---------------+
| idCliente | nome             | titulo                      | dataEmprestimo | dataDevolucao |
+-----------+------------------+-----------------------------+----------------+---------------+
|         1 | João Silva       | 1984                        | 2023-06-10     | 2023-06-20    |
|         5 | Carlos Ferreira  | Dom Casmurro                | 2023-02-10     | 2023-02-20    |
|         6 | Lúcia Lima       | A Revolução dos Bichos      | 2023-04-20     | 2023-05-01    |
|         6 | Lúcia Lima       | A Menina que Roubava Livros | 2023-05-05     | 2023-05-15    |
|         7 | Fernando Almeida | O Pequeno Príncipe          | 2023-03-15     | 2023-03-25    |
|         8 | Juliana Pereira  | Dom Casmurro                | 2024-02-10     | NULL          |
+-----------+------------------+-----------------------------+----------------+---------------+
*/

-- 3. Liste todos os clientes que não têm livros emprestados.
SELECT c.idCliente, c.nome FROM clientes c
    LEFT JOIN emprestimos e 
    ON e.fk_idCliente = c.idCliente
WHERE e.idEmprestimo IS NULL
ORDER BY c.idCliente;


/*
Nesta consulta corrigida, utilizamos um LEFT JOIN entre as tabelas clientes e emprestimos para 
garantir que todos os clientes sejam incluídos, independentemente de terem registros 
correspondentes na tabela de empréstimos. 

Em seguida, verificamos se o idEmprestimo na tabela de empréstimos é nulo para 
identificar os clientes que não têm empréstimos.

+-----------+--------------+
| idCliente | nome         |
+-----------+--------------+
|         2 | Maria Souza  |
|         3 | Pedro Santos |
|         4 | Ana Oliveira |
+-----------+--------------+

*/


-- 4. Liste todos os livros que ainda não foram emprestados.




-- 5. Liste todos os empréstimos feitos por um cliente específico, incluindo detalhes do livro.

-- 6.  Liste todos os livros emprestados em ordem crescente de data de empréstimo.

-- 7. Liste todos os clientes e, para cada cliente, conte quantos livros ele pegou emprestado.

-- 8. Liste todos os gêneros de livros distintos disponíveis para empréstimo.

-- 9. Liste todos os clientes que têm livros emprestados e que residem em um determinado endereço.

-- 10. Liste todos os empréstimos feitos em um determinado período de tempo.