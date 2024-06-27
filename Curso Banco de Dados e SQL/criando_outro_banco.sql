CREATE DATABASE comercio;

USE comercio;

CREATE TABLE cliente(
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    email VARCHAR(50) UNIQUE,
    cpf VARCHAR(15) UNIQUE
);

CREATE TABLE endereco (
    idendereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    fk_idcliente INT UNIQUE, -- essa será a chave estrangeira
    -- Ela é UNIQUE por que, uma pessoa poderá apenas ter um endereço (relacionamento 1:1)

    FOREIGN KEY(fk_idcliente) REFERENCES cliente(idcliente) -- Essa é a regra para o registro da chave estrangeira    
);

CREATE TABLE telefone(
    idtelefone INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('RES', 'COM', 'CEL') NOT NULL, -- RES -> residencial , COM -> comercial, CEL -> celular
    numero VARCHAR(10) NOT NULL,
    fk_idcliente INT,

    FOREIGN KEY(fk_idcliente) REFERENCES cliente(idcliente)  -- Essa é a regra para o registro da chave estrangeira
);

/* INSERINDO VALORES NA TABELA >CLIENTE< */
INSERT INTO cliente(nome, sexo, email, cpf) VALUE
    ('João', 'M', 'joao@ig.com', '15815615715'),
    ('Carlos', 'M', 'carlos@ig.com', '74458898755'),
    ('Ana', 'F', 'Ana@ig.com', '51236698811'),
    ('Clara', 'F', NULL, '65932125588'),
    ('Jorge', 'M', 'jorgeif@gmail.com', '87445663222'),
    ('Celia', 'F', 'jcelia@gmail.com', '56695235711');


/*
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| idendereco   | int         | NO   | PRI | NULL    | auto_increment |
| rua          | varchar(30) | NO   |     | NULL    |                |
| bairro       | varchar(30) | NO   |     | NULL    |                |
| cidade       | varchar(30) | NO   |     | NULL    |                |
| estado       | char(2)     | NO   |     | NULL    |                |
| fk_idcliente | int         | YES  | UNI | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
*/


/* INSERINDO VALORES NA TABELA >ENDERECO< */
INSERT INTO endereco(rua, bairro, cidade, estado, fk_idcliente) VALUES
    ('Rua antonio SA', 'Centro', 'Belo Horizonte', 'MG', 4),
    ('Rua capitão hermes', 'Centro', 'Rio de Janeiro', 'RJ', 1),
    ('Rua Presidente Vargas', 'Jardins', 'São Paulo', 'SP', 3),
    ('Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ', 2),
    ('Rua do ouvidor', 'Flamengo', 'Rio de Janeiro', 'RJ', 6),
    ('Rua Uruguaiana', 'Centro', 'Vitoria', 'ES', 5);

/*
+------------+-----------------------+----------+----------------+--------+--------------+
| idendereco | rua                   | bairro   | cidade         | estado | fk_idcliente |
+------------+-----------------------+----------+----------------+--------+--------------+
|          7 | Rua antonio SA        | Centro   | Belo Horizonte | MG     |            4 |
|          8 | Rua capitão hermes    | Centro   | Rio de Janeiro | RJ     |            1 |
|          9 | Rua Presidente Vargas | Jardins  | São Paulo      | SP     |            3 |
|         10 | Rua Alfandega         | Estacio  | Rio de Janeiro | RJ     |            2 |
|         11 | Rua do ouvidor        | Flamengo | Rio de Janeiro | RJ     |            6 |
|         12 | Rua Uruguaiana        | Centro   | Vitoria        | ES     |            5 |
+------------+-----------------------+----------+----------------+--------+--------------+
*/


/* INSERINDO VALORES NA TABELA >TELEFONE< */
INSERT INTO telefone(tipo, numero, fk_idcliente) VALUES
    ('CEL', '849878445', 5),
    ('RES', '545151235', 5),
    ('CEL', '115464741', 1),
    ('COM', '156484231', 2),
    ('RES', '415165165', 1),
    ('CEL', '512651651', 3),
    ('CEL', '132065165', 2),
    ('COM', '165165189', 1),
    ('RES', '151618949', 3),
    ('RES', '879841213', 5),
    ('CEL', '632184987', 2);

/*
+------------+------+-----------+--------------+
| idtelefone | tipo | numero    | fk_idcliente |
+------------+------+-----------+--------------+
|          1 | CEL  | 849878445 |            5 |
|          2 | RES  | 545151235 |            5 |
|          3 | CEL  | 115464741 |            1 |
|          4 | COM  | 156484231 |            2 |
|          5 | RES  | 415165165 |            1 |
|          6 | CEL  | 512651651 |            3 |
|          7 | CEL  | 132065165 |            2 |
|          8 | COM  | 165165189 |            1 |
|          9 | RES  | 151618949 |            3 |
|         10 | RES  | 879841213 |            5 |
|         11 | CEL  | 632184987 |            2 |
+------------+------+-----------+--------------+
*/




/*==========================================================================================
                          DIFERENÇA ENTRE SELEÇÃO, PROJEÇÃO E JUNÇÃO
  ==========================================================================================

"Seleção", "projeção" e "junção" são termos frequentemente usados em bancos de dados e 
consultas SQL para descrever operações específicas que podem ser realizadas em conjuntos 
de dados. Aqui está a diferença entre eles:

    1. **Seleção (Selection)**:
        - A seleção é uma operação que filtra as linhas de uma tabela com base em uma condição 
        especificada, retornando apenas as linhas que atendem a essa condição.

        - Na linguagem SQL, a seleção é realizada usando a cláusula `WHERE`.

        - Exemplo: `SELECT * FROM tabela WHERE condição;`

    2. **Projeção (Projection)**:
        - A projeção é uma operação que seleciona colunas específicas de uma tabela, descartando 
        as colunas que não são necessárias para a consulta.

        - Na linguagem SQL, a projeção é realizada listando apenas as colunas desejadas após a 
        cláusula `SELECT`.

        - Exemplo: `SELECT coluna1, coluna2 FROM tabela;`

    3. **Junção (Join)**:
        - A junção é uma operação que combina dados de duas ou mais tabelas com base em uma 
        condição de relacionamento entre elas.

        - Na linguagem SQL, as junções são realizadas usando as cláusulas `JOIN`, como 
        `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, etc., que especificam como as tabelas devem 
        ser combinadas.

        - Exemplo: `SELECT * FROM tabela1 INNER JOIN tabela2 ON tabela1.coluna = tabela2.coluna;`

Em resumo, a seleção filtra as linhas com base em uma condição, a projeção seleciona 
colunas específicas e a junção combina dados de várias tabelas com base em uma condição de 
relacionamento. 

Essas operações são essenciais para consultas SQL eficazes e para a manipulação de dados em 
bancos de dados relacionais.

*/




/*==========================================================================================
                                            JOIN 
  ==========================================================================================

  JOIN é uma cláusula em SQL que permite combinar linhas de duas ou mais tabelas com base 
  em uma condição especificada. Essa operação é fundamental para recuperar dados de várias 
  tabelas relacionadas em uma única consulta. Existem vários tipos de JOINs, cada um com 
  seu próprio propósito e comportamento.

  

    ------------------------------------> INNER JOIN <------------------------------------
    - O INNER JOIN retorna apenas as linhas que têm correspondências nas duas tabelas 
    sendo unidas.

    SINTAXE BÁSICA:

        SELECT *
        FROM tabela1
        INNER JOIN tabela2
        ON tabela1.coluna = tabela2.coluna;
*/

SELECT nome, sexo, bairro, cidade
FROM cliente
    INNER JOIN endereco
    ON idcliente = fk_idcliente;


                    /*
                    +-------------+------+----------+----------------+
                    | nome        | sexo | bairro   | cidade         |
                    +-------------+------+----------+----------------+
                    | Ana         | F    | Centro   | Belo Horizonte |
                    | Jose Marcos | M    | Centro   | Rio de Janeiro |
                    | Carlos      | M    | Jardins  | São Paulo      |
                    | João        | M    | Estacio  | Rio de Janeiro |
                    | Jorge       | M    | Flamengo | Rio de Janeiro |
                    | Clara       | F    | Centro   | Vitoria        |
                    +-------------+------+----------+----------------+
                    */


/*                      < FAZENDO UM INNER JOIN EM DUAS TABELAS >
SELECT nome, sexo, bairro, cidade, telefone
FROM cliente
    INNER JOIN endereco
    ON idcliente = fk_idcliente
        INNER JOIN telefone
        ON idcliente = fk_idcliente;


As chaves estrangeiras nas tabelas <endereco> e <telefone> são iguais, e ai,
o MYsql identifica isso como ambiguidade, ocorrendo em um erro na hora da execução;
Para concertar isso, devemos ponderar dando alias para as tabelas.
*/

SELECT c.nome, c.sexo, e.bairro, e.cidade, t.numero
FROM cliente c
    INNER JOIN endereco e 
    ON c.idcliente = e.fk_idcliente
        INNER JOIN telefone t
        ON c.idcliente = t.fk_idcliente;
/*
                +-------------+------+---------+----------------+-----------+
                | nome        | sexo | bairro  | cidade         | numero    |
                +-------------+------+---------+----------------+-----------+
                | Jose Marcos | M    | Centro  | Rio de Janeiro | 115464741 |
                | Jose Marcos | M    | Centro  | Rio de Janeiro | 415165165 |
                | Jose Marcos | M    | Centro  | Rio de Janeiro | 165165189 |
                | Carlos      | M    | Jardins | São Paulo      | 512651651 |
                | Carlos      | M    | Jardins | São Paulo      | 151618949 |
                | João        | M    | Estacio | Rio de Janeiro | 156484231 |
                | João        | M    | Estacio | Rio de Janeiro | 132065165 |
                | João        | M    | Estacio | Rio de Janeiro | 632184987 |
                | Clara       | F    | Centro  | Vitoria        | 849878445 |
                | Clara       | F    | Centro  | Vitoria        | 545151235 |
                | Clara       | F    | Centro  | Vitoria        | 879841213 |
                +-------------+------+---------+----------------+-----------+
*/

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------


/*
    ------------------------------------> LEFT JOIN <------------------------------------
    - O LEFT JOIN retorna todas as linhas da tabela à esquerda (tabela1), junto com as 
    linhas correspondentes na tabela à direita (tabela2). Se não houver correspondência, 
    o resultado conterá NULL na coluna da tabela à direita.

    SINTAXE BÁSICA:
        SELECT *
        FROM tabela1
        LEFT JOIN tabela2
        ON tabela1.coluna = tabela2.coluna;
 
*/


-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------



/*
    ------------------------------------> RIGHT JOIN <------------------------------------
    - O RIGHT JOIN retorna todas as linhas da tabela à direita (tabela2), junto com as 
    linhas correspondentes na tabela à esquerda (tabela1). Se não houver correspondência, 
    o resultado conterá NULL na coluna da tabela à esquerda.

    SINTAXE BÁSICA:
        SELECT *
        FROM tabela1
        RIGHT JOIN tabela2
        ON tabela1.coluna = tabela2.coluna;


*/


-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------



/*
    ------------------------------------> FULL JOIN <------------------------------------
    - O FULL JOIN retorna todas as linhas quando houver uma correspondência em uma das 
    tabelas. 
    Se não houver correspondência, o resultado conterá NULL na coluna sem correspondência.

    SINTAXE BÁSICA:
        SELECT *
        FROM tabela1
        FULL JOIN tabela2
        ON tabela1.coluna = tabela2.coluna;



*/

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------


/*==========================================================================================
                                CATEGORIAS DE COMANDOS 
  ==========================================================================================

  As categorias de comandos SQL são fundamentais para a manipulação e gerenciamento de dados 
  em bancos de dados relacionais. 
  
  Eles são divididos em várias categorias principais, cada uma com uma finalidade específica. 
  
  Aqui estão as principais categorias de comandos SQL:
    
    -> DML (Data Manipulation Language - Linguagem de Manipulação de Dados):
        > SELECT: Recupera dados de uma ou mais tabelas.
        > INSERT: Insere novos registros em uma tabela.
        > UPDATE: Modifica registros existentes em uma tabela.
        > DELETE: Remove registros de uma tabela.


    -> DDL (Data Definition Language - Linguagem de Definição de Dados):
        > CREATE: Cria novos objetos no banco de dados (tabelas, índices, vistas, etc.).
        > ALTER: Altera a estrutura de objetos existentes no banco de dados.
        > DROP: Remove objetos do banco de dados.
        > TRUNCATE: Remove todos os registros de uma tabela, mas mantém sua estrutura.


    -> DCL (Data Control Language - Linguagem de Controle de Dados):
        > GRANT: Concede permissões a usuários ou roles.  
        > REVOKE: Revoga permissões concedidas anteriormente.


    -> DQL (Data Query Language - Linguagem de Consulta de Dados):
        > SELECT: Embora frequentemente considerado parte do DML, o SELECT 
                é especificamente utilizado para consultas de dados e pode 
                ser destacado como DQL.

    -> TCL (Transaction Control Language - Linguagem de Controle de Transações):
        > COMMIT: Confirma uma transação, tornando todas as suas mudanças permanentes.
        > ROLLBACK: Reverte uma transação, desfazendo todas as suas mudanças.
        > SAVEPOINT: Define um ponto dentro de uma transação para que parte dela possa ser revertida.



-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------


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


-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------


/*==========================================================================================
                                        FUNÇÕES - IFNULL 
  ==========================================================================================