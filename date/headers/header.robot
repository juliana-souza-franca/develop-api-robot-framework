*** Settings ***
Resource        ../../config/main.robot

*** Keywords ***

acessar a pagina 
    ${HEADERS}  Create Dictionary    accept=application/json   Content-Type=application/json
     Create Session   alias=auth        url=${URL}        headers=${HEADERS}    disable_warnings=${True}