#Sessão para configuração, documentação, imports de arquivos e librarys
*Settings*
Documentation    Arquivo simples para requisições HTTP em APIs REST
Library          RequestsLibrary

#Sessão para definição de variáveis
*Variables*


#Sessão para criação dos cenários de teste
*Test Cases*
Cenário: GET Todos os Usuários 200
    [tags]    get
    Criar Sessão
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${28}"
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

#Sessão para criação de keywords personalizadas
*Keyword*
Criar Sessão
    Create Session    serverest    https://serverest.dev

GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

POST Endpoint /usuarios
    &{payload}    Create Dictionary    nome=Rachele    email=rachele@gmail.com    password=biscoito    administrador=true
    ${response}    POST On Session    serverest    /usuarios    data=&{payload}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    &{payload}    Create Dictionary    nome=Joey    email=joe@gmail.com    password=biscoito    administrador=true
    ${response}    PUT On Session    serverest    /usuarios/IWgmQxi2sr4jGTaj    data=&{payload}
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}    DELETE On Session    serverest    /usuarios/IWgmQxi2sr4jGTaj
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Validar Quantidade "${quantidade}"
    Should Be Equal    ${response.json()["quantidade"]}    ${quantidade}

Validar Se Mensagem Contém "${palavra}"
    Should Contain    ${response.json()["message"]}    ${palavra}

Printar Conteúdo Response
    Log to Console    Response: ${response.json()["usuarios"][0]["nome"]}