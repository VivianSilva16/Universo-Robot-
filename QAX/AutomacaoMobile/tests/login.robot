***settings***

Documentation                      Suíte de testes logindo App Smartbit


Resource                         ../resources/popup.resource
Resource                         ../resources/setupteardown.resource
Resource                        ../resources/login.resource
Resource                        ../resources/conta.resource

Test Setup            Iniciar Sessão
Test Teardown         Finalizar sessão

Library    ../../../.venv/Lib/site-packages/robot/libraries/XML.py

*** Test Cases***

Deve logar com cpf e IP 

    Realizar login na App com cpf     32354567555        #comando encapsulado de login resources 

    Ver se o usuário está logado      


Não deve logar com cpf não cadastrado 

    Realizar login na App com cpf     32354567555        #comando encapsulado de login resources 

    Popup have text            Acesso não Autorizado!    #comando encapsulado do popup resources  
    
Não deve logar com cpf inválido

   Realizar login na App com cpf     32354567555        #comando encapsulado de login resources 

    Popup have text                Cpf Inválido!      #comando encapsulado do popup resources 