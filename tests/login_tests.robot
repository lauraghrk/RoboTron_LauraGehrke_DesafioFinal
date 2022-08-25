*** Settings ***
Documentation    Testes para o endpoint /login
Resource        ../keywords/login_kw.robot

Suite Setup    Criar Sessão

*** Test Cases ***
TC 1: POST - Login com dados válidos 200
    [Tags]    tc1
    Selecionar Login "user_valido"
    POST Endpoint /login
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 2: POST - Login com e-mail inválido 400
    [Tags]    tc2
    Selecionar Login "user_invalido"
    POST Endpoint /login
    Validar Status Code "400"
    Validar Mensagem Contém "inválidos"

TC 3: POST - Login com senha inválida 400
    [Tags]    tc3
    Selecionar Login "user_senha_errada"
    POST Endpoint /login
    Validar Status Code "400"
    Validar Mensagem Contém "inválidos"