*** Settings ***
Documentation    Keywords para o endpoint /usuarios
Resource        ../support/base.robot

*** Keywords ***
GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

POST Endpoint /usuarios
    ${response}    POST On Session    serverest    /usuarios    json=&{payload}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

GET Endpoint /usuarios/
    ${response}    GET On Session    serverest    /usuarios/${id_guardado}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}    DELETE On Session    serverest    /usuarios/${id_guardado}    expected_status=any
    Log To Console    Response:${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    ${response}    PUT On Session    serverest    /usuarios/${id_guardado}    json=&{payload}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

Selecionar Usuário "${user}"
    ${json}    Importar JSON Estático    json_usuarios.json
    ${payload}    Set Variable    ${json["${user}"]}
    Set Global Variable    ${payload}

Validar Usuário Tem Carrinho
    ${carrinho}    mostrar carrinho usuario    id_user=${id_guardado}
    Log To Console    ${carrinho}

Validar Email Já Cadastrado  
    ${usuario}    mostrar usuario email    email=${payload["email"]}
    Log To Console    Usuário: ${usuario}