CREATE DATABASE universidade;
USE universidade;

CREATE TABLE alunos (
    idAluno INT PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(50),
    telefone VARCHAR(30) NOT NULL
);

CREATE TABLE enderecos (
    idEndereco INT PRIMARY KEY,
    rua VARCHAR(100) NOT NULL,
    numero INT,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cep INT,
    pais VARCHAR(30),
    complemento VARCHAR(30)
);

CREATE TABLE professores(
    idProfessor INT PRIMARY KEY,
    nome_prof VARCHAR(100) NOT NULL,
    email VARCHAR(50),
    telefone VARCHAR(30) NOT NULL,
    data_admissao DATE NOT NULL
);

CREATE TABLE projetos_pesquisa (
    idProjeto INT PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL,
    descricao VARCHAR(500)
);

CREATE TABLE projetos_cursos (
    idProjCurso INT PRIMARY KEY
);

CREATE TABLE matriculas (
    idMatricula INT PRIMARY KEY,
    data_matricula DATE NOT NULL
);

CREATE TABLE cursos (
    idCurso INT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    duracao FLOAT NOT NULL,
    qtd_periodos INT NOT NULL,
    coordenador VARCHAR(100),
    departamento VARCHAR(50)
);

CREATE TABLE disciplinas (
    idDisciplina INT PRIMARY KEY,
    nome_desc VARCHAR(100),
    carga_horaria INT
);


/* < CRIANDO OS CAMPOS PARA ALTERAR DEPOIS PARA AS CHAVES ESTRANGEIRAS > */
ALTER TABLE alunos
ADD COLUMN fk_idEndereco INT NOT NULL,
ADD COLUMN fk_idProjetos INT,
ADD COLUMN fk_idCursos INT;

ALTER TABLE professores
ADD COLUMN fk_idEndereco INT NOT NULL,
ADD COLUMN fk_idCursos INT NOT NULL;

ALTER TABLE projetos_pesquisa
ADD COLUMN fk_idProfessor INT NOT NULL UNIQUE;

ALTER TABLE projetos_cursos
ADD COLUMN fk_idProjetos INT,
ADD COLUMN fk_idCursos INT;

/* < FAZENDO ALTERAÇÕES NAS TABELAS ADICIONANDO CHAVES ESTRANGEIRAS > */
ALTER TABLE alunos
ADD CONSTRAINT fk_alunos_enderecos /* esse nome <fk_alunos_enderecos> é apenas um nome qualquer para a regra (CONSTRAINT)  */
FOREIGN KEY (fk_idEndereco) REFERENCES enderecos(idEndereco)
ON UPDATE CASCADE
ON DELETE CASCADE;