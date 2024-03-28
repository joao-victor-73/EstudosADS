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

INSERT INTO clientes(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

                                /* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO clientes VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

/* Vai dar erro esses de baixo.*/
INSERT INTO clientes(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO clientes(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);

                                /* INSERT INTO de mútliplas Linhas */

INSERT INTO nome_da_tabela (coluna1, coluna2) VALUES 
    (valor1, valor2), 
    (valor3, valor4), 
    (valor5, valor6);

INSERT INTO clientes (nome, sexo, endereco) VALUES
('Francisca', 'F', 'Rua Freire Silva - n45'),
('Livia', 'F', 'Rua Freire Silva - n65');