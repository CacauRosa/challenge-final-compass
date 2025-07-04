*** Settings ***
Library     Browser

*** Keywords ***
Alerta deve ser
    [Arguments]        ${expected_text}

    Wait For Elements State        css=.alert-content >> text=${expected_text}    visible        5