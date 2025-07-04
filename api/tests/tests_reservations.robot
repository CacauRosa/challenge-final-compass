*** Settings ***
Resource            ../resources/keywords/geral_keywords.resource

Suite Setup         Criar sessão na API

*** Test Cases ***
CT28: GET Obter reservas do usuário atual
    GET Endpoint /reservations/me
    Validar status code             200
    Validar resposta não vazia

CT29: GET Verificar detalhes da reserva
    GET Endpoint /reservations/id
    Validar status code             200
    Validar resposta não vazia

CT30: POST Cadastrar reserva com dados válidos
    POST Endpoint /reservations
    Validar status code    201
    Validar sucesso        True

CT31: POST Cadastrar mais de um assento em uma reserva
    POST Endpoint /reservations com mais de um assento
    Validar status code    201
    Validar sucesso        True

CT32: POST Cadastrar assentos já reservados em uma reserva 
    POST Endpoint /reservations com assento já reservado
    Validar status code    400