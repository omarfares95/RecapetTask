*** Settings ***
Variables   variablesAndLocators.py
Resource    ../pageBase.resource
*** Keywords ***
Open Login Page
    Read Env
    ${env_url}=    Get Environment Variable    URL
    Go To    ${env_url}
    Log To Console    ${env_url}
Insert Username
    [Arguments]    ${username}
    Wait Until Keyword Succeeds    3x    5s    Page Should Contain Element    ${user_name_field}
    Input Text    ${user_name_field}    ${username}
Insert Password
    [Arguments]    ${password}
    Wait Until Keyword Succeeds    3x    5s    Page Should Contain Element    ${password_field}
    Input Text    ${password_field}    ${password}
Click Login Button
    Wait Until Keyword Succeeds    3x    5s    Page Should Contain Element    ${submit_btn}
    Click Button    ${submit_btn}
Verify Login Status
    [Arguments]    ${error_msg}
    Wait Until Keyword Succeeds    3x    5s    Page Should Contain    ${error_msg}
Verify Login Failure    
    Page Should Contain Element    ${error_element}

