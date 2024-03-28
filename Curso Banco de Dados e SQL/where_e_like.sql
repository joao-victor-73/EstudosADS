/*==========================================================================================
                                    CLÁUSULA WHERE (filtro)                                  
  ==========================================================================================
  -> A cláusula WHERE é usada em consultas SQL para filtrar linhas com base em uma condição 
  especificada. Essa condição é avaliada para cada linha na tabela, e apenas as linhas que 
  atendem à condição são incluídas no resultado da consulta.
  
  Sintaxe básica:
  SELECT <coluna> 
  FROM <tabela>
  WHERE <condição>;
  */

SELECT nome, telefone FROM clientes
WHERE sexo = 'M';

/* RESULTADO DA CONSULTA COM FILTRO
+-------+----------+
| nome  | telefone |
+-------+----------+
| JOAO  | 22923110 |
| JORGE | 58748895 |
+-------+----------+
*/

SELECT nome, email, telefone FROM clientes
WHERE telefone > 25078869;

/* RESULTADO DA CONSULTA COM FILTRO
+--------+---------------------+-----------+
| nome   | email               | telefone  |
+--------+---------------------+-----------+
| JORGE  | NULL                | 58748895  |
| LILIAN | NULL                | 947785696 |
| ANA    | ANA@GLOBO.COM       | 548556985 |
| CARLA  | CARLA@TERATI.COM.BR | 66587458  |
+--------+---------------------+-----------+
*/

/*                              >>>>> UTILIZANDO O LIKE  <<<<<
    -> A cláusula LIKE é usada em consultas SQL para realizar correspondências de padrões
    em valores de texto. Ela é comumente usada em conjunto com a cláusula WHERE para filtrar 
    as linhas de uma tabela com base em padrões de texto específicos. 
    -> O LIKE permite que você busque por padrões, como uma parte específica de uma palavra, 
    uma palavra que comece ou termine com determinados caracteres, entre outros.

    SINTAXE BÁSICA:
    SELECT colunas
    FROM tabela
    WHERE coluna LIKE padrão;
*/

SELECT nome, email, endereco FROM clientes
WHERE endereco LIKE '%RJ';

/* RESULTADO DA CONSULTA COM LIKE
+--------+-----------------+-----------------------------------------------+
| nome   | email           | endereco                                      |
+--------+-----------------+-----------------------------------------------+
| JOAO   | JOAO@GMAIL.COM  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | CELIA@GMAIL.COM | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| LILIAN | NULL            | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
+--------+-----------------+-----------------------------------------------+
*/

SELECT nome, email FROM clientes
WHERE email LIKE '%gmail%';

/* RESULTADO DA CONSULTA COM LIKE de padrão específico em qualquer lugar
+-------+-----------------+
| nome  | email           |
+-------+-----------------+
| JOAO  | JOAO@GMAIL.COM  |
| CELIA | CELIA@GMAIL.COM |
+-------+-----------------+
*/