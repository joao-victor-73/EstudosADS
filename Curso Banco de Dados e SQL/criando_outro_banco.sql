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

    FOREIGN KEY(fk_idcliente) REFERENCES cliente(idcliente)    
);

CREATE TABLE telefone(
    idtelefone INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('RES', 'COM', 'CEL') NOT NULL, -- RES -> residencial , COM -> comercial, CEL -> celular
    numero VARCHAR(10) NOT NULL,
    fk_idcliente INT,

    FOREIGN KEY(fk_idcliente) REFERENCES cliente(idcliente)
);
