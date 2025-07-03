*** Settings ***
Resource            ../resources/keywords/geral_keywords.resource

Suite Setup         Criar sessão na API

*** Test Cases ***
CT15: GET Obter todos os filmes
    GET Endpoint /movies
    Validar status code             200
    Validar resposta não vazia

CT16: GET Verificar detalhes do filme
    GET Endpoint /movies/id
    Validar status code             200
    Validar resposta não vazia

CT19: POST Cadastrar filme com dados válidos
    [TAGS]      cadastro
    POST Endpoint /movies
    Validar status code    201
    Validar sucesso        True