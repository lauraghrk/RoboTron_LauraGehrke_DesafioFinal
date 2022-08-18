*** Settings ***
Documentation    Keywords gerais
Library        RequestsLibrary
Library        OperatingSystem

*** Variables ***
${response}

*** Keywords ***
Criar Sessão
    Create Session    serverest    http://localhost:3000/

Importar JSON Estático
    [Arguments]    ${nome_arquivo}
    ${arquivo}    Get File    ${EXECDIR}/${nome_arquivo}
    ${data}    Evaluate    json.loads('''${arquivo}''')    json
    [Return]    ${data}

Validar Status Code "${status_code}"
    Should Be True    ${response.status_code} == ${status_code}

Validar Mensagem Contém "${palavra}"
    Should Contain    ${response.json()["message"]}    ${palavra}

Mostrar Conteúdo da Resposta
    Log To Console    Resposta: ${response.content}