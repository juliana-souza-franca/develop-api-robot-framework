*** Settings ***
Resource        ../../config/main.robot


*** Keywords ***
Acessar a pagina da atualizacao do cliente
   acessar a pagina
   Digitar os campos 'mail' e 'password'
   Cadastrar o usuário
   Digitar os campos de login usuario
   Cadastrar um novo cliente

Realizar a atualizacao do cadastro do cliente
   ${COUNTRY}    FakerLibrary.Country
   ${ZIPCODE}    FakerLibrary.Postcode
   ${CITY}       FakerLibrary.City
   ${STATE}      FakerLibrary.State Abbr
   ${DISTRICT}   FakerLibrary.Street Suffix
   ${STREET}     FakerLibrary.Street Name
   ${NUMBER}     FakerLibrary.Building Number
   ${COMPLEMENT}  FakerLibrary.Port Number

   ${body_update_address_client}    Create Dictionary
   ...    country=${COUNTRY}
   ...    zipCode=${ZIPCODE} 
   ...    city=${CITY}  
   ...    state=${STATE}  
   ...    district=${DISTRICT} 
   ...    street=${STREET}
   ...    number=${NUMBER} 
   ...    complement=${COMPLEMENT} 

   ${RG}         FakerLibrary.Random Number   9       numbers_only=True
   ${CPF}        FakerLibrary.Random Number   11     numbers_only=True

   ${body_update_document_client}    Create Dictionary
   ...    rg=${RG}        
   ...    cpf=${CPF} 

   ${FULLNAME}    FakerLibrary.Name

   ${BIRTHDATE}   FakerLibrary.Date of Birth
   ${FORMATTED_BIRTHDATE}   Convert To String  ${BIRTHDATE}   

   ${MAIL}        FakerLibrary.Email
   ${PHONE}       FakerLibrary.Phone Number


   ${body_update_client}    Create Dictionary
   ...  fullName=${FULLNAME}     
   ...  birthDate=${FORMATTED_BIRTHDATE}
   ...  mail=${MAIL}      
   ...  phone=${PHONE} 
   ...  currentRole=ADMIN
   ...  documents=${body_update_document_client}
   ...  address=${body_update_address_client}
  

   Log   ${body_update_client}

   ${response_update_client}    PUT On Session      auth      ${ENDPOINT_CLIENT}${ID_CLIENTE} 
   ...    json=${body_update_client}     headers=${HEADERS_TOKEN}
   
   Log   ${response_update_client}
  
   Status Should Be    200
   Set Test Variable    ${UPDATE_CLIENTE}     ${response_update_client.json()}
   Log    ${UPDATE_CLIENTE}  

   #  Should Be Equal As Strings   ${UPDATE_CLIENTE}   msg      Cadastro atualizado com sucesso.
