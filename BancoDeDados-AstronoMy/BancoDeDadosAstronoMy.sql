-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE AstronoMy;
USE AstronoMy;



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
qtdPergunta int
);

CREATE TABLE Notas (
tentativa int,
fkUsuario int,
fkEstudo int,
primary key(tentativa , fkUsuario , fkEstudo),
acertos int
);



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
SELECT * FROM Notas;
        
-- VISUALIZAR DADOS DOS ESTUDOS E SUAS NOTAS
SELECT * FROM Estudo
	JOIN Notas
		ON fkEstudo = idEstudo;
        
-- SELECIONAR DADOS DOS ESTUDOS E DADOS DOS USUARIOS QUE ESTUDARAM
SELECT * FROM Estudo
	JOIN Notas
		ON fkForum = idEstudo
	JOIN Usuario
		ON fkUsuario = idUsuario;