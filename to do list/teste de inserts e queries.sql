insert into listas (nomeLista) values ("Mercado");
insert into listas (nomeLista) values ("Materiais escolares");
insert into listas (nomeLista) values ("Tarefas");
select * from listas;
truncate table listas;

select * from tarefas;
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (1, "Arroz", null , curdate(), "outro", "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (1, "Feijão", null , curdate(), "outro", "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (1, "Carne", null , curdate(), "outro", "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (1, "Batata", null , curdate(), "outro", "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (2, "Grafite de lapizeira", "2.0", curdate(), "pessoal", "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (2, "Caderno do batman", "10 matérias", curdate(), "pessoal", "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (2, "Borracha", null , curdate(), "pessoal", "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (2, "Apontador", null, curdate(), "pessoal", "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (3, "Cortar a grama", "Apenas a parte de trás do quintal", curdate(), "pessoal", "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (3, "Fazer a lição de casa", null, curdate(), "pessoal", "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) values (3, "Varrer a casa", "só o andar de baixo", curdate(), "pessoal", "nao feito");
TRUNCATE TABLE tarefas;
select
	*
from
	tarefas;
    
update tarefas
set status = "feito"
where pk_idTarefa = 5