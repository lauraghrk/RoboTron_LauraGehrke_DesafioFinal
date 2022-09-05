*** Settings ***
Documentation    Testes para o endpoint /produtos
Resource        ../keywords/produtos_kw.robot
Resource        ../keywords/login_kw.robot

Suite Setup    Criar Sessão

*** Test Cases ***
TC 15: GET - Listar produtos 200
    [Tags]    tc15
    GET Endpoint /produtos
    Validar Status Code "200"
    Mostrar Conteúdo da Resposta

TC 16: POST - Cadastrar produto 201
    [Tags]    tc16
    Selecionar Login "user_valido"
    POST Endpoint /login
    Guardar Token
    Criar Dados Produto
    POST Endpoint /produtos
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "sucesso"
    DELETE Endpoint /produtos

TC 17: POST - Cadastrar produto com nome já cadastrado 400
    [Tags]    tc17
    Selecionar Login "user_valido"
    POST Endpoint /login
    Guardar Token
    Selecionar Produto Repetido
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem Contém "Já existe"
    Validar Produto Repetido

TC 18: POST - Cadastrar produto com token expirado 401
    [Tags]    tc18
    Definir Token Expirado
    Criar Dados Produto
    POST Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "ausente"

TC 19: POST - Cadastrar produto sem ser administrador 403
    [Tags]    tc19
    Selecionar Login "user_nao_adm"
    POST Endpoint /login
    Guardar Token
    Criar Dados Produto
    POST Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem Contém "exclusiva"

TC 20: Buscar produto por ID válido 200
    [Tags]    tc20
    Seleciona ID "BeeJh5lz3k6kSIzA"
    GET Endpoint /produtos/
    Validar Status Code "200"

TC 21: Buscar produto inexistente 400
    [Tags]    tc21
    Seleciona ID "0000000000000000"
    GET Endpoint /produtos/
    Validar Status Code "400"
    Validar Mensagem Contém "não encontrado"

TC 22: Excluir Produto 200
    [Tags]    tc22
    Selecionar Login "user_valido"
    POST Endpoint /login
    Guardar Token
    Criar Dados Produto
    POST Endpoint /produtos
    Guardar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 23: Excluir produto com carrinho 400
    [Tags]    tc23
    Selecionar Login "user_valido"
    POST Endpoint /login
    Guardar Token
    Seleciona ID "K6leHdftCeOJj8BJ"
    DELETE Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem Contém "faz parte de carrinho"

TC 24: Excluir produto com token expirado 401
    [Tags]    tc24
    Definir Token Expirado
    Seleciona ID "K6leHdftCeOJj8BJ"
    DELETE Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 25: Excluir produto sem ser administrador 403
    [Tags]    tc25
    Selecionar Login "user_nao_adm"
    POST Endpoint /login
    Guardar Token
    Seleciona ID "K6leHdftCeOJj8BJ"
    DELETE Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem Contém "exclusiva"

TC 26: Editar produto 200
    [Tags]    tc26
    Selecionar Login "user_valido"
    POST Endpoint /login
    Guardar Token
    Criar Dados Produto
    POST Endpoint /produtos
    Guardar ID
    Criar Dados Produto
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem Contém "alterado"
    DELETE Endpoint /produtos

TC 27: Editar produto inexistente 201
    [Tags]    tc27
    Selecionar Login "user_valido"
    POST Endpoint /login
    Guardar Token
    Criar Dados Produto
    Seleciona ID "0000000000000000"
    PUT Endpoint /produtos
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "Cadastro"
    DELETE Endpoint /produtos

TC 28: Editar produto com nome já cadastrado 400
    [Tags]    tc28
    Selecionar Login "user_valido"
    POST Endpoint /login
    Guardar Token
    Selecionar Produto Repetido
    Seleciona ID "BeeJh5lz3k6kSIzA"
    PUT Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem Contém "existe"
    Validar Produto Repetido

TC 29: Editar produto com token expirado 401
    [Tags]    tc29
    Definir Token Expirado
    Criar Dados Produto
    Seleciona ID "K6leHdftCeOJj8BJ"
    PUT Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 30: Editar produto sem ser administrador 403
    [Tags]    tc30
    Selecionar Login "user_nao_adm"
    POST Endpoint /login
    Guardar Token
    Criar Dados Produto
    Seleciona ID "K6leHdftCeOJj8BJ"
    PUT Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem Contém "exclusiva"