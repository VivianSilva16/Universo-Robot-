*** Settings ***

Documentation    Ações e elementos da página de boas vindas 

Library    Browser


*** Keywords ***

Check Welcome Message


    #Verificação 
    Wait For Elements State        text= Falta pouco para fazer parte da família Smartbit!    visible    5    #O 5 é Timeout