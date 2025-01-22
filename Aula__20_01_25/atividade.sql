
-- 1-listar todos os livros com autores e categorias
CREATE VIEW vw_livro_com_autores_e_categorias as
SELECT 
   livro.id as id_livro,
   livro.titulo,
   autor.nome as autor_nome,
   categoria.nome as categoria_nome
from 
livro
join autor on livro.id_autor = autor.id
join categoria on livro.id_categoria = categoria.id;
select * from vw_livro_com_autores_e_categorias

-- 2. Crie uma view que exiba os livros disponíveis com título, unidade e categoria

CREATE VIEW vw_livro_com_titulo_unidade_e_categorias as
SELECT 
   livro.id as id_livro,
   livro.titulo,
   unidade.nome as unidade_nome,
   categoria.nome as categoria_nome
from 
livro
join unidade on livro.id_unidade = unidade.id
join categoria on livro.id_categoria = categoria.id;
select * from vw_livro_com_titulo_unidade_e_categorias


-- 3 Crie uma View para listar os usuários e o total de empréstimos realizados por cada um.

CREATE VIEW usuarios_emprestimos AS
SELECT 
    usuario.nome, 
    COUNT(emprestimo.id) AS total_emprestimos
FROM 
    usuario
JOIN emprestimo ON usuario.id = emprestimo.id_usuario
GROUP BY 
    usuario.nome;
	
select * from usuarios_emprestimos 

-- 4 Crie uma View que mostre os empréstimos atrasados com os nomes dos usuários e os títulos dos livros.

CREATE VIEW emprestimos_atrasados AS
SELECT 
    usuario.nome AS usuario, 
    livro.titulo, 
    emprestimo.data_devolucao
FROM 
    emprestimo
JOIN usuario ON emprestimo.id_usuario = usuario.id
JOIN livro ON emprestimo.id_livro = livro.id
WHERE 
    emprestimo.data_devolucao < CURRENT_DATE 
    AND emprestimo.devolvido = FALSE;

select * from  emprestimos_atrasados
-- 5 Crie uma View para exibir o nome das unidades e o total de livros disponíveis em cada uma.

CREATE VIEW unidades_livros_disponiveis AS
SELECT 
    unidade.nome AS unidade, 
    COUNT(livro.id) AS total_livros_disponiveis
FROM 
    unidade
JOIN livro ON unidade.id = livro.id_unidade
WHERE 
    livro.disponivel = TRUE
GROUP BY 
    unidade.nome;
    
    select * from unidades_livros_disponiveis 
    
-- 6 Crie uma View que exiba todos os autores com o número total de livros publicados.

CREATE VIEW autores_total_livros_publicados AS
SELECT 
    autor.nome, 
    COUNT(livro.id) AS total_livros
FROM 
    autor
JOIN livro ON autor.id = livro.id_autor
GROUP BY 
  autor.nome;
 
     select * from autores_total_livros_publicados
-- 7 Crie uma View  para listar todos os emprestimos com o status de devolução (devolvido ou não)

CREATE VIEW emprestimos_status AS
SELECT 
    emprestimo.id, 
    usuario.nome AS usuario, 
    livro.titulo, 
    CASE 
        WHEN emprestimo.devolvido = TRUE THEN 'Devolvido'
        ELSE 'Não devolvido'
    END AS status_devolucao
FROM 
    emprestimo
JOIN usuario ON emprestimo.id_usuario = usuario.id
JOIN livro ON emprestimo.id_livro = livro.id;

      select * from emprestimos_status

-- 8 Crie uma View para listar os livros categorizados por ano de publicação, ordenados do mais recente para o mais antigo

CREATE VIEW livros_por_ano_publicacao AS
SELECT 
    livro.titulo, 
    livro.ano_publicacao, 
    categoria.nome AS categoria
FROM 
    livro
JOIN categoria ON livro.id_categoria = categoria.id
ORDER BY 
    livro.ano_publicacao DESC;

	  select * from livros_por_ano_publicacao

-- 9 Crie uma View que mostre os bibliotecários e as unidades às quais estão associoados.

CREATE VIEW bibliotecarios_unidades AS
SELECT 
    bibliotecario.nome AS bibliotecario, 
    unidade.nome AS unidade
FROM 
    bibliotecario
INNER JOIN unidade ON bibliotecario.id_unidade = unidade.id;

        select * from bibliotecarios_unidades

-- 10 Crie uma View para exibir os usuários que nunca realizaram empréstimos.

CREATE VIEW usuarios_sem_emprestimos AS
SELECT 
    usuario.nome, 
    usuario.email
FROM 
    usuario
JOIN emprestimo ON usuario.id = emprestimo.id_usuario
WHERE 
    emprestimo.id IS NULL;

	select * from usuarios_sem_emprestimos



-- PROCEDURES
--1 Crie uma procedure para adicionar um novo autor ao banco de dados.
CREATE or replace procedure insert_novo_autor(
	IN nome varchar,
	IN nacionalidade varchar,
	IN data_nascimento date
	)
LANGUAGE SQL
AS $$
INSERT INTO autor(nome, nacionalidade, data_nascimento)
VALUES (nome, nacionalidade, data_nascimento);
$$;

-- 2. Crie uma procedure para registrar um novo empréstimo, verificando se o livro está
--disponível.

CREATE or replace procedure insert_novo_emprestimo(
	IN id_usuario integer,
	IN id_livro integer,
	IN data_emprestimo timestamp,
    IN data_devolucao date,
	IN devolvido boolean	
	)
LANGUAGE SQL
AS $$
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao, devolvido)
VALUES (id_usuario, id_livro, data_emprestimo, data_devolucao, devolvido)
$$;
-- livro disponivel por emprestimo

SELECT 
    emprestimo.id_livro AS emprestimo_id_livro,
    COUNT(emprestimo.id_livro) AS Livro_disponivel
FROM emprestimo
LEFT JOIN livro ON emprestimo.id_livro = livro.id
GROUP BY emprestimo.id_livro;

--3. Crie uma procedure para devolver um livro, atualizando o status de devolução e a
-- disponibilidade.

CREATE or replace procedure insert_devolucao_emprestimo(
	IN id_usuario integer,
	IN id_livro integer,
	IN data_emprestimo timestamp,
    IN data_devolucao date,
	IN devolvido boolean	
	)
LANGUAGE SQL
AS $$
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao, devolvido)
VALUES (id_usuario, id_livro, data_emprestimo, data_devolucao, devolvido)
$$;

- atualizando o status de devolucao

CREATE OR REPLACE PROCEDURE update_data_devolucao(
	id_usuario INTEGER,
	id_livro INTEGER
) LANGUAGE SQL
AS $$
	UPDATE emprestimo	
	SET data_devolucao = data_devolucao
	WHERE id = id_usuario
$$;

-- atualilzando a disponibilidade
CREATE OR REPLACE PROCEDURE update_disponivel(
	 id INTEGER,
	 titulo VARCHAR
) LANGUAGE SQL
AS $$
	UPDATE LIVRO
	SET disponivel = disponivel
	WHERE id = id
$$;

--4. Crie uma procedure para excluir uma unidade, garantindo que os livros relacionados 
--sejam removidos. 

create or replace procedure delete_unidade(
id integer
) language sql
as $$
delete from unidade
where id = id
$$;


-- 5. Crie uma procedure para adicionar uma nova categoria à tabela de categorias. 
select * from categoria

CREATE or replace procedure insert_nova_categoria(
   nome VARCHAR,
   descricao VARCHAR
)
LANGUAGE SQL
AS $$
INSERT INTO categoria (nome, descricao)
VALUES (nome, descricao);
$$;














