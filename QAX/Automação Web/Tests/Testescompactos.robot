
***Settings***
Library    Browser
Library    ../Resources/Libs/Account.py


Documentation         Os cenários de test do sign up compactados com variáveis declaradas  

Resource        ../resources/Base.resource 
Resource    ../Resources/pages/Welcome.resource
Resource    ../Resources/base.resource



*** Test Cases ***

Tentativa de pré cadastro 

  
     [Template]        Attempt signup     #Neste teste que estou deixando comentado ele vai implementar a palavra chave lá de baixo 
  #como um template para execução. 

  # Setando os valores que serão implementados na variável lá de baixo 
  ${EMPTY}     papito@gmail.com    46478068803    Por favor informe seu nome completo!
  Fernando Papito    ${EMPTY}      46478068803   Por favor informe seu melhor e-mail 
  Fernando Papito    papito@gmail.com    ${EMPTY}    Por favor informe seu cpf!
  Rodrigo Santoro    Rodrigo#gmail.com     12345678910    E-mail no formato inválido!
  Rodrigo Santoro    Rodrigo@gmail.com     1234567891a    CPF no formato inválido!