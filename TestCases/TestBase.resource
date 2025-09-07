*** Settings ***
Resource    ../Resources/pageBase.resource

*** Variables ***
${Item_number}    2


*** Keywords ***
Capture On Failure
    Run Keyword If    '${TEST_STATUS}' == 'FAIL'    Capture Page Screenshot

Read Env
    ${_}=    Evaluate    __import__('dotenv').load_dotenv('.env')