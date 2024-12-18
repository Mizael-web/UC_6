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
    constraint chk_livro check (id_livro ) reference licro (id),
	constraint chk_usuario check (id_usuario ) reference usrario(id),
    constraint chk_data_entrega CHECK ( data_emprestimo <= data_devolucao);
    constraint chk_data_entrega  check (daentregata_emprestimo < CURRENT_DATE)
  ); 




rollback
commit;
