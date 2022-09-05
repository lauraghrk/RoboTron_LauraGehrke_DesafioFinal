*** Settings ***
Documentation    Keywords para o endpoint /carrinhos
Resource        ../support/base.robot

*** Keywords ***
GET Endpoint /carrinhos
    ${response}    GET On Session    serverest    /carrinhos
    Set Global Variable    ${response}

POST Endpoint /carrinhos
    &{header}    Create Dictionary    Authorization=${token}
    ${response}    POST On Session    serverest    /carrinhos    json=&{payload}    expected_status=any    headers=&{header}
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

GET Endpoint /carrinhos/
    ${response}    GET On Session    serverest    /carrinhos/${id_guardado}    expected_status=any
    Log To Console    ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}    Create Dictionary    Authorization=${token}
    ${response}    DELETE On Session    serverest    /carrinhos/cancelar-compra/    expected_status=any    headers=&{header}
    Log To Console    Response:${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /carrinhos/concluir-compra
    &{header}    Create Dictionary    Authorization=${token}
    ${response}    DELETE On Session    serverest    /carrinhos/concluir-compra/    expected_status=any    headers=&{header}
    Log To Console    Response:${response.content}
    Set Global Variable    ${response}

Criar carrinho
    ${json}    Importar JSON Estático    json_carrinhos.json
    ${payload}    Set Variable    ${json}
    Set Global Variable    ${payload}

Validar Saldo Produtos
    ${saldo}    mostrar saldo produtos carrinho    carrinho=${payload["produtos"]}
    Log To Console    Saldo: ${saldo}