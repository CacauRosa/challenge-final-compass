*** Settings ***
Resource        geral_keywords.resource

*** Keywords ***
POST Endpoint /auth/login
    [Arguments]          ${email}    ${password}
    ${body}              Create Dictionary       email=${email}      password=${password}
    ${response}          POST On Session     cinema       /auth/login      json=${body}
    Set Test Variable    ${response}

Validar se foi gerado um token de autenticação
    ${data}                Get From Dictionary    ${response.json()}    data
    Should Not Be Empty    ${data["token"]}    Token de autenticação não foi gerado
    Set Test Variable      ${data} 

Guardar token gerado
    ${token}             Get From Dictionary    ${data}    token
    Set Test Variable    ${token}

GET Endpoint /auth/me
    Obter header com token de user
    ${response}          GET On Session     cinema    /auth/me    headers=${header}
    Set Test Variable    ${response}

Body para cadastro de usuário
    ${primeiro_nome}        FakerLibrary.First Name
    ${sobrenome}            FakerLibrary.Last Name
    ${email}                FakerLibrary.Email           
    ${password}             FakerLibrary.Password       length=6        special_chars=False
    ${body}                 Create Dictionary
    ...                     name=${primeiro_nome} ${sobrenome}
    ...                     email=${email}
    ...                     password=${password}
    Set Test Variable       ${body}

POST Endpoint /auth/register
    Body para cadastro de usuário
    ${response_users}       POST On Session     cinema       /auth/register     json=${body}
    Log To Console          Usuário criado: ${body}
    Set Test Variable       ${response_users}

POST Endpoint /auth/register com email invalido
    Body para cadastro de usuário
    ${nome_email}           FakerLibrary.User Name
    ${email}                Set Variable        ${nome_email}.com
    Set To Dictionary       ${body}             email=${email}
    ${response}             POST On Session     cinema       /auth/register      json=${body}     expected_status=any
    Log To Console          Usuário criado com e-mail inválido: ${body}
    Set Test Variable       ${response}

POST Endpoint /auth/register com senha invalida
    Body para cadastro de usuário
    ${caracteres}           Evaluate        random.randint(2, 5)       random
    ${caracteres_int}       Convert To Integer          ${caracteres}
    ${password}             FakerLibrary.Password       length=${caracteres_int}        special_chars=False    upper_case=False
    Set To Dictionary       ${body}                     password=${password}
    ${response}             POST On Session     cinema       /auth/register      json=${body}     expected_status=any
    Log To Console          Usuário criado com senha inválida: ${body}
    Set Test Variable       ${response}

POST Endpoint /auth/register com email já utilizado
    POST Endpoint /auth/register
    ${email_utilizado}      Set Variable        ${body["email"]}
    Body para cadastro de usuário
    Set To Dictionary       ${body}             email=${email_utilizado}
    ${response}             POST On Session     cinema       /auth/register      json=${body}     expected_status=any
    Log To Console          Usuário com email já utilizado: ${body}
    Set Test Variable       ${response}