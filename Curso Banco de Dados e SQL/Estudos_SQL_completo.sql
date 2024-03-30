/* OBS: Para o MySQL o comentario é feito através do # */



                    -- AQUI SE ENCONTRA TODOS OS CÓDIGOS E ANOTAÇÕES EM MYSQL, E EU DIVIDI EM
                            -- OUTROS ARQUIVOS APENAS OS ASSUNTOS ESPECIFICOS.

/* 
Para o primeiro momento, vamos criar uma base de dados com a seguinte tabela:

clientes

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
sexo - CARACTER(1)


E para criar um banco de dados usamos o comando:
CREATE DATABASE <nome do banco de dados>; */

CREATE DATABASE clientes;

/*
O ; <ponto e virgula> é um ...
*/

/* Para visualizar os banco de dados já criados e novos: */
SHOW DATABASES;

/*Após criar um banco de dados, vamos começar a utiliza-lo*/
USE clientes;

/* Após dar um 'use' no BD, podemos criar nossas tabelas, editar, excluir e fazer outras coisas nas tabelas */
CREATE TABLE clientes(
    nome VARCHAR(30),
    sexo CHAR(1),
    email VARCHAR(30),
    cpf INT(11),
    telefone VARCHAR(30),
    endereco VARCHAR(100)
);

/* Vamos verificar a criação e a estrutura da tabela criada */
SHOW TABLES;
DESC clientes;

/*
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| nome     | varchar(30)  | YES  |     | NULL    |       |
| sexo     | char(1)      | YES  |     | NULL    |       |
| email    | varchar(30)  | YES  |     | NULL    |       |
| cpf      | int          | YES  |     | NULL    |       |
| telefone | varchar(30)  | YES  |     | NULL    |       |
| endereco | varchar(100) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+    
*/


/*==========================================================================================*/
/*                                      TIPOS DE DADOS                                      */
/*==========================================================================================*/

/* 
- Todos os bancos de dados possuem tipos que devem ser atribuidos aos dados de uma tabela;

    - Para caracteres literais, temos >CHAR< e >VARCHAR<;
    - Para números temos: >INT< e >FLOAT<;
    - Para objetos, como fotos e documentos, temos: >BLOB<;
    - Para textos extensos temos: >TEXT<;

    - Para dados do tipo de horários e datas temos: >DATA< / >TIME< / e >DATETIME<;
    -Para tipos booleanos (true or false) temos: >BOOLEAN< / ou / >BOOL<;

    (Para mais informações, há anotações em um caderno para mais aprofundamento!)

- É interessante saber onde utilizar e em qual tipo de dado utilizar, pois assim pode deixar
o banco de dados mais rápido, fácil e dinâmico.
*/


/*==========================================================================================*/
/*                                      INSERÇÃO DE DADOS                                   */
/*==========================================================================================*/

/* 
A maneira mais básica de inserir valores em uma tabela é usando a instrução INSERT INTO;
Tem 3 maneiras comuns de se inserir dados dentro da tabela, são elas:  
*/

                                /* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO clientes VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO clientes VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO clientes VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

                                /* FORMA 02 - COLOCANDO AS COLUNAS */
/* Você especifica o nome da tabela seguido pelos nomes das colunas nas quais deseja inserir valores e, em seguida, os valores a serem inseridos. */

INSERT INTO clientes(NOME,sexo,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

                                /* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO clientes VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

/* Vai dar erro esses de baixo.*/
INSERT INTO clientes(NOME,sexo,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO clientes(NOME,sexo,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);

                                /* INSERT INTO de mútliplas Linhas */

INSERT INTO nome_da_tabela (coluna1, coluna2) VALUES 
    (valor1, valor2), 
    (valor3, valor4), 
    (valor5, valor6);

INSERT INTO clientes (nome, sexo, endereco) VALUES
('Francisca', 'F', 'Rua Freire Silva - n45'),
('Livia', 'F', 'Rua Freire Silva - n65');


/*==========================================================================================*/
/*                                                 SELECT                                   */
/*==========================================================================================*/

/*
A cláusula SELECT é uma das instruções mais fundamentais no SQL (Structured Query Language) e 
é usada para recuperar dados de um banco de dados. Com a instrução SELECT, você pode especificar 
quais colunas deseja recuperar e de quais tabelas ou fontes de dados deseja recuperar essas colunas.

Se você quiser selecionar todas as colunas de uma tabela, pode usar o caractere curinga *: */
SELECT * FROM clientes;

/*                                              RESULTADO DA CONSULTA
+-----------+------+---------------------+-----------+-----------+-----------------------------------------------+
| nome      | sexo | email               | cpf       | telefone  | endereco                                      |
+-----------+------+---------------------+-----------+-----------+-----------------------------------------------+
| JOAO      | M    | JOAO@GMAIL.COM      | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA     | F    | CELIA@GMAIL.COM     | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE     | M    | NULL                | 885755896 | 58748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN    | F    | NULL                | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
| ANA       | F    | ANA@GLOBO.COM       |  85548962 | 548556985 | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
| CARLA     | F    | CARLA@TERATI.COM.BR |   7745828 | 66587458  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
| Francisca | F    | NULL                |      NULL | NULL      | Rua Freire Silva - n45                        |
| Livia     | F    | NULL                |      NULL | NULL      | Rua Freire Silva - n65                        |
+-----------+------+---------------------+-----------+-----------+-----------------------------------------------+
*/

/* Em casos em que queremos específicar as colunas da tabela, nos chamamos isso de PROJEÇÃO;
a projeção se refere à parte de uma consulta SELECT que especifica quais colunas devem ser incluídas 
no conjunto de resultados. Em outras palavras, é a seleção das colunas que você deseja ver na saída da consulta.


Selecionando colunas específicas de uma tabela:*/
SELECT nome, email, sexo FROM clientes;

/*          RESULTADO DA CONSULTA:
+-----------+---------------------+------+
| nome      | email               | sexo |
+-----------+---------------------+------+
| JOAO      | JOAO@GMAIL.COM      | M    |
| CELIA     | CELIA@GMAIL.COM     | F    |
| JORGE     | NULL                | M    |
| LILIAN    | NULL                | F    |
| ANA       | ANA@GLOBO.COM       | F    |
| CARLA     | CARLA@TERATI.COM.BR | F    |
| Francisca | NULL                | F    |
| Livia     | NULL                | F    |
+-----------+---------------------+------+
*/


/* O QUE É O ALIAS EM MYSQL?
    -> um alias é um nome alternativo ou apelido temporário atribuído a uma coluna, tabela ou 
        expressão em uma consulta. Isso é útil para tornar o resultado da consulta mais legível, 
        fornecer nomes mais descritivos ou simplificar referências a colunas ou tabelas com nomes 
        longos ou complexos.
    
    -> Existem dois tipos principais de alias no SQL:

        1. ALIAS DE COLUNA
            Um alias de coluna é usado para renomear uma coluna no resultado da consulta. 
            Isso é útil quando você deseja dar um nome mais significativo a uma coluna ou 
            quando está usando funções ou expressões em uma coluna e deseja atribuir um nome 
            mais descritivo ao resultado;

        2. ALIAS DE TABELAS
            Um alias de tabela é usado para fornecer um nome abreviado ou apelido para uma 
            tabela na consulta, facilitando a referência a ela, especialmente em consultas que 
            envolvem várias tabelas. 
    
    -> Um alias de tabela é usado para fornecer um nome abreviado ou apelido para uma tabela na consulta, 
        facilitando a referência a ela, especialmente em consultas que envolvem várias tabelas.

    EXEMPLO: */ 
SELECT nome, email, sexo AS genero FROM clientes;

/* RESULTADO DA CONSULTA:
+-----------+---------------------+--------+
| nome      | email               | genero |
+-----------+---------------------+--------+
| JOAO      | JOAO@GMAIL.COM      | M      |
| CELIA     | CELIA@GMAIL.COM     | F      |
| JORGE     | NULL                | M      |
| LILIAN    | NULL                | F      |
| ANA       | ANA@GLOBO.COM       | F      |
| CARLA     | CARLA@TERATI.COM.BR | F      |
| Francisca | NULL                | F      |
| Livia     | NULL                | F      |
+-----------+---------------------+--------+
*/

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


/*==========================================================================================
                            A TABELA VERDADDE / OPERADORES LÓGICOS                                  
  ==========================================================================================*/

/* OPERADORES LÓGICOS 
OR -> PARA QUE A SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
AND -> PARA QUE A SAIDA SEJA VERDADEIRA TODAS AS CONDICOES PRECISAM SER VERDADEIRAS.
*/

/* OR - OU */

SELECT * FROM clientes;

SELECT nome, sexo, endereco FROM clientes
WHERE 
sexo = 'M' OR endereco LIKE '%RJ';

SELECT nome, sexo, endereco FROM clientes
WHERE 
sexo = 'M' AND endereco LIKE '%RJ';

SELECT nome, sexo, endereco  FROM clientes
WHERE
sexo = 'F' OR endereco LIKE '%ESTACIO';

/* AND - E */

SELECT nome, sexo, endereco  FROM clientes
WHERE 
sexo = 'M' AND endereco LIKE '%RJ';

SELECT nome, sexo, endereco FROM clientes
WHERE
sexo = 'F' AND endereco LIKE '%ESTACIO';

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





/*==========================================================================================
                                TIPOS DE CHAVES NO BANCO DE DADOS         
  ==========================================================================================
            Será visto aqui a criação de Primary Key, Foreign Key, a utilização do 
                        AUTO_INCREMENT e a necessidade de usar o NULL.
  */

  /*                =================>> PRIMARY KERY <<========================
    - Uma chave primária é uma coluna ou conjunto de colunas que identifica exclusivamente cada 
    registro em uma tabela.
    
    - Cada tabela pode ter apenas uma chave primária.
    
    - A chave primária não pode ter valores duplicados e não pode ser nula (NULL).
    
    - Geralmente é definida como AUTO_INCREMENT para gerar valores únicos automaticamente.
    
    - Usada para garantir a integridade e a unicidade dos dados em uma tabela.
  EXEMPLO: */

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);




  /*                =================>> FOREIGN KERY <<========================
    - Uma chave estrangeira é uma coluna ou conjunto de colunas que estabelece uma relação entre 
    duas tabelas.

    - Representa um campo na tabela que é uma chave primária em outra tabela ou uma chave única.
   
    - Usada para manter a integridade referencial entre tabelas, garantindo que os valores na coluna 
    correspondam aos valores existentes na chave primária ou única na tabela relacionada.
  
  EXEMPLO: */
  
  CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

                    /* Neste exemplo, ``cliente_id`` é uma chave estrangeira que referencia 
                    a chave primária ``id`` na tabela clientes. Isso estabelece um 
                    relacionamento entre a tabela ``pedidos`` e a tabela ``clientes``, onde
                    cada pedido está associado a um cliente específico.*/


  /*                =================>> UNIQUE KERY <<========================
    - Uma chave única é uma coluna ou conjunto de colunas que permite apenas valores únicos, 
    mas pode ter valores nulos (NULL).
    
    - Pode ser usada para garantir a integridade dos dados, evitando a inserção de valores 
    duplicados em uma coluna específica.
    
    - Uma tabela pode ter várias chaves únicas.
  
  EXEMPLO: */

  CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) UNIQUE,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);
