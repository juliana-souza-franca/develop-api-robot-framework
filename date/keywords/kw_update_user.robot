*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***
Acessar a pagina de atualizacao do usuário
    acessar a pagina 
    Digitar os campos 'mail' e 'password'
    Cadastrar o usuário
    Digitar os campos de login usuario
    
Atualizar o cadastro do usuario
  ${USER_DINAMIC}  dados dinamicos    
    Log To Console  ${USER_DINAMIC['mail']}
    Log To Console  ${USER_DINAMIC['fullName']}
    
    
    ${HEADERS}=  Create Dictionary  Authorization=${token}   

    ${BODY}    Create Dictionary  fullName=${USER_DINAMIC['fullName']}   mail=${USER_DINAMIC['mail']} 

    ${UPDATE_USER}  PUT On Session       auth       ${ENDPOINT_USER}${USER_ID}          
    ...    json=${BODY}    headers=${HEADERS}
    Log To Console  ${UPDATE_USER}
    Status Should Be    200
     Set Test Variable    ${UPDATE_USER}    ${UPDATE_USER.json()}
   
Validar a atualizacao do usuario
    Log  ${UPDATE_USER}
    ${MESSAGE}=         Get From Dictionary    ${UPDATE_USER}    msg
    Should Be Equal As Strings    ${MESSAGE}    Dados atualizados com sucesso!
   
