*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***

Digitar os campos de login usuario
    Acessar a pagina do usuario 
    Cadastrar o usuário
    
    
    ${BODY}  Create Dictionary          mail=${USER_MAIL}          password=${SENHA}
    ${response}  POST On Session       alias=auth       url=${ENDPOINT_LOGIN_ADMIN}        json=${BODY}   
    

    
    Set Test Variable      ${token}    ${response.json()['token']}
    Log        ${token}  

    ${HEADERS}    Create Dictionary    Authorization=${token}
    Set Global Variable    ${HEADERS_TOKEN}    ${HEADERS}   
   
    
    Should Be Equal As Numbers  ${response.status_code}  200

    Should Be Equal As Strings  ${response.json()['user']['mail']}       ${USER_MAIL} 
    Should Not Be Empty  ${token}  

