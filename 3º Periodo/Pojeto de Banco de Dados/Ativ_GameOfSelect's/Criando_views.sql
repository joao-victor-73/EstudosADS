-- VIEWS

-- Foi puxado do banco de dados o nome, cpf, zona eleitoral, em quem o eleitor votou e qual o nome do partido do candidato;
CREATE VIEW v_relatorio_eleitores AS 
    SELECT e.nome, e.cpf, e.ZonaEleitoral, c.nome, c.Nome_Partido
    FROM Voto v
        INNER JOIN Eleitor e
        ON v.fk_idEleitor = e.idEleitor
            INNER JOIN Candidato c
            ON v.fk_idCandidato = c.idNumero_Candidato;
        
        
-- Foi puxado do banco de dados quantos votos cada candidato teve;
CREATE VIEW v_relatorio_votos AS
	SELECT c.Nome, c.Nome_Partido, (SELECT COUNT(*) FROM Voto v WHERE v.fk_idCandidato = c.idNumero_Candidato) AS NumeroVotos
	FROM Candidato c;

/* 						OBS
Criei essa view utilizando subconsulta para poder treinar, e também para aplicar os conceitos estudados em sala,
daria muito bem para fazer com um simples JOIN e um GROUP BY, como vou deixar abaixo

SELECT c.Nome AS NomeCandidato, c.Nome_Partido, COUNT(v.idVoto) AS NumeroVotos
FROM Candidato c
	LEFT JOIN Voto v ON c.idNumero_Candidato = v.fk_idCandidato
GROUP BY c.Nome, c.Nome_Partido;

*/

