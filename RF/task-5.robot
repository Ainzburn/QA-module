*** Settings ***
Documentation       single test for login

Library             SeleniumLibrary
Library             XML


*** Variables ***
${email}                        haziq+1@besquare.com.my
${password}                     iLove3334
${demo}                         //div[@id="demo"]
${dropdown}                     //div[@id="dropdown-display"]
${deriv_trader}                 //a[@href="/"]
${trade_dropdown}               //div[@class="cq-symbol-select-btn"]
${volatility_50}                //div[@class="sc-mcd__item sc-mcd__item--R_50 "]
${option_dropdown}              //div[@id="dt_contract_dropdown"]
${multiplier}                   //div[@id="dt_contract_multiplier_item"]
${take_profit}                  //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox take_profit-checkbox__input"]
${stop_loss}                    //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox stop_loss-checkbox__input"]
${deal_cancellation}            //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox"]
${take_profit_ticked}           //span[@class="class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox take_profit-checkbox__input"]
${stop_loss_ticked}             //span[@class=//parent::label][@class="dc-checkbox stop_loss-checkbox__input"]
${deal_cancellation_ticked}     //span[@class=//parent::label][@class="dc-checkbox"]


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
    Wait Until Element Is Visible    ${volatility_50}    10
    Click Element    ${volatility_50}
    Wait Until Element Is Visible    ${option_dropdown}    10
    Click Element    ${option_dropdown}
    Wait Until Element Is Visible    ${multiplier}    10
    Click Element    ${multiplier}
    Page Should Not Contain Element    //*[text()="Payout"]
    # Check => take profit (✓) stop loss ( ) deal cancellation ( )
    Wait Until Element Is Visible    ${take_profit}    10
    Click Element    ${take_profit}
    Wait Until Element Is Visible    ${multiplier}    10
    Click Element    ${multiplier}
    Sleep    5
