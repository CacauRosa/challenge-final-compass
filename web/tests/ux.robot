*** Settings ***
Resource             ../resources/base.resource

Test Setup           Criar sessão
Test Teardown        Take Screenshot

*** Test Cases ***
CT58: Verificar presença do cabeçalho contendo links rápidos para áreas principais nas páginas da aplicação
    Fazer login com usuario
    Verificar cabeçalho na página inicial
    Ir para catálogo de filmes
    Ir para inicio
    Ir para perfil