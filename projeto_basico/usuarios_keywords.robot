*** Settings ***
Documentation        Keywords e variáveis para ações do endpoint /usuarios
Library        RequestsLibrary

*** Variables ***
${nome_do_usuario}        amy winehouse
${senha_do_usuario}        senha123
${email_do_usuario}        testeteste@gmail.com

*** Keywords ***
GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

POST Endpoint /usuarios
    &{payload}    Create Dictionary    nome=${nome_do_usuario}    email=${email_do_usuario}    password=${senha_do_usuario}    administrador=true
    ${response}    POST On Session    serverest    /usuarios    data=&{payload}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    &{payload}    Create Dictionary    nome=Joey    email=joe@gmail.com    password=biscoito    administrador=true
    ${response}    PUT On Session    serverest    /usuarios/IWgmQxi2sr4jGTaj    data=&{payload}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}    DELETE On Session    serverest    /usuarios/IWgmQxi2sr4jGTaj
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}