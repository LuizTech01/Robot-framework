*** Settings ***
Library    SeleniumLibrary
Resource   locators.robot
Resource   variables.robot

*** Keywords ***


# Navegador

Abrir Navegador
    [Arguments]    ${URL}
    Open Browser    ${URL}    chrome    ${CHROME_ARGS}
    Maximize Browser Window

Fechar Navegador
    Close Browser


# Registro

Acessar Página de Registro
    Abrir Navegador    ${URL_REGISTRO}

Fazer Registro
    Input Text    ${EMAIL_LOCATOR}             ${EMAIL}
    Input Text    ${CONFIRMAR_EMAIL_LOCATOR}   ${CONFIRMAR_EMAIL}
    Input Text    ${SENHA_LOCATOR}             ${SENHA}
    Input Text    ${NOME_COMPLETO_LOCATOR}     ${NOME_COMPLETO}
    Input Text    ${RUA_LOCATOR}               ${RUA}
    Input Text    ${CODIGO_POSTAL_LOCATOR}     ${CODIGO_POSTAL}
    Input Text    ${CIDADE_LOCATOR}            ${CIDADE}
    Click Button    ${CRIAR_CONTA_BTN_LOCATOR}

Validar Registro com Sucesso
    Wait Until Location Is    ${URL_LOGIN}    timeout=10s
    ${URL_ATUAL}=    Get Location
    Should Be Equal    ${URL_ATUAL}    ${URL_LOGIN}


# Login

Acessar Página de Login
    Set Selenium Timeout  20s
    Abrir Navegador    ${URL_LOGIN}

Fazer Login
    Input Text    ${EMAIL_LOCATOR}    ${EMAIL}
    Input Text    ${SENHA_LOCATOR}    ${SENHA}
    Click Button  ${LOGIN_BTN_LOCATOR}

Fazer Login Invalido
    Input Text    ${EMAIL_INVALIDO_LOCATOR}    ${EMAIL_INVALIDO}
    Input Text    ${SENHA_LOCATOR}    ${SENHA}
    Click Button  ${LOGIN_BTN_LOCATOR}

Validar Login com Sucesso
    Wait Until Location Is    ${URL_PRODUTOS}    timeout=10s
    ${URL_ATUAL}=    Get Location
    Should Be Equal    ${URL_ATUAL}    ${URL_PRODUTOS}

Validar Mensagem de Erro no Login
    Wait Until Element Is Visible    css=section.alert    timeout=10s
    ${titulo_atual}=    Get Text    css=.alert h2
    ${mensagem_atual}=  Get Text    css=.alert p
    Should Be Equal    ${titulo_atual}    ${ERRO_TITULO_LOGIN_LOCATOR}
    Should Be Equal    ${mensagem_atual}    ${ERRO_MENSAGEM_LOGIN_LOCATOR}
