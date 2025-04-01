*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Resource   ../resources/variables.robot

*** Test Cases ***
Fazer Login
    Fazer Login    ${EMAIL_LOCATOR}    ${SENHA_LOCATOR}    ${EMAIL}    ${SENHA}
    Confirma Login      ${URL_PRODUTOS}
    Fechar Navegador

Fazer Login invalido
    Abrir Navegador Login
    Fazer Login invalido      ${EMAIL_INVALIDO_LOCATOR}    ${SENHA_LOCATOR}    ${EMAIL_INVALIDO}    ${SENHA}
    Validar Mensagem de Erro Login      ${ERRO_TITULO_LOGIN_LOCATOR}    ${ERRO_MENSAGEM_LOGIN_LOCATOR}