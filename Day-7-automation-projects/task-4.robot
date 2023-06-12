*** Settings ***
Documentation       Day 7 Automation Task 4

Resource            ../login.resource
Library             SeleniumLibrary
Library             XML


*** Variables ***
${demo}                 //div[@id="demo"]
${dropdown}             //div[@id="dropdown-display"]
${deriv_trader}         //a[@href="/"]
${trade_dropdown}       //div[@class="cq-symbol-select-btn"]
${AUD_USD}              //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
${option_dropdown}      //div[@id="dt_contract_dropdown"]
${higher_lower}         //div[@id="dt_contract_high_low_item"]
${duration}             //input[@class="dc-input__field"]
${payout}               //input[@id="dt_amount_input"]
${lower}                //button[@class="btn-purchase btn-purchase--2"]
${barrier}              //input[@id="dt_barrier_1_input"]
${payout}               //button[@id="dc_payout_toggle_item"]
${payout_amount}        //input[@id="dt_amount_input"]
${button_disabled}      //div[@class="btn-purchase__shadow-wrapper btn-purchase__shadow-wrapper--disabled"]


*** Test Cases ***
Login
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ${email}
    Input Password    password    ${password}
    Click Element    //button[@name="login"]

Check if user able to change to Demo Account
    Wait Until Page Contains Element    ${dropdown}    10
    Click Element    ${dropdown}
    Wait Until Element Is Visible    ${demo}    10
    Click Element    ${demo}

Check Navigation to Deriv Trader
    Wait Until Element Is Visible    ${deriv_trader}    10
    Click Element    ${deriv_trader}

Check Navigation to Underlying AUD/USD
    Click Underlying Market
    Go to Underlying AUD/USD

Check Contract Type Lower
    Choose Contract Type
    Choose Higher/Lower

Check Duration 2 Days
    Wait Until Element Is Visible    ${duration}    10
    Input Text    ${duration}    2

Check Barrier with ErrorType: 24 hours
    Wait Until Element Is Visible    ${barrier}    10
    Press Keys    ${barrier}    CTRL+a+BACKSPACE
    Input Text    ${barrier}    -0.5

Check Payout = 10
    Wait Until Element Is Visible    ${payout}    10
    Click Element    ${payout}
    Wait Until Element Is Visible    ${payout_amount}    10
    Press Keys    ${payout_amount}    CTRL+a+BACKSPACE
    Input Text    ${payout_amount}    10

Check Lower Button is disabled
    Wait Until Element Is Visible    ${button_disabled}    10

Check Correct Message Error Appear
    Wait Until Page Contains    Contracts more than 24 hours in duration would need an absolute barrier.

*** Keywords ***
Click Underlying Market
    Wait Until Element Is Visible    ${trade_dropdown}    100
    Click Element    ${trade_dropdown}

Go to Underlying AUD/USD
    Wait Until Element Is Visible    ${AUD_USD}    10
    Click Element    ${AUD_USD}

Choose Contract Type
    Wait Until Element Is Visible    ${option_dropdown}    10
    Click Element    ${option_dropdown}

Choose Higher/Lower
    Wait Until Element Is Visible    ${higher_lower}    10
    Click Element    ${higher_lower}
