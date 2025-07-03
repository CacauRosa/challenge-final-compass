*** Settings ***
Resource            ../resources/keywords/geral_keywords.resource

Suite Setup         Criar sessão na API

*** Test Cases ***
CT01: POST Login com dados válidos
    [TAGS]      login
    POST Endpoint /auth/login    ${EMAIL_USER}    ${SENHA}
    Validar se foi gerado um token de autenticação
    Guardar token gerado
    Validar status code             200

CT06: GET Verificar dados do perfil
    GET Endpoint /auth/me
    Validar status code             200
    Validar resposta não vazia

CT07: POST Cadastrar usuário com dados válidos
    [TAGS]      cadastro
    POST Endpoint /auth/register
    Validar status code    201  
    Validar sucesso        True

CT08: POST Cadastrar usuário com formato de e-mail inválido
    [TAGS]      cadastro_padrões
    POST Endpoint /auth/register com email invalido
    Validar status code    400      
    Validar sucesso        False

CT09: POST Cadastrar usuário com formato de senha inválido
    [TAGS]      cadastro_padrões
    POST Endpoint /auth/register com senha invalida
    Validar status code    400
    Validar sucesso        False

CT10: POST Cadastrar usuário com e-mail já utilizado
    [TAGS]      cadastro
    POST Endpoint /auth/register com email já utilizado
    Validar status code    400
    Validar mensagem       User already exists