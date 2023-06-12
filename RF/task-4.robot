*** Settings ***
Documentation       single test for login

Library             SeleniumLibrary
Library             XML


*** Variables ***
${email}                haziq+1@besquare.com.my
${password}             iLove3334
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
login
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ${email}
    Input Password    password    ${password}
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${dropdown}    10
    Click Element    ${dropdown}
    Wait Until Element Is Visible    ${demo}    10
    Click Element    ${demo}
    Wait Until Element Is Visible    ${deriv_trader}    10
    Click Element    ${deriv_trader}
    Wait Until Element Is Visible    ${trade_dropdown}    100
    Click Element    ${trade_dropdown}
    Wait Until Element Is Visible    ${AUD_USD}    10
    Click Element    ${AUD_USD}
    Wait Until Element Is Visible    ${option_dropdown}    10
    Click Element    ${option_dropdown}
    Wait Until Element Is Visible    ${higher_lower}    10
    Click Element    ${higher_lower}
    Wait Until Element Is Visible    ${duration}    10
    Input Text    ${duration}    2
    Wait Until Element Is Visible    ${barrier}    10
    Press Keys    ${barrier}    CTRL+a+BACKSPACE
    Input Text    ${barrier}    -0.5
    Wait Until Element Is Visible    ${payout}    10
    Click Element    ${payout}
    Wait Until Element Is Visible    ${payout_amount}    10
    Press Keys    ${payout_amount}    CTRL+a+BACKSPACE
    Input Text    ${payout_amount}    10
    Wait Until Element Is Visible    ${button_disabled}    10
    Wait Until Element Contains    //*[text()="Contracts more than 24 hours in duration would need an absolute barrier."]    100
    Sleep    100