create database meuprimeirobdads;

show databases;

use meuprimeirobdads; -- tudo o que for feito daqui para frente será no banco meuprimeirobdads
-- nome tipo caracteristica
create table pessoas (cpf varchar (12) primary key, 
					  nome varchar (100) not null, 
					  nascimento date not null,
                      email varchar (100) not null unique,
                      ativo enum ('ativo', 'inativo', 'aguardando') default 'aguardando' -- ativar ou desativar a pessoa, inativa ou ativa no sistema. Não pode excluir os dados.
                      );
-- no cpf, tem que ser 12 por causa de um problema somente do mysql
-- char é alfanumerico, tem tamanho fixo. se escrever zé, ele ocupa o maximo q foi descrito entre os parenteses ao inves de somente 2 caracteres. 
-- date (somente a data); 
-- datetime (pega a data e a hora)
-- time (só a hora)
-- enum é uma lista de valores, só pode entrar se estiver na lista


show tables;
describe pessoas;


-- TESTES DE ALTER 
use meuprimeirobdads;

-- codigo int primary key auto_increment
-- tabela sem pk é chamada de tabela fraca
create table produtus (codigo int,
					   nomi varchar (100) not null,
                       pressu datetime,
                       kkkkkk int
					  );
			
-- arrumando os erros
-- dml é exclusivo para linha INSERT, UPDATE e DELETE
-- ddl tabela como um todo create, insert, update (mesma logica semantica, mas para coisas diferentes)

-- trocando nomi

describe produtus;

alter table produtus rename to produtos;

describe produtos;
		
-- add pk, dentro dos parenteses pode ser um conjunto de pks
alter table produtos add primary key (codigo);
-- como agora tem pk na tabela, ela é uma strong table

-- drop pk
alter table produtos drop primary key;

-- drop column
alter table produtos drop column kkkkkk;

-- add column
alter table produtos add column cadastro datetime not null ; -- after nomi, coloca o cadastro antes de nomi

-- alter estrutura de atributos
alter table produtos modify column pressu decimal;
-- modify só altera o tipo de dado (de varchar para int, por exemplo), mas tá caindo em desuso

-- igual ao modify, mas esse faz os dois ao mesmo tempo, tem que reescrever o tipo, mesmo se ele n vai mudar. 
alter table produtos change column pressu preco decimal;

-- alter nomi
alter table produtos change column nomi nome varchar (100) not null;

-- vimos create, alter, show, drop

-- drop da tabela toda, exclui tudo
-- n tem rollback para strutura, só para linha no mysql
drop table produtos;

-- drop dabase inteira
drop database meuprimeirobdads;





