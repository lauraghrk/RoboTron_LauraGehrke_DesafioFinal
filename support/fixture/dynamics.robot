*** Settings ***
Documentation    Keywords para geração de dados dinâmicos
Library        FakerLibrary

*** Keywords ***
Criar Dados Usuário Válido
    ${nome}    FakerLibrary.Name
    ${email}    FakerLibrary.Email
    ${payload}    Create Dictionary    nome=${nome}    email=${email}    password=senha123    administrador=true
    Log To Console    ${payload}
    Set Global Variable    ${payload}

Criar Dados Produto
    ${nome}    FakerLibrary.Word    ext_word_list=['Mouse', 'Teclado', 'Monitor', 'TV', 'Celular', 'Fone de ouvido', 'Carregador']
    ${preco}    FakerLibrary.Random Int    min=30
    ${descricao}    FakerLibrary.Sentence    nb_words=4
    ${quantidade}    FakerLibrary.Random Int    min=1    max=200
    ${payload}    Create Dictionary    nome=${nome}    preco=${preco}    descricao=${descricao}    quantidade=${quantidade}
    Log To Console    ${payload}
    Set Global Variable    ${payload}