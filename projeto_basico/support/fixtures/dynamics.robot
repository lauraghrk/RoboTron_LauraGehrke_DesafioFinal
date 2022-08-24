*** Settings ***
Documentation    Keywords e variáveis para geração de dados dinâmicos
Library        FakerLibrary

*** Keywords ***
Criar Dados Usuário Válido
    ${nome}    FakerLibrary.Name
    ${email}    FakerLibrary.Email
    ${payload}    Create Dictionary    nome=${nome}    email=${email}    password=senha123    administrador=true
    Log To Console    ${payload}
    Set Global Variable    ${payload}