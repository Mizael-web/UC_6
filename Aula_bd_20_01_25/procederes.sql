

-- criar procedure para tabela autor
-- https://www.postgresql.org/docs/current/sql-createprocedure.html

CREATE or replace procedure insert_novo_autor(
   nome CHAR,
   nacionalidade CHAR,
   data_nascimento DATE
)
LANGUAGE SQL
AS $$
INSERT INTO autor(nome, nacionalidade, data_nascimento)
VALUES (nome, nacionalidade, data_nascimento);
$$;

-- apos inserir vai no procedures clica e no insert_novo_autor clica botão direito
-- vai em scripts exec scripts 

CALL public.insert_novo_autor(
	<IN nome character>,  --' Paulo Freire',
	<IN nacionalidade  character>,-- ' brasileiro',
	<IN data_nascimento  date> -- '1959-05-20'
	)
	-- so alterar os valores

	-- criar procedure  categoria
-- criar procedure


CREATE or replace procedure insert_nova_categoria(
   nome VARCHAR,
   descricao VARCHAR
)
LANGUAGE SQL
AS $$
INSERT INTO categoria (nome, descricao)
VALUES (nome, descricao);
$$;

-- apos inserir vai no procedures clica e no insert_novo_autor clica botão direito
-- vai em scripts exec scripts 

CALL public.insert_nova_categoria(
	<IN nome character varying>,
	<IN descricao  character varying>
)
-- so alterar os valores

-- criar atualizalão

select * from unidade


create or replace procedure update_telefone_unidade(
id_unidade integer,
telefone_unidade VARCHAR    
) language sql
as $$
update unidade
set telefone = telefone_unidade
where id = id_unidade
$$;

-- criar deletar 


create or replace procedure delete_livro(
id_livro integer, 
) language sql
as $$
delete from livro
where id = id_livro
$$;