*** Settings ***
Resource        ../../config/main.robot


*** Keywords ***
Acessar a pagina de cadastro da empresa
  acessar a pagina 
   Digitar os campos 'mail' e 'password'
   Cadastrar o usuário
   Digitar os campos de login usuario  

Cadastrar uma nova empresa  
...  ${COMPANY_DINAMIC}      ${LIST_ADDRESS}        dados dinamicos company
 
   
   ${ADDRESS}    Create Dictionary      
   ...  zipCode=${LIST_ADDRESS['zipCode']} 
   ...  city=${LIST_ADDRESS['city']}
   ...  state=${LIST_ADDRESS['state']} 
   ...  district=${LIST_ADDRESS['district']} 
   ...  street=${LIST_ADDRESS['street']} 
   ...  number=${LIST_ADDRESS['number']}
   ...  complement=${LIST_ADDRESS['complement']}
   ...  country=${LIST_ADDRESS['country']}  

  ${LIST_ADDRESS_COMPANY}     Create List    ${ADDRESS}


  ${BODY}    Create Dictionary      
 ...    corporateName=${COMPANY_DINAMIC['corporateName']}        
 ...    registerCompany=${COMPANY_DINAMIC['registerCompany']}       
 ...    mail=${COMPANY_DINAMIC['mail']}        
 ...    matriz=${COMPANY_DINAMIC['matriz']}
 ...    responsibleContact=${COMPANY_DINAMIC['responsibleContact']}
 ...    telephone=${COMPANY_DINAMIC['telephone']}
 ...    serviceDescription=${COMPANY_DINAMIC['serviceDescription']}
 ...    address=${LIST_ADDRESS_COMPANY}
     Log    ${BODY} 

    
    ${response}    POST On Session        alias=auth          url=${ENDPOINT_COMPANY}            json=${BODY}          
    ...     headers=${HEADERS_TOKEN}   


    Log To Console  ${response.status_code}
    Log   ${response.json()}

    Status Should Be   201

    Set Global Variable        ${EMAIL_COMPANY}      ${response.json()['newCompany']['mail']}
    Log    ${EMAIL_COMPANY} 
    Set Global Variable        ${TELEFONE_COMPANY}    ${response.json()['newCompany']['telephone']}   

    Set Global Variable         ${ID_COMPANY}             ${response.json()['newCompany']['_id']}
    Should Be Equal             ${ID_COMPANY}            ${response.json()['newCompany']['_id']}
    Log   ${ID_COMPANY}  
    Set Test Variable       ${RESPONSE}           ${response.json()}

Validar a empresa com sucesso
   Log    ${RESPONSE} 
 
  Should Be Equal As Strings    ${RESPONSE['newCompany']['mail']}         ${EMAIL_COMPANY}
  Should Be Equal As Strings    ${RESPONSE['newCompany']['telephone']}    ${TELEFONE_COMPANY} 
  Should Be Equal As Strings    ${RESPONSE['newCompany']['_id']}          ${ID_COMPANY}

