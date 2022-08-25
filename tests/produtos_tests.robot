*** Settings ***
Documentation    Testes para o endpoint /produtos
Resource        ../keywords/produtos_kw.robot

Suite Setup    Criar Sessão

*** Test Cases ***
TC 15: GET - Listar produtos 200
    [Tags]    tc15
    GET Endpoint /produtos
    Validar Status Code "200"
    Mostrar Conteúdo da Resposta

TC 16: POST - Cadastrar produto 201
    [Tags]    tc16
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "teclado"
    POST Endpoint /produtos
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "sucesso"
    DELETE Endpoint /produtos

TC 17: POST - Cadastrar produto com nome já cadastrado 400
    [Tags]    tc17
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "monitor_repetido"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem Contém "Já existe"

TC 18: POST - Cadastrar produto sem login 401
    [Tags]    tc18
    Selecionar Produto "teclado"
    POST Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "ausente"

TC 19: POST - Cadastrar produto sem ser administrador 403
    [Tags]    tc19
    Fazer Login e Guardar Token "user_nao_adm"
    Selecionar Produto "teclado"
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
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "teclado"
    POST Endpoint /produtos
    Guardar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 23: Excluir produto em carrinho 400
    [Tags]    tc23
    Fazer Login e Guardar Token "user_valido"
    Seleciona ID "K6leHdftCeOJj8BJ"
    DELETE Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem Contém "faz parte de carrinho"

TC 24: Excluir produto sem autorização 401
    [Tags]    tc24
    Seleciona ID "K6leHdftCeOJj8BJ"
    DELETE Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 25: Excluir produto sem ser administrador 403
    [Tags]    tc25
    Fazer Login e Guardar Token "user_nao_adm"
    Seleciona ID "K6leHdftCeOJj8BJ"
    DELETE Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem Contém "exclusiva"

TC 26: Editar produto 200
    [Tags]    tc26
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "tv_alterar"
    Seleciona ID "BeeJh5lz3k6kSIzA"
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem Contém "alterado"

TC 27: Editar produto inexistente 201
    [Tags]    tc27
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "produto_novo"
    Seleciona ID "0000000000000000"
    PUT Endpoint /produtos
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "Cadastro"
    DELETE Endpoint /produtos

TC 28: Editar produto com nome já cadastrado 400
    [Tags]    tc28
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "monitor_repetido"
    Seleciona ID "K6leHdftCeOJj8BJ"
    PUT Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem Contém "existe"

TC 29: Editar produto sem autorização 401
    [Tags]    tc29
    Selecionar Produto "tv_alterar"
    Seleciona ID "K6leHdftCeOJj8BJ"
    PUT Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 30: Editar produto sem ser administrador 403
    [Tags]    tc30
    Fazer Login e Guardar Token "user_nao_adm"
    Selecionar Produto "tv_alterar"
    Seleciona ID "K6leHdftCeOJj8BJ"
    PUT Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem Contém "exclusiva"