*** Test Cases ***
Cenário: GET Todos os Usuários 200
    GET Endpoint /usuarios
    Validar todos os usuários na response
    Validar status code "200"

Cenário: GET Usuário Especifico 200
    GET Endpoint /usuarios com id "/0uxuPY0cbmQhpEz1"
    Validar Usuário com id "/0uxuPY0cbmQhpEz1"
    Validar Status Code "200"
    Validar Mensagem "Nome = Fulano da Silva"

Cenário: POST Criar Novo Usuário 201
    Criar Usuário Dinâmico
    POST Usuário Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: PUT Editar usuário Existente 200
    PUT Editar usuário com id "/0uxuPY0cbmQhpEz1" usando Dados Dinâmicos
    Validar Status Code 200
    Validar Mensagem "Registro alterado com sucesso"

Cenário: DELETE Excluir Usuário Existente 200
    DELETE Usuário Específico com id "/0uxuPY0cbmQhpEz1"
    Validar Status Code 200
    Validar Mensagem "Registro excluído com sucesso"