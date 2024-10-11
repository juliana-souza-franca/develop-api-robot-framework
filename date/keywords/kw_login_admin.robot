*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***

Digitar os campos 'mail' e 'password'
   
    ${BODY}       Create Dictionary          mail=${EMAIL_ADMIN}          password=${SENHA_ADMIN}
    ${response}   POST On Session        alias=auth        url=${ENDPOINT_LOGIN_ADMIN}         json=${BODY}
    
    Log To Console  ${response.status_code}
    Log To Console  ${response.text}

    Set Test Variable   ${response_json}   ${response.json()}  
    Log  ${response_json}

    
    Set Test Variable      ${token}    ${response_json['token']}
    Log To Console         ${token}
   
    ${HEADERS}    Create Dictionary    Authorization=${token}
    Set Global Variable    ${HEADERS_TOKEN}    ${HEADERS}   
    
   
    Set Test Variable      ${password}    ${response_json['user']['password']}
    Should Be Equal As Numbers  ${response.status_code}  200

Validar dados do login admin
    Should Be Equal As Strings  ${response_json['user']['mail']}       ${EMAIL_ADMIN}
    Should Be Equal As Strings  ${response_json['user']['password']}    ${password}  
    Should Not Be Empty  ${token}

