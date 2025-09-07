*** Settings ***
Variables   variablesAndLocators.py
Resource    ../pageBase.resource
*** Keywords ***
sort Products from Low to High Price
    Wait Until Element Is Visible    ${sort_btn}
    Select From List By Label    ${sort_btn}    ${sort_value}

add item to cart
    [Arguments]    ${item_number}
    ${add_to_cart_btn}    Replace String    ${add_to_cart_btn}    InputNumber    ${item_number}
    ${added_item_name}    Replace String    ${added_item_name}    InputNumber    ${item_number}
    ${added_item_price}    Replace String    ${added_item_price}    InputNumber    ${item_number}
    Click Element    ${add_to_cart_btn}
    ${add_to_cart_btn_text}    Get Text    ${add_to_cart_btn}
    Should Be Equal    ${add_to_cart_btn_text}    Remove
    ${item_name}    Get Text    ${added_item_name}
    ${item_price}    Get Text    ${added_item_price}
    ${item_price}    Replace String    ${item_price}    $    ${Empty}
    RETURN    ${item_name}    ${item_price}

open Cart Page
    Click Element    ${Cart_icon}
    Sleep     5s

