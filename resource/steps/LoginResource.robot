*** Settings ***
Documentation   Keywords com os steps da suíte de Login
Resource        ../variables/Globais.robot
Resource        ../variables/MappingLogin.robot
Library         AppiumLibrary

*** Keywords ***
# ---- DADO
Dado que estou na tela de Login
    ${STATUS}         Run Keyword And Return Status    Acionar o menu principal
    Run Keyword If    '${STATUS}' == 'False'     Run Keywords       Acessar a tela principal do app   AND   Acionar o menu principal
    ${STATUS_LOGIN}   Run Keyword And Return Status    Acionar a opção de login
    Run Keyword If    '${STATUS_LOGIN}' == 'False'    Run Keywords    Acionar o menu principal    AND    Acionar a opção de login


# ---- E
E não informo o meu username
    Conferir se campo de texto está vazio    ${TELA_LOGIN.inputUsername}

E informo o meu username "${USERNAME}"
    Preencher campo com valor    ${TELA_LOGIN.inputUsername}    ${USERNAME}

E não informo a minha password
    Conferir se campo de texto está vazio    ${TELA_LOGIN.inputPassword}

E informo username "${USERNAME}" e password "${PASSWORD}" inexistentes
    Preencher campo com valor    ${TELA_LOGIN.inputUsername}    ${USERNAME}
    Preencher campo com valor    ${TELA_LOGIN.inputPassword}    ${PASSWORD}

E informo username "${USERNAME}" e password "${PASSWORD}"
    Preencher campo com valor    ${TELA_LOGIN.inputUsername}    ${USERNAME}
    Preencher campo com valor    ${TELA_LOGIN.inputPassword}    ${PASSWORD}

# ---- QUANDO
Quando solicito o login
    Acionar o botão Login

Quando cancelo o login
    Acionar o botão Cancel

# ---- ENTÃO
Então o app exibe a mensagem de erro "${MENSAGEM}"
    Wait Until Element Is Visible    ${TELA_LOGIN.message}
    Element Should Contain Text    ${TELA_LOGIN.message}    ${MENSAGEM}

Então o app exibe a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible    ${TELA_LOGIN.message}
    Element Should Contain Text    ${TELA_LOGIN.message}    ${MENSAGEM}

E em seguida exibe o erro "${MENSAGEM_ERRO}"
    Wait Until Element Is Visible    ${TELA_LOGIN.message}
    Element Should Contain Text    ${TELA_LOGIN.message}    ${MENSAGEM_ERRO}

Então o app retorna para a tela inicial
    Element Should Contain Text    class=android.widget.TextView    Hews
    Element Should Be Visible    ${TELA_INICIAL.buttonMenu}
    Element Should Be Visible    ${TELA_INICIAL.buttonSearch}
    Element Should Be Visible    ${TELA_INICIAL.buttonRefresh}
    Element Should Be Visible    ${TELA_INICIAL.buttonTypography}

# ---- E
E o app exibe os campos "Username" e "Password"
    Element Should Be Enabled    ${TELA_LOGIN.inputUsername}
    Element Should Be Enabled    ${TELA_LOGIN.inputUsername}

E o app exibe a mensagem "${MENSAGEM}"
    Page Should Contain Text    ${MENSAGEM}

E o app exibe os botões "${BUTTON_LOGIN}" e "${BUTTON_CANCEL}"
    Element Should Be Enabled    ${BUTTON_LOGIN}
    Element Should Be Enabled    ${BUTTON_CANCEL}

# ---- STEPS
Acessar a tela principal do app
    Open Application    ${REMOTE_URL}   platformName=${platformName}
    ...                 deviceName=${deviceName}  app=${app}  ensureWebviewsHavePages=${ensureWebviewsHavePages}
    Set Appium Timeout    20

Retornar para a tela inicial
    Run Keyword If    '${TEST_TAG[0]}' != 'CENARIO_CANCELAR'    name    *args
    Run Keyword If Test Passed    Acionar o botão Cancel
    Run Keyword If Test Passed    Acionar o botão Refresh

Acionar o menu principal
    Wait Until Element Is Visible    ${TELA_INICIAL.buttonMenu}
    Click Element    ${TELA_INICIAL.buttonMenu}

Acionar a opção de login
    Wait Until Element Is Visible    ${TELA_INICIAL.buttonExpandirLogin}
    Click Element    ${TELA_INICIAL.buttonExpandirLogin}
    Click Text    Login
    Wait Until Element Is Visible    ${TELA_LOGIN.titleAlertLogin}
    Click Element    ${TELA_LOGIN.titleAlertLogin}

Acionar o botão Login
    Wait Until Element Is Visible    ${TELA_LOGIN.buttonLogin}
    Click Element    ${TELA_LOGIN.buttonLogin}

Acionar o botão Cancel
    Wait Until Element Is Visible    ${TELA_LOGIN.buttonCancelar}
    Click Element    ${TELA_LOGIN.buttonCancelar}

Acionar o botão Refresh
    Wait Until Element Is Visible    ${TELA_INICIAL.buttonRefresh}
    Click Element    ${TELA_INICIAL.buttonRefresh}

Preencher campo com valor
    [Arguments]  ${IDENTIFICADOR_CAMPO}    ${VALOR_CAMPO}
    Wait Until Element Is Visible    ${IDENTIFICADOR_CAMPO}
    Input Text    ${IDENTIFICADOR_CAMPO}    ${VALOR_CAMPO}

Conferir se campo de texto está vazio
    [Arguments]  ${IDENTIFICADOR_CAMPO}
    Wait Until Element Is Visible   ${IDENTIFICADOR_CAMPO}
    Element Text Should Be          ${IDENTIFICADOR_CAMPO}    ${EMPTY}
