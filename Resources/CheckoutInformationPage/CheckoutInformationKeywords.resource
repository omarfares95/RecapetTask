*** Settings ***
Variables   variablesAndLocators.py
Resource    ../pageBase.resource

*** Keywords ***
Insert First Name
    ${first_name}=     First Name
    Input Text    ${first_name_txt}    ${first_name}
    
Insert Last Name
    ${last_name}=     Last Name
    Input Text    ${last_name_txt}    ${last_name}
    
Insert ZIP Code
    ${zipcode_name}=     Zipcode
    Input Text    ${postal_code_txt}    ${zipcode_name}
    
Click Continue
    Click Button    ${continue_btn}

get Item Total Price
    ${Total_Price}    Get Text    ${total_price_txt}
    ${Total_Price}    Replace String    ${Total_Price}    Item total: $    ${Empty}
    ${Total_Price}    Convert To Number    ${Total_Price}
    RETURN    ${Total_Price}
    
get Tax Price
    ${Tax_Price}    Get Text    ${tax_price_txt}
    ${Tax_Price}    Replace String    ${Tax_Price}    Tax: $    ${Empty}
    ${Tax_Price}    Convert To Number    ${Tax_Price}
    RETURN    ${Tax_Price}

finish order
    Click Button    ${finish_btn}