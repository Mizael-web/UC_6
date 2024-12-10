
CREATE TABLE IF NOT EXISTS USUARIO (
id SERIAL PRIMARY KEY, 
nome VARCHAR(60) NOT NULL,
email VARCHAR (60) UNIQUE NOT NULL,
data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS EDITORA (
id  serial  PRIMARY KEY,
nome VARCHAR (60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS GENERO (
id  SERIAL  PRIMARY KEY,
DESCRICAO  VARCHAR (100)  NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS LIVRO (
id SERIAL PRIMARY KEY,
titulo VARCHAR (60) NOT NULL,
quantidade_disponivel INT NOT NULL CHECK ( QUANTIDADE_DISPONIVEL >=0),
ID_EDITORA INT NOT NULL,
id_genero INT NOT NULL,
CONSTRAINT fk_LIVROS_EDITORA FOREIGN KEY (ID_EDITORA) REFERENCES EDITORA (ID) ON DELETE CASCADE,
CONSTRAINT fk_LIVROS_GENERO FOREIGN KEY (ID_GENERO) REFERENCES GENERO (ID) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS EMPRESTIMO (
  id SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_livro INT NOT NULL,
  data_emprestimo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  data_devolucao  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_EMRESTIMO_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID) ON DELETE CASCADE,
  CONSTRAINT fk_EMPRESTIMO_LIVRO FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO (ID) ON DELETE CASCADE

);

\d usuario

-- • Adicione um campo para armazenar o telefone dos usuários
-- ALTER TABLE USUARIOS ADD TELEFONRE CAR  not null;
alter table usuario add column telefone char (11)  default 'nenhum';

-- • Altere o tamanho do campo titulo na tabela livros para comportar até 
-- 200 caracteres
alter table livro alter column titulo type varchar (200);
\d livro

-- • Remova o campo data_cadastro da tabela usuarios, pois ele não será 
-- mais utilizado
alter table usuario drop data_cadastro; 
-- \d usuario
alter table livro add constraint uq_livro_titulo_editora UNIQUE (titulo, id_editora);

-- -- \d usuario
-- \d livro
-- garantir que as datas de emprestimos e devolução sejam distintas e validas

alter table emprestimo add constraint chk_data_devolucao CHECK (data_devolucao > data_emprestimo);
-- \d emprestimo

-- -- \dt
-- -- \d USUARIO
-- -- \d EDITORA
-- -- \d GENERO
-- -- \d LIVRO

-- inserção de dados na tabela

INSERT INTO usuario (id, nome, email,telefone)
VALUES ( 1, ' Valtemir' , 'valtemir@senac.br', '9999-9999'), (2,  ' Valtemir junior' , ' valtemir@senac.br','9855-9854' );
SELECT *FROM USUARIO;


INSERT INTO EDITORA (ID, NOME)
VALUES (1, 'SENAC'), (2, 'sesc'),(3, 'Mundo'), (4,  'Dark Side');
SELECT *from editora;

INSERT INTO GENERO (id, DESCRICAO)
VALUES (1,'terror'), (2, 'drama'), (3, 'Romance'), (4, 'Infantil');
SELECT *from genero;

INSERT into LIVRO ( titulo, quantidade_disponivel, id_editora, id_genero)
VALUES
('lar doce lar', 8, 1, 4),
('Seu lar',3,3, 4),
('La Paz', 7, 4, 1),
('Brasil', 9, 4, 2),
('MOANA', 8 ,3, 3);
SELECT *from livro;



INSERT INTO EMPRESTIMO (ID_USUARIO, ID_LIVRO, DATA_DEVOLUCAO)
VALUES
(1,4,'2024-12-06'),
(1,5,'2024-12-06');
SELECT *FROM EMPRESTIMO;