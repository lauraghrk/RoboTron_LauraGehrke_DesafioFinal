*** Settings ***
Documentation    Keywords para o endpoint /usuarios
Resource        ./commons.robot

*** Variables ***
${payload}
${id}
${id_user}

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
    ${response}    DELETE On Session    serverest    /usuarios/${id_user}
    Log To Console    Response:${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    ${response}    PUT On Session    serverest    /usuarios/${id_user}    data=&{payload}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

Selecionar Usuário "${val}"
    ${json}    Importar JSON Estático    json_usuarios.json
    ${payload}    Set Variable    ${json["${val}"]}
    Set Global Variable    ${payload}

Guardar ID
    ${id_user}    Set Variable    ${response.json()["_id"]}
    Log To Console    ID salvo: ${id_user}
    Set Global Variable    ${id_user}