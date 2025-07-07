*** Settings ***
Library        RequestsLibrary
Library        Collections
Resource       base.resource

*** Keywords ***
Obter header com token de admin
    ${body}         Create Dictionary       email=${EMAIL_ADMIN}     password=${SENHA}
    ${response}     POST    url=http://localhost:3002/api/v1/auth/login      json=${body}

    ${data}         Get From Dictionary    ${response.json()}    data
    ${token}        Get From Dictionary    ${data}    token

    ${header}   Create Dictionary   Authorization=Bearer ${token}
    Set Suite Variable    ${header}

POST Endpoint /theaters
    Obter header com token de admin

    ${body}                 Create Dictionary
    ...                     name=Theater 10
    ...                     capacity=60
    ...                     type=standard

    ${response}          POST     url=http://localhost:3002/api/v1/theaters   json=${body}    headers=${header}
    ${data}              Get From Dictionary    ${response.json()}    data
    ${id_theater}        Get From Dictionary    ${data}    _id
    Set Suite Variable    ${id_theater}


POST Endpoint /movies
    Obter header com token de admin
    
    ${body}    Create Dictionary
    ...        title=The Spiderwick Chronicles
    ...        synopsis=Upon moving into the run-down Spiderwick Estate with their mother, twin brothers Jared and Simon Grace, along with their sister Mallory, discover a world of faeries and magical creatures hidden from human sight.
    ...        director=Mark Waters
    ...        genres=Fantasy
    ...        duration=97
    ...        classification=PG
    ...        poster=https://upload.wikimedia.org/wikipedia/en/a/a6/Spiderwick_chronicles_poster.jpg
    ...        releaseDate=2008-02-14


    ${response}          POST     url=http://localhost:3002/api/v1/movies    json=${body}    headers=${header}
    ${data}              Get From Dictionary    ${response.json()}    data
    ${id_movie}          Get From Dictionary    ${data}    _id
    Set Suite Variable    ${id_movie}


POST Endpoint /sessions
    Obter header com token de admin

    ${body}                 Create Dictionary
    ...                     movie=${id_movie}
    ...                     theater=${id_theater}
    ...                     datetime=2025-07-07T15:00:00.000+00:00
    ...                     fullPrice=30
    ...                     halfPrice=15

    ${response}          POST     url=http://localhost:3002/api/v1/sessions   json=${body}    headers=${header}
    ${data}              Get From Dictionary    ${response.json()}    data
    ${id_session}          Get From Dictionary    ${data}    _id
    Set Suite Variable    ${id_session}