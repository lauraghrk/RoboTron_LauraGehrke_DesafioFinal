*** Settings ***
Documentation    Keywords para o endpoint /carrinho
Resource        ./commons.robot

*** Variables ***
${id_guardado}

*** Keywords ***
GET Endpoint /carrinhos
    ${response}    GET On Session    serverest    /carrinhos
    Set Global Variable    ${response}

POST Endpoint /carrinhos

GET Endpoint /carrinhos/
    ${response}    GET On Session    serverest    /carrinhos/${id_guardado}    expected_status=any
    Log To Console    ${response.content}
    Set Global Variable    ${response}

Selecionar Carrinho ""