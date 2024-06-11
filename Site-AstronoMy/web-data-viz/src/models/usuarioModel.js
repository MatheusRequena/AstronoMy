var database = require("../database/config")

function listar(email) {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()", email);
    var instrucaoSql = `
    SELECT Usuario.nome , email , dtNasc , dtCadastro , sum(qtdPerguntas) as perguntas , sum(acertos) as acertos FROM Usuario
	JOIN Notas
		ON fkUsuario = idUsuario
	JOIN Estudo
		ON fkEstudo = idEstudo
    WHERE email = '${email}'
	GROUP BY Usuario.nome , email , dtNasc , dtCadastro`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
    SELECT Usuario.nome , email , dtNasc , dtCadastro , sum(qtdPerguntas) as perguntas , sum(acertos) as acertos FROM Usuario
	JOIN Notas
		ON fkUsuario = idUsuario
	JOIN Estudo
		ON fkEstudo = idEstudo
    WHERE email = '${email}' AND senha = '${senha}'
    GROUP BY Usuario.nome , email , dtNasc , dtCadastro;`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, telefone , nascimento) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    INSERT INTO Usuario (nome , email , telefone , dtNasc , senha , dtCadastro) VALUES ('${nome}' , '${email}' , '${telefone}' , '${nascimento}' , '${senha}' , current_timestamp());
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function mostrar() {
    var instrucao = `
    SELECT sum(${acertosQuiz}) as acertos FROM Notas
      JOIN Usuario
          ON fkUsuario = idUsuario
      WHERE dtNota LIKE current_date() AND email = '${email}';  `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
  }

module.exports = {
    autenticar,
    cadastrar,
    listar,
    mostrar
};