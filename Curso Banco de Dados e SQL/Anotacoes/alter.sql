/*==========================================================================================
                                        ALTER TABLE 
  ==========================================================================================

  
O comando ALTER TABLE é usado em SQL para fazer alterações na estrutura de uma tabela 
existente em um banco de dados. 
Ele permite adicionar, modificar ou excluir colunas, índices e restrições em uma 
tabela já existente.

    >>> ADICIONAR UMA NOVA COLUNA: 
        Você pode usar ALTER TABLE para adicionar uma nova coluna a uma tabela existente.

        ALTER TABLE nome_da_tabela
        ADD nome_da_coluna tipo_de_dado;
        ---------------------------------------------------------------------------------

        A posição das colunas em uma tabela é geralmente determinada pelo banco de dados 
        e não é considerada uma propriedade fixa. 
        
        No entanto, você pode definir a posição relativa da nova coluna em relação às 
        colunas existentes usando a cláusula AFTER ou FIRST, dependendo do SGBD que 
        está utilizando.

        USANDO AFTER:
            Você pode usar a cláusula AFTER para especificar que a nova coluna deve 
            ser adicionada após uma coluna específica existente.

            ALTER TABLE nome_da_tabela
            ADD nome_da_coluna tipo_de_dado AFTER nome_da_coluna_anterior;


        USANDO FIRST:
            Você pode usar a cláusula FIRST para especificar que a nova coluna deve 
            ser adicionada como a primeira coluna na tabela.

            ALTER TABLE nome_da_tabela
            ADD nome_da_coluna tipo_de_dado FIRST;
        ---------------------------------------------------------------------------------


    >>> MODIFICAR UMA COLUNA EXISTENTE:
        Você pode alterar a definição de uma coluna existente, como seu tipo de dado ou 
        suas restrições.

        ALTER TABLE nome_da_tabela
        MODIFY nome_da_coluna novo_tipo_de_dado;
        ---------------------------------------------------------------------------------

        Também dá para utilizar o CHANGE no lugar de MODIFY.

        O CHANGE é usado para renomear uma coluna e/ou modificar seu tipo de dado ou 
        suas restrições em uma tabela existente. 
        
        Em alguns sistemas de gerenciamento de banco de dados (SGBDs), como MySQL, o 
        CHANGE pode ser usado para alcançar o mesmo resultado que o MODIFY, além de 
        permitir a alteração do nome da coluna simultaneamente.

        ALTER TABLE nome_da_tabela
        CHANGE nome_antigo nome_novo tipo_de_dado;
        ---------------------------------------------------------------------------------

        A dica é:
            -> Quando quiser trabalhar com mudanças no nome de uma coluna, utilizar o CHANGE;
            -> Quando quiser traballhar para mudar o tipo do dado, utilizar o MODIFY.
        ---------------------------------------------------------------------------------


    >>> RENOMEAR UMA COLUNA:
        Você pode usar ALTER TABLE para renomear uma coluna em uma tabela existente.

        ALTER TABLE nome_da_tabela
        RENAME COLUMN nome_antigo TO nome_novo;
        ---------------------------------------------------------------------------------


    >>> EXCLUIR UMA COLUNA:
        Você pode remover uma coluna de uma tabela existente usando ALTER TABLE.

        ALTER TABLE nome_da_tabela
        DROP COLUMN nome_da_coluna;
        ---------------------------------------------------------------------------------


    >>> ADICIONAR OU REMOVER RESTRIÇÕES:
        Você pode adicionar ou remover restrições, como 
            chaves primárias, 
            chaves estrangeiras ou 
            restrições de verificação, 
        usando ALTER TABLE.

        ALTER TABLE nome_da_tabela
        ADD CONSTRAINT nome_da_restricao tipo_de_restricao (coluna)

        ALTER TABLE nome_da_tabela
        DROP CONSTRAINT nome_da_restricao;
        ---------------------------------------------------------------------------------
 
Esses são apenas alguns exemplos de como você pode usar o comando ALTER TABLE para 
modificar a estrutura de uma tabela existente em um banco de dados. 

O ALTER TABLE oferece flexibilidade para fazer ajustes na estrutura do banco de 
dados conforme necessário, sem precisar recriar a tabela inteira.

*/

