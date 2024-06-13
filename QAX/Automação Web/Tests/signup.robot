***Settings***
Library    Browser
Library    ../Resources/Libs/Account.py


Documentation         Testando cadastro novo usuário 

Resource        ../resources/Base.resource 
Resource    ../Resources/pages/Welcome.resource


# Test Setup    Start Session
# Test Teardown    Take Screenshot 

#Setup e Teardown você já fez na Alura, é um comando que você pode colocar para fazer antes e depois de todos os testes. São os famosos ganchos de teste. 


*** Test Cases ***
Deve iniciar o cadastro do cliente 
    
    ${account1}    Get Fake Account      #palavra chave pra chamar a biblioteca que você criou.
    #Esse account no crifrão é uma variável 
    
        Start Session    # Comandos de abrir o Brownser e entrar na localhost:300o estão emcapsulados aqui!
        Submit signup Form    ${account1}     #Codigo robusto com o ocmando encapsulado pela palavra chave Submit Signup form    
    
        Check Welcome Message    #Comando emcapsulado para verificar boas vindas, lá no welcome resource 
        Take Screenshot     #Tira Print <3 Ele já gera a evidência na hora. 


Campo nome deve ser obrigatório 
    [Tags]    required  #Filtrar para quando o robot executar os cenários (ele executa todos) executar apenas esses com a tag required 
    
    ${account1}     Create Dictionary    #Criando um dicionário para esta variável 
    ...    name=${EMPTY}    #variável para deixar esse campo NULO, sem preencher 
    ...    email=diane@gmail.com
    ...    cpf=54729425006
    
     Start Session    # Comandos de abrir o Brownser e entrar na localhost:300o estão emcapsulados aqui!

    Get Text    
    ...    css=#signup h2   
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!  
    #Ato
   
    Fill Text  id=email       DanielSantos@gmail.Com
    Fill Text  id=document    57120488090    

    Click    css=button >> text=Cadastrar   
    
    #Verificação 
    Wait For Elements State       
    ...   css=form .notice     
    ...    visible    5   # deve estar visivel e timout de 5 segundos 
    ...    
    Get Text    css=form .notice     equal    Por favor informe o seu nome completo
    
#Esse form. notice ele ajuda a pegar direto do elemento pai do botão, evitando ambiguidade para o robot.

Campo e-mail deve ser obrigatório 
    [Tags]    required  
    
    ${account1}     Create Dictionary    #Criando um dicionário para esta variável 
    ...    name=Diane   
    ...    email=${EMPTY}
    ...    cpf=54729425006

     Start Session    # Comandos de abrir o Brownser e entrar na localhost:300o estão emcapsulados aqui!

    Get Text    
    ...    css=#signup h2   
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!  
    #Ato
    Fill Text    id:name     Daniel Santos
    Fill Text  id=document    57120488090    

    Click    css=button >> text=Cadastrar   
    
    #Verificação 
    Wait For Elements State       
    ...   css=form .notice     
    ...    visible    5    
    ...    
    Get Text    css=form .notice     equal    Por favor, informe o seu melhor e-mail

Campo CPF deve ser obrigatório 
    [Tags]    required  
    
        ${account1}     Create Dictionary    #Criando um dicionário para esta variável 
    ...    name=Diane  
    ...    email=diane@gmail.com
    ...    cpf=${EMPTY}
    ...    
   Start Session    # Comandos de abrir o Brownser e entrar na localhost:300o estão emcapsulados aqui!

    Get Text    
    ...    css=#signup h2   
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!  
    #Ato
    Fill Text    id:name     Daniel Santos
     Fill Text  id=email       DanielSantos@gmail.com   

    Click    css=button >> text=Cadastrar   
    
    #Verificação 
    Wait For Elements State       
    ...   css=form .notice     
    ...    visible    5    
    ...    
    Get Text    css=form .notice     equal    Por favor, informe o seu CPF

E-mail no formato incorreto 

      # Essas tags são para filtrar senários dentro de um unico código para o robot executar, mas eu mesma prefiro que um teste fique separado do outro.
    [Tags]    inv  # Que inv? O invisivel? kkkkkkkkkkkkkkkkkkkkkk 
    

     Start Session    # Comandos de abrir o Brownser e entrar na localhost:300o estão emcapsulados aqui!

    Get Text    
    ...    css=#signup h2   
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!  
    #Ato
    Fill Text    id:name     Daniel Santos
     Fill Text  id=email      daniel*gmail.com   #email cagado  
     Fill Text  id=document    57120488090
    Click    css=button >> text=Cadastrar   
    
    #Verificação 
    Wait For Elements State       
    ...   css=form .notice     
    ...    visible    5    
    ...    
    Get Text    css=form .notice     equal    Oops! O email informado é inválido

CPF no formato incorreto 

    [Tags]   inv  # Que inv? O invisivel? kkkkkkkkkkkkkkkkkkkkkk 
    
    Start Session    # Comandos de abrir o Brownser e entrar na localhost:300o estão emcapsulados aqui!

    Get Text    
    ...    css=#signup h2   
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!  
    #Ato
    Fill Text    id:name     Daniel Santos
     Fill Text  id=email      daniel*gmail.com  
     Fill Text  id=document    kkkkkkk  #CPF cagado 
    Click    css=button >> text=Cadastrar   
    
    #Verificação 
    Wait For Elements State       
    ...   css=form .notice     
    ...    visible    5    
    ...    
    Get Text    css=form .notice     equal    Oops! O CPF informado é inválido

    
   #PARABENS!!! ESSE ARQUIVO É UMA REGRESSÃO COMPLETA!!




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







