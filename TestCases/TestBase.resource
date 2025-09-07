*** Settings ***
Resource    ../Resources/pageBase.resource

*** Variables ***
${username}    standard_user
${password}    secret_sauce
${Item_number}    2


*** Keywords ***
Capture On Failure
    Run Keyword If    '${TEST_STATUS}' == 'FAIL'    Capture Page Screenshot