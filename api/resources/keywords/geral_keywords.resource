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
    [Arguments]          ${status_code}    ${nome_response}
    Should Be True       ${${nome_response}.status_code}==${status_code}           O status code deveria ser "${status_code}" e não "${${nome_response}.status_code}"

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
    [Arguments]    ${nome_endpoint}
    ${data}     Get From Dictionary    ${response_${nome_endpoint}.json()}    data
    ${id_${nome_endpoint}}       Get From Dictionary    ${data}    _id
    Set Test Variable    ${id_${nome_endpoint}}