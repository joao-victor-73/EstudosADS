CREATE DATABASE bkp_pesquisa_eleitoral;

USE bkp_pesquisa_eleitoral;


-- TABELA ELEITOR

CREATE TABLE bkp_eleitor
SELECT * FROM pesquisa_eleitoral.eleitor;

DELIMITER @

CREATE TRIGGER trg_inserir_eleitor
AFTER INSERT ON bkpbkp_eleitor_pesquisa_eleitoral.bkp_eleitor
FOR EACH ROW
BEGIN 
    INSERT INTO bkp_pesquisa_eleitoral.bkp_eleitor(idEleitor, Nome, Genero, CPF, ZonaEleitoral, idCEP, fk_idNumero_Candidato)
    VALUES (NEW.idEleitor, NEW.Nome, NEW.Genero, NEW.CPF, NEW.ZonaEleitoral, NEW.idCEP, NEW.fk_idNumero_Candidato);
END @

DELIMITER ;


-- TABELA CANDIDATO

CREATE TABLE bkp_candidato
SELECT * FROM pesquisa_eleitoral.candidato;

DELIMITER @

CREATE TRIGGER trg_inserir_candidato
AFTER INSERT ON bkp_pesquisa_eleitoral.bkp_candidato
FOR EACH ROW
BEGIN
    INSERT INTO bkp_pesquisa_eleitoral.bkp_candidato (idNumero_Candidato, Nome, Nome_Partido, Cargo)
    VALUES (NEW.idNumero_Candidato, NEW.Nome, NEW.Nome_Partido, NEW.Cargo);
END @

DELIMITER ;



-- TABELA REGIÃO

CREATE TABLE bkp_regiao
SELECT * FROM pesquisa_eleitoral.regiao;

DELIMITER @

CREATE TRIGGER trg_inserir_regiao
AFTER INSERT ON bkp_pesquisa_eleitoral.bkp_regiao
FOR EACH ROW
BEGIN
    INSERT INTO bkp_pesquisa_eleitoral.bkp_regiao (CEP, Bairro)
    VALUES (NEW.CEP, NEW.Bairro);
END @

DELIMITER ;


-- TABELA VOTO
CREATE TABLE bkp_voto AS
SELECT * FROM pesquisa_eleitoral.voto;

delimiter @

CREATE TRIGGER trg_inserir_votos
AFTER INSERT ON bkp_pesquisa_eleitoral.bkp_voto
FOR EACH ROW
BEGIN
    INSERT INTO bkp_pesquisa_eleitoral.bkp_voto (idVoto, fk_idEleitor, fk_idCandidato)
    VALUES (NEW.idVoto, NEW.fk_idEleitor, NEW.fk_idCandidato);
END @

delimiter ;

