*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             FakerLibrary
Resource        geral_keywords.resource

*** Keywords ***
GET Endpoint /movies
    ${response}          GET On Session     cinema    /movies
    Set Test Variable    ${response}

GET Endpoint /movies/id
    POST Endpoint /movies
    Obter id
    ${response}          GET On Session     cinema    /movies/${id}
    Log to Console       Filme de id ${id}: ${response.content}
    Set Test Variable    ${response}

Body para cadastro de filme
    ${titulo}               FakerLibrary.Sentence      nb_words=3
    ${sinopse}              FakerLibrary.Paragraph
    ${diretor}              FakerLibrary.Name
    ${todos_os_generos}     Create List                Fantasy    Adventure    Family    Drama    Comedy    Sci-Fi    Action    Mystery
    @{generos}              Evaluate                   random.sample(${todos_os_generos}, random.randint(1, 2))    modules=random
    ${duracao}              FakerLibrary.Random Int    min=80     max=180
    ${classificacao}        Set Variable               PG
    ${poster}               Set Variable               https://image.jpg
    ${data_lancamento}      FakerLibrary.Date          pattern=%Y-%m-%d

    ${body}                 Create Dictionary
    ...                     title=${titulo}
    ...                     synopsis=${sinopse}
    ...                     director=${diretor}
    ...                     genres=${generos}
    ...                     duration=${duracao}
    ...                     classification=${classificacao}
    ...                     poster=${poster}
    ...                     releaseDate=${data_lancamento}
    Set Test Variable       ${body}

POST Endpoint /movies
    Obter header com token de admin
    Body para cadastro de filme
    ${response}          POST On Session     cinema    /movies    json=${body}    headers=${header}
    Log To Console       Filme criado: ${body}
    Set Test Variable    ${response}