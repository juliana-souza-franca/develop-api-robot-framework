*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***
Acessar a pagina de atualizacao de senha do usuário
   acessar a pagina 
   Digitar os campos 'mail' e 'password'
   Cadastrar o usuário
   Digitar os campos de login usuario

Atualizar a senha do usuario 
  

   ${BODY}    Create Dictionary    password=${SENHA_ADMIN}      confirmPassword=${SENHA_ADMIN}

   ${UPDATE_PASSWORD_USER}    PUT On Session    auth        ${ENDPOINT_PASSWORD_USER}${USER_ID}        
   ...    json=${BODY}     headers=${HEADERS_TOKEN} 
   Log  ${UPDATE_PASSWORD_USER}
   Status Should Be    200
       
   Set Test Variable    ${UPDATE_PASSWORD_USER}        ${UPDATE_PASSWORD_USER.json()}

Validar se a senha foi atualizada
   Log    ${UPDATE_PASSWORD_USER} 

   ${MESSAGE}       Get From Dictionary    ${UPDATE_PASSWORD_USER}    msg
   Should Be Equal As Strings   ${MESSAGE}    Senha atualizada com sucesso!