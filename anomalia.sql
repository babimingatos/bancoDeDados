-- Integridade referencial 
-- Anomalia de dados: DML-> DELETE e UPDATE 
	-- As informações podem mudar ao longo do tempo
    -- Anomalia-> quando 
-- Integridade de FK: DML- INSERT

CREATE DATABASE anomalia;

USE anomalia;

CREATE TABLE pes_pessoas (
	pes_cpf INT PRIMARY KEY,
    pes_nome VARCHAR (45) NOT NULL,
    pes_nascimento DATE DEFAULT NULL
);

CREATE TABLE alu_alunos(
	alu_ra INT PRIMARY KEY AUTO_INCREMENT,
	alu_vestibular DATE NOT NULL,
    alu_cursos VARCHAR (45) NOT NULL,
	pes_cpf INT NOT NULL,
    FOREIGN KEY (pes_cpf)REFERENCES pes_pessoas(pes_cpf)
    ON UPDATE CASCADE 
    -- DELETE/ UPDATE CASCADE
    -- CASCADE: para a fk, os valores serao cascateados com as atualizações das alterações (se o pai for atualizado, os filhos tbm serão)
);

-- DML (Manipulação=> INSERT, UPDATE e DELETE)
-- INSERT INTO TABELA () VALUES (ATRIB) 

-- Simples
INSERT INTO pes_pessoas VALUES (1234568912, 'AIIII', '2020/09/21');

-- Composto
INSERT INTO pes_pessoas VALUES
	(22222,'eiii','2020/09/09'),
	(33333, 'aa', '2010/09/21'),
    (132213, 'bb', '2010/08/08'
);

-- Sem coisa obrigatória
INSERT INTO pes_pessoas VALUES (
	666, 'as', NULL
);

-- Campos especificos
INSERT INTO pes_pessoas (pes_cpf, pes_nome) VALUES (3465, 'sdfds');

-- o ra é AI
INSERT INTO alu_alunos (alu_vestibular, alu_cursoS, pes_cpf) VALUES (
	'2020/09/20', 'Analise', 22222
);

-- SELECT DQL
SELECT * FROM alu_alunos;
SELECT * FROM pes_pessoas;


INSERT INTO alu_alunos VALUES (
	0, '2021/01/02', 'ads', 132213
);

INSERT INTO alu_alunos VALUES (
	4365,'2021/01/02', 'ads', 47653
);



