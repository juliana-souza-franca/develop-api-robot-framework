*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***

Acessar a pagina de consulta 
   acessar a pagina     
   Digitar os campos 'mail' e 'password'
   Acessar a pagina do usuario  
   Digitar os campos de login usuario
   

Realizar uma consulta com um usuário com sucesso
   Log    ${USER_ID} 
  ${response_one_user}    GET On Session        auth         ${ENDPOINT_USER}${USER_ID}      headers=${HEADERS_TOKEN}  
   Log To Console      ${response_one_user}
   
   Status Should Be    200    
     Set Test Variable  ${response_one_user}      ${response_one_user.json()}  
     Log  ${response_one_user}   
Validar consulta de um usuário realizada com sucesso 
    ${response_json}    Set Variable        ${response_one_user}    # O response já é um dicionário
    Should Be Equal    ${USER_MAIL}         ${response_json['mail']}
    Should Be Equal    ${USER_ID}           ${response_json['_id']}
