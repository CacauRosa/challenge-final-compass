*** Settings ***
Library     Browser

Resource    ../variables.resource

*** Keywords ***
Ir para login
    Go To        ${URL_BASE}/login
    Wait For Elements State    xpath=//*[@id="root"]/main/div/div/div[1]/h1      visible      5
    Get Text                   xpath=//*[@id="root"]/main/div/div/div[1]/h1      equal        Login

Preencher login
    [Arguments]    ${user}
    Fill Text   css=input[id=email]    ${user}[email]
    Fill Text   css=input[id=password]    ${user}[password]
    Click       css=button[type=submit]

Usuario na pagina inicial
    ${element}         Set Variable    xpath=//*[@id="root"]/main/div/h1
    Wait For Elements State    ${element}    visible    5

Logout e confirmação
    ${element}    Set Variable    css=.btn-logout
    Wait For Elements State    ${element}      visible      5
    Click    ${element}

Usuario na pagina de login
    ${element}         Set Variable    xpath=//*[@id="root"]/main/div/div/div[1]/h1
    Wait For Elements State    ${element}    visible    5
