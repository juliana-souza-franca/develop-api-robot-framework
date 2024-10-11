*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***
Acessar a pagina de consulta do cliente 
   acessar a pagina
   Digitar os campos 'mail' e 'password'
   Cadastrar o usuário
   Digitar os campos de login usuario
   Cadastrar um novo cliente 

Realizar consulta do cliente 
    Log    ${ID_CLIENTE} 

   ${response_one_client}    GET On Session     auth      ${ENDPOINT_CLIENT}${ID_CLIENTE}        headers=${HEADERS_TOKEN}
    Log     ${response_one_client} 

     Status Should Be    200 
     Set Test Variable  ${response_one_client}      ${response_one_client.json()}  

Validar a consulta do cliente 
   Log  ${response_one_client} 

   Should Be Equal     ${response_one_client['client']['mail']}                 ${EMAIL_CLIENTE} 
   Should Be Equal     ${response_one_client['client']['phone']}                ${TELEFONE_CLIENTE}  
   Should Be Equal     ${response_one_client['client']['documents'][0]['cpf']}  ${CPF_CLIENTE}