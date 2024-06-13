***settings***

Documentation                             Ações e elementos do login na APP da smartbit 

#Não instalei a librady Appium pra testar o aplicativo, por isso está esses erros. são dessa bibloteca. 

Library    ../../../.venv/Lib/site-packages/robot/libraries/XML.py

*** Keywords ***

Realizar login na App com cpf 

    [Arguments]            ${cpf}
    
    Input Text         xpath= Seucampodetexto

    Input Text         xpath=Seucampo de texto        ${cpf}

    Click Element        xpath=seubotão

    
    