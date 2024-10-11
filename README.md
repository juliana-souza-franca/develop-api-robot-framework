# Automação com Robot Framwork API

Projeto ERP realizando teste de API utilizando todos os métodos.

### Objetivo da automação
Utilizando a ferramenta swagger para realizar teste.
- Develop Academy: https://develop.qacoders-academy.com.br/api-docs/#/
 

# Pré-requesito

## Instalação do python
Link: https://www.python.org/downloads/

## Instalação da IDE da sua preferencia
Link VSCODE: https://code.visualstudio.com/download

Link INTELLIJ: https://www.jetbrains.com/idea/download/?section=windows

## Instalação do ambiente virtual "venv"
comando powershell: python -m venv venv

## Ativar o ambiente virtual
- comando no terminal powershell: .\venv\Scripts\Activate.ps1
- comando no terminal linux : source ./venv/Scripts/activate
 
## Caso tenha erro de politica de segurança
 - comando no terminal powershell no modo administrador: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
 
 ## Instalação do requerimento 
 Após clonar este projeto na pasta de sua preferência, acesse o terminal dentro da pasta principal do projeto e execute o comando abaixo para baixar as dependências:

 - pip install -r requirements.txt

 Caso for primeiro acesso:
 - comando de instalação no powershell:  pip freeze > requirements.txt
 

 ## Instalações das Dependencias
 - pip install robotframework
 - pip install robotframework-requests
 - pip install PyYAML
 - pip install robotframework-faker
 -  pip install robotframework-jsonlibrary

## Execute os testes com o seguinte comando:
 Execute os testes com o seguinte comando:
```
robot -d results test/features/file_name.robot
```
Onde:
 
- robot - é o comando do Robot Framework para iniciar a execução.
- -d results - define o local onde serão armazenados os relatórios e evidências.
- test/features/file_name.robot - define o arquivo de teste a ser executado.

# Documento do faker
https://faker.readthedocs.io/en/master/locales/pt_BR.html#faker.providers.address.pt_BR.Provider.country
https://faker.readthedocs.io/en/master/locales/pt_BR.html





