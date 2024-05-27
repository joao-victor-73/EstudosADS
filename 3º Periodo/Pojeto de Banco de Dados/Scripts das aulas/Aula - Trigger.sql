/* 
TRIGGER 

Uma trigger (gatilho) no MySQL é um conjunto de instruções que é automaticamente executado em resposta a determinados eventos em uma tabela. 
Esses eventos podem ser operações como INSERT, DELETE ou UPDATE de registros na tabela.
A trigger pode ser acionada antes de uma operação (BEFORE) ou depois (AFTER).

Antes de criar uma trigger devemos trocar o delimitador.

Sintaxe:

DELIMITER @
CREATE TRIGGER NOME_TRIGGER
BEFORE/AFTER INSERT/DELETE/UPDATE ON NOME_TABELA
FOR EACH ROW
BEGIN
	
    COMANDOS;

END @
DELIMITER ;
*/

-- Criar uma database para ser um backup da database 'biblioteca'
CREATE DATABASE bkp_biblioteca;
USE bkp_biblioteca;

-- Podemos criar tabelas a partir de outras já existentes através desse comando
CREATE TABLE bkp_leitor AS
SELECT * FROM biblioteca.leitor; -- necessário informar database.tabela, pois estamos em uma database diferente do local da tabela onde estamos recuperando as informações

SELECT * FROM bkp_leitor;

CREATE TABLE bkp_livros AS
SELECT * FROM biblioteca.livros;

SELECT * FROM bkp_livros;

-- Essas funções do SQL informam a data e hora atuais do sistema e o usuário, respectivamente
SELECT now(), current_user();

-- Alterando a estrutura da tabela bkp_livros
ALTER TABLE bkp_livros
ADD data_hora TIMESTAMP NOT NULL,
ADD usuario VARCHAR(100) NOT NULL,
ADD evento CHAR(1);

DESC bkp_livros;

-- Mudando a database
-- Para criarmos a trigger devemos criar na database da tabela que vai gerar o gatilho
USE biblioteca;

-- É necessário alterar o delimitador, pois precisamos usar o ';' dentro dos comandos da trigger
DELIMITER @

-- Criação da trigger
CREATE TRIGGER biblioteca_livros_d
BEFORE DELETE ON biblioteca.livros
FOR EACH ROW
BEGIN
	INSERT INTO bkp_biblioteca.bkp_livros VALUES
    (old.idLivro, old.titulo, old.autor, old.ano_publicacao, 
    now(), current_user(), 'D');
END @

-- Retornando ao delimitador padrão
DELIMITER ;

-- Consulta para verificar as tabelas antes da operação de DELETE
SELECT * FROM bkp_biblioteca.bkp_livros;
SELECT * FROM livros;

-- Apagando um registro de livro
DELETE FROM livros
WHERE idLivro = 103;

-- Conferindo se a informação foi deletada e se foi registrada na tabela de backup
SELECT * FROM livros;
SELECT * FROM bkp_biblioteca.bkp_livros;

-- Criar trigger para insert na tabela de livros
DELIMITER @
CREATE TRIGGER biblioteca_livro_i
AFTER INSERT ON biblioteca.livros
FOR EACH ROW
BEGIN
	INSERT INTO bkp_biblioteca.bkp_livros VALUES
    (new.idLivro, new.titulo, new.autor, new.ano_publicacao, now(), current_user(), 'I');
END @
DELIMITER ;

SELECT * FROM livros;
SELECT * FROM bkp_biblioteca.bkp_livros;

INSERT INTO livros VALUES (null, 'O Trono de Sombras', 'Breno Galante', 2023);

-- Criar trigger para update na tabela de livros
DELIMITER $$
CREATE TRIGGER biblioteca_livros_u
AFTER UPDATE ON biblioteca.livros
FOR EACH ROW
BEGIN
	INSERT INTO bkp_biblioteca.bkp_livros VALUES
    (old.idLivro, new.titulo, new.autor, new.ano_publicacao, now(), current_user(), 'U');
END $$
DELIMITER ;

SELECT * FROM livros;
SELECT * FROM bkp_biblioteca.bkp_livros;

UPDATE livros
SET ano_publicacao = 2024
WHERE idlivro = 105;