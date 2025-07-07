*** Settings ***
Resource             ../resources/base.resource

Suite Setup          Criar cinema, filme e sessão para testes
Suite Teardown       Apagar dados do banco de dados

Test Setup           Criar sessão
Test Teardown        Take Screenshot

*** Test Cases ***
CT34: Verificar cores por disponibilidade e seleção dos assentos
    Ir até reserva de assentos
    Selecionar assento
    Confirmar seleção

CT36: Verificar redirecionamento para página de checkout após seleção de assentos
    Ir até reserva de assentos
    Selecionar assento
    Ir até checkout

CT38: Verificar seleção do método de pagamento, processamento do pagamento e confirmação da reserva
    Ir até reserva de assentos
    Selecionar assento
    Ir até checkout
    Selecionar pagamento
    Confirmar reserva

CT39: Acessar reservas pelo menu e visualizar como cards
    Fazer login com usuario
    Minhas reservas pelo menu