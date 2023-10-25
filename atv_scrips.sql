create database AtvScripts;

use AtvScripts;

create table usu_usuarios(
usu_codigo int auto_increment primary key,
usu_email varchar (60) not null unique,
usu_senha varchar (250) not null,
usu_ativo int (1) default 0 not null
);

insert into usu_usuarios (usu_email, usu_senha) values ('jasfd@gmail.com','123');
insert into usu_usuarios (usu_email, usu_senha,usu_ativo) values ('dhydhj@gmail.com','123',1);

select
usu_ativo as ativo_original,
if (usu_ativo = 0, 'NÃO', 'SIM') as ativo_modificado
FROM Atvscripts.usu_usuarios;


select * from usu_usuarios;
