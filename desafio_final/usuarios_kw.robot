*** Settings ***
Documentation    Keywords para o endpoint /usuarios
Resource        ./commons.robot

*** Variables ***
${payload}
${id}

*** Keywords ***
GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

POST Endpoint /usuarios
    ${response}    POST On Session    serverest    /usuarios    json=&{payload}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

GET Endpoint /usuarios/{_id}
    ${response}    GET On Session    serverest    /usuarios/${id}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}    DELETE On Session    serverest    /usuarios/1XWPibby5ziaD1HP
    Log To Console    Response:${response.content}
    Set Global Variable    ${response}

PUT

Criar Usuário Válido
    ${json}    Importar JSON Estático    json_usuarios.json
    ${payload}    Set Variable    ${json["user_valido"]}
    Set Global Variable    ${payload}

Criar Usuário Repetido
    ${json}    Importar JSON Estático    json_usuarios.json
    ${payload}    Set Variable    ${json["user_repetido"]}
    Set Global Variable    ${payload}

Seleciona ID "${identificador}"
    ${id}    Set Variable    ${identificador}
    Set Global Variable    ${id}