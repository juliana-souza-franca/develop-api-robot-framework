*** Settings ***

Resource        ./libraries.robot

Variables       ./setup.yaml   


Resource        ../date/keywords/kw_login_admin.robot
Resource        ../date/keywords/kw_register_user.robot
Resource        ../date/keywords/kw_consult_user.robot
Resource        ../date/keywords/kw_update_user.robot
Resource        ../date/keywords/kw_update_password_user.robot
Resource        ../date/keywords/kw_register_company.robot
Resource        ../date/keywords/kw_consult_company.robot
Resource        ../date/keywords/kw_update_company.robot
Resource        ../date/keywords/kw_update_address_company.robot
Resource        ../date/keywords/kw_delete_company.robot
Resource        ../date/keywords/kw_delete_user.robot
Resource        ../date/keywords/kw_register_client.robot
Resource        ../date/keywords/kw_consult_client.robot
Resource        ../date/keywords/kw_update_client.robot
Resource        ../date/keywords/kw_delete_client.robot

Resource        ../date/keywords/kw_dinamic.robot
Resource        ../date/keywords/kw_dinamica_company.robot
Resource        ../date/keywords/kw_dinamic_client.robot

Resource        ../date/headers/header.robot

Resource        ../date/keywords/kw_login_user.robot

Variables       ../date/variables/admin_login.yaml


Variables       ../date/variables/return_variable.robot

