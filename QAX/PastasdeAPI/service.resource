*** Settings ***

Documentation                Camada de integração com a API

Library                        RequestsLibrary 
Library    ../../.venv/Lib/site-packages/Browser/browser.py


*** Keywords ***

Setando o Token de usuário 

    #CRIANDO UM DICIONÁRIO COM O QUE ESSA API VAI RECEBER

    ${payload}            Create Dictionary
      ...                   email=vivian123@gmail.com
      ...                   senha=vivian123


   ${responde}     POST   
   ...               url=SeuEndPoint      #Exemplo:localhost   
   ...               json=${payload}        #Passando a variavel que voce criou como dicionario, essa biblioteca do robot, a requests, ela converte para um JSON. 
    
   ${token}        Set Variable              Bearer ${responde.json()}[Token]    # trazer a variável como um Json , esse token entre colchetes quer dizer que voce pode escolher um campo 


Puxando a conta por nome 
    [Tags]            SmokeTest         #Use essa tag quando voce quiser testar algo separado de outros testes

    [Arguments]            ${seunome}


    ${cabecalhos}       Create Dictionary    
    ...                 Autorizacao=${token}

    ${parametro}        Create Dictionary        
    ...                 nome=${seunome}
    
    
     ${responde}   GET   url=SeuLocalhost
    ...                  parametro=${parametro} 
    ...                  cabecalhos= ${cabecalhos}  
    
    Log    ${responde.json()}
    


