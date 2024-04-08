-- Criar a base de dados
CREATE DATABASE atividade_join;
USE atividade_join;

-- Criação das tabelas
CREATE TABLE livros(
	idLivro	INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    autor VARCHAR(50),
    genero VARCHAR(20),
    anoPublicacao YEAR
);

CREATE TABLE clientes(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(30),
    endereco VARCHAR(30)
);

CREATE TABLE emprestimos(
	idEmprestimo INT PRIMARY KEY AUTO_INCREMENT,
    dataEmprestimo DATE,
    dataDevolucao DATE,
    fk_idLivro INT,
    fk_idCliente INT
);

-- Criar regra de chave estrangeira
ALTER TABLE emprestimos

ADD CONSTRAINT fk_emprestimos_livros
FOREIGN KEY (fk_idLivro)
REFERENCES livros(idLivro)
ON DELETE CASCADE
ON UPDATE CASCADE,

ADD CONSTRAINT fk_emprestimos_clientes
FOREIGN KEY (fk_idCliente)
REFERENCES clientes(idCliente)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Inserindo registros nas tabelas
INSERT INTO livros (titulo, autor, genero, anoPublicacao) VALUES    
    ('Dom Casmurro', 'Machado de Assis', 'Romance', '1901'),
    ('1984', 'George Orwell', 'Ficção Científica', '1949'),
    ('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Infantil', '1943'),
    ('A Revolução dos Bichos', 'George Orwell', 'Fábula', '1945'),
    ('Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 'Fantasia', '1997'),
    ('O Hobbit', 'J. R. R. Tolkien', 'Fantasia', '1937'),
    ('A Culpa é das Estrelas', 'John Green', 'Romance', '2012'),
    ('A Menina que Roubava Livros', 'Marcus Zusak', 'Romance', '2005');
    
INSERT INTO clientes (nome, email, endereco) VALUES
	('João Silva', 'joao@example.com', 'Rua A, 123'),
    ('Maria Souza', 'maria@example.com', 'Rua B, 456'),
    ('Pedro Santos', 'pedro@example.com', 'Rua C, 789'),
    ('Ana Oliveira', 'ana@example.com', 'Rua D, 987'),
    ('Carlos Ferreira', 'carlos@example.com', 'Rua E, 654'),
    ('Lúcia Lima', 'lucia@example.com', 'Rua F, 321'),
    ('Fernando Almeida', 'fernando@example.com', 'Rua G, 741'),
    ('Juliana Pereira', 'juliana@example.com', 'Rua H, 852');
    
INSERT INTO emprestimos (dataEmprestimo, dataDevolucao, fk_idLivro, fk_idCliente) VALUES
	('2023-02-10', '2023-02-20', 1, 5),
    ('2023-03-15', '2023-03-25', 3, 7),
    ('2023-04-20', '2023-05-01', 4, 6),
    ('2023-05-05', '2023-05-15', 8, 6),
    ('2023-06-10', '2023-06-20', 2, 1);

INSERT INTO emprestimos (dataEmprestimo, fk_idLivro, fk_idCliente) VALUES
	('2024-02-10', 1, 8);

-- 1.	Preciso saber quantos livros de cada gênero estão disponíveis.
SELECT genero, COUNT(genero) as 'Total'
FROM livros
	LEFT JOIN emprestimos
    ON fk_idlivro = idlivro
WHERE dataDevolucao IS NOT NULL
OR dataEmprestimo IS NULL
GROUP BY genero;

-- 2.	Quero saber quais são os livros publicados antes de 1950.
SELECT titulo, anoPublicacao
from livros
WHERE anoPublicacao < 1950;

-- 3.	Preciso saber todos os livros emprestados.
SELECT titulo, autor
FROM livros
	INNER JOIN emprestimos
    ON fk_idlivro = idlivro
WHERE dataDevolucao IS NULL;

-- 4.	Preciso saber quais livros foram emprestados e quem são os clientes que fizeram os empréstimos, ordenado pelo título do livro.
SELECT l.titulo, c.nome, e.dataEmprestimo
FROM livros l
	INNER JOIN emprestimos e
    ON e.fk_idLivro = l.idLivro
		INNER JOIN clientes c
        ON c.idCliente = e.fk_idCliente
ORDER BY l.titulo;

-- 5.	Quero saber quais livros foram emprestados e quem são os clientes que fizeram os empréstimos, com detalhes sobre os livros.
SELECT c.nome, l.*, e.dataEmprestimo
FROM livros l
	INNER JOIN emprestimos e
    ON e.fk_idLivro = l.idLivro
		INNER JOIN clientes c
        ON c.idCliente = e.fk_idCliente
ORDER BY l.titulo;

-- 6.	Quero saber todos os clientes, mesmo aqueles que não tem empréstimos.
SELECT nome, dataEmprestimo
FROM clientes
	LEFT JOIN emprestimos
    ON fk_idCliente = idCliente;
       
-- (Desafio: Usar uma função para determinar um valor (a sua escolha) para os clientes que não tiverem empréstimos.)
SELECT nome, ifnull(dataEmprestimo, 'Cliente sem empréstimo')  as 'Data_Empréstimo'
FROM clientes
	LEFT JOIN emprestimos
    ON fk_idCliente = idCliente;

-- 7.	Preciso saber quais são os livros disponíveis para empréstimo.
SELECT titulo, dataEmprestimo, dataDevolucao
FROM livros
	LEFT JOIN emprestimos
    ON fk_idlivro = idLivro
WHERE dataEmprestimo IS NULL
OR dataDevolucao IS NOT NULL;


