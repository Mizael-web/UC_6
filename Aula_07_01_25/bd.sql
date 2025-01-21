-- Tabela CLIENTE
CREATE TABLE IF NOT EXISTS cliente (
    id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR (11) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP --(realiza um DATE e um TIME em anos, meses, dias, horas, minutos, segundos e frações de um segundo.)
);

-- Tabela PRODUTO
CREATE TABLE IF NOT EXISTS produto  (
    id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    descricao text NOT NULL,
    preco decimal (10,2) NOT NULL CHECK ( PRECO > 0),
    qtde INT NOT NULL CHECK ( QTDE > 0),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP --(realiza um DATE e um TIME em anos, meses, dias, horas, minutos, segundos e frações de um segundo.)
);

-- Tabela FUNCIONARIO
CREATE TABLE IF NOT EXISTS funcionario (
   id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR (11) NOT NULL UNIQUE,
    cargo VARCHAR (30) NOT NULL,
    salario decimal (10,2) NOT NULL CHECK ( SALARIO > 0),
    email VARCHAR(100) NOT NULL UNIQUE,
    data_admissao TIMESTAMP DEFAULT CURRENT_TIMESTAMP --(realiza um DATE e um TIME em anos, meses, dias, horas, minutos, segundos e frações de um segundo.)
    );