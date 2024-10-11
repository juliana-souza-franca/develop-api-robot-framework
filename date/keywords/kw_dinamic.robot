*** Settings ***
Resource        ../../config/main.robot    


*** Keywords ***

dados dinamicos
   

    ${CPF}            Generate Random String    length=11    chars=[NUMBERS]
    ${NOME}           Generate Random String    length=8     chars=[LETTERS]
    ${SOBRENOME}      Generate Random String    length=8     chars=[LETTERS]
    ${NUMERO}         Generate Random String    length=11    chars=[NUMBERS]
    ${FULLNAME}       Catenate                  J${NOME}     F${SOBRENOME}
    ${EMAIL_USUARIO}  Set Variable              julianafranca${CPF}@gmail.com
   

    Log To Console  ${FULLNAME}
    Log To Console  ${EMAIL_USUARIO}
   
    
    ${USER_DINAMIC}      Create Dictionary      
    ...  fullName=${FULLNAME} 
    ...  mail=${EMAIL_USUARIO}

    [RETURN]   ${USER_DINAMIC}    
