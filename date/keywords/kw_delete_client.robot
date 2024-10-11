*** Settings ***

Resource           ../../config/main.robot

*** Keywords ***

Acessando uma pagina para excluir cliente
   acessar a pagina
   Digitar os campos 'mail' e 'password'
   Cadastrar o usuário
   Digitar os campos de login usuario
   Cadastrar um novo cliente


Realizar a exclucao dos dados do cliente
    ${delete_one_client}    DELETE On Session    auth     ${ENDPOINT_CLIENT}${ID_CLIENTE}       headers=${HEADERS_TOKEN}
   Log    ${delete_one_client}

   Status Should Be    200

   Set Test Variable    ${DELETE_CLIENT}     ${delete_one_client.json()}

Validar se os dados do cliente foram excluidos com sucesso
    Log   ${DELETE_CLIENT}

   Should Contain    ${DELETE_CLIENT['msg']}    deletado com sucesso!