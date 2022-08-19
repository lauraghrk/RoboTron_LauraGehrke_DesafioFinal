*** Settings ***
Documentation    Testes automatizados para a API ServeRest
Library        RequestsLibrary
Resource        ./commons.robot
Resource        ./login_kw.robot
Resource        ./usuarios_kw.robot
Resource        ./produtos_wk.robot
Resource        ./carrinhos_kw.robot

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

TC 5: POST - Cadastrar usuário 201
    [Tags]    tc5
    Criar Sessão
    Selecionar Usuário "user_valido"
    POST Endpoint /usuarios
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "sucesso"
    DELETE Endpoint /usuarios

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
    Selecionar Usuário "user_teste"
    POST Endpoint /usuarios
    Guardar ID
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
    [Tags]    tc12
    Criar Sessão
    Selecionar Usuário "user_modificar"
    Seleciona ID "8GokkdxoxZzbjGp1"
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem Contém "alterado"    

TC 13: PUT - Editar usuário inexistente 201
    [Tags]    tc13
    Criar Sessão
    Selecionar Usuário "user_novo"
    Seleciona ID "8novodxoxZzbjGp1"
    PUT Endpoint /usuarios
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "Cadastro"
    DELETE Endpoint /usuarios

TC 14: PUT - Editar usuário usando email já cadastrado 400
    [Tags]    tc14
    Criar Sessão
    Selecionar Usuário "user_repetido"
    Seleciona ID "8GokkdxoxZzbjGp1"
    PUT Endpoint /usuarios
    Validar Status Code "400"
    Validar Mensagem Contém "usado"

#Endpoint /produtos
TC 15: GET - Listar produtos 200
    [Tags]    tc15
    Criar Sessão
    GET Endpoint /produtos
    Validar Status Code "200"
    Mostrar Conteúdo da Resposta

TC 16: POST - Cadastrar produto 201
    [Tags]    tc16
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "teclado"
    POST Endpoint /produtos
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "sucesso"
    DELETE Endpoint /produtos

TC 17: POST - Cadastrar produto com nome já cadastrado 400
    [Tags]    tc17
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "monitor_repetido"
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem Contém "Já existe"

TC 18: POST - Cadastrar produto sem login 401
    [Tags]    tc18
    Criar Sessão
    Selecionar Produto "teclado"
    POST Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "ausente"

TC 19: POST - Cadastrar produto sem ser administrador 403
    [Tags]    tc19
    Criar Sessão
    Fazer Login e Guardar Token "user_nao_adm"
    Selecionar Produto "teclado"
    POST Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem Contém "exclusiva"

TC 20: Buscar produto por ID válido 200
    [Tags]    tc20
    Criar Sessão
    Seleciona ID "BeeJh5lz3k6kSIzA"
    GET Endpoint /produtos/
    Validar Status Code "200"

TC 21: Buscar produto inexistente 400
    [Tags]    tc21
    Criar Sessão
    Seleciona ID "0000000000000000"
    GET Endpoint /produtos/
    Validar Status Code "400"
    Validar Mensagem Contém "não encontrado"

TC 22: Excluir Produto 200
    [Tags]    tc22
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "teclado"
    POST Endpoint /produtos
    Guardar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 23: Excluir produto em carrinho 400
    [Tags]    tc23
    #??????????????????????????

TC 24: Excluir produto sem autorização 401
    [Tags]    tc24
    Criar Sessão
    Seleciona ID "K6leHdftCeOJj8BJ"
    DELETE Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 25: Excluir produto sem ser administrador 403
    [Tags]    tc25
    Criar Sessão
    Fazer Login e Guardar Token "user_nao_adm"
    Seleciona ID "K6leHdftCeOJj8BJ"
    DELETE Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem Contém "exclusiva"

TC 26: Editar produto 200
    [Tags]    tc26
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "tv_alterar"
    Seleciona ID "BeeJh5lz3k6kSIzA"
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem Contém "alterado"

TC 27: Editar produto inexistente 201
    [Tags]    tc27
    Criar Sessão
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
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Selecionar Produto "monitor_repetido"
    Seleciona ID "K6leHdftCeOJj8BJ"
    PUT Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem Contém "existe"

TC 29: Editar produto sem autorização 401
    [Tags]    tc29
    Criar Sessão
    Selecionar Produto "tv_alterar"
    Seleciona ID "K6leHdftCeOJj8BJ"
    PUT Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 30: Editar produto sem ser administrador 403
    [Tags]    tc30
    Criar Sessão
    Fazer Login e Guardar Token "user_nao_adm"
    Selecionar Produto "tv_alterar"
    Seleciona ID "K6leHdftCeOJj8BJ"
    PUT Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem Contém "exclusiva"

#Endpoint /carrinhos
TC 31: Listar carrinhos 200
    [Tags]    tc31
    Criar Sessão
    GET Endpoint /carrinhos
    Validar Status Code "200"
    Mostrar Conteúdo da Resposta

TC 32: Cadastrar carrinho 201
    [Tags]    tc32
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Criar carrinho
    POST Endpoint /carrinhos
    Guardar ID
    Validar Status Code "201"
    Validar Mensagem Contém "sucesso"
    DELETE Endpoint /carrinhos/cancelar-compra

TC 33: Cadastrar carrinho com erro 400
    [Tags]    tc33
    Criar Sessão
    Fazer Login e Guardar Token "user_com_carrinho"
    Criar carrinho
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Mensagem Contém "Não é permitido"

TC 34: Cadastrar carrinho sem autorização 401
    [Tags]    tc34
    Criar Sessão
    Criar carrinho
    POST Endpoint /carrinhos
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 35: Buscar carrinho por ID 200
    [Tags]    tc35
    Criar Sessão
    Seleciona ID "qbMqntef4iTOwWfg"
    GET Endpoint /carrinhos/
    Validar Status Code "200"

TC 36: Buscar carrinho inexistente 400
    [Tags]    tc36
    Criar Sessão
    Seleciona ID "0000000000000000"
    GET Endpoint /carrinhos/
    Validar Status Code "400"
    Validar Mensagem Contém "não encontrado"

TC 37: Excluir carrinho - concluir compra
    [Tags]    tc37
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Criar carrinho
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 38: Excluir carrinho sem autorização
    [Tags]    tc38
    Criar Sessão
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

TC 39: Excluir carrinho e retornar produtos para estoque - cancelar compra
    [Tags]    tc39
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Criar carrinho
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"
    Validar Mensagem Contém "sucesso"

TC 40: Excluir carrinho e retornar produtos para estoque sem autorização
    [Tags]    tc40
    Criar Sessão
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "401"
    Validar Mensagem Contém "inválido"

DELETE
    [Tags]    tcx
    Criar Sessão
    Fazer Login e Guardar Token "user_valido"
    Seleciona ID "Qdfxvy92kc2Y4v7b"
    DELETE Endpoint /produtos