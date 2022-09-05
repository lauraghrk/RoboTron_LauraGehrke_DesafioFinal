*** Settings ***
Documentation    Keywords para o endpoint /produtos
Resource        ../support/base.robot

*** Keywords ***
GET Endpoint /produtos
    ${response}    GET On Session    serverest    /produtos
    Set Global Variable    ${response}

POST Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token}
    ${response}    POST On Session    serverest    /produtos    data=&{payload}    expected_status=any    headers=&{header}
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

GET Endpoint /produtos/
    ${response}    GET On Session    serverest    /produtos/${id_guardado}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token}
    ${response}    DELETE On Session    serverest    /produtos/${id_guardado}    expected_status=any    headers=&{header}
    Log To Console    Response:${response.content}
    Set Global Variable    ${response}

PUT Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token}
    ${response}    PUT On Session    serverest    /produtos/${id_guardado}    data=&{payload}    expected_status=any    headers=${header}
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

Selecionar Produto Repetido
    ${payload}    Create Dictionary    nome=Samsung 60 polegadas    preco=5000    descricao=TV samsung    quantidade=127
    Set Global Variable    ${payload}

Validar Produto Repetido
    ${produto}    mostrar id produto repetido    nome=${payload["nome"]}
    Log To Console    Produto: ${produto}