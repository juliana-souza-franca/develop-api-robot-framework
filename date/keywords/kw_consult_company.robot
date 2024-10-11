*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***
Acessar a pagina de consulta da empresa
    acessar a pagina 
    Digitar os campos 'mail' e 'password' 
    Cadastrar o usuário
    Digitar os campos de login usuario
    Cadastrar uma nova empresa

Realizar uma consulta da empresa
  Log     {ID_COMPANY} 
    ${response_a_company}    GET On Session        auth         ${ENDPOINT_COMPANY}${ID_COMPANY}      headers=${HEADERS_TOKEN}  
    Log       ${response_a_company}
   
   Status Should Be    200  
   Set Test Variable  ${response_company}    ${response_a_company.json()}

 Validar se a consulta foi realizada com sucesso
     Log    ${response_company}
    Should Be Equal    ${response_company['mail']}          ${EMAIL_COMPANY}
    Should Be Equal    ${response_company['telephone']}     ${TELEFONE_COMPANY}
  
