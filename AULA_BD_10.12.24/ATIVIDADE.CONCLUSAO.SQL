--QUESTÃO 1, 2
create table if not exists GENERO (
 ID SERIAL primary key,
 NOME VARCHAR (60) not null unique
);

create table if not exists filme (
 ID SERIAL  primary key,
 NOME VARCHAR (60) not null,
 ID_GENERO  int not null,
constraint fk_genero foreign key (ID_GENERO) references GENERO(ID)
);


insert into GENERO (ID, NOME)
values (1, 'ANIMAÇÃO'), (2, 'TERROR'), (3, 'ACAO'), (4, 'DRAMA'), (5, 'COMEDIA');

 -- QUESTAO 3 - Criar mais 5 registros na tabela movies
insert into FILME (ID, NOME,ID_GENERO)
values
(10,'BATMAN', 3),(20,'THE BATTLE OF THE DARK TIVER', 3),(30,'WHITE DUCK', 1),(40,'BREAKING BARRIERS', 4),(50,'THE TWO HOURS', 2);


-- QUESTÃO O4 Criar mais dois registros na tabela genres 

insert into GENERO (ID, NOME )
VALUES ( 6, 'DOCUMENTO'), (7, 'SUSPENSE');

-- QUESTÃO O5  Criar uma consulta que retorne todos os filmes do gênero Horror
insert into FILME (ID,NOME,ID_GENERO)
values 
(60 , 'BATMAN  O RETORNO', 3),(70, 'MOANA', 7),(80, 'PATO DONALD', 1),(90,'HULK', 2),(100, 'TROPA DE ELITE', 6);

-- -- QUESTÃO 06
-- insert into GENERO (ID, NOME )
-- VALUES ( 6, 'DOCUMENTO'), (7, 'SUSPENSE');

-- QUESTÃO 06  Criar uma consulta que retorne todos os filmes do gênero Horror ou Drama
select NOME from FILME
where id_genero = (select id from genero where nome = 'TERROR');


-- QUESTÃO 07  Criar uma consulta que retorne todos os filmes 

select NOME from FILME
where id_genero = (select id from genero where nome = 'TERROR')
or id_genero = (select id from genero where nome = 'DRAMA');

-- ALTER TABLE FILME ADD CONSTRAINT NOME_FILME UNIQUE(NOME);



-- QUESTÃO 08 criar uma consulta que retorne todos os gêneros 
select *from GENERO;

select *from FILME
WHERE NOME LIKE '%T%';

--QUESTÃO 09  Criar uma consulta que retorne todos os filmes que começam com a letra T
SELECT *FROM FILME WHERE NOME ILIKE 'T%';

--QUESTÃO 10  Atualizar todos os filmes do gênero Action para Drama

UPDATE FILME
SET ID_GENERO=4
WHERE ID_GENERO = 3;

select *from FILME

UPDATE FILME
  SET ID_GENERO = (SELECT ID FROM GENERO WHERE NOME = 'ACAO')
  WHERE ID_GENERO = (SELECT ID FROM GENERO WHERE NOME = 'DRAMA');

select *from FILME

-- questão 11  Criar uma consulta que retorne o nome de todos os filmes e o nome do gênero
select filme.nome as nome_do_filme,  genero.nome as genero from filme, genero 
where id_genero = genero.id
order by filme.nome;

select filme.nome as filme_nome,
genero.nome as genero_nome
from filme join genero  on filme.id_genero = genero.id
order by filme.nome;

-- questão 12  Criar um código SQL que delete todos os filmes do gênero Action

delete from filme
where id_genero = (select id from genero where nome = 'acao');

select *from filme;

