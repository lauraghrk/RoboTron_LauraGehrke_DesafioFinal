*** Settings ***
Documentation    Testes para o endpoint /usuarios
Resource        ../keywords/usuarios_kw.robot
Resource        ../keywords/login_kw.robot

Suite Setup    Criar Sessão

*** Test Cases ***
TC 4: GET - Listar usuários 200
    [Tags]    tc4
    GET Endpoint /usuarios
    Validar Status Code "200"
    Mostrar Conteúdo da Resposta

TC 5: POST - Cadastrar usuário 201
    [Tags]    tc5
    Criar Dados Usuário Válido
    POST Endpoint /usuarios
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "sucesso"
    DELETE Endpoint /usuarios

TC 6: POST - Cadastrar usuário repetido 400
    [Tags]    tc6
    Selecionar Usuário "user_repetido"
    POST Endpoint /usuarios
    Validar Status Code "400"
    Validar Mensagem Contém "usado"

TC 7: GET - Buscar usuário 200
    [Tags]    tc7
    Seleciona ID "0uxuPY0cbmQhpEz1"
    GET Endpoint /usuarios/
    Validar Status Code "200"

TC 8: GET - Buscar usuário inexistente 400
    [Tags]    tc8
    Seleciona ID "0000000000000000"
    GET Endpoint /usuarios/
    Validar Status Code "400"
    Validar Mensagem Contém "não encontrado"

TC 9: DELETE - Excluir usuário 200
    [Tags]    tc9
    Criar Dados Usuário Válido
    POST Endpoint /usuarios
    Guardar ID
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 10: DELETE - Excluir usuário inexistente 200
    [Tags]    tc10
    Seleciona ID "0000000000000000"
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem Contém "Nenhum"

TC 11: DELETE - Excluir usuário com carrinho 400
    [Tags]    tc11
    Seleciona ID "jIGnJrllFqYxinob"
    DELETE Endpoint /usuarios
    Validar Status Code "400"
    Validar Mensagem Contém "Não é permitido"

TC 12: PUT - Editar usuário existente 200
    [Tags]    tc12
    Selecionar Usuário "user_modificar"
    POST Endpoint /usuarios
    Guardar ID
    Criar Dados Usuário Válido
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem Contém "alterado"
    DELETE Endpoint /usuarios    

TC 13: PUT - Editar usuário inexistente 201
    [Tags]    tc13
    Criar Dados Usuário Válido
    Seleciona ID "000000000000"
    PUT Endpoint /usuarios
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "Cadastro"
    DELETE Endpoint /usuarios

TC 14: PUT - Editar usuário usando email já cadastrado 400
    [Tags]    tc14
    Seleciona ID "UES5DKNIxfWTo5rJ"
    Selecionar Usuário "user_repetido"
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Mensagem Contém "usado"