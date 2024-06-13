*** Settings ***

Documentation        Ações da página de matrículas 

Library    Browser

*** Keywords ***

Go to Enrolls

     Click    css=a=[href="/memberships"]    #Foi montado aqui um localizador para encontrar um elemento a 


    Wait For Elements State    css=h1 >> text=Matrículas     visible     5

    # Verificar se o elemento na página, o texto escrito matrículas está visivel para comprovar que a matricula foi feita 

Go to Enroll Form
  

      Click    css=a[href="/memberships/new"]        #Botão de novos membros dentro do elemento a <href que é o link>

     Wait For Elements State    css=h1 >> text=Nova matrícula     visible     5

Select Account 

    [Arguments]        ${name}    ${cpf}


     
    Fill Text    css=imput[aria-label=select_account]    ${name} 
    Sleep    2

   Click    css=[data-testid=" ${cpf}"]   #Um id criado para idenfiticar o nome de cada cliente pré cadastrado. Esse id identifica o Fernando Papito.

    Sleep    5


Select Plan 
    
    [Arguments]        ${plan_name}
    
    Fill Text    css=imput[aria-label=select_plan]       ${plan_name}
     
    Click        css=#react-select-3-options-1 >>  ${plan_name}
    
Fill Payment card 

    [Arguments]    ${cheiodagrana}

     #Dados de pagamento da mensalidade do plano aderido. 

    Fill Text    css=input[name=card_number]        ${cheiodagrana}[number]       #Numero do cartão de crédito
    Fill Text    css=input[name=card_holder]        ${cheiodagrana}[holder]          #Titular do cartão de crédito
    Fill Text    css=input[name=card_month]         ${cheiodagrana}[month]          #Mês de vencimento do cartão de crédito
    Fill Text    css=input[name=card_year]          ${cheiodagrana}[year]                    #Ano de vencimento do cartão de crédito
    Fill Text    css=input[name=card_cvv]           ${cheiodagrana}[cvv]                   #CVV do cartão de crédito


Search by name 

    [Arguments]        ${name}

     Fill Text        css=input[placeholder^=Busque]          ${name}               #Esse chapeuzinho significa que o selector do css está buscando dentro do texto o início que é pela palavra Busque.
    
     Wait For Elements State    css=strong >> text=total: 1     visible    5 


Should Filter By Name 
     [Arguments]        ${name}

    
    Wait For Elements State    css=table tbody tr >> text=${name}    visible 5 


Request Removal 

    [Arguments]        ${name}

    Click    xpath=//td[text()="Emily Stone"]/../button 

    Click    css=.swal2-confirm 

    