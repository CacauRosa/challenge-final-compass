*** Settings ***
Resource             ../resources/base.resource

Test Setup           Criar sessão
Test Teardown        Take Screenshot

*** Test Cases ***
CT02: Verificar redirecionamento para página inicial após login bem-sucedido
    ${user}    Create Dictionary
    ...        email=${EMAIL_USER}
    ...        password=${SENHA}

    Ir para login
    Preencher login               ${user}
    Alerta deve ser    Login realizado com sucesso!
    Usuario na pagina inicial

CT03: Verificar redirecionamento para página inicial após login bem-sucedido
    Fazer login com usuario
    Logout e confirmação
    Usuario na pagina de login