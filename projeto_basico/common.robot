*** Settings ***
Documentation        Keywords e variáveis gerais
Library            OperatingSystem

*** Variables ***
${response}

*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Importar JSON Estático
    [Arguments]    ${nome_arquivo}
    ${aquivo}    Get File    ${EXECDIR}/${nome_arquivo}
    ${data}        Evaluate    json.loads('''${aquivo}''')    json
    [Return]    ${data}