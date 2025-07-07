*** Settings ***
Resource             ../resources/base.resource

Suite Setup          Criar cinema, filme e sessão para testes
Suite Teardown       Apagar dados do banco de dados

Test Setup           Criar sessão
Test Teardown        Take Screenshot

*** Test Cases ***
CT24: Verificar seção de “Filmes em Cartaz”
    Fazer login com usuario
    Ir para filmes

CT22: Verificar navegação para reserva a partir de horários disponíveis
    Fazer login com usuario
    Ir para filmes
    Ir para detalhes de um filme    ${id_movie}
    Verificar sessões disponíveis com horários
    Ir para reserva