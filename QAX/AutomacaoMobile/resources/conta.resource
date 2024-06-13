*** Settings ***

Documentation                             Ações e elementos da tela minha conta.  

#Não instalei a librady Appium pra testar o aplicativo, por isso está esses erros. são dessa bibloteca. 

Library   Appium Library  #Não instalei 

*** Keywords ***


Ver se o usuário está logado 

    ${element}            Set Variable         xpath=seuelemento

    
     Wait Until Element is Visible             ${element}


     Element Text Should Be        xpath=seuelementodetexto

