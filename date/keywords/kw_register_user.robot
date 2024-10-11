*** Settings ***
Resource        ../../config/main.robot


*** Keywords ***
Acessar a pagina do usuario 
    acessar a pagina
    Digitar os campos 'mail' e 'password'
  

Cadastrar o usuário
    ${account}=    Get Fake Account
    Log To Console    ${account}

    ${BODY_USER}  Create Dictionary      
    ...  fullName=${account}[name]  
    ...  mail=${account}[email]
    ...  accessProfile=ADMIN        
    ...  cpf=${account}[cpf]
    ...  password=${SENHA}  
    ...  confirmPassword=${SENHA}  
    
    Log To Console  ${BODY_USER}  

    ${response}  POST On Session     alias=auth      url=${ENDPOINT_USER}         json=${BODY_USER}      headers=${HEADERS_TOKEN}   
         
    Log To Console  ${response.status_code}
    Log To Console  ${response.text}
    

    Set Test Variable   ${response_user}   ${response.json()}  
    Log  ${response_user}

    Should Be Equal As Numbers  ${response.status_code}  201
     Set Global Variable    ${USER_MAIL}        ${response.json()['user']['mail']}  
     Should Be Equal      ${USER_MAIL}           ${response.json()['user']['mail']} 


    Set Global Variable    ${USER_ID}        ${response.json()['user']['_id']}  
    Should Be Equal      ${USER_ID}           ${response.json()['user']['_id']}     
    Log     ${USER_ID} 

    [Return]  ${response_user}  ${account}
   

Validar os campos preenchidos
    [Arguments]    ${response_user}    ${account}
    Log    ${response_user}
    
   Set Test Variable          ${expected_msg}                Olá ${account}[name], cadastro realizado com sucesso.
   Log To Console             ${expected_msg}   
   Should Be Equal            ${response_user['msg']}            ${expected_msg}

    Set Test Variable       ${user_data}  ${response_user['user']}
    Log To Console          ${user_data} 
  
    Dictionary Should Contain Key    ${user_data}    _id
    Should Be Equal    ${user_data['fullName']}    ${account}[name]
    Should Be Equal    ${user_data['mail']}        ${account}[email]
    Should Be Equal    ${user_data['cpf']}         ${account}[cpf]