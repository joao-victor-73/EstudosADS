/*==========================================================================================
                                    O QUE É COUNT e GROUP BY?          
  ==========================================================================================
    
    <= COUNT =>
    A função COUNT é uma função de agregação em SQL que conta o número de linhas em um 
    conjunto de resultados que atende a uma determinada condição. 
    Essa função é frequentemente usada em consultas para determinar o número total de 
    registros em uma tabela ou o número de registros que satisfazem uma condição específica.

    SINTAXE BÁSICA:
        SELECT COUNT(coluna) 
        FROM tabela
        WHERE condição;

        Dentro dos parênteses do COUNT, se colocar um *, ele virá a soma de tudo.
    
    EXEMPLOS:
*/
-- Mostrar quantos registros da tabela
SELECT COUNT(*) FROM clientes;
/*          É possível alterar esse COUNT(*) apresentado na tabela com outro nome 
                                     utilizando o AS.
+----------+
| COUNT(*) |
+----------+
|        8 |
+----------+
*/

    /*
    <= GROUP BY =>
    A cláusula GROUP BY é usada em consultas SQL para agrupar linhas que têm os mesmos
    valores em uma ou mais colunas. Essa cláusula permite realizar operações de 
    agregação, como soma, contagem, média, etc., em grupos de linhas que compartilham 
    valores semelhantes em determinadas colunas.

    SINTAXE BÁSICA:
        SELECT coluna_agregada1, coluna_agregada2, ..., função_agregação(coluna)
        FROM tabela
        GROUP BY coluna1, coluna2, ...;

    */

SELECT sexo, COUNT(*) FROM clientes
GROUP BY sexo;

/*
+------+----------+
| sexo | COUNT(*) |
+------+----------+
| M    |        2 |
| F    |        6 |
+------+----------+
*/