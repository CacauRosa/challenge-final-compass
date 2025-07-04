*** Settings ***
Library     Browser
Library     FakerLibrary

Resource    ../variables.resource

*** Keywords ***
Selecionar assento
    ${fileira}       FakerLibrary.Random Element          elements=["A","B","C","D","E","F","G"]
    ${assento}       FakerLibrary.Random Int              min=1    max=8

    ${element}  Set Variable    xpath=//button[@title="Fileira ${fileira}, Assento ${assento} - Status: available"]
    Scroll To Element          ${element}
    Wait For Elements State    ${element}      visible      5
    Click                      ${element}

    Set Test Variable    ${fileira}
    Set Test Variable    ${assento}

Confirmar seleção
    ${element}  Set Variable    xpath=//button[@title="Fileira ${fileira}, Assento ${assento} - Status: selected"]
    Wait For Elements State    ${element}      visible      5

Ir até checkout
    ${element}    Set Variable    xpath=//button[text()="Continuar para Pagamento"]
    Scroll To Element          ${element}
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}      equal        Continuar para Pagamento
    Click                      ${element}

Selecionar pagamento
    ${pagamento}    FakerLibrary.Random Int              min=1    max=4
    ${element}  Set Variable    xpath=//div[contains(@class, 'payment-method ')][${pagamento}]
    Wait For Elements State    ${element}      visible      5
    Click                      ${element}

    ${element_finalizar}    Set Variable    xpath=//button[text()="Finalizar Compra"]
    Click    ${element_finalizar}

Confirmar reserva
    ${element}    Set Variable    xpath=//*[@id="root"]/main/div/div/div[1]/h1
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}     equal        Reserva Confirmada!

Minhas reservas pelo menu
    Click    xpath=//*[@id="root"]/header/div/nav/ul/li[3]/a
    ${element}    Set Variable    xpath=//*[@id="root"]/main/div/div/div[1]/h1
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}      equal        Minhas Reservas