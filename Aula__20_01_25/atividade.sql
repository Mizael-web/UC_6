
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

-- 3. Crie uma view para listar os usuários e o total de empréstimos realizados por cada um
-- 3. Crie uma view para listar os usuários e o total de empréstimos realizados por cada um
create  view listar_usuario_e_total_de_emprestimo  as
select
  usuario.id as id_usuario, 
  usuario.nome,
  emprestimo.data as emprestimo_data
  from
  usuario
  JOIN usuario  ON emprestimo.data = emprestimo_data
  GROUP BY usuario.id;

