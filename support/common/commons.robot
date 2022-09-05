*** Settings ***
Documentation    Keywords gerais
Library        RequestsLibrary
Library        OperatingSystem
Resource        ../variables/variables.robot

*** Keywords ***
Criar Sessão
    Create Session    serverest    ${base_uri}

Importar JSON Estático
    [Arguments]    ${nome_arquivo}
    ${arquivo}    Get File    ${EXECDIR}/support/fixture/${nome_arquivo}
    ${data}    Evaluate    json.loads('''${arquivo}''')    json
    [Return]    ${data}

Validar Status Code "${status_code}"
    Should Be True    ${response.status_code} == ${status_code}

Validar Mensagem Contém "${palavra}"
    Should Contain    ${response.json()["message"]}    ${palavra}

Mostrar Conteúdo da Resposta
    Log To Console    Resposta: ${response.content}

Seleciona ID "${id}"
    ${id_guardado}    Set Variable    ${id}
    Set Global Variable    ${id_guardado}

Guardar ID
    ${id_guardado}    Set Variable    ${response.json()["_id"]}
    Log To Console    ID salvo: ${id_guardado}
    Set Global Variable    ${id_guardado}

Definir Token Expirado
    ${token}    Set Variable    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNTg5NzU4NzQ2LCJleHAiOjE1ODk3Njg3NDZ9.B6TASHV8k9xBerz4NSeFBlAZGSDhZlqESt767M0567I"
    Set Global Variable    ${token}