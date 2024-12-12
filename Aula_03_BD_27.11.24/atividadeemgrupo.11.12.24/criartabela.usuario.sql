-- QUESTÃO 01 
-- Criação da tabela usuarios
-- Crie a tabela usuarios com os seguintes campos:

-- id (chave primária, auto-incrementada)
-- nome (obrigatório)
-- email (obrigatório, único)
-- senha (obrigatório)
-- data_cadastro (valor padrão: data atual).

CREATE TABLE IF NOT EXISTS usuarios(
    id serial primary key,
    nome varchar(60) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    senha varchar(16) NOT NULL,
    data_cadastro DATE DEFAULT(CURRENT_DATE)
); 


Criação da tabela categorias
Crie a tabela categorias com os seguintes campos:

id (chave primária, auto-incrementada)
descricao (obrigatório).


 

-- Inserir registros na tabela usuarios (3 REGISTROS) 

 

--  QUESTAO 5

Insert into usuarios (id, nome, email, senha) 

Values (1, ’João’, ‘joao@gmail.com’, ‘0123456’), (2, ‘Pedro’, ‘pedro@gmail.com’, ‘1234567’), (3, ‘Gabriel’, ‘gabriel@gmail.com’, ‘23456789’); 