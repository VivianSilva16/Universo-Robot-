*** Settings ***

Documentation        Suite de Testes de Adesão de plano 

Resource    ../Resources/base.resource
Resource    ../Resources/Memberships.resource


Test Setup       Start Session    #Padrão de comportando para começar todos os testes, 
Test Teardown    Take Screenshot  #Padrão de comportando para terminar todos os testes 



*** Test Cases ***

Deve poder realizar uma nova adesão 

   #VARIAVEL QUE FOI COLOCADA LÁ NO BANCO DA PHYTON 
   
  ${data}     Get Json Fixture     membros    create           #chamando a massa em JSON 
  
     
      
   
   Insert Account              ${account}   #INSIRA ESSES DADOS NA VARIAVEL ACCOUNT 
   Delete Account By email     ${account}[email]      #ELE VAI DELETAR A MASSA PRA VOCÊ PODER USAR ELA DE NOVO 

   

    
    Go to login page    
    Submit Login Form    sac@smartbit.com      pwd123    
    User Logged    sac@smartbit.com  
    

   
    Go to Enrolls        #Emcapsulado nas Keywords 
    
    Go to Enroll Form    #Emcapsulado nas Keywords 
   
    Select Account           Rodrigo Santoro    12345678910     #Emcapsulado nas Keywords , o nome e o cpf vão se encaixar nas variaveis lá de baixo 
   
    Select Plan              Plano Black                        #Emcapsulado nas Keywords, o plano é uma variável feita lá nas keywords 

    Fill Payment card    1221 3434 5656 7878    Nicolas F Silva     
    ...    ...07  2030    123   #preencher os dados do cartão nas varíáveis 
   
    Click    css=button[type=submit] >> text=Cadastrar     #Nas buscas do css não pode usar tabulação senão ele gera 2 argumentos e a gente só quer 1 , por isso use espaço 

    Toast Shoud be    Matrícula Cadastrada com sucesso.   # Esse Toast Shoud be  é um comando emcapsulado do toast resources 

    Sleep    10
   

Não pode fazer adesão duplicada 

    #Chamando o JSON 

   ${data}   Get Json Fixture     membros    duplicate         #a outra massa, separando uma massa da outra no JSON          

     Go to Enrolls        #Emcapsulado nas Keywords 
    
    Go to Enroll Form    #Emcapsulado nas Keywords 
   
    Select Account           Rodrigo Santoro    12345678910     #Emcapsulado nas Keywords , o nome e o cpf vão se encaixar nas variaveis lá de baixo 
   
    Select Plan              Plano Black                        #Emcapsulado nas Keywords, o plano é uma variável feita lá nas keywords 

    Fill Payment card    1221 3434 5656 7878    Nicolas F Silva     
    ...    ...07  2030    123   #preencher os dados do cartão nas varíáveis 
   
    Click    css=button[type=submit] >> text=Cadastrar     #Nas buscas do css não pode usar tabulação senão ele gera 2 argumentos e a gente só quer 1 , por isso use espaço 

    Toast Shoud be   O usuário já possui matrícula!   # Esse Toast Shoud be  é um comando emcapsulado do toast resources 

    Sleep    10
   

Deve buscar por nome 

    ${data}    Get Json Fixture    Membros   search     # Usando Json não corre o risco de queimarem ou apagarem sua massa de teste 

     Insert Memberships       ${data}


   
   
    SignIn admin    #Comando emcapsulado que eu não fiz 
    Go to Enrolls 

    Sleep     3
    Searck By Name           ${name}[account][name]               #Comando encapsulado do membership resources 
    Should Filter By Name    ${name}[account][name]               #Comando encapsulado do membership resources



Deve Excluir uma Matrícula 
    
    ${data}    Get Json Fixture    Membros   search    

     Insert Memberships       ${data}


   
   
    SignIn admin    
    Go to Enrolls 
    
  

  # A partir daqui ele cria a massa para excluir , agora sim que ele vai começar a excluir 

   

    Wait For Elements State    css=table tbody tr >> text=EmilyStone          detached    5



  





