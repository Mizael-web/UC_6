
-- questão 3
-- Criação da tabela transacoes 

-- Crie a tabela transacoes com os seguintes campos: 

 

-- id (chave primária, auto-incrementada) 

-- usuario_id (chave estrangeira referenciando usuarios) 

-- categoria_id (chave estrangeira referenciando categorias) 

-- tipo (obrigatório, podendo ser 'Receita' ou 'Despesa') 

-- valor (obrigatório) 

-- data (valor padrão: data atual) 

-- descricao (opcional). 

 
create table if not exists transacao( 

   id SERIAL primary key, 

   Usuario_id int, 

   Categoria_id int, 

   Tipo char(8) not null check (tipo in (‘Receita’ , ‘Despesa’)) not null, 

   Valor numeric (10,2) not null, 

   Data DATE DEFAULT(CURRENT_DATE), 

   Descricao text,  

   Constraint fk_usuario foreign key (id_usuario) references usuario(id) on delete cascade, 

   Constraint fk_categoria foreign key (id_categoria) references categoria(id) on delete SET NULL 

 ); 
   
   --Questão 04 -Adicionar constraint para evitar descrições repetidas nas transações 

 --Adicione uma constraint que proíba transações do mesmo usuário com a mesma descrição na mesma data. 

 

ALTER TABLE TRANSACAO ADD CONSTRAINT BLOQUEAR_TRANSACAO_REPETIDA UNIQUE (id_usuario, descricao, data); 

--QUESTAO 04 - Adicione uma constraint para proibir que transações do tipo 'Despesa' tenham valor superior a 10.000.  

ALTER TABLE TRANSACAO ADD CONSTRAINT BLOQUEAR_DESPESA 
CHECK (TIPO = 'RECEITA' OR ( tipo = ‘Despesa’ AND VALOR <= 10000)); 

--Questão 7 - inserir 3 resgistros em transações usuario 01 valor de R$3000, vinculada à categoria Salário, Receita.  

Insert into transacao(id_usuario, id_categoria, tipo, valor, descricao) 

Values(1, 1, ‘Receita’, 3000, ‘Salario mensal’), (1, 2, ‘Despesa’, 500, ‘Alimentação’), (1, 2, ‘Despesa’, 1000, ‘Carro’); 



--  QUESTÃO 8 Liste todas as transações realizadas pelo usuário João (Trazer o nome e transações)  

SELECT * FROM TRANSACAO JOIN

USUARIOS ON TRANSACAO.id_usuario = USUARIOS.id 

WHERE USUARIOS.NOME =  ‘João’; 