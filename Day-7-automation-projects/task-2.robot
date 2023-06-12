*** Settings ***
Documentation       single test for login

Library             SeleniumLibrary


*** Variables ***
${email}                haziq+1@besquare.com.my
${password}             iLove3334
${demo}                 //div[@id="demo"]
${dropdown}             //div[@id="dropdown-display"]
${deriv_trader}         //a[@href="/"]
${trade_dropdown}       //div[@class="cq-symbol-select-btn"]
${volatility_10_1s}     //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
${5_tick}               //span[@data-testid="tick_step_5"]
${purchase_rise}        //*[@id="dt_purchase_call_button"]

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
    Wait Until Element Is Visible    ${volatility_10_1s}    10
    Click Element    ${volatility_10_1s}
    Wait Until Element Is Visible    //input[@class="input trade-container__input range-slider__track"]    10
    ${input_value}=    Get Input
    IF    ${input_value} != 5
       Wait Until Element Is Visible    ${5_tick}    10
       Click Element    ${5_tick}
    END
    Wait Until Element Is Visible    ${purchase_rise}    10
    Click Element    ${purchase_rise}


*** Keywords ***
Get Input
    ${result}=    Get Element Attribute
    ...    //input[@class="input trade-container__input range-slider__track"]
    ...    value
    Log    ${result}
    RETURN    ${result}
