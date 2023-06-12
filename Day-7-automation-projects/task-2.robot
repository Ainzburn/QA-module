*** Settings ***
Documentation       Day 7 Automation Task 2

Library             SeleniumLibrary
Resource            ../login.resource


*** Variables ***
${demo}                     //div[@id="demo"]
${dropdown}                 //div[@id="dropdown-display"]
${deriv_trader}             //a[@href="/"]
${trade_dropdown}           //div[@class="cq-symbol-select-btn"]
${volatility_10_1s}         //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
${5_tick}                   //span[@data-testid="tick_step_5"]
${purchase_rise}            //*[@id="dt_purchase_call_button"]
${trade_type_rise_fall}     //span[@name="contract_type" and @value="rise_fall_equal"]
${input_value}              //input[@id="dt_amount_input" and @value="10"]


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

Check Navigation to Deriv Trader -> Volatility 10(1s)
    Wait Until Page Contains Element    ${deriv_trader}    10
    Click Element    ${deriv_trader}
    Wait Until Element Is Visible    ${trade_dropdown}    100
    Click Element    ${trade_dropdown}
    Wait Until Element Is Visible    ${volatility_10_1s}    10
    Click Element    ${volatility_10_1s}

Check Contract Type is Rise/Fall
    Wait Until Element Is Visible    ${trade_type_rise_fall}    20

Check Duration 5 Tick
    Wait Until Element Is Visible    //input[@class="input trade-container__input range-slider__track"]    10
    ${input_value}=    Get Input
    IF    ${input_value} != 5
        Wait Until Element Is Visible    ${5_tick}    10
        Click Element    ${5_tick}
    END

Check Stake = 10 USD
    Wait Until Element Is Visible    ${input_value}

Check Purchase Contract
    Wait Until Element Is Visible    ${purchase_rise}    10
    Click Element    ${purchase_rise}


*** Keywords ***
Get Input
    ${result}=    Get Element Attribute
    ...    //input[@class="input trade-container__input range-slider__track"]
    ...    value
    Log    ${result}
    RETURN    ${result}
