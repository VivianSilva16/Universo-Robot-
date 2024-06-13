*** Settings ***

Documentation    Ações e elementos do componente da caixa de notificação 

Library    Browser

Resource    ../../../Tests/signup.robot

*** Keywords ***

Notice should be 

    [Arguments]    ${target}

     ${elementomaxtill}    Set Variable    css=form .notice


     Wait For Elements State  ${elementomaxtill}    visible    5

     Get Text    ${elementomaxtill}    equal    ${target}

     