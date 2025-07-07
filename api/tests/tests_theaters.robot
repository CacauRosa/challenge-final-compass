*** Settings ***
Resource            ../resources/keywords/geral_keywords.resource

Suite Setup       Criar sessão na API

*** Test Cases ***
CT49: GET Obter todos os cinemas
    [TAGS]    obter_todos
    GET Endpoint /theaters
    Validar status code     200    response
    Validar resposta não vazia

CT50: GET Verificar detalhes do cinema
    [TAGS]    detalhes
    GET Endpoint /theaters/id
    Validar status code     200    response
    Validar resposta não vazia

CT51: POST Cadastrar cinema com dados válidos
    [TAGS]      cadastro
    POST Endpoint /theaters
    Validar status code    201    response_theaters