#Sessão para configuração, documentação, imports de arquivos e librarys
*Settings*
Documentation    Arquivo simples para requisições HTTP em APIs REST
Library          RequestsLibrary

#Sessão para definição de variáveis
*Variables*


#Sessão para criação dos cenários de teste
*Test Cases*
Cenário: GET Todos os Usuários 200
    Criar sessão
    GET Endpoint /usuarios
    Validar Status Code "200"


#Sessão para criação de keywords personalizadas
*Keyword*
Criar Sessão
    Create Session    serverest    https://serverest.dev

GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}