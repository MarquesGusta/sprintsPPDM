-- Criação de lista		\ deu certo
DELIMITER //
CREATE PROCEDURE criarLista(
	IN novaLista varchar(30)
)
BEGIN
	INSERT INTO listas (nomeLista) values (novaLista);
END // 
DELIMITER ;
call criarLista("Frutas para comprar");


-- Exclusão de lista		/ ainda não criada
DELIMITER //
CREATE PROCEDURE excluirLista(
	IN listaExcluida int
)
BEGIN
	DECLARE row_count INT;
    
    -- Verifica se a lista a ser excluída existe
    SELECT COUNT(*) INTO row_count FROM listas WHERE pk_idLista = listaExcluida;
    
    IF row_count > 0 THEN
        -- Se a lista existe, as tarefas relacionadas serão excluídas primeiro
        DELETE FROM tarefas WHERE fk_idLista = listaExcluida;
        
        -- Em seguida, a lista em si será excluída
        DELETE FROM listas WHERE pk_idLista = listaExcluida;
    ELSE
        -- Se a lista não existe, emitirá um aviso
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A lista especificada não existe.';
    END IF;
END // 
DELIMITER ;


-- Modificação de lista		/ deu certo
DELIMITER //
CREATE PROCEDURE modificarLista(
	IN listaAlterada int,
	IN novoNome varchar(30)
)
BEGIN
	DECLARE row_count INT;
    
    -- Verificar se a lista a ser modificada existe
    SELECT COUNT(*) INTO row_count FROM listas WHERE pk_idLista = listaAlterada;
    
    IF row_count > 0 THEN
        -- Se a lista existe, o nome é atualizado
        UPDATE listas
        SET nomeLista = novoNome
        WHERE pk_idLista = listaAlterada;
    ELSE
        -- Se a lista não existe, emite um aviso
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A lista especificada não existe.';
    END IF;
END // 
DELIMITER ;
call modificarLista(4, "Frutas");


-- Adição de tarefa		/ ainda não criada
DELIMITER //
CREATE PROCEDURE criarLista(
	IN lista int,
    IN tarefa varchar(30),
    IN descTarefa varchar(200),
    IN criacao date , 
    IN entrega date,
    situacao enum("feito", "nao feito")
)
BEGIN
	INSERT INTO tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, dataEntrega, status) values (lista, tarefa, descTarefa, criacao, entrega, situacao);
END // 
DELIMITER ;


-- Exclusão de tarefa

-- Modificação de tarefa
-- nome

-- descriçãoptimize

-- data de entrega

-- retornar status nao feito

-- retornar status feito

-- Alterar status para feito

-- Alterar status para nao feito

-- Visualização da tarefa