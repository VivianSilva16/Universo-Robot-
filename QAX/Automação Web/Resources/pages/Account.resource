*** Settings ***

Documentation    Ações e elementos da página de Gestão de clientes da academia 

Library    Browser


*** Keywords ***


User Logged 
    # Uma estrategia pra ver se o usuário foi logado direitinho 
    [Arguments]        ${emai}    

      ${elementomaxtill}        Set Variable    css=.logged-user 

        Wait For Elements State    ${elementomaxtill}    visible     5     # 5 é timout, põe só o numero mesmo 
        Get Text                   ${elementomaxtill}    equal    ${emai}   