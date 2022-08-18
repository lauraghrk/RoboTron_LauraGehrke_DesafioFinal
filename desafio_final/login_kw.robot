*** Settings ***
Documentation    Keywords para o endpoint /login
Resource        ./commons.robot

*** Variables ***
${payload}

*** Keywords ***
POST Endpoint /login
    ${response}    POST On Session    serverest    /login    json=&{payload}    expected_status=any
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Selecionar Login "${val}"
    ${json}    Importar JSON Estático    json_login.json
    ${payload}    Set Variable    ${json["${val}"]}
    Set Global Variable    ${payload}

Fazer Login e Guardar Token "${login}"
    Selecionar Login "${login}"
    POST Endpoint /login
    ${token}    Set Variable    ${response.json()["authorization"]}
    Set Global Variable    ${token}