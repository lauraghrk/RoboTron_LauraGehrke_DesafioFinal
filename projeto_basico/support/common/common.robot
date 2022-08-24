*** Settings ***
Documentation        Keywords e variáveis gerais
Library            RequestsLibrary
Library            OperatingSystem
Resource            ../variables/serverest_variables.robot

*** Variables ***
${response}

*** Keywords ***
Criar Sessão
    Create Session    serverest    ${base_uri}
    
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Validar Se Mensagem Contém "${palavra}"
    Should Contain    ${response.json()["message"]}    ${palavra}

Importar JSON Estático
    [Arguments]    ${nome_arquivo}
    ${aquivo}    Get File    ${EXECDIR}/support/fixtures/${nome_arquivo}
    ${data}        Evaluate    json.loads('''${aquivo}''')    json
    [Return]    ${data}