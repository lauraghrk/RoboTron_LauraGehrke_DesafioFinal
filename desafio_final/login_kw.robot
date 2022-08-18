*** Settings ***
Documentation    Keywords para o endpoint /login
Resource        ./commons.robot

*** Variables ***
${user}

*** Keywords ***
POST Endpoint /login
    ${json}    Importar JSON Estático    json_login.json
    &{payload}    Set Variable    ${json["${user}"]}
    ${response}    POST On Session    serverest    /login    json=&{payload}    expected_status=any
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Selecionar Usuário "${usuario}"
    ${user}    Set Variable    ${usuario}
    Set Global Variable    ${user}