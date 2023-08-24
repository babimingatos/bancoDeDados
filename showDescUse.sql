show databases; -- mostra todas as bases

use sys; -- entrar no banco escolhido, tudo o que for feito depois disso, vai mexer com o banco

-- use nomeDoOutroBanco; mudar de banco (só rodar o use dnv)

show tables; -- primarios

describe host_summary; -- ver colunas/ estrutura de uma tabela, pode ser 
-- num order by, o DESC é decrescente, é bom usar DESCRIBE no caso acima

-- depois do describe, aparecem as colunas (como está formada a tabela)

-- saindo do DDL

 select * from table_scan;

-- ----------------------

SHOW CREATE TABLE sys; 
