create DATABASE biblioteca;
USE biblioteca;

CREATE TABLE cur_cursos (
	cur_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cur_nome VARCHAR (45) NOT NULL,
    cur_sigla VARCHAR (4) NOT NULL
);

CREATE TABLE car_cargos (
	car_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    car_nome VARCHAR (45)
);

CREATE TABLE nac_nacionalidades (
	nac_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nac_nome VARCHAR (45) NOT NULL
);

CREATE TABLE edi_editoras (
	edi_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    edi_nome VARCHAR (45) NOT NULL
);

CREATE TABLE alu_alunos (
	alu_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    alu_nome VARCHAR (45) NOT NULL,
    alu_matricula INT NOT NULL UNIQUE,
    cur_id INT NOT NULL,
    FOREIGN KEY (cur_id) REFERENCES cur_cursos (cur_id)
    ON UPDATE CASCADE
);

CREATE TABLE aut_autores (
	aut_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    aut_nome VARCHAR (100) NOT NULL,
    aut_datanascimento DATE NOT NULL,
    nac_id INT NOT NULL,
    FOREIGN KEY (aut_id) REFERENCES nac_nacionalidades(nac_id)
	ON UPDATE CASCADE 
);

CREATE TABLE liv_livros (
	liv_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    liv_titulo VARCHAR(45) NOT NULL,
    liv_isbn VARCHAR (17) UNIQUE NOT NULL, 
    liv_anopublicacao DATE NOT NULL,
    liv_qtdcopias INT NOT NULL,
    edi_id INT NOT NULL,
    FOREIGN KEY (edi_id) REFERENCES edi_editoras(edi_id)
	ON UPDATE CASCADE
);


CREATE TABLE fun_funcionarios (
	fun_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fun_nome VARCHAR (45) NOT NULL,
    fun_numeroFuncionario INT NOT NULL,
    fun_datacontrato DATE NOT NULL,
    fun_cpf VARCHAR (14) UNIQUE NOT NULL,
    car_id INT NOT NULL,
    FOREIGN KEY (car_id) REFERENCES car_cargos(car_id)
    ON UPDATE CASCADE
);

CREATE TABLE emp_emprestimos (
	emp_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    emp_dataemprestimo DATE NOT NULL,
    emp_datadevolucaoprevista DATE NOT NULL,
    emp_datadevolucaoreal DATE,
    liv_id INT NOT NULL,
    alu_id INT NOT NULL,
    fun_id INT NOT NULL,
    FOREIGN KEY (liv_id) REFERENCES liv_livros(liv_id)
	ON UPDATE CASCADE,
     FOREIGN KEY (alu_id) REFERENCES alu_alunos(alu_id)
	ON UPDATE CASCADE,
     FOREIGN KEY (fun_id) REFERENCES fun_funcionarios(fun_id)
	ON UPDATE CASCADE
);

CREATE TABLE liv_aut (
	aut_id INT NOT NULL,
    liv_id INT NOT NULL,
    FOREIGN KEY (aut_id) REFERENCES aut_autores (aut_id)
    ON UPDATE CASCADE,
    FOREIGN KEY (liv_id) REFERENCES liv_livros (liv_id)
    ON UPDATE CASCADE
);

INSERT INTO cur_cursos(cur_nome, cur_sigla) VALUES ('Analise e Desenvolvimento de Sistemas', 'ADS'), ('Logistica','LOG'), ('Gestao da Tecnologia da Informacao', 'GTI'), ('Gestao Financeira', 'GFIN'), ('Gestao Empresarial','GEMP');
INSERT INTO alu_alunos (alu_nome, alu_matricula, cur_id) VALUES ('Barbara', 123, 1), ('Maria', 456, 2), ('Marcos',789, 3), ('Marcia', 1011, 4), ('Eduardo', 1213, 5);
INSERT INTO car_cargos(car_nome) VALUES('Bibliotecária'), ('Adm'), ('Gerente'), ('TI'), ('Estagiario');
INSERT INTO fun_funcionarios(fun_nome, fun_numerofuncionario,fun_datacontrato, fun_cpf, car_id) VALUES('Joana', 98, '2020-02-02', '98989898', 1), ('Marta', 76, '2022-01-12', '76767676767', 2);
INSERT INTO edi_editoras (edi_nome) VALUES ('Vagalume'), ('Catavento');
INSERT INTO nac_nacionalidades (nac_nome) VALUES ('Brasileiro'), ('Uruguaio'), ('Frances'), ('Alemao');
INSERT INTO aut_autores (aut_nome, aut_datanascimento, nac_id) VALUES ('Leonardo Jonas', '1990-10-10', 1), ('Maria Aparecida Santos','1980-10-10', 2);
INSERT INTO liv_livros (liv_titulo, liv_isbn,liv_anopublicacao, liv_qtdcopias, edi_id)VALUES ('O som da Luz', '978-85-333-0227-3', '2000-09-09', 120, 1),('O Monstro do Lago Ness', '823-85-333-0227-3', '1950-10-09', 190, 2);
INSERT INTO liv_aut (liv_id, aut_id) VALUES(1, 1), (1,2);
INSERT INTO emp_emprestimos (emp_dataEmprestimo, emp_datadevolucaoPrevista, liv_id, alu_id, fun_id) VALUES ('2023-09-09', '2023-10-10', 1, 1, 1), ('2023-09-08', '2023-10-10', 2, 2, 2);
UPDATE liv_livros SET liv_qtdcopias = liv_qtdcopias - 1 WHERE liv_id = 1;
UPDATE liv_livros SET liv_qtdcopias = liv_qtdcopias - 1 WHERE liv_id = 2;

UPDATE emp_emprestimos SET emp_datadevolucaoReal = '2022-03-03'WHERE emp_id = 1;
UPDATE liv_livros SET liv_qtdcopias = liv_qtdcopias + 1 WHERE liv_id = 1;

SELECT
  emp.emp_id,
  emp.emp_dataEmprestimo,
  emp.emp_datadevolucaoPrevista,
  emp.emp_datadevolucaoReal,
  liv.liv_titulo,
  alu.alu_nome,
 alu.cur_id,
  alu.alu_matricula,
  fun.fun_nome
FROM
  emp_emprestimos emp
JOIN
  liv_livros liv
ON
  emp.liv_id = liv.liv_id
JOIN
  alu_alunos alu
ON
  emp.alu_id = alu.alu_id
JOIN
  fun_funcionarios fun
ON
  emp.fun_id = fun.fun_id
WHERE
  emp.emp_id = 2;




