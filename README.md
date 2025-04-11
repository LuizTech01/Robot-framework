# Robot-framework
Este projeto tem como objetivo a automação de testes utilizando o Robot Framework para validação do fluxo de login no site https://wde-5p3f.onrender.com/login.

## Tecnologias Utilizadas

- Robot Framework
- Python
- SeleniumLibrary
- Webdriver Manager
- VS Code com extensão Robot Framework Language Server (opcional)

## Instalação
1. Instale as dependências:

```
pip install -r requirements.txt
```

Caso o arquivo requirements.txt não exista, instale manualmente:

```
pip install robotframework selenium webdriver-manager
```

## Como Executar os Testes

Para executar os testes, use o comando:

```
robot tests/
```

Ou especifique um arquivo de teste individual:

```
robot tests/test_login.robot
```

## Estrutura do Projeto

```
Robot-framework/
├── drivers/
│   └── chromedriver.exe               # Driver necessário para execução no navegador Chrome
├── tests/
│   ├── test_login.robot               # Testes automatizados do fluxo de login
│   └── register_tests.robot           # Testes automatizados do fluxo de registro (atualmente comentado pois o usuario criado fica salvo no banco do site)
├── resources/
│   ├── keywords.robot                 # Keywords reutilizáveis utilizadas nos testes
│   ├── locators.robot                 # Localizadores dos elementos da interface (XPaths, IDs etc.)
│   └── variables.robot                # Variáveis como URLs, dados de login e configurações
├── .gitignore                         # Arquivos e pastas ignorados pelo Git
└── README.md                          # Instruções e informações do projeto (versão Markdown)
```

## Escopo Atual dos Testes

- Validação de login com credenciais válidas
- Mensagem de erro para login inválido