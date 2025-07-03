*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     FakerLibrary

Resource    ../variables/variables.resource
Resource    auth_keywords.resource
Resource    movies_keywords.resource
Resource    reservations_keywords.resource
Resource    sessions_keywords.resource
Resource    theaters_keywords.resource

*** Keywords ***
Criar sessão na API
    Create Session      cinema      ${URL_BASE}

Validar status code
    [Arguments]          ${status_code}
    Should Be True       ${response.status_code}==${status_code}           O status code deveria ser "${status_code}" e não "${response.status_code}"

Validar sucesso
    [Arguments]         ${sucesso}
    ${sucesso_string}    Convert To Boolean    ${sucesso} 
    Should Be Equal      ${response.json()["success"]}       ${sucesso_string}       O sucesso deveria ser "${sucesso_string}" e não "${response.json()["success"]}"
    IF    ${response.json()["success"]} == False
        Log To Console      ${response.json()["errors"]}
    END

Validar mensagem
    [Arguments]         ${mensagem}
    Should Be Equal     ${response.json()["message"]}       ${mensagem}        A mensagem deveria ser "${mensagem}" e não "${response.json()["message"]}"
    Log To Console      ${response.json()["message"]}

Validar resposta não vazia
    Should Not Be Empty     ${response.json()}      Nenhuma informação foi retornada pela API

Obter header com token de user
    POST Endpoint /auth/login    ${EMAIL_USER}    ${SENHA}
    Validar se foi gerado um token de autenticação
    Guardar token gerado
    ${header}   Create Dictionary   Authorization=Bearer ${token}
    Set Test Variable    ${header}

Obter header com token de admin
    POST Endpoint /auth/login    ${EMAIL_ADMIN}    ${SENHA}
    Validar se foi gerado um token de autenticação
    Guardar token gerado
    ${header}   Create Dictionary   Authorization=Bearer ${token}
    Set Test Variable    ${header}

Obter id
    ${data}              Get From Dictionary    ${response.json()}    data
    ${tem_id}            Run Keyword And Return Status    Dictionary Should Contain Key    ${data}    id
    IF    ${tem_id}
        ${id}            Get From Dictionary    ${data}    id
    ELSE
        ${id}            Get From Dictionary    ${data}    _id
    END
    Set Test Variable    ${id}

