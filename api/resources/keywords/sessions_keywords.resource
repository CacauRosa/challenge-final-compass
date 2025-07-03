*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             FakerLibrary
Resource    geral_keywords.resource

*** Keywords ***
GET Endpoint /sessions
    Obter header com token de admin
    ${response}          GET On Session     cinema    /sessions    headers=${header}
    Set Test Variable    ${response}

GET Endpoint /sessions/id
    POST Endpoint /sessions
    Obter id
    ${response}          GET On Session     cinema    /sessions/${id}
    Set Test Variable    ${response}

Body para cadastro de sessão
    POST Endpoint /movies
    Obter id
    ${filme_id}             Set Variable                  ${id}
    POST Endpoint /theaters
    Obter id             
    ${cinema_id}            Set Variable                  ${id} 
    ${data_hora}            FakerLibrary.Date             pattern=%Y-%m-%d

    ${preco_inteira}        Set Variable                   30
    ${preco_meia}           Set Variable                   15

    ${body}                 Create Dictionary
    ...                     movie=${filme_id}
    ...                     theater=${cinema_id}
    ...                     datetime=${data_hora}
    ...                     fullPrice=${preco_inteira}
    ...                     halfPrice=${preco_meia}
    Set Test Variable       ${body}


POST Endpoint /sessions
    Obter header com token de admin
    Body para cadastro de sessão
    ${response}          POST On Session     cinema    /sessions   json=${body}    headers=${header}
    Set Test Variable    ${response}