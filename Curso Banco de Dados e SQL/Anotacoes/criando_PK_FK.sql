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

