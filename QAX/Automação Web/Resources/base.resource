*** Settings ***

Library    JSONLibrary 
Library     libs/Account.py
Library    Browser

Resource   pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Account.resource

Resource    pages/components/toasts.resource
Resource    pages/components/BoxNotice.resource
#faltou carregar o membership.resource 

Documentation     As palavras chaves de emcapsulamento para que o código fique robusto estão guardadas aqui.

*** Keywords ***



Submit signup Form     #você pode tirar esses steps que você colou aqui e substituir lá onde você recortou por submit signup form, essa palavra chave criada aqui 
   #Guarde esse pedacinho de código para usar futuras tecnicas de emcapsulamento, através de palavras chaves
   #Isso deixa o código mais clean, bonitão.
   [Arguments]        ${account1}

    Get Text    
    ...    css=#signup h2   
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit! 
    
   
    Fill Text    id=name    ${account1}[name]       
    Fill Text    id=email   ${account1}[email]
    Fill Text    id=cpf     ${account1}[cpf]    

    Click    css=button >> text=Cadastrar    
    

Start Session 
    New Browser    browser=chromium    headless=false
    New Page     http://Localhost:3000

Attempt signup 

    [Arguments]    ${name}    ${email}    ${cpf}    ${output_messagem}     #Quatro variáveis foram declaradas 

        ${account1}           Create Dictionary

             name=${name}
             email=${email}
             cpf=${cpf}


    Submit signup Form    ${account1}
    #Não criei o Notice Shoud be, por isso não vou setar a variável output_message 



Get Json Fixture 

    [Arguments]        ${filename0}

      ${dados}  Load Json From File    ${EXECDIR}/Resources/Fixtures/${filename0}.Json     #Chamando o arquivo em JSON criado na pasta com a massa dos dados 


