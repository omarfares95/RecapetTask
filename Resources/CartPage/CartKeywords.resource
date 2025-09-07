*** Settings ***
Variables   variablesAndLocators.py
Resource    ../pageBase.resource
*** Keywords ***
Check Cart Data
    [Arguments]    ${Added_Items}
    @{cart_items_list}    Get Webelements    ${cart_items}
    @{Approved_list}=    Create List
    FOR    ${Added_Item}    IN    @{Added_Items}
        FOR    ${item}    IN    @{cart_items_list}
            ${name}=    Evaluate    $item.find_element("xpath", "${cart_Title_items}").text
            ${price}=    Evaluate    $item.find_element("xpath", "${cart_Price_items}").text
            ${price}    Replace String    ${price}    $    ${Empty}
            ${check_status}    Run Keyword If    '${name}' == '${Added_Item}[name]'   check price is same    ${price}    ${Added_Item}[price]
            Run Keyword If    '${name}' == '${Added_Item}[name]' and '${check_status}' == 'True'    Append To List    ${Approved_list}    ${check_status}
        END
    END
    ${cart_items_list_count}    Get Length    ${cart_items_list}
    ${Approved_list_count}    Get Length    ${Approved_list}
    Should Be Equal As Integers    ${cart_items_list_count}    ${Item_number}
    Should Be Equal As Integers    ${Approved_list_count}    ${Item_number}

check price is same
    [Arguments]    ${ActualPrice}    ${ExpectedPrice}
    ${status}    Run Keyword And Return Status    Should Be Equal        ${ActualPrice}    ${ExpectedPrice}
    RETURN    ${status}

click Checkout
    Click Button    ${checkout_btn}