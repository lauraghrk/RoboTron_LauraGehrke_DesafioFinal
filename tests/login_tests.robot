*** Settings ***
Documentation    Testes para o endpoint /login
Resource        ../keywords/login_kw.robot

Suite Setup    Criar Sessão

*** Test Cases ***
TC 01: POST - Login com dados válidos 200
    [Tags]    tc01
    Selecionar Login "user_valido"
    POST Endpoint /login
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 02: POST - Login com e-mail inválido 400
    [Tags]    tc02
    Selecionar Login "user_invalido"
    POST Endpoint /login
    Validar Status Code "400"
    Validar Mensagem Contém "inválidos"

TC 03: POST - Login com senha inválida 400
    [Tags]    tc03
    Selecionar Login "user_senha_errada"
    POST Endpoint /login
    Validar Status Code "400"
    Validar Mensagem Contém "inválidos"