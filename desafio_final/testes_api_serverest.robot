*Settings*
Documentation    Casos te teste da API ServeRest
Library    RequestsLibrary

*Variables*
${user}    {"email": "fulano@qa.com", "password": "teste"}


*Test Cases*
Cenário 1: POST Login com dados válidos
    Criar sessão
    POST Endpoint /login
    Validar status code "200"
    Validar mensagem "Login realizado com sucesso"

*Keywords*
Criar sessão
    Create Session    serverest    https://serverest.dev    ${user}

POST Endpoint /login
    ${response}    POST On Session    serverest    /login
    Set Global Variable    ${response}

Validar status code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Validar mensagem "${message}"
    Should Be True    ${response.message} == ${message}