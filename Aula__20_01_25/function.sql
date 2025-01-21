
-- criar funcão para pegar total de livros

select count (id) as total_livro from livro

create or replace function total_livro()-- se precisar passar parametro precisa do nome e tipo. ex. titulo varchar
returns int as $$

begin
    return (select count (*) as total_livro from livro);	
end;
$$ language plpgsql; 

-- apos inserir a função vai no function clica _total_livro clica botão direito
-- vai em scripts select scripts 

SELECT public.total_livro()  

-- criar funcão para pegar total de usuario
--https://www.postgresql.org/docs/current/sql-createfunction.html

create or replace function listar_usuario () returns
table (id_user integer, nome_user varchar, email_user varchar, telefone_user varchar, endereco_user text, data_cadastro_user timestamp)
as $$
begin
  return query
  select usuario.id, usuario.nome, usuario.email, usuario.telefone, usuario.endereco,usuario.data_cadastro
  from usuario;
  end;
$$ language plpgsql; 

select * from listar_usuario ()


-- listar usuario por id
create or replace function listar_usuario_por_id (id_user integer ) 
returns table (id_usuario integer, nome_user varchar, email_user varchar, telefone_user varchar, endereco_user text, data_cadastro_user timestamp)
as $$
begin
  return query
  select *
  from usuario
  where id= id_user;
  end;
$$ language plpgsql; 

select * from listar_usuario_por_id(8)


create or replace function listar_livro_por_id (id_user integer ) 
returns table (id_livro integer, titulo_livro varchar, id_autor integer, id_categoria integer, ano_publicacao integer, numero_paginas integer, disponivel boolean, id_unidade integer)
as $$
begin
  return query
  select *
  from livro
  where id= id_user;
  end;
$$ language plpgsql;


select * from listar_livro_por_id (110)