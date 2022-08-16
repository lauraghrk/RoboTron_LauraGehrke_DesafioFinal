*** Settings ***
Documentation        Keywords e variáveis para ações do endpoint /usuarios
Library        RequestsLibrary
Resource        ./common.robot

*** Variables ***
${nome_do_usuario}        amy winehouse
${senha_do_usuario}        senha123
${email_do_usuario}        testeteste@gmail.com
${response}
${payload}

*** Keywords ***
GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

POST Endpoint /usuarios
    ${response}    POST On Session    serverest    /usuarios    json=&{payload}
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

Criar Usuário Estático Válido
    ${json}    Importar JSON Estático    json_usuario.json
    ${payload}    Set Variable    ${json["user_valido"]}
    Set Global Variable    ${payload}
    POST Endpoint /usuarios

Validar Quantidade "${quantidade}"
    Should Be Equal    ${response.json()["quantidade"]}    ${quantidade}

Validar Se Mensagem Contém "${palavra}"
    Should Contain    ${response.json()["message"]}    ${palavra}

Printar Conteúdo Response
    Log to Console    Response: ${response}
