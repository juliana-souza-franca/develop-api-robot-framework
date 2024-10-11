*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***
 
Acessar a pagina para deletar um usuario
    acessar a pagina 
    Digitar os campos 'mail' e 'password' 
    Cadastrar o usuário

Realizar o delete de um usuario
  
   ${DELETE_USUARIO}    DELETE On Session    auth    ${ENDPOINT_USER}${USER_ID}    
  ...    headers=${HEADERS_TOKEN}

   Log    ${DELETE_USUARIO}  

   Status Should Be    200

  Set Test Variable    ${RESPONSE_DELETE_USER}        ${DELETE_USUARIO.json()}

Validar se os dados do usuario foram apagados 
   Log   ${RESPONSE_DELETE_USER}

   Should Be Equal       ${RESPONSE_DELETE_USER['msg']}    Usuário deletado com sucesso!.



