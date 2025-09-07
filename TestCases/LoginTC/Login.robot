*** Settings ***
Resource    ../TestBase.resource
Resource    ../../Resources/LoginPage/loginKeywords.resource
Library    DataDriver    file=login_data.csv


*** Test Cases ***
Invalid User Name
    [Tags]    E2E    Login
    [Template]    Validate Login
    username    password    expected_msg


*** Keywords ***
Validate Login
    [Arguments]    ${username}    ${password}    ${expected_msg}
    Open Base Browser
    Open Login Page
    Insert Username    ${username}
    Insert Password    ${password}
    Click Login Button
    Verify Login Status    ${expected_msg}
    Close Browser