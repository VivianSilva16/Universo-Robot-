*** Settings ***

Documentation    Ações e elementos da página de login admin SAC 

Library    Browser

Resource    components/BoxNotice.resource
    

*** Keywords ***

Go to login page 

    Go To    http://localhost:3000/login


Submit Login Form 
    #Setando as variáveis
        [Arguments]    ${email}    ${password}

       Fill Text    css=input[name=email]       ${email}
       Fill Text    css=input[name=password]    ${password}


    
      Click       css=button >> text=Entrar 




Login with verify notice
    
    [Arguments]         ${email}    ${password}    ${output_message}

    Go to login page    
    Submit Login Form   ${email}    ${password}
    Notice should be    ${output_message}



