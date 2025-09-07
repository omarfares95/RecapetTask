*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    FakerLibrary
Library    OperatingSystem
Resource    ../Resources/LoginPage/loginKeywords.resource
Resource    ../Resources/InventoryPage/InventoryKeywords.resource
Resource    ../Resources/CartPage/CartKeywords.resource
Resource    ../Resources/CheckoutInformationPage/CheckoutInformationKeywords.resource
Resource    ../TestCases/TestBase.resource



*** Variables ***
${BROWSER}    chrome
${BROWSER_HEADLESS}    false

*** Keywords ***
Open Base Browser
    ${options}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${BROWSER_HEADLESS}' == 'true'    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --no-first-run
    Call Method    ${options}    add_argument    --disable-extensions
    Open Browser    browser=${BROWSER}    options=${options}
	Maximize Browser Window

Close Base Browser
    Close Browser