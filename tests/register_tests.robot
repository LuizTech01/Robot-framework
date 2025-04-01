*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Resource   ../resources/variables.robot

*** Test Cases ***
Teste de Registro com Sucesso
    Abrir Navegador Registro
    Fazer Registro  ${EMAIL_LOCATOR}    ${CONFIRMAR_EMAIL_LOCATOR}    ${SENHA_LOCATOR}    ${NOME_COMPLETO_LOCATOR}    ${RUA_LOCATOR}    ${CODIGO_POSTAL_LOCATOR}    ${CIDADE_LOCATOR}    ${EMAIL}    ${CONFIRMAR_EMAIL}    ${SENHA}    ${NOME_COMPLETO}    ${RUA}    ${CODIGO_POSTAL}    ${CIDADE}
    Confirma Registro   ${URL_LOGIN}
