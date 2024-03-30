/*==========================================================================================
                                    CLÁUSULA UPDATE          
  ==========================================================================================
- A cláusula UPDATE é uma instrução SQL usada para modificar os valores existentes em uma 
ou mais colunas de uma ou várias linhas em uma tabela. Essa cláusula é usada quando você 
precisa atualizar registros existentes em vez de apenas recuperá-los.

- A cláusula UPDATE é uma ferramenta poderosa para modificar dados em um banco de dados e 
é comumente usada em combinação com a cláusula WHERE para atualizar apenas os registros 
específicos que atendem a determinados critérios. 

    SINTAXE BÁSICA:
        UPDATE tabela
        SET coluna1 = valor1, coluna2 = valor2, ...
        WHERE condição;
*/

/*
+-----------+---------------------+
| nome      | email               |
+-----------+---------------------+
| ANA       | ANA@GLOBO.COM       |
+-----------+---------------------+
*/

UPDATE clientes
SET email = 'Ana32@gmail.com.br'
WHERE nome = 'Ana';

SELECT nome, email FROM clientes;

/*
+-----------+---------------------+
| nome      | email               |
+-----------+---------------------+
| ANA       | Ana32@gmail.com.br  |
+-----------+---------------------+
*/

/* ATUALIZANDO VÁRIAS COLUNAS: */
UPDATE clientes
SET email = 'livia4334@hotmail.com', cpf = '11223344'
WHERE nome = 'Livia';

SELECT nome, email, cpf FROM clientes
WHERE nome = 'Livia';
/* Antes Livia tinha EMAIL E CPF como Nulos:
+-------+-----------------------+----------+
| nome  | email                 | cpf      |
+-------+-----------------------+----------+
| Livia | livia4334@hotmail.com | 11223344 |
+-------+-----------------------+----------+
*/