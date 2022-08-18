*** Settings ***
Documentation    Testes automatizados para a API ServeRest
Library        RequestsLibrary
Resource        ./commons.robot
Resource        ./login_kw.robot
Resource        ./usuarios_kw.robot

*** Variables ***

*** Test Cases ***
#Endpoint /login
TC 1: POST - Login com dados válidos 200
    [Tags]    tc1
    Criar Sessão
    Selecionar Login "user_valido"
    POST Endpoint /login
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 2: POST - Login com e-mail inválido 400
    [Tags]    tc2
    Criar Sessão
    Selecionar Login "user_invalido"
    POST Endpoint /login
    Validar Status Code "400"
    Validar Mensagem Contém "inválidos"

TC 3: POST - Login com senha inválida 400
    [Tags]    tc3
    Criar Sessão
    Selecionar Login "user_senha_errada"
    POST Endpoint /login
    Validar Status Code "400"
    Validar Mensagem Contém "inválidos"

#Endpoint /usuarios
TC 4: GET - Listar usuários 200
    [Tags]    tc4
    Criar Sessão
    GET Endpoint /usuarios
    Validar Status Code "200"
    Mostrar Conteúdo da Resposta

TC 5: POST - Cadastrar usuário 201  ###Excluir no final
    [Tags]    tc5
    Criar Sessão
    Selecionar Usuário "user_valido"
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem Contém "sucesso"

TC 6: POST - Cadastrar usuário repetido 400
    [Tags]    tc6
    Criar Sessão
    Selecionar Usuário "user_repetido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Mensagem Contém "usado"

TC 7: GET - Buscar usuário 200
    [Tags]    tc7
    Criar Sessão
    Seleciona ID "0uxuPY0cbmQhpEz1"
    GET Endpoint /usuarios/{_id}
    Validar Status Code "200"

TC 8: GET - Buscar usuário inexistente 400
    [Tags]    tc8
    Criar Sessão
    Seleciona ID "0000000000000000"
    GET Endpoint /usuarios/{_id}
    Validar Status Code "400"
    Validar Mensagem Contém "não encontrado"

TC 9: DELETE - Excluir usuário 200
    [Tags]    tc9
    Criar Sessão
    Criar Usuário e Guardar ID
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 10: DELETE - Excluir usuário inexistente 200
    [Tags]    tc10
    Criar Sessão
    Seleciona ID "0000000000000000"
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem Contém "Nenhum"

TC 11: DELETE - Excluir usuário com carrinho 400
    [Tags]    tc11
    #????????????????????????????????????????

TC 12: PUT - Editar usuário existente 200

TC 13: PUT - Editar usuário inexistente 200

TC 14: PUT - Editar usuário usando email já cadastrado 400