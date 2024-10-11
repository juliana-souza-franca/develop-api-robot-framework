*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***

Acessar a pagina de cadastro de cliente
    acessar a pagina
    Digitar os campos 'mail' e 'password'
    Cadastrar o usuário
    Digitar os campos de login usuario

Cadastrar um novo cliente 
    ${DINAMIC_DATE_CLIENT}    ${DINAMIC_DOCUMENT}   ${DINAMIC_ADDRESS_CLIENT}      dados dinamico cliente
    
    ${ADDRESS_CLIENT}    Create Dictionary
    ...    country=${DINAMIC_ADDRESS_CLIENT['country']}    
    ...    zipCode=${DINAMIC_ADDRESS_CLIENT['zipCode']}      
    ...    city=${DINAMIC_ADDRESS_CLIENT['city']}      
    ...    state=${DINAMIC_ADDRESS_CLIENT['state']}       
    ...    district=${DINAMIC_ADDRESS_CLIENT['district']}         
    ...    street=${DINAMIC_ADDRESS_CLIENT['street']}   
    ...    number=${DINAMIC_ADDRESS_CLIENT['number']}   
    ...    complement=${DINAMIC_ADDRESS_CLIENT['complement']}   

    ${DOCUMENT_CLIENT}   Create Dictionary
    ...  rg=${DINAMIC_DOCUMENT['rg']}         
    ...  cpf=${DINAMIC_DOCUMENT['cpf']} 

    ${LIST_CLIENT_DOCUMENT}   Create List   ${DOCUMENT_CLIENT}    
    ${LIST_CLIENT_ADDRESS}    Create List   ${ADDRESS_CLIENT}

    ${BODY_CLIENT}    Create Dictionary
    ...  fullName=${DINAMIC_DATE_CLIENT['fullName']}     
    ...  birthDate=${DINAMIC_DATE_CLIENT['birthDate']}   
    ...  mail=${DINAMIC_DATE_CLIENT['mail']}      
    ...  phone=${DINAMIC_DATE_CLIENT['phone']}  
    ...  currentRole=${DINAMIC_DATE_CLIENT['currentRole']} 
    ...  documents=${LIST_CLIENT_DOCUMENT}
    ...  address=${LIST_CLIENT_ADDRESS}
    
    Log    ${BODY_CLIENT} 

    ${response_client}    POST On Session       auth         ${ENDPOINT_CLIENT}            
    ...    json=${BODY_CLIENT}         headers=${HEADERS_TOKEN}
    
    Log   ${response_client.json()}

    Status Should Be    201

    Set Test Variable    ${EMAIL_CLIENTE}    ${response_client.json()['newClient']['mail']}
    Log    ${EMAIL_CLIENTE}

    Set Test Variable   ${TELEFONE_CLIENTE}    ${response_client.json()['newClient']['phone']}
    Log    ${TELEFONE_CLIENTE}

    Set Test Variable    ${RG_CLIENTE}     ${response_client.json()['newClient']['documents'][0]['rg']}    
    Log   ${RG_CLIENTE} 

    Set Test Variable    ${CPF_CLIENTE}    ${response_client.json()['newClient']['documents'][0]['cpf']}   
    Log   ${CPF_CLIENTE}

    Set Test Variable    ${ID_CLIENTE}        ${response_client.json()['newClient']['_id']}
     Log    ${ID_CLIENTE}



    Set Test Variable    ${RESPONSE_CLIENT}        ${response_client.json()}
Validar cliente com sucesso
    Log    ${RESPONSE_CLIENT}   console=True 

    Should Be Equal    ${RESPONSE_CLIENT['msg']}                                   Cliente criado com sucesso.
    Should Be Equal    ${RESPONSE_CLIENT['newClient']['mail']}                     ${EMAIL_CLIENTE}
    Should Be Equal    ${RESPONSE_CLIENT['newClient']['phone']}                    ${TELEFONE_CLIENTE}
    Should Be Equal    ${RESPONSE_CLIENT['newClient']['documents'][0]['rg']}       ${RG_CLIENTE} 
    Should Be Equal    ${RESPONSE_CLIENT['newClient']['documents'][0]['cpf']}      ${CPF_CLIENTE}
    Should Be Equal    ${RESPONSE_CLIENT['newClient']['_id']}                      ${ID_CLIENTE}
    
   