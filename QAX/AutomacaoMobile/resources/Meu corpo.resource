*** Settings ***

Documentation        Recursos de Meu corpo 


*** Keywords ***

Passar as medidas do IMC    #Massa sempre dinamica pra não correr risco de apagarem sua massa

[Arguments]                ${fitness}

    Wait Until Page Contais         Registre aqui suas medidas.    5

     Input Text           xpath=Seu campo           ${fitness}[peso]
     Input Text           xpath=Seu campo           ${fitness}[altura]

     Click Element            xpath=seuelemento 
