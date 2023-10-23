create database joins;
use joins;

create table alu_alunos (
	  alu_id int auto_increment primary key not null,
    alu_nome varchar (45) not null,
    alu_email varchar (45) not null,
    cur_id int
);

create table cur_cursos (
	  cur_id int auto_increment primary key,
    cur_nome varchar (45)
);

insert into alu_alunos (alu_nome, alu_email, cur_id) values 
("Marcos", "marcos@marcos.com", 1), 
("José", "jose@jose.com", 2),
("Barbara", "babi@babi.com", 1),
("Yuri", "yuri@yuri.com", 2);

insert into alu_alunos (alu_nome, alu_email) values 
("Pedro", "Pedro@Pedro.com"), 
("Marcia", "Marcia@Marcia.com"),
("Janaina", "Janaina@Janaina.com");

insert into cur_cursos (cur_nome) values ("Análise e Desenvolvimento de Sistemas"), ("Gestão de Empresas");
insert into cur_cursos (cur_nome) values ("GTI"), ("DS");

-- Inner join: junção das duas tabelas. Para saber cursos que tem alunos e alunos que tem cursos.
-- alunos sem cursos ou cursos sem alunos não são trazidos nesse contexto.
-- Está na intersecção dos dois conjuntos
select alu_alunos.alu_nome, cur_cursos.cur_nome
from alu_alunos
inner join cur_cursos on alu_alunos.cur_id = cur_cursos.cur_id;

-- left join: traz todos os dados da tabela da esquerda
-- todos os alunos retornam e os alunos com cursos também
select alu_alunos.alu_nome,cur_cursos.cur_nome 
from alu_alunos
left join cur_cursos on alu_alunos.cur_id = cur_cursos.cur_id;

-- right join: traz todos os dados da tabela a direita
-- todos os cursos retornam e os cursos com alunos também
-- cursos sem alunos, alu_nome aparece como null
select alu_alunos.alu_nome, cur_cursos.cur_nome 
from alu_alunos
right join cur_cursos on alu_alunos.cur_id = cur_cursos.cur_id;

-- retorna todos os alunos e todos os cursos
-- full outer join de outra maneira, pois o mysql nao suporta
select alu_alunos.alu_nome, cur_cursos.cur_nome
from alu_alunos
left join cur_cursos on alu_alunos.cur_id = cur_cursos.cur_id
union
select alu_alunos.alu_nome, cur_cursos.cur_nome
from alu_alunos
right join cur_cursos on alu_alunos.cur_id = cur_cursos.cur_id
where alu_alunos.cur_id is null;

-- anti left join: retorna os dados da tabela a esquerda que não tem nada correspondente na tabela direita
select alu_alunos.*
from alu_alunos
left join cur_cursos on alu_alunos.cur_id = cur_cursos.cur_id
where cur_cursos.cur_id is null;

-- anti right join: retorna dados da direita que não tem correspondentes na tabela esquerda
select cur_cursos.*
from alu_alunos
right join cur_cursos on alu_alunos.cur_id = cur_cursos.cur_id
where alu_alunos.alu_id is null;

-- anti outer join

-- cross join: combina cada linha da primeira tabela com cada linha da segunda
select alu_alunos.*, cur_cursos.*
from alu_alunos
cross join cur_cursos;


