*** Settings ***
Documentation   Keywords com os steps da Suíte de Login
Resource        ../variables/Globais.robot
Resource        ../variables/MappingLogin.robot
Library         AppiumLibrary

*** Keywords ***
# ---- DADO
Dado que estou na tela de Login
    ${STATUS}         Run Keyword And Return Status    Acionar o menu principal
    Run Keyword If    '${STATUS}' == 'False'
    ...               Run Keywords
    ...               Acessar a tela principal do app   AND   Acionar o menu principal
    ${STATUS_LOGIN}   Run Keyword And Return Status    Acionar a opção de login
    Run Keyword If    '${STATUS_LOGIN}' == 'False'
    ...               Run Keywords
    ...               Acessar a tela principal do app   AND
    ...               Acionar o menu principal          AND    Acionar a opção de login

Dado que estou logado no app com o usuário "${USERNAME}"
    Dado que estou na tela de Login
    E informo username "${USERNAME}" e password "${ACESSO_VALIDO.password}"
    Quando solicito o login

# ---- E
E não informo o meu username
    Conferir se campo de texto está vazio    ${TELA_LOGIN.inputUsername}

E informo o meu username "${USERNAME}"
    Preencher campo com valor                ${TELA_LOGIN.inputUsername}    ${USERNAME}

E não informo a minha password
    Conferir se campo de texto está vazio    ${TELA_LOGIN.inputPassword}

E informo username "${USERNAME}" e password "${PASSWORD}" inexistentes
    Informar os campos username e password    ${USERNAME}    ${PASSWORD}

E informo username "${USERNAME}" e password "${PASSWORD}"
    Informar os campos username e password    ${USERNAME}    ${PASSWORD}

E desabilito a rede móvel e wifi
    Desabilitar rede móvel e wifi

E habilito a rede móvel
    Habilitar rede móvel e wifi

# ---- QUANDO
Quando solicito o login
    Acionar o botão Login

Quando cancelo o login
    Acionar o botão Cancel

Quando solicito o logout
    Acionar o botão Refresh
    Acionar o menu principal
    Acionar a opção de expandir login e ou logout
    Acionar a opção de expandir login e ou logout
    Click Text    Logout

# ---- ENTÃO
Então o app exibe a mensagem de erro "${MENSAGEM}"
    Conferir mensagem exibida no app    ${MENSAGEM}

Então o app exibe a mensagem "${MENSAGEM}"
    Conferir mensagem exibida no app    ${MENSAGEM}

Então o app retorna para a tela inicial
    Conferir se exibe os elementos principais da tela inicial

Então o usuário "${ACESSO_VALIDO.username}" é deslogado
    Acionar o menu principal
    Acionar a opção de expandir login e ou logout
    Conferir nome do usuário logado    Logout

# ---- E
E o app exibe os campos "Username" e "Password"
    Element Should Be Enabled    ${TELA_LOGIN.inputUsername}
    Element Should Be Enabled    ${TELA_LOGIN.inputUsername}

E o app exibe a mensagem "${MENSAGEM}"
    Page Should Contain Text     ${MENSAGEM}

E o app exibe os botões Login e Cancel
    Element Should Be Enabled    ${TELA_LOGIN.buttonLogin}
    Element Should Be Enabled    ${TELA_LOGIN.buttonCancelar}

E o app exibe o nome do usuário logado "${NOME_USUARIO}"
    Acionar o menu principal
    Acionar a opção de expandir login e ou logout
    Conferir nome do usuário logado    ${NOME_USUARIO}

E em seguida exibe o erro "${MENSAGEM_ERRO}"
    Conferir mensagem exibida no app    ${MENSAGEM_ERRO}

# ---- STEPS
Acessar a tela principal do app
    Set Appium Timeout    20
    Open Application    ${REMOTE_URL}             platformName=${platformName}
    ...                 deviceName=${deviceName}  app=${app}
    ...                 ensureWebviewsHavePages=${ensureWebviewsHavePages}

Acionar o menu principal
    Wait Until Element Is Visible    ${TELA_INICIAL.buttonMenu}
    Click Element                    ${TELA_INICIAL.buttonMenu}

Acionar a opção de login
    Acionar a opção de expandir login e ou logout
    Click Text    Login
    Wait Until Element Is Visible    ${TELA_LOGIN.titleAlertLogin}
    Click Element                    ${TELA_LOGIN.titleAlertLogin}

Acionar a opção de expandir login e ou logout
    Wait Until Element Is Visible    ${TELA_INICIAL.buttonExpandirLogin}
    Click Element                    ${TELA_INICIAL.buttonExpandirLogin}

Acionar o botão Login
    Wait Until Element Is Visible    ${TELA_LOGIN.buttonLogin}
    Click Element                    ${TELA_LOGIN.buttonLogin}

Acionar o botão Cancel
    Wait Until Element Is Visible    ${TELA_LOGIN.buttonCancelar}
    Click Element                    ${TELA_LOGIN.buttonCancelar}

Acionar o botão Refresh
    Wait Until Element Is Visible    ${TELA_INICIAL.buttonRefresh}
    Click Element                    ${TELA_INICIAL.buttonRefresh}

Preencher campo com valor
    [Arguments]  ${IDENTIFICADOR_CAMPO}    ${VALOR_CAMPO}
    Wait Until Element Is Visible    ${IDENTIFICADOR_CAMPO}
    Input Text    ${IDENTIFICADOR_CAMPO}    ${VALOR_CAMPO}

Informar os campos username e password
    [Arguments]   ${USERNAME}    ${PASSWORD}
    Preencher campo com valor    ${TELA_LOGIN.inputUsername}    ${USERNAME}
    Preencher campo com valor    ${TELA_LOGIN.inputPassword}    ${PASSWORD}

Conferir se campo de texto está vazio
    [Arguments]  ${IDENTIFICADOR_CAMPO}
    Wait Until Element Is Visible   ${IDENTIFICADOR_CAMPO}
    Element Text Should Be          ${IDENTIFICADOR_CAMPO}    ${EMPTY}

Conferir mensagem exibida no app
    [Arguments]   ${MENSAGEM}
    Wait Until Element Is Visible    ${TELA_LOGIN.message}
    Element Should Contain Text      ${TELA_LOGIN.message}    ${MENSAGEM}

Conferir se exibe os elementos principais da tela inicial
    Element Should Contain Text  class=android.widget.TextView    Hews
    Element Should Be Visible    ${TELA_INICIAL.buttonMenu}
    Element Should Be Visible    ${TELA_INICIAL.buttonSearch}
    Element Should Be Visible    ${TELA_INICIAL.buttonRefresh}
    Element Should Be Visible    ${TELA_INICIAL.buttonTypography}

Conferir nome do usuário logado
    [Arguments]   ${NOME_USUARIO}
    ${USERNAME_ACCOUNT}   Get Text               ${TELA_LOGIN.account}
    Should Be Equal       ${USERNAME_ACCOUNT}    ${NOME_USUARIO}

Habilitar rede móvel e wifi
    Execute Adb Shell    svc wifi enable
    Execute Adb Shell    svc data enable

Desabilitar rede móvel e wifi
    Execute Adb Shell    svc wifi disable
    Execute Adb Shell    svc data disable
