*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Resource   ../resources/variables.robot

*** Test Cases ***
Login com Credenciais Válidas
    Acessar Página de Login
    Fazer Login
    Validar Login com Sucesso
    Fechar Navegador

Login com Credenciais Inválidas
    Acessar Página de Login
    Fazer Login Invalido
    Validar Mensagem de Erro no Login
    Fechar Navegador