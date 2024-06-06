// Verificar login
function validarSessao() {
    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;

    

    if (email != null && nome != null) {
        header.innerHTML = `<a href="index.html"><img src="img/LogoAstronoMy.png" alt="Logo AstronoMy" class="logo"></a>
        <a href="index.html" class="${index}">Inicio</a>
        <a href="EstudarAstronoMy.html" class="${estudar}">Estudar</a>
        <select id="selectPerfil" onchange="selecionar()">
        <option value="#" hidden selected>${nome} ‎</option>
        <option value="perfil">Perfil</option>
        <option value="sair">Sair</option>
        `;

        homeEstudar.innerHTML = `<label class="tituloEstudar">TUDO PRONTO</label>
        <span>Não perca tempo, vamos estudar!!</span>
        <div class="botoes">
            <button onclick="estudo()">ESTUDAR</button>
        </div>`;
    } else {
        header.innerHTML = `<a href="index.html"><img src="img/LogoAstronoMy.png" alt="Logo AstronoMy" class="logo"></a>
        <a href="index.html" class="${index}">Inicio</a>
        <a href="CadastroAstronoMy.html" class="${cadastro}">Cadastre-se</a>
        <a href="LoginAstronoMy.html" class="${login}">Entrar</a> 
    </select>`

    homeEstudar.innerHTML = `<label class="tituloEstudar">ESTUDE CONOSCO</label>
    <span>Para estudar, não esqueça de se cadastrar!</span>
    <div class="botoes">
        <button onclick="entrar()">ENTRAR</button>
        <button onclick="cadastrar()">CADASTRAR</button>
    </div>`
    }
}

// Deslogar
function limparSessao() {
    sessionStorage.clear();
    window.location = "../index.html";
}