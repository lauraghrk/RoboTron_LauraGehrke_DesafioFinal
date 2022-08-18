*** Settings ***
Documentation    Keywords para o endpoint /produtos
Resource        ./commons.robot

*** Variables ***
${token}
&{payload}
${id_guardado}
${id}

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

Selecionar Produto "${item}"
    ${json}    Importar JSON Estático    json_produtos.json
    ${payload}    Set Variable    ${json["${item}"]}
    Set Global Variable    ${payload}