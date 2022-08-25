*** Settings ***
Documentation    Testes para o endpoint /carrinhos
Resource        ../keywords/carrinhos_kw.robot

Suite Setup    Criar Sessão

*** Test Cases ***
TC 31: Listar carrinhos 200
    [Tags]    tc31
    GET Endpoint /carrinhos
    Validar Status Code "200"
    Mostrar Conteúdo da Resposta

TC 32: Cadastrar carrinho 201
    [Tags]    tc32
    Fazer Login e Guardar Token "user_valido"
    Criar carrinho
    POST Endpoint /carrinhos
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "sucesso"
    DELETE Endpoint /carrinhos/cancelar-compra

TC 33: Cadastrar carrinho com erro 400
    [Tags]    tc33
    Fazer Login e Guardar Token "user_com_carrinho"
    Criar carrinho
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Mensagem Contém "Não é permitido"

TC 34: Cadastrar carrinho sem autorização 401
    [Tags]    tc34
    Criar carrinho
    POST Endpoint /carrinhos
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 35: Buscar carrinho por ID 200
    [Tags]    tc35
    Seleciona ID "qbMqntef4iTOwWfg"
    GET Endpoint /carrinhos/
    Validar Status Code "200"

TC 36: Buscar carrinho inexistente 400
    [Tags]    tc36
    Seleciona ID "0000000000000000"
    GET Endpoint /carrinhos/
    Validar Status Code "400"
    Validar Mensagem Contém "não encontrado"

TC 37: Excluir carrinho - concluir compra
    [Tags]    tc37
    Fazer Login e Guardar Token "user_valido"
    Criar carrinho
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 38: Excluir carrinho sem autorização
    [Tags]    tc38
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 39: Excluir carrinho e retornar produtos para estoque - cancelar compra
    [Tags]    tc39
    Fazer Login e Guardar Token "user_valido"
    Criar carrinho
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 40: Excluir carrinho e retornar produtos para estoque sem autorização
    [Tags]    tc40
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"