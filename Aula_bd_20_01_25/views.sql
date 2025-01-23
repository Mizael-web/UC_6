
	-- criar uma view que retorna todos aluno - conexao
	--https://www.postgresql.org/docs/current/sql-createview.html
CREATE VIEW vw_aluno as
SELECT * from aluno;

-- criar uma view que retorna todos os alunos
CREATE VIEW vw_cliente as
SELECT * from cliente;




-- criar uma view que retorna todos os alunos 07 a 09/01/25
CREATE VIEW vw_cliente as
SELECT * from cliente;

CREATE VIEW vw_funcionarios as
SELECT * from funcionario;


CREATE VIEW vw_produtos as
SELECT * from produto;


-- atividade avalizaçao
CREATE VIEW vw_autores as
SELECT * from autor;


CREATE VIEW vw_categorias as
SELECT * from categoria;


CREATE VIEW vw_unidades as
SELECT * from unidade;

CREATE VIEW vw_livros as
SELECT * from livro;


CREATE VIEW vw_usuarios as
SELECT * from usuario;