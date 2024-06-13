*** Settings ***

Documentation    Ações e elementos da Landing Page 

Library    Browser

*** Keywords ***

#Aqui por exemplo é o lugar onde você pode colocar os elementos que envolvem a landing page e que conectam lá no código emcapsuladas para ele ficar 
#robusto. Esse conceito de POM (Page Object Models) é uma forma de deixar o código mais limpo e separando os arquivos de palavras chave dos
#casos de testes, deixando eles mais organizados e elegantes. 


Submit signup Form    ${account1}

     Get Text    css=#signup h2 


    Fill Text    id=name      ${account1}[name]
    Fill Text    id=email     ${account1}[email]
    Fill Text    id=cpf       ${account1}[cpf]

    Click    css=button >> text=Cadastrar 