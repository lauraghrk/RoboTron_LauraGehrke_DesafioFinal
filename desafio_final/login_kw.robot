*** Settings ***
Documentation    Keywords para o endpoint /login
Resource        ./commons.robot

*** Variables ***

*** Keywords ***
POST Endpoint /login
    ${json}    Importar JSON Estático    json_login.json
    ${payload}    Set Variable    ${user}
    ${response}    POST On Session    serverest    /login    json=&{user}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}