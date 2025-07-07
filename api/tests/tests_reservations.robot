*** Settings ***
Resource            ../resources/keywords/geral_keywords.resource

Suite Setup       Criar sessão na API

*** Test Cases ***
CT28: GET Obter reservas do usuário atual
    [TAGS]    obter_atual
    GET Endpoint /reservations/me
    Validar status code     200    response
    Validar resposta não vazia

CT29: GET Verificar detalhes da reserva
    [TAGS]    detalhes
    GET Endpoint /reservations/id
    Validar status code     200    response
    Validar resposta não vazia

CT30: POST Cadastrar reserva com dados válidos
    [TAGS]    cadastro
    POST Endpoint /reservations
    Validar status code    201    response_reservations

CT31: POST Cadastrar mais de um assento em uma reserva
    [TAGS]    cadastro
    POST Endpoint /reservations com mais de um assento
    Validar status code    201    response_reservations

CT32: POST Cadastrar assentos já reservados em uma reserva 
    [TAGS]    cadastro_duplicado
    POST Endpoint /reservations com assento já reservado
    Validar status code    400    response