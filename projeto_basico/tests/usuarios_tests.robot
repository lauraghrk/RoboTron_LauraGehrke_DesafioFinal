*** Settings ***
Documentation    Testes para o endpoint /usuarios
Resource        ../keywords/usuarios_keywords.robot

Suite Setup    Criar Sessão
Suite Teardown

*** Test Cases ***
Cenário: GET Todos os Usuários 200
    [tags]    get
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenário: POST Cadastrar Usuário 201
    [tags]    post
    Criar Dados Usuário Válido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contém "sucesso"

Cenário: PUT Editar Usuário 200
    [tags]    put
    Criar Dados Usuário Válido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenário: DELETE Deletar Usuário 200
    [tags]    delete
    Criar Dados Usuário Válido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenário: POST Criar Usuário com Massa Estática 201
    [Tags]    postcriarusuarioestatico
    Obter Dados Usuário Estático Válido
    POST Endpoint /usuarios
    Validar Status Code "201"