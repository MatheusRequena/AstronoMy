-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE AstronoMy;
USE AstronoMy;
-- DROP DATABASE AstronoMy;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE Usuario (
idUsuario int primary key auto_increment,
nome varchar(100),
email varchar(320),
telefone char(11),
dtNasc date,
senha varchar(100),
dtCadastro datetime
);

CREATE TABLE Estudo (
idEstudo int primary key auto_increment,
nome varchar(100),
tema varchar(100),
qtdPerguntas int
) auto_increment = 1000;

CREATE TABLE Tentativa (
idTentativa int auto_increment,
fkUsuario int,
fkEstudo int,
primary key(idTentativa , fkUsuario , fkEstudo),
acertos int,
dtTentativa date
);



-- INSERÇÃO DE VALORES
INSERT INTO Usuario VALUES
(default , 'Matheus Requena' , 'matheus@gmail.com' , '11973850247' , '2006-01-14' , '#Theus14' , current_timestamp());

INSERT INTO Estudo VALUES 
(default , 'Meu peso em diferentes planetas' , 'Explicando a diferença de peso em diferentes gravidades' , 5),
(default , 'Curiosidades do sistema solar' , 'Alguns fatos interessantes sobre nosso sistema' , 13),
(default , 'Diferentes mundos pela galáxia' , 'Demonstrando alguns exoplanetas curiosos' , 7);

INSERT INTO Tentativa VALUES
(default , 1 , 1000 , 2 , '2024-01-03'), 
(default , 1 , 1000 , 3 , '2024-01-05'), 
(default , 1 , 1002 , 5 , '2024-01-05'), 
(default , 1 , 1002 , 2 , '2024-01-17'), 
(default , 1 , 1002 , 2 , '2024-02-01'), 
(default , 1 , 1001 , 7 , '2024-02-05'), 
(default , 1 , 1001 , 8 , '2024-02-06'), 
(default , 1 , 1000 , 4, '2024-03-18'), 
(default , 1 , 1001 , 7, '2024-03-12'), 
(default , 1 , 1001 , 8, '2024-03-08'), 
(default , 1 , 1001 , 10, '2024-03-24'), 
(default , 1 , 1000 , 4, '2024-04-21'), 
(default , 1 , 1000 , 5, '2024-04-14'), 
(default , 1 , 1001 , 11, '2024-04-25'), 
(default , 1 , 1000 , 5, '2024-04-07'), 
(default , 1 , 1001 , 12, '2024-04-07'), 
(default , 1 , 1002 , 6, '2024-04-07'), 
(default , 1 , 1000 , 5 , '2024-05-02'), 
(default , 1 , 1001 , 13 , '2024-05-13'), 
(default , 1 , 1002 , 7 , '2024-05-22');


-- CONFIGURAÇÃO DAS CHAVES ESTRANGEIRAS
ALTER TABLE Tentativa
	ADD CONSTRAINT fkUsuarioTentativa foreign key (fkUsuario)
		REFERENCES Usuario (idUsuario);

ALTER TABLE Tentativa
	ADD CONSTRAINT fkEstudoTentativa foreign key (fkEstudo)
		REFERENCES Estudo (idEstudo);
        

        
-- VISUALIZAÇÃO DE DADOS DAS TABELAS
-- VISUALIZAÇÃO INDIVIDUAL
SELECT * FROM Usuario;
SELECT * FROM Estudo;
SELECT * FROM Tentativa;

-- VISUALIZAR DADOS DOS ESTUDOS E SUAS NOTAS
SELECT * FROM Estudo
	JOIN Tentativa
		ON fkEstudo = idEstudo;
        
-- SELECIONAR DADOS DOS ESTUDOS E DADOS DOS USUARIOS QUE ESTUDARAM
SELECT * FROM Estudo
	JOIN Tentativa
		ON fkEstudo = idEstudo
	JOIN Usuario
		ON fkUsuario = idUsuario;
   
   
   
   
   
   







-- TESTE DE SELECTS PARA SITE
SELECT Usuario.nome , email , dtNasc , dtCadastro , sum(qtdPerguntas) as perguntas , sum(acertos) as acertos FROM Usuario
	LEFT JOIN Tentativa
		ON fkUsuario = idUsuario
	LEFT JOIN Estudo
		ON fkEstudo = idEstudo
	GROUP BY Usuario.nome , email , dtNasc , dtCadastro;
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE email = 'matheus@gmail.com';