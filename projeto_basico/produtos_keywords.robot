*** Settings ***
Documentation        Keywords e variáveis para ações do endpoint /produtos
Library            RequestsLibrary

*** Variables ***
${token_auth}
${id_produto}
${response}

*** Keywords ***
POST Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    &{payload}    Create Dictionary    nome=PC    preco=50    descricao=eletronicos    quantidade=100
    ${response}    POST On Session    serverest    /produtos    data=&{payload}    headers=&{header}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

Criar Produto e Armazenar ID
    POST Endpoint /produtos
    Validar Ter Criado Produto
    ${id_produto}    Set Variable    ${response.json()["_id"]}
    Log To Console    ID Produto: ${id_produto}
    Set Global Variable    ${id_produto}

DELETE Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    ${response}    DELETE On Session    serverest    /produtos/${id_produto}    headers=${header}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Ter Criado Produto
    Should Be Equal    ${response.json()["message"]}    Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()["_id"]}