*** Settings ***
Resource    geral_keywords.resource

*** Keywords ***
GET Endpoint /sessions
    Obter header com token de admin
    ${response}          GET On Session     cinema    /sessions    headers=${header}
    Set Test Variable    ${response}

GET Endpoint /sessions/id
    POST Endpoint /sessions
    Obter id    sessions
    ${response}          GET On Session     cinema    /sessions/${id_sessions}
    Set Test Variable    ${response}

Body para cadastro de sessão
    POST Endpoint /movies
    Obter id    movies
    POST Endpoint /theaters
    Obter id    theaters          
    ${data_hora}            FakerLibrary.Date             pattern=%Y-%m-%d

    ${preco_inteira}        Set Variable                   30
    ${preco_meia}           Set Variable                   15

    ${body}                 Create Dictionary
    ...                     movie=${id_movies}
    ...                     theater=${id_theaters}
    ...                     datetime=${data_hora}
    ...                     fullPrice=${preco_inteira}
    ...                     halfPrice=${preco_meia}
    Set Test Variable       ${body}
    Set Test Variable       ${id_movies}


POST Endpoint /sessions
    Obter header com token de admin
    Body para cadastro de sessão
    ${response_sessions}          POST On Session     cinema    /sessions   json=${body}    headers=${header}
    Set Test Variable    ${response_sessions}