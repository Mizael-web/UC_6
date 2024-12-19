begin;
create table autor (
  id serial primary key,
  nome varchar(60) not null, 
  data_nascimento date,
  constraint chk_data_nascimento check (data_nascimento <= CURRENT_DATE)-- SERVE PARA ARMAZENAR 
  --UM ARQUIVO TEMPORARIO CHK_DATA_NASCIMENTO PARA DEPOIS IR PARA COLUNA DATA_NASCIMENTO
);


CREATE TABLE livro (
  id serial primary key,
  titulo varchar(60) not null,
  id_autor int,
  ano_publicacao int,
  CONSTRAINT fk_autor_livro FOREIGN KEY (id_autor) REFERENCES autor (id) ON DELETE CASCADE,
  constraint chk_ano_publicacao check (ano_publicacao >=1500 and ano_publicacao <= EXTRACT (YEAR FROM CURRENT_DATE))
  );

  
create table usuario (
  id serial primary key,
  nome varchar(60) not null,
  email varchar(60) UNIQUE,
  data_adesao date
  constraint chk_data_adesao check (data_adesao <= CURRENT_DATE)
  );


   create table emprestimo(
  id serial primary key,
  id_livro int,
  id_usuario int,
  data_emprestimo date not null, 
  data_devolucao date, 
    constraint fk_livro foreign key (id_livro ) references livro (id),
	constraint cfk_usuario foreign key (id_usuario ) references usuario(id),
    constraint chk_data_entrega check ( data_emprestimo <= data_devolucao),
    constraint uq_livro_emprestimo unique (id_livro, data_emprestimo)
  ); 


  INSERT INTO autor ( nome, data_nascimento)
  values
  ('Rubem Fonseca', '25/12/1980'),
  ('Lugia Fagundes', '06/02/1971'),
  ('João Cabral', '04/10/1982'),
  (' Cecilia Meireles', '06/09/1978'),
  (' Cavalcante Sales', '24/04/2000');

  

  
   INSERT INTO livro ( titulo, id_autor,  ano_publicacao)
  values
  ('feliz ano novo', '1', '1975'),
  ('ciranda de pedra','2' , '1954'),
  ('Morte e vida severina','3', '1955'),
  ('viagem', '4','1939'),
  ('a transas do rei careca', '5', '1984');



INSERT INTO  usuario (nome, email, data_adesao)
  values
  ('Joao', 'joao@gmail.com', '24/04/2024'),
  ('Luiz','luiz@gmail.com' , '12/12/1954'),
  ('Antonio','antonio@gmail.com',' 05/05/2020'),
  ('Eduardo','eduardo@gmail.com', '18/04/2000'),
  ('Carlos', 'carlos@gmail.com', '24/04/1984');

  

  
INSERT INTO emprestimo (id_livro, id_usuario, data_emprestimo, data_devolucao)
  values
  ('1', '1', '24/04/2000', '25/05/2024'),
  ('2','2','12/10/2020' , '15/10/2020'),
  ('3','3','25/06/2023',' 28/06/2023'),
  ('4', '4', '05/06/2015', '18/06/2015'),
  ('5', '5', '15/08/2022', '25/09/2022');


  select id_livro, id_usuario, data_emprestimo, data_devolucao
  from emprestimo;


-- lista toda tabela autor
select * from autor;

-- lista toda tabela livro
select *from livro;

-- liste todos os livros com seus respectivos autores
select livro.titulo, autor.nome
from autor
join livro on livro.id_autor = autor.id;

-- liste os usuarios e sejus emails
select nome, email from usuario;


select * from emprestimo;
-- liste todos os emprestimos realizados, incluindo informaçoes dos livros, usuario e datas
select usuario.nome, livro.titulo, emprestimo.data_emprestimo, emprestimo.data_devolucao
from emprestimo
join livro on id_livro = livro.id
join usuario on id_usuario = usuario.id;


-- liste os livro que ainda não forma devolvidos

select livro.titulo, emprestimo.data_devolucao
from emprestimo
join livro on id_livro = livro.id
where data_devolucao = null;

-- encontre os usuario que pediram emprestado livros do autor
select usuario.nome as nome_usuario,  livro.titulo, autor.nome as nome_autor
from emprestimo
join livro on id_livro = livro.id
join usuario on id_usuario = usuario.id
join autor on id_autor = autor.id
where autor.nome = 'João Cabral'


 


  rollback