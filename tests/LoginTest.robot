*** Settings ***
Documentation   Suíte de Teste de Login do app Hews Hacker News
Resource        ../resource/steps/LoginResource.robot
Suite Setup     Acessar a tela principal do app
Test Teardown   Retornar para a tela inicial

*** Test Case ***
CT01: Login (motivo da falha: campo Username obrigatório)
    [Tags]    LOGINCT01
    Dado que estou na tela de Login
    E não informo o meu username
    Quando solicito o login
    Então o app exibe a mensagem de erro "Catch you, anonymous!"

CT02: Login (motivo da falha: campo Password obrigatório)
    [Tags]    LOGINCT02
    Dado que estou na tela de Login
    E informo o meu username "teste_user"
    E não informo a minha password
    Quando solicito o login
    Então o app exibe a mensagem de erro "You got a short…password"

CT03: Login (motivo da falha: Username e Password inexistentes)
    [Tags]    LOGINCT03
    Dado que estou na tela de Login
    E informo username "user_wrong" e password "pass_wrong" inexistentes
    Quando solicito o login
    # Então o app exibe a mensagem "Logging in…"
    E em seguida exibe o erro "Arrr…wrong username/password"

CT04: Login (fluxo alternativo: botão Cancelar)
    [Tags]    LOGINCT04   CENARIO_CANCELAR
    Dado que estou na tela de Login
    E informo username "user" e password "password"
    Quando cancelo o login
    Então o app retorna para a tela inicial

CT05: Login (Conferir exibição dos campos e mensagem inicial)
    [Tags]    LOGINCT05
    Dado que estou na tela de Login
    E o app exibe os campos "Username" e "Password"
    E o app exibe a mensagem "*Your password will NOT be saved"
    E o app exibe os botões "Login" e "Cancel"
