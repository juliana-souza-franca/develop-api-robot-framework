*** Settings ***
Resource        ../../config/main.robot
    

*** Test Cases ***
CT001- Acesso a pagina do login de admin com sucesso
  [Tags]    ADMIN
    acessar a pagina 
    Digitar os campos 'mail' e 'password'
    Validar dados do login admin

CT002- Cadastro do usuário com sucesso
    [Tags]    CADASTRO_USUARIO

    Acessar a pagina do usuario
    ${response_user}    ${account}=  Cadastrar o usuário
    Log    ${response_user}   
    Log     ${account}
    Validar os campos preenchidos       ${response_user}    ${account}
    
CT003- Consultar um usuário     
    [Tags]    CONSULTA_USUARIO
    Acessar a pagina de consulta 
    Realizar uma consulta com um usuário com sucesso  
    Validar consulta de um usuário realizada com sucesso  

CT004- Atualizar um usuário
    [Tags]    ATUALIZA_USUARIO
   Acessar a pagina de atualizacao do usuário
   Atualizar o cadastro do usuario
   Validar a atualizacao do usuario

CT005- Atualizar a senha de um usuário
    [Tags]    SENHA_USUARIO
   Acessar a pagina de atualizacao de senha do usuário
   Atualizar a senha do usuario 
   Validar se a senha foi atualizada

CT006- Cadastro de empresa
   [Tags]    CADASTRO_EMPRESA
   Acessar a pagina de cadastro da empresa
   Cadastrar uma nova empresa 
   Validar a empresa com sucesso 

CT007- Consultar uma empresa
    [Tags]    CONSULTA_EMPRESA
  Acessar a pagina de consulta da empresa
  Realizar uma consulta da empresa
  Validar se a consulta foi realizada com sucesso   

CT008- Atualizar os dados de uma empresa
   [Tags]    ATUALIZA_EMPRESA
  Acessar a pagina de atualizacao da empresa
  Realizar atualizacao de cadastro da empresa
  Validar se os dados foram atualizado com sucesso 

CT009- Atualizar o endereço da empresa
  [Tags]    ATUALIZA_ENDERECO
    Acessar a pagina de atualizacao de endereco da empresa
    Realizar atualizacao do endereco da empresa
    Validar se o endereco foi atualizado

CT010- Deletar os dados de uma empresa
  [Tags]    DELETAR_EMPRESA
  Acessar a pagina para deletar uma empresa  
  Realizar o delete dos dados de uma empresa
  Validar se os dados da empresa foram apagados

CT011- Deletar os dados de um usuário
  [Tags]    DELETAR_USUARIO
   
   Acessar a pagina para deletar um usuario
   Realizar o delete de um usuario
   Validar se os dados do usuario foram apagados 
  

CT012- Cadastrar um cliente 
  [Tags]   CADASTRO_CLIENTE

   Acessar a pagina de cadastro de cliente
   Cadastrar um novo cliente 
   Validar cliente com sucesso

CT013- Consultar um cliente 
  [Tags]    CONSULTA_CLIENTE
  
    Acessar a pagina de consulta do cliente 
    Realizar consulta do cliente 
    Validar a consulta do cliente 

CT014- Atualizar os dados do cliente 
  [Tags]    ATUALIZA_CLIENTE

   Acessar a pagina da atualizacao do cliente
   Realizar a atualizacao do cadastro do cliente
   #Validar se o cliente foi atualizado com sucesso 

CT015- Deletar os dados de um cliente
  [Tags]    DELETA_CLIENTE
    
    Acessando uma pagina para excluir cliente
    Realizar a exclucao dos dados do cliente
    Validar se os dados do cliente foram excluidos com sucesso
   
   

   

   





  










     




   
   
   

  