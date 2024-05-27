/*
PROCEDURES 

As procedures são objetos do banco de dados que encapsulam uma ou mais instruções SQL em uma única unidade lógica.
Permitem a reutilização de código, simplificando operações comuns e complexas.
Podem aceitar parâmetros de entrada e retorno de valores, tornando-as flexíveis e dinâmicas.

Sintaxe:
DELIMITER @
CREATE PROCEDURE NOME_PROCEDURE(PARÂMETROS)
BEGIN
	COMANDOS;
END @
DELIMITER ;

Pode ter variáveis locais, utilizando o DECLARE
Os parâmetros podem ser de entrada (IN - padrão), saída (OUT) ou ambos (INOUT)
*/

-- Criar procedure para exibir uma mensagem
DELIMITER @
CREATE PROCEDURE ola_mundo()
BEGIN
	SELECT 'Hello, world!' as mensagem;
END @
DELIMITER ;

CALL ola_mundo();

DELIMITER @
CREATE PROCEDURE ola_mundo_personalizado(nome VARCHAR(100))
BEGIN
	SELECT concat(nome, ' Hello world!') as 'mensagem';
END @
DELIMITER ;

CALL ola_mundo_personalizado('Mariana');

DELIMITER @
CREATE PROCEDURE mensagem_personalizado(nome VARCHAR(100), idade INT)
BEGIN
	SELECT concat('Nome: ', nome, ' Idade: ', idade) as 'mensagem';
END @
DELIMITER ;

CALL mensagem_personalizado('Mariana', 25);

-- Criar procedure para trazer informação de um leitor


-- Procedure para trazer a relação dos livros que estão emprestados


-- Procedure para calcular a quantos anos o livro foi publicado
