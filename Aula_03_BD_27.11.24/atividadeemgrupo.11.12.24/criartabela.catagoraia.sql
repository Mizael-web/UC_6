-- QUESTÃO 02
-- Criação da tabela categorias
-- Crie a tabela categorias com os seguintes campos:

-- id (chave primária, auto-incrementada)
-- descricao (obrigatório) e único.

CREATE TABLE IF NOT EXISTS categorias(
    id serial primary key,
    descricao varchar(150) NOT NULL UNIQUE
);
-- QUESTAO 06 INSERIR REGISTROS NA TABELA CATEGORIA (SALARIO, ALIMENTAÇÃO, TRANSPORTE, EDUCAÇÃO E LAZER)

 

Insert  into categorias (id, descricao) 

Values (1, ‘Salário’), (2, ‘Alimentação’), (3,'Transporte’), (4,'Educação’), (5,'Lazer’); 