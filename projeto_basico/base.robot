#Sessão para configuração, documentação, imports de arquivos e librarys
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Library          RequestsLibrary
Resource        ./usuarios_keywords.robot
Resource        ./login_keywords.robot
Resource        ./produtos_keywords.robot
Resource        ./common.robot

#Sessão para definição de variáveis
*** Variables ***
${response}

#Sessão para criação dos cenários de teste
*** Test Cases ***
Cenário: GET Todos os Usuários 200
    [tags]    get
    Criar Sessão
    GET Endpoint /usuarios
    Validar Status Code "200"
    #Validar Quantidade "${28}"
    Printar Conteúdo Response

Cenário: POST Cadastrar Usuário 201
    [tags]    post
    Criar Sessão
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contém "sucesso"

Cenário: PUT Editar Usuário 200
    [tags]    put
    Criar Sessão
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenário: DELETE Deletar Usuário 200
    [tags]    delete
    Criar Sessão
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenário: POST Realizar Login 200
    [Tags]    postlogin
    Criar Sessão
    POST Endpoint /login
    Validar Status Code "200"

Cenário: POST Criar Produto 201
    [Tags]    postproduto
    Criar Sessão
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenário: DELETE Excluir Produto 200
    [Tags]    deleteproduto
    Criar Sessão
    Fazer Login e Armazenar Token
    Criar Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenário: POST Criar Usuário com Massa Estática 201
    [Tags]    postcriarusuarioestatico
    Criar Sessão
    Criar Usuário Estático Válido
    Validar Status Code "201"

#Sessão para criação de keywords personalizadas
*** Keywords ***
Criar Sessão
    Create Session    serverest    http://localhost:3000/
