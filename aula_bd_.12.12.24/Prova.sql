-- Tabela CLIENTES
CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20)NOT NULL UNIQUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP --(realiza um DATE e um TIME em anos, meses, dias, horas, minutos, segundos e frações de um segundo.)
);

-- Tabela SERVIÇOS
CREATE TABLE IF NOT EXISTS servicos(
    id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
	descricao text NOT NULL,
	preco decimal (10,2) NOT NULL CHECK ( PRECO > 0),
	tipo_servico VARCHAR (50) NOT NULL CHECK (tipo_servico IN ('CONSULTORIA', 'SUPORTE', 'MANUTENCAO'))   
);

-- Tabela TECNICOS
CREATE TABLE IF NOT EXISTS tecnicos(
    id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
	especialidade VARCHAR (50) NOT NULL,
	data_contratacao DATE NOT NULL  
);

--Tabela CHAMADAS
CREATE TABLE IF NOT EXISTS chamadas (
    id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    clientes_id INT  NOT NULL references clientes (id) on delete cascade,
	tecnicos_id INT  NOT NULL references tecnicos (id) on delete cascade,
    servicos_id INT  NOT NULL references servicos (id) on delete cascade,	
    data_chamada DATE NOT NULL,
	status VARCHAR(20) NOT NULL CHECK ( STATUS IN ('PENDENTE', 'EM ANDAMENTO', ' FINALIZADO')),
    descricao text NOT NULL	
);  


--Tabela PAGAMENTOS
CREATE TABLE IF NOT EXISTS pagamentos (
    id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    clientes_id INT  NOT NULL references clientes (id) on delete cascade,
	chamadas_id INT  NOT NULL references chamadas (id) on delete cascade,
    valor_pago DECIMAL (10,2) NOT NULL CHECK (valor_pago >0 ),
	data_pagamento DATE NOT NULL,
	forma_pagamento VARCHAR (50) NOT NULL		
);  



-- dados insert

INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES
('João Silva','joao@email.com', '(11) 98765-4321', '2023-01-15' ),
('Maria Oliveira','maria@email.com', '(21) 99654-3210', '2023-02-20' ),
('Pedro Souza','pedro@email.com', '(31) 99765-1234', '2023-03-10' ),
('Ana Costa','ana@email.com', '(41) 98888-999', '2023-04-25' ),
('Lucas Almeida','lucas@email.com', '(61) 99123-4567', '2023-05-30' );

INSERT INTO servicos (nome, descricao, preco, tipo_servico	)
VALUES
('Consultoria em TI','Consultoria especializada em infraestrutura de TI', '500.00', 'Consultoria' ),
('Manutenção de Equipamentos','Manutenção preventiva e corretiva de equipamentos', '300.00', 'Manutenção' ),
('Suporte Técnico','Suporte remoto e presencial para empresas', '200.00', 'Suporte' );

INSERT INTO tecnicos (nome, especialidade, data_contratacao)
VALUES
('Carlos OliveirsI','consultoria TI', '20200-10-10'),
('Fernanda Souza','Manutenção', '2021-06-15' ),
('Roberto Costa', 'Suporte Técnico', '2020-08-20' );



INSERT INTO chamadas (cliente_id, tecnicos_id, servicos_id,data_cadastro, status, descricao)
VALUES
('1','1', '1', '2023-06-01', 'aberto','Fiação de casa queimada'),
('2','2', '2', '2023-07-10',' em andamento', 'Vazamento na tubulação' ),
('3','3', '3', '2023-08-05', 'concluído', 'Reparação no ar-condicionado' ),
('4','1', '2', '2023-09-20', 'aberto', 'Manutenção no servidor' ),
('5','2', '1', '2023-10-15', 'concluído', 'Suporte para software' ); 


INSERT INTO pagamentos (cliente_id, chamadas_id, valor_pago, data_pagamento, forma_pagamento)
VALUES
('1','1', '350.00', '023-06-15', 'transferencia bancaria'),
('2','2', '450.00', '2023-07-15', ' cartao de credito'),
('3','3', '600.00', '2023-08-10', ' transferencia bancaria'),
('4','4', '300.00', '2023-09-25', 'cartao de credito');

-- QUESTÃO 04 - Liste o nome e e-mail de todos os clientes cadastrados.
SELECT nome, email
 FROM clientes

-- QUESTÃO 05 - Recupere os nomes dos serviços disponíveis e seus respectivos preços.

SELECT nome, preco
from servicos

-- QUESTÃO 06 -  Exiba os nomes e especialidades de todos os técnicos
SELECT nome, especialidade
from tecnicos

 -- QEUSTÃO 7. Mostre a descrição e o status de todos os chamados registrados.
 SELECT descricao, status
 from chamadas

 -- QUESTÃO 8. Liste os valores pagos e as datas de pagamento de todos os registros na tabela de pagamentos.
 SELECT valor_pago, data_pagamento
 from pagamentos

 -- QUESTAO 9. Liste os nomes dos clientes e as descrições de seus chamados que estão com o status "Em Andamento"

 
 SELECT nomes, descricao 
 FROM chamadas
 JOIN clientes ON chamadas
 