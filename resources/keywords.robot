*** Settings ***
Library    SeleniumLibrary
Resource   locators.robot
Resource   variables.robot

*** Keywords ***
Abrir Navegador Registro
    Open Browser    ${URL_REGISTRO}    ${BROWSER}
    Maximize Browser Window

Abrir Navegador Login
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Close Browser

Fazer Registro
    [Arguments]    ${EMAIL_LOCATOR}    ${CONFIRMAR_EMAIL_LOCATOR}    ${SENHA_LOCATOR}    ${NOME_COMPLETO_LOCATOR}    ${RUA_LOCATOR}    ${CODIGO_POSTAL_LOCATOR}    ${CIDADE_LOCATOR}    ${EMAIL}    ${CONFIRMAR_EMAIL}    ${SENHA}    ${NOME_COMPLETO}    ${RUA}    ${CODIGO_POSTAL}    ${CIDADE}
    
    Open Browser    ${URL_REGISTRO}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    ${EMAIL_LOCATOR}             ${EMAIL}
    Input Text    ${CONFIRMAR_EMAIL_LOCATOR}   ${CONFIRMAR_EMAIL}
    Input Text    ${SENHA_LOCATOR}             ${SENHA}
    Input Text    ${NOME_COMPLETO_LOCATOR}     ${NOME_COMPLETO}
    Input Text    ${RUA_LOCATOR}               ${RUA}
    Input Text    ${CODIGO_POSTAL_LOCATOR}     ${CODIGO_POSTAL}
    Input Text    ${CIDADE_LOCATOR}            ${CIDADE}
    Click Button    ${CRIAR_CONTA_BTN_LOCATOR}

Confirma Registro
    [Arguments]    ${URL_ESPERADA}
    Wait Until Location Is    https://wde-5p3f.onrender.com/login    timeout=10s
    ${URL_ATUAL}=    Get Location
    Should Be Equal    ${URL_ATUAL}    ${URL_ESPERADA}

Fazer Login
    [Arguments]    ${EMAIL_LOCATOR}    ${SENHA_LOCATOR}    ${EMAIL}    ${SENHA}

    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Maximize Browser Window

    Input Text    ${EMAIL_LOCATOR}             ${EMAIL}
    Input Text    ${SENHA_LOCATOR}             ${SENHA}
    Click Button    ${LOGIN_BTN_LOCATOR}

Fazer Login invalido
    [Arguments]    ${EMAIL_INVALIDO_LOCATOR}    ${SENHA_LOCATOR}    ${EMAIL}    ${SENHA}
    Input Text    ${EMAIL_INVALIDO_LOCATOR}             ${EMAIL}
    Input Text    ${SENHA_LOCATOR}             ${SENHA}
    Click Button    ${LOGIN_BTN_LOCATOR}

Confirma Login
    [Arguments]    ${URL_ESPERADA}
    Wait Until Location Is    https://wde-5p3f.onrender.com/products    timeout=10s
    ${URL_ATUAL}=    Get Location
    Should Be Equal    ${URL_ATUAL}    ${URL_ESPERADA}

Validar Mensagem de Erro Login
    [Arguments]    ${titulo_esperado}    ${mensagem_esperada}
    Wait Until Element Is Visible    css=section.alert    timeout=10s
    ${titulo_atual}=    Get Text    css=.alert h2
    ${mensagem_atual}=    Get Text    css=.alert p
    Should Be Equal    ${titulo_atual}    ${titulo_esperado}
    Should Be Equal    ${mensagem_atual}    ${mensagem_esperada}