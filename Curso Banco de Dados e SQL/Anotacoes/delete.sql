/*==========================================================================================
                                    CLÁUSULA DELETE          
  ==========================================================================================
  A cláusula DELETE é uma instrução SQL usada para remover uma ou mais linhas de uma tabela 
  em um banco de dados. Essa cláusula é usada quando você precisa remover registros 
  existentes de uma tabela, em vez de apenas recuperá-los ou atualizá-los.

  A cláusula DELETE é uma ferramenta poderosa para remover dados de uma tabela em um 
  banco de dados. 
  
  É importante usá-la com cuidado, especialmente quando não se usa uma cláusula WHERE, pois 
  ela pode excluir todos os registros na tabela. 
  
  Sempre verifique suas condições cuidadosamente para garantir que você esteja excluindo os 
  registros corretos e que as exclusões não causem perda de dados indesejada. 
  
  Além disso, lembre-se de que a operação de exclusão é irreversível, então faça backup dos 
  dados antes de executar uma instrução DELETE importante.

  SINTAXE BÁSICA:  
    DELETE FROM tabela
    WHERE condição;

  */

/* Inserindo um dado para apagar depois */
INSERT INTO clientes VALUES('Carla', 'F', 'C.Lopes@uol.com.br', 45638854, '4575-0048', 'Rua Copper Leaf - Kitchener');

/*  
DELETE FROM clientes
WHERE nome = 'Carla'

    - Se for mandado uma instrução assim, ele apagará 
    os dois registros 'Carla' da tabela.

    - Como resolver?                              */

DELETE FROM clientes
WHERE nome = 'Carla'
AND email = 'C.Lopes@uol.com.br';

/* O registro inserido anteriormente, está apagado.
+-----------+-----------------------+
| nome      | email                 |
+-----------+-----------------------+
| JOAO      | JOAO@GMAIL.COM        |
| CELIA     | CELIA@GMAIL.COM       |
| JORGE     | NULL                  |
| LILIAN    | NULL                  |
| ANA       | Ana32@gmail.com.br    |
| CARLA     | CARLA@TERATI.COM.BR   |
| Francisca | NULL                  |
| Livia     | livia4334@hotmail.com |
+-----------+-----------------------+
*/