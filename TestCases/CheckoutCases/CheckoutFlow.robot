*** Settings ***
Resource    ../TestBase.resource
Suite Setup    Login
Suite Teardown    Close Browser
Test Teardown    Capture On Failure

*** Variables ***
${Total_items_price}    0

*** Test Cases ***
Add To Cart
    [Tags]    E2E    AddToCart    CheckOut
    Page Should Contain    Products    Product Pages not opened successfully
    Wait Until Keyword Succeeds    3x    5s    sort Products from Low to High Price
    @{Items_list}=    Create List
    Set Global Variable    ${Items_list}
    FOR    ${count}    IN RANGE    1    ${Item_number}+1
        ${count}=    Convert To String    ${count}
        ${item_name}    ${item_price}    add item to cart    ${count}
        ${Items_Data}  Create Dictionary    name=${item_name}    price=${item_price}
        Append To List    ${Items_list}    ${Items_Data}
        ${Total_items_price}    Evaluate    ${Total_items_price}+${item_price}
    END
    Set Global Variable    ${Total_items_price}
    open Cart Page
    Check Cart Data    ${Items_list}

complete order
    [Tags]    E2E    CheckOut
    Wait Until Keyword Succeeds    3x    5s    click Checkout
    Wait Until Keyword Succeeds    3x    5s    Page Should Contain    Checkout: Your Information
    Sleep    1S
    Click Continue
    Page Should Contain    Error: First Name is required
    Insert First Name
    Click Continue
    Page Should Contain    Error: Last Name is required
    Insert Last Name
    Click Continue
    Page Should Contain    Error: Postal Code is required
    Insert ZIP Code
    Click Continue
    Wait Until Keyword Succeeds    3x    5s    Page Should Contain    Checkout: Overview
    ${totalPrice}    Get Item Total Price
    ${taxPrice}    Get Tax Price
    ${calculated_tax}    Evaluate    round(${totalPrice} * 0.08, 2)
    Should Be Equal As Numbers    ${calculated_tax}    ${taxPrice}
    Should Be Equal As Numbers    ${Total_items_price}    ${totalPrice}
    finish order
    Wait Until Keyword Succeeds    1x    5s    Page Should Contain    Thank you for your order!


*** Keywords ***
Login
    Open Base Browser
    Open Login Page
    ${username}=    Get Environment Variable    USERNAME
    ${password}=    Get Environment Variable    PASSWORD
    Log To Console    ${username} - ${password}
    Insert Username    ${username}
    Insert Password    ${password}
    Click Login Button

