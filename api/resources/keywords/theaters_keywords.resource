*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             FakerLibrary
Resource    geral_keywords.resource

*** Keywords ***
GET Endpoint /theaters
    Obter header com token de admin
    ${response}          GET On Session     cinema    /theaters    headers=${header}
    Set Test Variable    ${response}

GET Endpoint /theaters/id
    POST Endpoint /theaters
    Obter id
    ${response}          GET On Session     cinema    /theaters/${id}
    Log to Console       Cinema de id ${id}: ${response.content}
    Set Test Variable    ${response}

Body para cadastro de cinema
    ${palavra}              FakerLibrary.Word
    ${numero}               FakerLibrary.Random Number
    ${nome_cinema}          Set Variable                         Theater ${palavra} ${numero}
    ${capacidade}           Set Variable                         80          
    ${tipo_cinema}          FakerLibrary.Random Element          elements=["standard","IMAX","3D"]

    ${body}                 Create Dictionary
    ...                     name=${nome_cinema}
    ...                     capacity=${capacidade}
    ...                     type=${tipo_cinema}
    Set Test Variable       ${body}

POST Endpoint /theaters
    Obter header com token de admin
    Body para cadastro de cinema
    ${response}          POST On Session     cinema    /theaters   json=${body}    headers=${header}
    Log To Console       Cinema criado: ${body}
    Set Test Variable    ${response}