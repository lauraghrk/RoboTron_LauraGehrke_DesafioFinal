*** Settings ***
Documentation        Keywords e variáveis para ações do endpoint /usuarios
Library        RequestsLibrary
Resource        ../support/base.robot

*** Variables ***
${response}
${payload}

*** Keywords ***
GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Log To Console    ${response}
    Set Global Variable    ${response}

POST Endpoint /usuarios
    ${response}    POST On Session    serverest    /usuarios    json=&{payload}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    ${response}    PUT On Session    serverest    /usuarios/${response.json()["_id"]}    json=&{payload}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}    DELETE On Session    serverest    /usuarios/${response.json()["_id"]}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

Obter Dados Usuário Estático Válido
    ${json}    Importar JSON Estático    json_usuario.json
    ${payload}    Set Variable    ${json["user_valido"]}
    Set Global Variable    ${payload}
