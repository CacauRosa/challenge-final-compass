*** Settings ***
Library     Browser

Resource    ../variables.resource

*** Keywords ***
Verificar cabeçalho na página inicial
    Wait For Elements State    xpath=//*[@id="root"]/header/div                    visible      5
    Wait For Elements State    xpath=//*[@id="root"]/header/div/nav/ul/li[1]/a     visible      5
    Wait For Elements State    xpath=//*[@id="root"]/header/div/nav/ul/li[2]/a     visible      5
    Wait For Elements State    xpath=//*[@id="root"]/header/div/nav/ul/li[3]/a     visible      5
    Wait For Elements State    xpath=//*[@id="root"]/header/div/nav/ul/li[4]/a     visible      5

Ir para catálogo de filmes
    Click    xpath=//*[@id="root"]/header/div/nav/ul/li[1]/a
    ${element}    Set Variable    xpath=//*[@id="root"]/main/div/h1
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}      equal        Filmes em Cartaz

Ir para inicio
    Click    xpath=//*[@id="root"]/header/div/nav/ul/li[2]/a
    ${element}    Set Variable    xpath=//*[@id="root"]/main/div/h1
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}      equal        Welcome to Cinema App
Ir para perfil
    Click    xpath=//*[@id="root"]/header/div/nav/ul/li[4]/a
    ${element}    Set Variable    xpath=//*[@id="root"]/main/div/div/div[2]/h1
    Wait For Elements State    ${element}      visible      5
    Get Text                   ${element}      equal        Meu Perfil