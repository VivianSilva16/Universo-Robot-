*** Settings ***

Documentation    Testes de Login do SAC 

Resource    ../Resources/base.resource
Resource   ../Resources/pages/Login.resource


Test Setup       Start Session    #Padrão de comportando para começar todos os testes, 
Test Teardown    Take Screenshot  #Padrão de comportando para terminar todos os testes 


*** Test Cases ***

Deve logar como gestor da academia 

    Go to login page    #palavra chave do arquivo loginresource 
    Submit Login Form    sac@smartbit.com      pwd123     #chamando a palavra chave do arquivo e setando os dados nas variaveis de lá
    User Logged    sac@smartbit.com
    

Não deve logar com senha incorreta 
#Validando o toast. Toast é um negocinho flutuante que aparece na tela em HTML 

    Go to login page
    Submit Login Form    sac@smartbit.com      abc123
    Toast Shoud be    #palavra chave para validar o toast que coloquei lá no resources de login do sac 
    ...  As credenciais de acesso fornecidas são inválidas. Tente Novamente! 
   

Login com dados incorretos 

    



 