*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***

Acessar a pagina para deletar uma empresa  
    acessar a pagina 
    Digitar os campos 'mail' e 'password' 
    Cadastrar o usuário
    Digitar os campos de login usuario
    Cadastrar uma nova empresa

Realizar o delete dos dados de uma empresa

   ${DELETE_COMPANY}    DELETE On Session      auth        ${ENDPOINT_COMPANY}${ID_COMPANY}      
    ...    headers=${HEADERS_TOKEN}
    
    Log    ${DELETE_COMPANY}
     
     Status Should Be    200

     Set Test Variable    ${RESPONSE_DELETE}        ${DELETE_COMPANY.json()}

Validar se os dados da empresa foram apagados
  
     Log    ${RESPONSE_DELETE}  

      Should Be Equal    ${RESPONSE_DELETE['msg']}    Companhia deletado com sucesso.

