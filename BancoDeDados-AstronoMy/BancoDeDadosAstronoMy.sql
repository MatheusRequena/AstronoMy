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
primary key(tentativa , fkUsuario , fkEstudo),
acertos int,
dtTentativa date
);



-- INSERÇÃO DE VALORES
INSERT INTO Usuario VALUES
(default , 'Matheus Requena' , 'matheus@gmail.com' , '11973850247' , '2006-01-14' , '#Theus14' , current_timestamp());

INSERT INTO Estudo VALUES 
(default , 'Meu peso em diferentes planetas' , 'Explicando a diferença de peso em diferentes gravidades' , 5),
(default , 'Curiosidades do sistema solar' , 'Alguns fatos interessantes sobre nosso sistema' , 13),
(default , 'Diferentes mundos pela galáxia' , 'Demonstrando alguns exoplanetas curiosos' , 7),
(default , 'Por que os astros giram?' , 'Explicando a rotação dos planetas e sua influência nas horas do dia' , 6);

INSERT INTO Notas VALUES
(default , 1 , 1000 , 2 , current_date()), 
(default , 1 , 1000 , 3 , current_date()), 
(default , 1 , 1001 , 4, current_date()), 
(default , 1 , 1001 , 8, current_date()), 
(default , 1 , 1002 , 4, current_date()), 
(default , 1 , 1003 , 4, current_date()), 
(default , 1 , 1003 , 4, current_date());


-- CONFIGURAÇÃO DAS CHAVES ESTRANGEIRAS
ALTER TABLE Notas
	ADD CONSTRAINT fkUsuarioNota foreign key (fkUsuario)
		REFERENCES Usuario (idUsuario);

ALTER TABLE Notas
	ADD CONSTRAINT fkEstudoNotas foreign key (fkEstudo)
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
	WHERE dtTentativa LIKE current_date() AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-01-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-02-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-03-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-04-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-05-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-06-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-07-%' AND email = 'matheus@gmail.com';

SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-08-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-09-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-10-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-11-%' AND email = 'matheus@gmail.com';
    
SELECT sum(acertos) as acertos FROM Tentativa
	JOIN Usuario
		ON fkUsuario = idUsuario
	WHERE dtTentativa LIKE '%-12-%' AND email = 'matheus@gmail.com';