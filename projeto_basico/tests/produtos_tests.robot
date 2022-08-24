*** Settings ***
Documentation    Testes para o endpoint /produtos
Resource        ../keywords/produtos_keywords.robot

Suite Setup    Criar Sessão

*** Test Cases ***
Cenário: POST Criar Produto 201
    [Tags]    postproduto
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenário: DELETE Excluir Produto 200
    [Tags]    deleteproduto
    Fazer Login e Armazenar Token
    Criar Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"