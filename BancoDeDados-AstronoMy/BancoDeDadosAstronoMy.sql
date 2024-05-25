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
senha varchar(30),
dtCadastro datetime,
fkAmigo int
);

CREATE TABLE Forum (
idForum int primary key auto_increment,
nome varchar(50),
descricao varchar(250),
dtCriacao datetime
);

CREATE TABLE Participantes (
fkUsuario int,
fkForum int,
primary key(fkUsuario , fkForum),
posicao varchar(13),
CONSTRAINT chkPosicao check(posicao IN('Criador' , 'Administrador' , 'Comum'))
);

CREATE TABLE Comentario (
idComentario int,
fkUsuario int,
fkForum int,
comentario varchar(1000),
horario datetime
);



-- CONFIGURAÇÃO DAS CHAVES ESTRANGEIRAS
ALTER TABLE Usuario
	ADD CONSTRAINT fkUsuarioAmigo foreign key (fkAmigo)
		REFERENCES Usuario (idUsuario);
        
ALTER TABLE Participantes
	ADD CONSTRAINT fkUsuarioParticipante foreign key (fkUsuario)
		REFERENCES Usuario (idUsuario);

ALTER TABLE Participantes
	ADD CONSTRAINT fkForumParticipante foreign key (fkForum)
		REFERENCES Forum (idForum);
        
ALTER TABLE Comentario
	ADD CONSTRAINT fkUsuarioComentario foreign key (fkUsuario)
		REFERENCES Usuario (idUsuario);

ALTER TABLE Comentario
	ADD CONSTRAINT fkForumComentario foreign key (fkForum)
		REFERENCES Forum (idForum);
        
        

-- VISUALIZAÇÃO DE DADOS DAS TABELAS
-- VISUALIZAÇÃO INDIVIDUAL
SELECT * FROM Usuario;
SELECT * FROM Forum;
SELECT * FROM Participantes;
SELECT * FROM Comentario;

-- VISUALIZAR DADDOS DOS USUÁRIOS E DE SEUS RESPECTIVOS AMIGOS
SELECT * FROM Usuario
	JOIN Usuario as Amigo
		ON Usuario.fkAmigo = Amigo.idUsuario;
        
-- VISUALIZAR DADOS DOS FÓRUNS E SEUS PARTICIPANTES
SELECT * FROM Forum
	JOIN Participantes
		ON fkForum = idForum;
        
-- SELECIONAR DADOS DOS FÓRUNS E DADOS DE SEUS PARTICIPANTES
SELECT * FROM Forum
	JOIN Participantes
		ON fkForum = idForum
	JOIN Usuario
		ON fkUsuario = idUsuario;
        
-- SELECIONAR DADOS DOS USUÁRIOS E SEUS COMENTÁRIOS
SELECT * FROM Usuario
	JOIN Participantes
		ON Participantes.fkUsuario = idUsuario
	JOIN Comentario
		ON Comentario.fkUsuario = idUsuario;
        
-- SELECIONAR DADOS DOS FÓRUNS E SEUS COMENTÁRIOS
SELECT * FROM Forum
	JOIN Participantes
		ON Participantes.fkForum = idForum
	JOIN Comentario
		ON Comentario.fkForum = idForum;
        
-- SELECIONAR DADOS DOS FÓRUNS, DE SEUS PARTICIPANTES E SEUS COMENTÁRIOS
SELECT * FROM Forum
	JOIN Participantes
		ON Participantes.fkForum = idForum
	JOIN Usuario
		ON fkUsuario = idUsuario
	JOIN Comentario
		ON Comentario.fkForum = idForum;