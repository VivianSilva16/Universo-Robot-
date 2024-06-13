*** Settings ***

Documentation                Suite de testes da funcionalidade de cadastro de medidas no app

Resource                ../resources/Base.robot
Resource    ../../Automação Web/Resources/base.resource
Resource    ../resources/login.resource
Resource    ../resources/conta.resource
Resource    ../resources/setupteardown.resource
Resource    ../resources/menu.resource
Resource    ../resources/Meu corpo.resource
Resource    ../resources/popup.resource
Resource    ../PastasdeAPI/service.resource
Resource    ../../PastasdeAPI/service.resource

Test Setup       Iniciar Sessão
Test Teardown    Finalizar sessão


*** Test Cases ***

Deve poder cadastrar minhas medidas

    ${data}            Get Json Fixture    update 
     
     Insert Membership     ${data}                    #Esse insert membership é um comando emcapsulado e data é a variável que ele vai inserir do JSON 

     Realizar login na App com cpf            ${data}[account][cpf]

     Ver se o usuário está logado               

     Clique em Meu corpo                                            #Comando emcapsulado do loginresource
    
     Passar as medidas do IMC                ${data}[account]       #emcapsulado do Meu Corpo resource, o data vem do JSON 
  
      Popup have text                        Seu cadastro foi atualizado com sucesso!
   

    #Puxando os comandos que voce criou na ´pasta para API 

     Setando o Token de usuário

     Puxando a conta por nome    Daiany Alves 

    
    


