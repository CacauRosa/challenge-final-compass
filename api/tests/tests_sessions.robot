*** Settings ***
Resource            ../resources/keywords/geral_keywords.resource

Suite Setup       Criar sessão na API

*** Test Cases ***
CT43: GET Obter todos as sessões
    [TAGS]    obter_todos
    GET Endpoint /sessions
    Validar status code     200    response
    Validar resposta não vazia

CT44: GET Verificar detalhes dos horários
    [TAGS]    detalhes
    GET Endpoint /sessions/id
    Validar status code     200    response
    Validar resposta não vazia

CT45: POST Cadastrar sessão com dados válidos
    [TAGS]    cadastro
    POST Endpoint /sessions
    Validar status code    201    response_sessions