***settings***

Documentation                             Configurações inciiais e finais dos testes 

Resource                         ../resources/Base.resource

Library    ../../../.venv/Lib/site-packages/robot/libraries/XML.py

*** Keywords ***

Iniciar Sessão


    Open Application         linkdaaplicação
    ...                    platformname=Android
    ...                    Automationname=SuaAutomação
    ...                    DeviceName=Emulador
    ...                    udid=seuudid
    ...                    app=${EXECDIR}seuapp     #eXECDIR É DIRETÓRIO DE EXECUÇÃO 
    ...                    autoGrantPermissions=true 
    

    Wait Until Page Contais         IP DA API     30 


Finalizar sessão 

    Capture Page Screenshot                     #importar a biblioteca appium
    Close Application                            #importar a biblioteca appium