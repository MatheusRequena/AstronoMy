var database = require("../database/config")

function listar() {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()", );
    var instrucaoSql = `
    SELECT * FROM Tentativa
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
<<<<<<< HEAD
    SELECT * FROM Usuario
=======
    SELECT Usuario.nome , email , dtNasc , dtCadastro FROM Usuario
>>>>>>> bb1bbeabe77dca28fa2ee7b02c3935a8070d71d3
    WHERE email = '${email}' AND senha = '${senha}';
    `
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
    SELECT sum(${acertosQuiz}) as acertos FROM Tentativa
      JOIN Usuario
          ON fkUsuario = idUsuario
      WHERE dtTentativa LIKE current_date() AND email = '${email}';  `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
  }

  function mandarAcertos(idEstudo, idUsuario, acertos) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function mandarAcertos():", idEstudo, idUsuario, acertos);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
    INSERT INTO Tentativa (idTentativa , fkUsuario , fkEstudo , acertos , dtTentativa) VALUES (default , ${idUsuario} , ${idEstudo} , ${acertos} , current_date());
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    listar,
    mostrar,
    mandarAcertos
};