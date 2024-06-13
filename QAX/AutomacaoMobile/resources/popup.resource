***settings***

Documentation                             Ações e elementos do pop up 

Resource                         ../resources/Base.resource

Library    ../../../.venv/Lib/site-packages/robot/libraries/XML.py

*** Keywords ***

Popup have text 

    [Arguments]                    ${target}  #a target e a variavel como texto do popup

    ${element}        Set Variable    xpath=seuelemento

    Wait Until Element is Visible      ${element}         5   #para exibir o elemento do popup

    Element Text Should Be             ${element}        ${target}

       

    

