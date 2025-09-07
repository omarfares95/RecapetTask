*** Settings ***
Variables   variablesAndLocators.py
Resource    ../pageBase.resource
*** Keywords ***
Open Login Page
    Go To    ${URL}
Insert Username
    [Arguments]    ${username}
    Input Text    ${user_name_field}    ${username}
Insert Password
    [Arguments]    ${password}
    Input Text    ${password_field}    ${password}
Click Login Button
    Click Button    ${submit_btn}
Verify Login Status
    [Arguments]    ${error_msg}
    Page Should Contain    ${error_msg}
Verify Login Failure    
    Page Should Contain Element    ${error_element}

