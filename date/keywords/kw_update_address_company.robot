*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***
Acessar a pagina de atualizacao de endereco da empresa
    acessar a pagina 
    Digitar os campos 'mail' e 'password' 
    Cadastrar o usuário
    Digitar os campos de login usuario
    Cadastrar uma nova empresa  

Realizar atualizacao do endereco da empresa
  ${BODY_UPDATE_ADDRESS}    Create Dictionary
   ...   zipCode=11000202
   ...   city=Santos
   ...   state=SP
   ...   district=Aparecida
   ...   street=Rua Alexandre Martins
   ...   number=80
   ...   complement=Lj 60
   ...   country=Brasil

   ${LIST_UPDATE}       Create List     ${BODY_UPDATE_ADDRESS}

   ${BODY}   Create Dictionary   address=${LIST_UPDATE}


    ${UPDATE_ADDRESS_COMPANY}    PUT On Session      auth        ${ENDPOINT_ADDRESS_COMPANY}${ID_COMPANY}    
    ...    json=${BODY}      headers=${HEADERS_TOKEN}
    
    Log   ${BODY}
    Log    ${UPDATE_ADDRESS_COMPANY}
    Status Should Be    201

    Set Global Variable    ${CEP}    ${UPDATE_ADDRESS_COMPANY.json()['updateCompany']['address'][0]['zipCode']}
    Log    ${CEP}
    Set Test Variable    ${CIDADE}    ${UPDATE_ADDRESS_COMPANY.json()['updateCompany']['address'][0]['city']}
    Log    ${CIDADE}
    Set Test Variable    ${RUA}    ${UPDATE_ADDRESS_COMPANY.json()['updateCompany']['address'][0]['street']}
    Log    ${RUA}
  
    Log    ${UPDATE_ADDRESS_COMPANY.json()}    console=True


     
    Set Test Variable    ${RESPONSE_ADDRESS}    ${UPDATE_ADDRESS_COMPANY.json()}
   
Validar se o endereco foi atualizado
    Log    ${RESPONSE_ADDRESS}
    Should Be Equal     ${RESPONSE_ADDRESS['msg']}    Endereço da companhia atualizado com sucesso.
    Should Be Equal    ${RESPONSE_ADDRESS['updateCompany']['address'][0]['zipCode']}    ${CEP}
    Should Be Equal    ${RESPONSE_ADDRESS['updateCompany']['address'][0]['city']}       ${CIDADE}
    Should Be Equal    ${RESPONSE_ADDRESS['updateCompany']['address'][0]['street']}     ${RUA}

   
   
