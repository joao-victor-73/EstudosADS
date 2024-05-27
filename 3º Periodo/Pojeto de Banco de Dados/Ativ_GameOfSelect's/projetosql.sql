-- Criação da database
CREATE DATABASE Pesquisa_Eleitoral;

USE Pesquisa_Eleitoral;

-- Criação da tabela eleitor 
CREATE TABLE Eleitor (
  idEleitor INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(100),
  Genero VARCHAR(9),
  CPF VARCHAR(11),
  ZonaEleitoral VARCHAR(50),
  idCEP INT,
  FOREIGN KEY (idCEP) REFERENCES Regiao(CEP)
);

-- Criação da tabela Candidato
CREATE TABLE Candidato (
    idNumero_Candidato INT PRIMARY KEY ,
    Nome VARCHAR(100),
    Nome_Partido VARCHAR(100),
    Cargo VARCHAR(20)
);

-- Criação da tabela Região 
CREATE TABLE Regiao (
    CEP INT PRIMARY KEY,
    Bairro VARCHAR(100)
);

-- Criação da tabela voto
CREATE TABLE Voto (
    idVoto INT AUTO_INCREMENT PRIMARY KEY,
    idEleitor INT,
    idCandidato INT,
    FOREIGN KEY (idEleitor) REFERENCES Eleitor(idEleitor),
    FOREIGN KEY (idCandidato) REFERENCES Candidato(idNumero_Candidato)
);

-- Inserção de dados na tabela eleitor
INSERT INTO Eleitor (Nome, Genero, CPF, ZonaEleitoral)
VALUES ('João Silva', 'Masculino', '1234567890', 1),
('Maria Santos', 'Feminino', '0987654321', 2),
('Carlos Oliveira', 'Masculino', '1122334455', 3),
('Ana Souza', 'Feminino', '5544332211', 4),
('Pedro Rocha', 'Masculino', '6677889900', 5),
('Mariana Costa', 'Feminino', '9900887766', 1),
('Lucas Pereira', 'Masculino', '8899776655', 2),
('Juliana Almeida', 'Feminino', '7788990011', 3),
('Fernando Santos', 'Masculino', '9988776655', 4),
('Beatriz Oliveira', 'Feminino', '1122334455', 5),
('Roberto Nunes', 'Masculino', '5544332211', 1),
('Carla Mendes', 'Feminino', '6677889900', 2),
('Gustavo Lima', 'Masculino', '9900887766', 3),
('Tatiane Costa', 'Feminino', '8899776655', 4),
('Ricardo Alves', 'Masculino', '7788990011', 5),
('Camila Santos', 'Feminino', '9988776655', 1),
('José Pereira', 'Masculino', '1122334455', 2),
('Larissa Oliveira', 'Feminino', '5544332211', 3),
('Daniel Souza', 'Masculino', '6677889900', 4),
('Aline Lima', 'Feminino', '9900887766', 5),
('Paulo Costa', 'Masculino', '8899776655', 1),
('Natália Silva', 'Feminino', '7788990011', 2),
('Felipe Santos', 'Masculino', '9988776655', 3),
('Isabela Oliveira', 'Feminino', '1122334455', 4),
('Marcos Mendes', 'Masculino', '5544332211', 5),
('Vanessa Lima', 'Feminino', '6677889900', 1),
('Rafaela Almeida', 'Feminino', '9900887766', 2),
('Luciana Costa', 'Feminino', '8899776655', 3),
('Gabriel Santos', 'Masculino', '7788990011', 4),
('Amanda Oliveira', 'Feminino', '9988776655', 5),
('Vinícius Pereira', 'Masculino', '1122334455', 1),
('Patrícia Souza', 'Feminino', '5544332211', 2),
('Thiago Lima', 'Masculino', '6677889900', 3),
('Carolina Mendes', 'Feminino', '9900887766', 4),
('Eduardo Costa', 'Masculino', '8899776655', 5),
('Bianca Silva', 'Feminino', '7788990011', 1),
('Henrique Santos', 'Masculino', '9988776655', 2),
('Laura Oliveira', 'Feminino', '1122334455', 3),
('Marcelo Mendes', 'Masculino', '5544332211', 4),
('Jéssica Lima', 'Feminino', '6677889900', 5),
('Rafael Oliveira', 'Masculino', '9900887766', 1),
('Fernanda Costa', 'Feminino', '8899776655', 2),
('Leonardo Santos', 'Masculino', '7788990011', 3),
('Ana Clara Silva', 'Feminino', '9988776655', 4),
('Luiz Carlos Pereira', 'Masculino', '1122334455', 5),
('Mariana Souza', 'Feminino', '5544332211', 1),
('Ricardo Lima', 'Masculino', '6677889900', 2),
('Tatiana Mendes', 'Feminino', '9900887766', 3),
('Diego Costa', 'Masculino', '8899776655', 4),
('Caroline Oliveira', 'Feminino', '7788990011', 5);

-- Inserção de dados na tabela candidato
INSERT INTO Candidato (idNumero_Candidato, Nome, Nome_Partido, Cargo)
VALUES (11, 'Cícero Lucena', 'Partido Progressista', 'Prefeito'),
(20, 'Ruy Carneiro', 'Podemos', 'Prefeito'),
(22, 'Marcelo Queiroga', 'Partido Liberal', 'Prefeito'),
(13, 'Cida Ramos', 'Partido dos Trabalhadores', 'Prefeito');

-- Inserção de dados na tabela região
INSERT INTO Regiao ( CEP, Bairro)
VALUES (58304500,'Bessa'),
(58305500,'Cristo Redentor'),
(58306500,'Altiplano'),
(58307500,'Tambaú'),
(58308500,'Varadouro');

-- Inserção de dados na tabela voto
INSERT INTO Voto (idEleitor, idCandidato)
VALUES
    (1, 11),
    (2, 20),
    (3, 22),
    (4, 13),
    (5, 11),
    (6, 20),
    (7, 22),
    (8, 13),
    (9, 11),
    (10, 20),
    (11, 11),
    (12, 11),
    (13, 11),
    (14, 20),
    (15, 20),
    (16, 20),
    (17, 13),
    (18, 13),
    (19, 13),
    (20, 11),
    (21, 11),
    (22, 11),
    (23, 20),
    (24, 20),
    (25, 20),
    (26, 13),
    (27, 13),
    (28, 13),
    (29, 11),
    (30, 11),
    (31, 20),
    (32, 20),
    (33, 20),
    (34, 13),
    (35, 13),
    (36, 13),
    (37, 11),
    (38, 11),
    (39, 11),
    (40, 20),
    (41, 20),
    (42, 20),
    (43, 13),
    (44, 13),
    (45, 13),
    (46, 11),
    (47, 11),
    (48, 11),
    (49, 20),
    (50, 20);
    
    
    
    
    
    

-- TRIGGERS


CREATE DATABASE bkp_pesquisa_eleitoral;

USE bkp_pesquisa_eleitoral;

-- Criação da tabela de backup
CREATE TABLE bkp_voto (
    idVoto INT,
    idEleitor INT,
    idCandidato INT,
    DataInsercao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

delimiter @

CREATE TRIGGER trg_after_insert_voto
AFTER INSERT ON bkp_pesquisa_eleitoral.bkp_voto
FOR EACH ROW
BEGIN
    INSERT INTO bkp_pesquisa_eleitoral.bkp_voto (idVoto, idEleitor, idCandidato)
    VALUES (NEW.idVoto, NEW.idEleitor, NEW.idCandidato);
END @

delimiter ;





 