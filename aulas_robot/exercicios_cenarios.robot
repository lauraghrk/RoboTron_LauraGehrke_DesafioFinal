*** Test Cases ***
Cenário: GET Buscar Produto Existente 200
    GET Endpoint /produtos id /0uxuPY0cbmQhpEz1
    Validar produto id = 0uxuPY0cbmQhpEz1
    Validar status code 200

Cenário: GET Buscar Produto Inexistente 400
    GET Endpoint /produtos id /0uxuPY0cbmQhpEz1
    Validar produto id != 0uxuPY0cbmQhpEz1
    Validar status code 400
    Validar mensagem "Produto não encontrado"

Cenário: PUT Editar Produto 200
    PUT Endpoint /produtos id /0uxuPY0cbmQhpEz1 utilizando dados dinâmicos
    Validar status code 200
    Validar mensagem "Produto alterado com sucesso"

Cenário: PUT Tentativa de Editar Produto sem ser ADM 403
    PUT Endpoint /produtos id /0uxuPY0cbmQhpE
    Validar se administrador = true
    Validar status code 403
    Validar mensagem "Rota exclusiva para administradores"