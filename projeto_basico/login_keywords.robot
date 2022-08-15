*** Settings ***
Documentation        Keywords e variáveis para ações do endpoint /login
Library            RequestsLibrary

*** Variables ***
${email_login}        testeteste@gmail.com
${password_login}        senha123
${response}

*** Keywords ***
POST Endpoint /login
    &{payload}    Create Dictionary    email=${email_login}    password=${password_login}
    ${response}    POST On Session    serverest    /login    data=&{payload}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Ter Logado
    Should Be Equal    ${response.json()["message"]}    Login realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}    Set Variable    ${response.json()["authorization"]}
    Log To Console    Token Salvo: ${token_auth}
    Set Global Variable    ${token_auth}
