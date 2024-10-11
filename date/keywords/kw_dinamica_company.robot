*** Settings ***
Resource        ../../config/main.robot    

*** Keywords ***

dados dinamicos company
    ${CPF}            Generate Random String    length=11    chars=[NUMBERS]
    ${NOME}           Generate Random String    length=8     chars=[LETTERS]
    ${SOBRENOME}      Generate Random String    length=8     chars=[LETTERS]
    ${NUMERO}         Generate Random String    length=10    chars=[NUMBERS]  
    ${REGISTRO}       Generate Random String    length=14    chars=[NUMBERS]
    ${CEP}            Generate Random String    length=8     chars=[NUMBERS]  
    ${ESTADO}         Generate Random String    length=2     chars=[UPPER]  

    ${FULLNAME_COMPANY}       Catenate    J${NOME}     F${SOBRENOME}
    ${COMPANY}        Set Variable       ${NOME}   
    ${EMAIL}          Set Variable       ${COMPANY}${NUMERO}@hotmail.com
    ${TELEFONE}       Set Variable        ${REGISTRO} 
    ${MATRIZ}         Set Variable       ${NOME} 
    ${DESCRICAO}      Set Variable       ${NOME} 
    ${BAIRRO}         Catenate    J${NOME}    F${SOBRENOME} 
    ${ENDEREÇO}       Catenate    J${NOME}    F${SOBRENOME} 
    ${COMPLEMENTO}    Catenate    ${NOME}    ${NUMERO}
    ${PAÍS}           Set Variable       ${NOME} 
    ${ESTADO}         Set Variable       ${ESTADO}  

    ${COMPANY_DINAMIC}    Create Dictionary  
    ...  corporateName=${COMPANY}
    ...  registerCompany=${REGISTRO}
    ...  mail=${EMAIL} 
    ...  matriz=${MATRIZ}  
    ...  responsibleContact=${FULLNAME_COMPANY}  
    ...  telephone=${TELEFONE} 
    ...  serviceDescription=${DESCRICAO}

    ${LIST_ADDRESS}     Create Dictionary  
    ...  zipCode=${CEP}
    ...  city=${NOME}  
    ...  state=${ESTADO}
    ...  district=${BAIRRO}
    ...  street=${ENDEREÇO}
    ...  number=${NUMERO}
    ...  complement=${COMPLEMENTO}
    ...  country=${PAÍS}

    [Return]    ${COMPANY_DINAMIC}    ${LIST_ADDRESS}
