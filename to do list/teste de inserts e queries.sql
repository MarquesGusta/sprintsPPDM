insert into listas (nomeLista) values ("Mercado");
insert into listas (nomeLista) values ("Materiais escolares");
insert into listas (nomeLista) values ("Tarefas");
select * from listas;

select * from tarefas;
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (1, "Arroz", null , curdate(), null, "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (1, "Feijão", null , curdate(), null, "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (1, "Carne", null , curdate(), null, "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (1, "Batata", null , curdate(), null, "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (2, "Grafite de lapizeira", "2.0", curdate(), null, "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (2, "Caderno do batman", "10 matérias", curdate(), null, "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (2, "Borracha", null , curdate(), null, "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (2, "Apontador", null, curdate(), null, "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (3, "Cortar a grama", "Apenas a parte de trás do quintal", curdate(), "2024/01/23", "feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (3, "Fazer a lição de casa", null, curdate(), "2024-02-10", "nao feito");
insert into tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (3, "Varrer a casa", "só o andar de baixo", curdate(), "2024-01-25", "nao feito");

select
	*
from
	tarefas;
    
update tarefas
set status = "feito"
where pk_idTarefa = 5