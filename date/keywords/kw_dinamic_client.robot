*** Settings ***
Resource        ../../config/main.robot    


*** Keywords ***

dados dinamico cliente 
  ${NOME}           Generate Random String            length=8          chars=[LETTERS]
  ${SOBRENOME}      Generate Random String            length=8          chars=[LETTERS]
  ${FULLNAME}       Catenate                  J${NOME}     F${SOBRENOME}
  ${NUMBER_EIGHT}    Generate Random String            length=8          chars=[NUMBERS]
  ${NUMBER_SERVEN}    Generate Random String           length=7          chars=[NUMBERS]
  ${NUMBER_FOURTEEN}    Generate Random String         length=14         chars=[NUMBERS]
  ${NUMBER_ELEVEN}    Generate Random String           length=11         chars=[NUMBERS]
  ${CHAR}           Generate Random String                  length=2     chars=[UPPER] 
  ${ALFA}           Generate Random String            length=8           chars=[LETTERS][NUMBERS]
  
  ${EMAIL_CLIENT}    Set Variable            ${NOME}${SOBRENOME}${NUMBER_FOURTEEN}@hotmail.com  
  ${PHONE_CLIENT}    Set Variable            ${NUMBER_FOURTEEN} 
  ${BIRTH_DATE}      Set Variable            ${NUMBER_EIGHT} 
  ${RG}              Set Variable            ${NUMBER_SERVEN}
  ${CPF}             Set Variable            ${NUMBER_ELEVEN} 
  ${COUNTRY}         Set Variable            ${NOME} 
  ${ZIPCODE}         Set Variable            ${NUMBER_EIGHT} 
  ${CITY}            Set Variable            ${NOME} 
  ${STATE}           Set Variable            ${CHAR} 
  ${DISTRICT}        Set Variable            ${FULLNAME}  
  ${STREET}          Set Variable            ${FULLNAME}
  ${NUMBER}          Set Variable            ${NUMBER_EIGHT} 
  ${COMPLEMENT}      Set Variable            ${ALFA} 



  ${DINAMIC_DATE_CLIENT}    Create Dictionary  
  ...  fullName=${FULLNAME}    
  ...  birthDate=${BIRTH_DATE}    
  ...  mail=${EMAIL_CLIENT}      
  ...  phone=${PHONE_CLIENT} 
  ...  currentRole=ADMIN

  ${DINAMIC_DOCUMENT}    Create Dictionary   
  ...  rg=${RG}         
  ...  cpf=${CPF}

  ${DINAMIC_ADDRESS_CLIENT}   Create Dictionary   
  ...    country=${COUNTRY}     
  ...    zipCode=${ZIPCODE}    
  ...    city=${CITY}     
  ...    state=${STATE}     
  ...    district=${DISTRICT}        
  ...    street=${STREET}
  ...    number=${NUMBER} 
  ...    complement=${COMPLEMENT}

  [RETURN]   ${DINAMIC_DATE_CLIENT}    ${DINAMIC_DOCUMENT}   ${DINAMIC_ADDRESS_CLIENT}





 