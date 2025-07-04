*** Settings ***
Library        Browser

Resource       variables.resource
Resource       pages/loginPage.resource
Resource       pages/moviesPage.resource
Resource       pages/reservationsPage.robot
Resource       pages/ux.robot
Resource       pages/components/alert.resource

*** Keywords ***
Criar sessão
    New Browser     browser=chromium      headless=False
    New Page        ${URL_BASE} 

Fazer login com usuario
    ${user}    Create Dictionary
    ...        email=${EMAIL_USER}
    ...        password=${SENHA}
    
    Ir para login
    Preencher login               ${user}
    Alerta deve ser    Login realizado com sucesso!
    Usuario na pagina inicial

Ir até reserva de assentos
    Fazer login com usuario
    Ir para filmes
    Ir para detalhes de um filme
    Verificar sessões disponíveis com horários
    Ir para reserva
