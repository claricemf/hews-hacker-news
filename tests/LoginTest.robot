*** Settings ***
Documentation   Suíte de Teste de Login do app Hews Hacker News
Resource        ../resource/steps/LoginResource.robot
Test Setup     Acessar a tela principal do app
Test Teardown   Close Application

*** Test Case ***
CT01: Login (motivo da falha: campo Username obrigatório)
    [Tags]    CT01LOGIN
    Dado que estou na tela de Login
    E não informo o meu username
    Quando solicito o login
    Então o app exibe a mensagem de erro "Catch you, anonymous!"

CT02: Login (motivo da falha: campo Password obrigatório)
    [Tags]    CT02LOGIN
    Dado que estou na tela de Login
    E informo o meu username "teste_user"
    E não informo a minha password
    Quando solicito o login
    Então o app exibe a mensagem de erro "You got a short…password"

CT03: Login (motivo da falha: Username e Password inexistentes)
    [Tags]    CT03LOGIN
    Dado que estou na tela de Login
    E informo username "user_wrong" e password "pass_wrong" inexistentes
    Quando solicito o login
    E em seguida exibe o erro "Arrr…wrong username/password"

CT04: Login (fluxo alternativo: botão Cancelar)
    [Tags]    CT04LOGIN
    Dado que estou na tela de Login
    E informo username "user" e password "password"
    Quando cancelo o login
    Então o app retorna para a tela inicial

CT05: Login (Conferir exibição dos campos e mensagem inicial)
    [Tags]    CT05LOGIN
    Dado que estou na tela de Login
    Então o app exibe a mensagem "* Your password will NOT be saved"
    E o app exibe os campos "Username" e "Password"
    E o app exibe os botões Login e Cancel

CT06: Login - Sucesso
    [Tags]    CT06LOGIN
    Dado que estou na tela de Login
    E informo username "${ACESSO_VALIDO.username}" e password "${ACESSO_VALIDO.password}"
    Quando solicito o login
    Então o app exibe a mensagem "Logging in…"
    E o app exibe o nome do usuário logado "${ACESSO_VALIDO.username}"

CT07: Logout - Sucesso
    [Tags]    CT07LOGIN
    Dado que estou logado no app com o usuário "${ACESSO_VALIDO.username}"
    Quando solicito o logout
    Então o usuário "${ACESSO_VALIDO.username}" é deslogado

CT08: Login (motivo da falha: rede móvel e wifi desabilitado)
    [Tags]    CT08LOGIN
    Dado que estou na tela de Login
    E informo username "${ACESSO_VALIDO.username}" e password "${ACESSO_VALIDO.password}"
    E desabilito a rede móvel e wifi
    Quando solicito o login
    Então o app exibe a mensagem de erro "Where's the Internet? Can't get it"
    E habilito a rede móvel
