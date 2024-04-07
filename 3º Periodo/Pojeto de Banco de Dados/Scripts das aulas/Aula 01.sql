SHOW DATABASES;

-- Criar a base de dados
CREATE DATABASE faculdade;

USE faculdade;

-- Criação das tabelas
CREATE TABLE alunos(
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT,
    email VARCHAR(50),
    telefone VARCHAR(15)
);

CREATE TABLE professores(
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(50),
    telefone VARCHAR(15),
    departamento VARCHAR(50),
    disciplina VARCHAR(50)
);

CREATE TABLE aluno_professor(
	fk_idprofessor INT,
    fk_idaluno INT,
    PRIMARY KEY(fk_idprofessor, fk_idaluno)
);

CREATE TABLE cursos(
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    registro VARCHAR(50),
    coordenador VARCHAR(50),
    fk_idprofessor INT
);

CREATE TABLE matricula(
	idMatricula INT PRIMARY KEY AUTO_INCREMENT,
    data_matricula DATE NOT NULL,
    fk_idaluno INT,
    fk_idcurso INT
)AUTO_INCREMENT = 1001; -- definindo um valor para iniciar o auto_increment

-- Adicionando regra de chave estrangeira
ALTER TABLE aluno_professor
ADD CONSTRAINT fk_aluno_professor
FOREIGN KEY (fk_idprofessor)
REFERENCES professores(idProfessor)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE aluno_professor
ADD CONSTRAINT fk_aluno_professor_2
FOREIGN KEY (fk_idaluno)
REFERENCES alunos(idAluno)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE cursos
ADD CONSTRAINT fk_curso_professor
FOREIGN KEY (fk_idprofessor)
REFERENCES professores (idprofessor)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Usando apenas um ALTER TABLE para adicionar regras de duas chaves estrangeiras
ALTER TABLE matricula
ADD CONSTRAINT fk_matricula_aluno
FOREIGN KEY (fk_idaluno)
REFERENCES alunos (idAluno)
ON UPDATE CASCADE
ON DELETE CASCADE,
ADD CONSTRAINT fk_matricula_curso
FOREIGN KEY (fk_idcurso)
REFERENCES cursos (idcurso)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Inserindo registros nas tabelas
INSERT INTO alunos (nome, idade, email, telefone) VALUES
('João', 20, 'joao@example.com', '(83) 1234-5678'),
('Maria', 22, 'maria@example.com', '(83) 2345-6789'),
('Pedro', 21, 'pedro@example.com', '(83) 3456-7890'),
('Ana', 19, 'ana@example.com', '(83) 4567-8901'),
('Lucas', 23, 'lucas@example.com', '(83) 5678-9012'),
('Julia', 20, 'julia@example.com', '(83) 6789-0123'),
('Gabriel', 21, 'gabriel@example.com', '(83) 7890-1234'),
('Laura', 22, 'laura@example.com', '(83) 8901-2345'),
('Mariana', 20, 'mariana@example.com', '(83) 9012-3456'),
('Rafael', 23, 'rafael@example.com', '(83) 0123-4567');

INSERT INTO professores (nome, email, telefone, departamento, disciplina) VALUES
('Maria Silva', 'maria@example.com', '(83) 1234-5678', 'Ciências da Computação', 'Programação'),
('Carlos Oliveira', 'carlos@example.com', '(83) 2345-6789', 'Ciências da Computação', 'Algoritmos'),
('Ana Souza', 'ana@example.com', '(83) 3456-7890', 'Engenharia', 'Cálculo'),
('João Santos', 'joao@example.com', '(83) 4567-8901', 'Administração', 'Gestão Financeira'),
('Laura Costa', 'laura@example.com', '(83) 5678-9012', 'Psicologia', 'Psicoterapia'),
('Fernanda Lima', 'fernanda@example.com', '(83) 6789-0123', 'Medicina', 'Anatomia'),
('Rafael Martins', 'rafael@example.com', '(83) 7890-1234', 'Direito', 'Direito Penal'),
('Patricia Oliveira', 'patricia@example.com', '(83) 8901-2345', 'Nutrição', 'Nutrição Esportiva'),
('Gustavo Mendes', 'gustavo@example.com', '(83) 9012-3456', 'Arquitetura', 'Desenho Técnico'),
('Aline Ferreira', 'aline@example.com', '(83) 0123-4567', 'Marketing', 'Marketing Digital'),
('Paula Rodrigues', 'paula@example.com', '(83) 1234-5678', 'Ciências da Computação', 'Inteligência Artificial'),
('Pedro Santos', 'pedro@example.com', '(83) 2345-6789', 'Ciências da Computação', 'Redes de Computadores');

INSERT INTO cursos (nome, registro, coordenador, fk_idprofessor) VALUES
('Análise e Desenvolvimento de Sistemas', 'ADS2022', 'Maria Silva', 1),
('Ciência da Computação', 'CC2022', 'Carlos Oliveira', 2),
('Engenharia Civil', 'EC2022', 'Ana Souza', 3),
('Administração', 'ADM2022', 'João Santos', 4),
('Psicologia', 'PSI2022', 'Laura Costa', 5),
('Medicina', 'MED2022', 'Fernanda Lima', 6),
('Direito', 'DIR2022', 'Rafael Martins', 7),
('Nutrição', 'NUT2022', 'Patricia Oliveira', 8),
('Arquitetura', 'ARQ2022', 'Gustavo Mendes', 9),
('Marketing', 'MKT2022', 'Aline Ferreira', 10);

INSERT INTO aluno_professor (fk_idprofessor, fk_idaluno) VALUES
(1, 1), 
(1, 2), 
(2, 3), 
(2, 4), 
(3, 5), 
(3, 6), 
(4, 7), 
(4, 8), 
(5, 9), 
(5, 10);

INSERT INTO matricula (data_matricula, fk_idaluno, fk_idcurso) VALUES
('2023-01-15', 3, 5), 
('2023-02-20', 2, 9), 
('2023-03-25', 7, 3), 
('2023-04-30', 5, 7), 
('2023-05-05', 8, 4), 
('2023-06-10', 6, 10),
('2023-07-15', 4, 6), 
('2023-08-20', 9, 8), 
('2023-09-25', 10, 2),
('2023-10-30', 1, 1); 

-- Alterando tipo de campo
ALTER TABLE alunos
MODIFY telefone CHAR(15);

-- Alterando nome de campo
ALTER TABLE professores
CHANGE telefone contato VARCHAR(15);

-- Atualizando o valor de um registro
UPDATE cursos
SET nome = 'ADS'
WHERE nome = 'Análise e Desenvolvimento de Sistemas';

-- Apagando registros específicos
DELETE FROM cursos
WHERE idcurso = 3;

DELETE FROM professores
WHERE idprofessor IN (5,7);

-- Consulta geral
SELECT * FROM CURSOS;

select * from professores;

SELECT * FROM matricula;

-- Consulta: alunos com mais de 20 anos
SELECT nome, idade
FROM ALUNOS
WHERE idade >= 20
ORDER BY idade ASC;

-- Consulta: professores que iniciam o nome com a letra ‘P’
SELECT nome
FROM professores
WHERE nome LIKE 'P%';
