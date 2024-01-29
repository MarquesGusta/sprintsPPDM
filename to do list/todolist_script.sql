create database toDoList;

use toDoList;

drop database toDoList;

create table listas(
	pk_idLista int PRIMARY KEY AUTO_INCREMENT,
    nomeLista varchar(30) NOT NULL
);

create table tarefas(
	pk_idTarefa int PRIMARY KEY AUTO_INCREMENT,
    fk_idLista int NOT NULL,
    nomeTarefa varchar(30) NOT NULL,
    descricao varchar(200),
    dataCriacao date NOT NULL,
    dataEntrega date,
    status enum("feito", "nao feito") NOT NULL DEFAULT "nao feito",
    
    FOREIGN KEY(fk_idLista) REFERENCES listas(pk_idLista)
);