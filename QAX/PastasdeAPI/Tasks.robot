*** Settings ***

Documentation                Arquivo para testar o consumo da API  com TaskS

Resource                     ./service.resource



*** Tasks ***

Testando a API

    Setando o Token de usuário     # comando de teste de API que vc criou  

    Puxando a conta por nome     Daiany Alves   #Variavel que voce criou na API com ${seunome}, ele guarda o Daiany 

    

