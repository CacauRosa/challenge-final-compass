*** Settings ***
Library     Browser
Library     FakerLibrary

Resource    ../variables.resource

*** Keywords ***
Ir para filmes
    Click    xpath=//*[@id="root"]/header/div/nav/ul/li[1]/a
    ${element}    Set Variable    xpath=//*[@id="root"]/main/div/h1
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}      equal        Filmes em Cartaz

Ir para detalhes de um filme
    ${filme}      FakerLibrary.Random Int    min=1    max=3
    ${element}    Set Variable    xpath=//*[@id="root"]/main/div/div[2]/div[${filme}]/div[2]/a
    Scroll To Element          ${element}
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}      equal        Ver Detalhes
    Click                      ${element}

Verificar sessões disponíveis com horários
    ${element}    Set Variable    xpath=//*[@id="root"]/main/div/div/div/div[2]/div[5]/h2
    Scroll To Element          ${element}
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}      equal        Sessões Disponíveis

Ir para reserva
    ${horario}      FakerLibrary.Random Int    min=1    max=5
    Click    xpath=(//div[contains(@class, 'session-card')])[${horario}]//a[contains(@class, 'session-button')]
    ${element}    Set Variable    xpath=//div[@class="screen"]
    Scroll To Element          ${element}
    Wait For Elements State    ${element}      visible      5
    Get Text    ${element}     equal        Tela
