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


-- Exclusão de lista		/ deu certo
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
call excluirLista(4);

-- Modificação de lista		/ deu certo
DELIMITER //
CREATE PROCEDURE modificarLista(
	IN listaAlterada int,
	IN novoNome varchar(30)
)
BEGIN
	DECLARE row_count INT;
    
    -- Verifica se a lista a ser modificada existe
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


-- Adição de tarefa		/ deu certo
DELIMITER //
CREATE PROCEDURE criarTarefa(
	IN lista int,
    IN tarefa varchar(30),
    IN descTarefa varchar(200),
    IN tipoTarefa enum("pessoal", "comercial", "outro")
)
BEGIN
	DECLARE row_count INT;

	-- Verifica se a lista especificada existe
    SELECT COUNT(*) INTO row_count FROM listas WHERE pk_idLista = lista;
    
    IF row_count > 0 THEN
		-- Se a lista existe inserire a tarefa na tabela de tarefas
		INSERT INTO tarefas (fk_idLista, nomeTarefa, descricao, dataCriacao, tipo, status) 
		VALUES (lista, tarefa, descTarefa, curdate(), tipoTarefa, "nao feito");
	ELSE
		-- Se a lista não existe, emite um aviso
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A lista especificada não existe.';
    END IF;
END // 
DELIMITER ;
drop procedure criarTarefa;
call criarTarefa(4, "banana", null, "pessoal");


-- Exclusão de tarefa		/ deu certo
DELIMITER //
CREATE PROCEDURE excluirTarefa(
	IN tarefaExcluida int
)
BEGIN
	DECLARE row_count INT;
    
    -- Verifica se a tarefa a ser excluída existe
    SELECT COUNT(*) INTO row_count FROM tarefas WHERE pk_idTarefa = tarefaExcluida;
    
    IF row_count > 0 THEN
        -- Se a tarefa existir ela será excluída
        DELETE FROM tarefas WHERE pk_idTarefa = tarefaExcluida;
    ELSE
        -- Se a tarefa não existe, emitirá um aviso
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A tarefa especificada não existe.';
    END IF;
END // 
DELIMITER ;
call excluirTarefa(1);


-- Modificação de tarefa (nome, desc, tipo)		/ deu certo
DELIMITER //
CREATE PROCEDURE modificarTarefa(
	IN tarefa int,
    IN novoNome varchar(30),
    IN novaDesc varchar(200),
    IN novoTipo enum("pessoal", "comercial", "outro")
)
BEGIN
	DECLARE row_count INT;

	-- Verifica se a tarefa a ser modificada existe
    SELECT COUNT(*) INTO row_count FROM tarefas WHERE pk_idTarefa = tarefa;
    
    IF row_count > 0 THEN
        -- Se a tarefa existir ela será modificada
        UPDATE tarefas
		SET nomeTarefa = novoNome,
		descricao = novaDesc,
		tipo = novoTipo
		WHERE pk_idTarefa = tarefa;
    ELSE
        -- Se a tarefa não existe, emitirá um aviso
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A tarefa especificada não existe.';
    END IF;
	
END // 
DELIMITER ;
call modificarTarefa(1, "Arroz", null, "Outro");


-- Alterar status para feito		/ deu certo
DELIMITER //
CREATE PROCEDURE marcarFeito(
	IN tarefaFeita int
)
BEGIN
	DECLARE row_count INT;

	-- Verifica se a tarefa que será marcada como feita existe
    SELECT COUNT(*) INTO row_count FROM tarefas WHERE pk_idTarefa = tarefaFeita;
    
    IF row_count > 0 THEN
        -- Se a tarefa existir ela será marcada como feita
        UPDATE tarefas
		SET status = "feito"
		WHERE pk_idTarefa = tarefaFeita;
    ELSE
        -- Se a tarefa não existe, emitirá um aviso
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A tarefa especificada não existe.';
    END IF;
END // 
DELIMITER ;
drop procedure marcarFeito;
call marcarFeito(2);


-- Alterar status para nao feito		/ deu certo
DELIMITER //
CREATE PROCEDURE desmarcarFeito(
	IN tarefaNaoFeita int
)
BEGIN
	DECLARE row_count INT;

	-- Verifica se a tarefa que será marcada como nao feita existe
    SELECT COUNT(*) INTO row_count FROM tarefas WHERE pk_idTarefa = tarefaNaoFeita;
    
    IF row_count > 0 THEN
        -- Se a tarefa existir ela será marcada como nao feita
        UPDATE tarefas
		SET status = "nao feito"
		WHERE pk_idTarefa = tarefaNaoFeita;
    ELSE
        -- Se a tarefa não existe, emitirá um aviso
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A tarefa especificada não existe.';
    END IF;
END // 
DELIMITER ;
drop procedure desmarcarFeito;
call desmarcarFeito(3);