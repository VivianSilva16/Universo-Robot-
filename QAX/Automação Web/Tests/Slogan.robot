***Settings***
Library        Browser
Documentation         Teste para verificar o slogan da smartbit

*** Test Cases ***

 Deve exibir o slogan na Landing Page
   New Browser    browser=chromium    headless=false
   New Page     http://Localhost:3000
   Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!
    
   Sleep    15