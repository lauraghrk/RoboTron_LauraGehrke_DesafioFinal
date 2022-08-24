*** Settings ***
Documentation    Testes para o endpoint /login
Resource        ../keywords/login_keywords.robot

Suite Setup    Criar Sessão

*** Test Cases ***
Cenário: POST Realizar Login 200
    [Tags]    postlogin
    POST Endpoint /login
    Validar Status Code "200"