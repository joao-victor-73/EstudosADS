/*
Aula: Views

Uma view é uma consulta SQL armazenada que se comporta como uma tabela virtual. Ela não armazena dados em si, 
mas referencia dados de outras tabelas.

Vantagens:
- Simplifica consultas complexas
- Abstração dos dados
- Segurança dos dados

Sintaxe:
CREATE VIEW nome_da_view AS SELECT ... FROM ...;
*/

/* Criar uma view que traga todas as informações de clientes, livros, apenas dos que tem registros de emprestimos. */

-- Antes de criar a View é recomendado fazer antes o SELECT que será utilizado para a criação da view.
SELECT c.nome, 
	   c.email, 
       c.endereco, 
       l.titulo, 
       l.autor, 
       l.genero,
       l.anoPublicacao,
       e.dataEmprestimo,
       e.dataDevolucao
FROM clientes c
	INNER JOIN emprestimos e
    ON e.fk_idCliente = c.idCliente
		INNER JOIN livros l
        ON l.idLivro = e.fk_idLivro
ORDER BY l.titulo;

-- Como a view é uma tabela virtual, ela irá ser mostrada através do mesmo comando para visualizar as tabelas que existem no banco.
SHOW TABLES;

-- Para nomear uma view é recomendando colocar algo que a diferencie das tabelas do banco, como, por exemplo, 'v_'.
CREATE VIEW v_relatorio_geral AS
	SELECT c.nome, 
	   c.email, 
       c.endereco, 
       l.titulo, 
       l.autor, 
       l.genero,
       l.anoPublicacao,
       e.dataEmprestimo,
       e.dataDevolucao
	FROM clientes c
		INNER JOIN emprestimos e
		ON e.fk_idCliente = c.idCliente
			INNER JOIN livros l
			ON l.idLivro = e.fk_idLivro
	ORDER BY l.titulo;

-- A consulta na view é feita da mesma forma que em uma tabela.
SELECT *
FROM v_relatorio_geral;

SELECT nome, titulo, anopublicacao
FROM v_relatorio_geral
WHERE anopublicacao < 1950;

/* Criar uma view para um relatório geral que informe todos os clientes, mesmo aqueles que não realizaram empréstimos de 
livros.*/

-- 1. Faz o Select.
SELECT c.nome, 
	   c.email, 
       c.endereco, 
       ifnull(e.dataEmprestimo, 'Sem empréstimo') as 'Data Empréstimo',
       ifnull(e.dataDevolucao, 'Sem devolução') as 'Data Devolução'
FROM clientes c
	LEFT JOIN emprestimos e
    ON e.fk_idCliente = c.idCliente
ORDER BY c.nome;

-- 2. Cria a View.
CREATE VIEW v_relatorio_clientes AS
SELECT c.nome, 
	   c.email, 
       c.endereco, 
       ifnull(e.dataEmprestimo, 'Sem empréstimo') as 'Data Empréstimo',
       ifnull(e.dataDevolucao, 'Sem devolução') as 'Data Devolução'
FROM clientes c
	LEFT JOIN emprestimos e
    ON e.fk_idCliente = c.idCliente
ORDER BY c.nome;

SELECT * FROM v_relatorio_clientes;

-- Para alterar uma view usamos o comando: ALTER VIEW nome_da_view AS SELECT ...;
ALTER VIEW v_relatorio_clientes AS
SELECT c.nome, 
	   c.email, 
       c.endereco, 
       ifnull(l.titulo, 'Sem empréstimo') as 'Título',
       ifnull(e.dataEmprestimo, 'Sem empréstimo') as 'Data Empréstimo',
       ifnull(e.dataDevolucao, 'Sem devolução') as 'Data Devolução'
FROM clientes c
	LEFT JOIN emprestimos e
    ON e.fk_idCliente = c.idCliente
		LEFT JOIN livros l
        ON l.idLivro = e.fk_idLivro
ORDER BY c.nome;

-- Se desejar apagar uma view usa o comando DROP VIEW nome_da_view.

/* A partir dessa view criada, apresente apenas os clientes que realizaram empréstimos. */

/* Como na view foi utilizada alias para os campos que usaram a função ifnull, então temos que utilizar o alias entre
acento da crase para que no select ele seja entendido como um campo. */

SELECT nome, `Data Empréstimo`
FROM v_relatorio_clientes
WHERE `Data Empréstimo` != 'Sem empréstimo';

/* A partir da view criada, apresente apenas os clientes que ainda não devolveram os livros emprestados. */

SELECT nome, `Data Devolução`, `Data Empréstimo`
FROM v_relatorio_clientes
WHERE `Data Devolução` = 'Sem devolução'
AND `Data Empréstimo` != 'Sem empréstimo';

-- Crie uma view de relatório geral dos livros

SELECT *
FROM livros
ORDER BY titulo;

CREATE VIEW v_relatorio_livros AS
SELECT *
FROM livros
ORDER BY titulo;

SELECT * FROM v_relatorio_livros;

-- Em uma view que tem apenas uma tabela é possível fazer o INSERT através da view
INSERT INTO v_relatorio_livros VALUES
	(NULL, 'Livro BD', 'Autor X', 'Científico', '2024');
    
SELECT * FROM livros;

/* (Desafio) A partir da view dos livros, apresente os livros que foram publicados após a publicação de 'Dom Casmurro'. */

/* É necessário utilizar subconsulta. As subconsultas são consultas SQL aninhadas dentro de outras consultas. 
Elas podem ser utilizadas em cláusulas WHERE, FROM, UPDATE, SELECT para realizar operações complexas. */

SELECT titulo, anoPublicacao
FROM v_relatorio_livros
WHERE anoPublicacao > (SELECT anoPublicacao
						FROM livros
						WHERE titulo = 'Dom Casmurro')
ORDER BY anoPublicacao;