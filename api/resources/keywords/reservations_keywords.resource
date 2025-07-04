*** Settings ***
Resource    geral_keywords.resource

*** Keywords ***
GET Endpoint /reservations/me
    Obter header com token de user
    ${response}          GET On Session     cinema    /reservations/me    headers=${header}    expected_status=any
    Log To Console       Reservas do usuário atual: ${response.content}
    Set Test Variable    ${response}

GET Endpoint /reservations/id
    Obter header com token de user
    POST Endpoint /reservations
    Obter id
    ${response}          GET On Session     cinema    /reservations/${id}        headers=${header}
    Set Test Variable    ${response}

Body para reserva de um assento
    POST Endpoint /sessions
    Obter id
    ${sessao_id}            Set Variable                         ${id}
    ${fileira}              FakerLibrary.Random Element          elements=["A","B","C","D","E","F","G","H"]
    ${numero_assento}       FakerLibrary.Random Int              min=1    max=10
    ${tipo_assento}         FakerLibrary.Random Element          elements=["full","half"]   

    &{assento}              Create Dictionary
    ...                     row=${fileira}
    ...                     number=${numero_assento}
    ...                     type=${tipo_assento}

    @{assentos}             Create List                          ${assento} 

    ${forma_pagamento}       FakerLibrary.Random Element          elements=["pix", "credit_card", "debit_card", "bank_transfer"]


    ${body}                 Create Dictionary
    ...                     session=${sessao_id}
    ...                     seats=${assentos}
    ...                     paymentMethod=${forma_pagamento}
    Set Test Variable       ${body}

POST Endpoint /reservations
    Obter header com token de user
    Body para reserva de um assento
    ${response}          POST On Session     cinema    /reservations   json=${body}    headers=${header}
    Set Test Variable    ${response}

Body para reserva de mais assentos
    POST Endpoint /sessions
    Obter id
    ${sessao_id}             Set Variable                         ${id}
    ${fileira1}              FakerLibrary.Random Element          elements=["A","B","C","D","E","F","G","H"]
    ${numero_assento1}       FakerLibrary.Random Int              min=1    max=10
    ${tipo_assento1}         FakerLibrary.Random Element          elements=["full","half"]

    ${fileira2}              FakerLibrary.Random Element          elements=["A","B","C","D","E","F","G","H"]
    ${numero_assento2}       FakerLibrary.Random Int              min=1    max=10
    ${tipo_assento2}         FakerLibrary.Random Element          elements=["full","half"]

    &{assento1}             Create Dictionary
    ...                     row=${fileira1}
    ...                     number=${numero_assento1}
    ...                     type=${tipo_assento1}

    &{assento2}             Create Dictionary
    ...                     row=${fileira2}
    ...                     number=${numero_assento2}
    ...                     type=${tipo_assento2}

    @{assentos}             Create List                         ${assento1}    ${assento2}

    ${forma_pagamento}      FakerLibrary.Random Element          elements=["pix", "credit_card", "debit_card", "bank_transfer"]

    ${body}                 Create Dictionary
    ...                     session=${sessao_id}
    ...                     seats=${assentos}
    ...                     paymentMethod=${forma_pagamento}
    Set Test Variable       ${body}

POST Endpoint /reservations com mais de um assento
    POST Endpoint /reservations
    Obter header com token de user
    Body para reserva de mais assentos
    ${response}          POST On Session     cinema    /reservations   json=${body}    headers=${header}
    Set Test Variable    ${response}

POST Endpoint /reservations com assento já reservado
    POST Endpoint /reservations
    ${response}          POST On Session     cinema    /reservations   json=${body}    headers=${header}    expected_status=any
    Set Test Variable    ${response}