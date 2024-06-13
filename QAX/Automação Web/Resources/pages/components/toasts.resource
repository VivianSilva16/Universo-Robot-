*** Settings ***

Documentation        Ações e elementos do componente toast 

Library    Browser

*** Keywords ***


Toast Shoud be

    [Arguments]        ${textoesperado}

    Wait For Elements State    css=.Toastify_toast-body 
    ...        visible    5 

    Get Attribute    css=.Toastify_toast-body      equal        ${textoesperado}  