*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***

Acessar a pagina de atualizacao da empresa
    acessar a pagina 
    Digitar os campos 'mail' e 'password' 
    Cadastrar o usuário
    Digitar os campos de login usuario
    Cadastrar uma nova empresa   

Realizar atualizacao de cadastro da empresa 
  ${BODY_COMPANY_UPDATE}    Create Dictionary    
   ...    corporateName=QA Coders
   ...    registerCompany=12126456000155
   ...    mail=qacoders@academy.com
   ...    matriz=Academy
   ...    responsibleContact=Juliana França
   ...    telephone=99999999999999
   ...    serviceDescription=Testes

  ${UPDATE_COMPANY}=  PUT On Session      auth       ${ENDPOINT_COMPANY}${ID_COMPANY}
    ...    json=${BODY_COMPANY_UPDATE}    headers=${HEADERS_TOKEN}
       
    Log  ${UPDATE_COMPANY}
   
   Status Should Be   200

    Set Test Variable     ${UPDATE_COMPANY}         ${UPDATE_COMPANY.json()}
    
Validar se os dados foram atualizado com sucesso 
  Log    ${UPDATE_COMPANY} 
    
    Should Be Equal    ${UPDATE_COMPANY['msg'].strip()}    Companhia atualizada com sucesso.

    Should Be Equal As Strings    ${UPDATE_COMPANY['updatedCompany']['corporateName']}      QA Coders
    Should Be Equal As Strings    ${UPDATE_COMPANY['updatedCompany']['mail']}               qacoders@academy.com
    Should Be Equal As Strings    ${UPDATE_COMPANY['updatedCompany']['telephone']}          99999999999999 
   




    
  
 

  