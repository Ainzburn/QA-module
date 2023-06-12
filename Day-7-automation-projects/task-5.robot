*** Settings ***
Documentation       single test for login

Resource            ../login.resource
Library             SeleniumLibrary
Library             XML


*** Variables ***
${demo}                             //div[@id="demo"]
${dropdown}                         //div[@id="dropdown-display"]
${deriv_trader}                     //a[@href="/"]
${trade_dropdown}                   //div[@class="cq-symbol-select-btn"]
${volatility_50}                    //div[@class="sc-mcd__item sc-mcd__item--R_50 "]
${option_dropdown}                  //div[@id="dt_contract_dropdown"]
${multiplier}                       //div[@id="dt_contract_multiplier_item"]
${take_profit}                      //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox take_profit-checkbox__input"]
${stop_loss}                        //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox stop_loss-checkbox__input"]
${deal_cancellation}                //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox"]
${take_profit_ticked}               //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox take_profit-checkbox__input"]
${stop_loss_ticked}                 //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox stop_loss-checkbox__input"]
${deal_cancellation_ticked}         //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox"]
${multiplier_value_selection}       //div[@id="dropdown-display"]
${multiplier_x20}                   //div[@id="20"]
${multiplier_x40}                   //div[@id="40"]
${multiplier_x60}                   //div[@id="60"]
${multiplier_x100}                  //div[@id="100"]
${multiplier_x200}                  //div[@id="200"]


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

Check Navigation to Deriv Trader -> Volatility 50
    Wait Until Element Is Visible    ${deriv_trader}    10
    Click Element    ${deriv_trader}
    Wait Until Element Is Visible    ${trade_dropdown}    100
    Click Element    ${trade_dropdown}
    Wait Until Element Is Visible    ${volatility_50}    10
    Click Element    ${volatility_50}

Check Contract Type Multiplier
    Wait Until Element Is Visible    ${option_dropdown}    10
    Click Element    ${option_dropdown}
    Wait Until Element Is Visible    ${multiplier}    10
    Click Element    ${multiplier}

Check Only Stake is Allowed
    Page Should Contain Element    //*[text()="Stake"]
    Page Should Not Contain Element    //*[text()="Payout"]

Check Deal Cancellation or Take Profit/Stop Loss is allowed
    Wait Until Element Is Visible    ${take_profit}    10
    Click Element    ${take_profit}
    Wait Until Element Is Visible    ${take_profit_ticked}    10
    Wait Until Element Is Visible    ${stop_loss}    10
    Click Element    ${stop_loss}
    Wait Until Element Is Visible    ${stop_loss_ticked}    10
    Wait Until Element Is Visible    ${deal_cancellation}    10
    Click Element    ${deal_cancellation}
    Wait Until Element Is Visible    ${deal_cancellation_ticked}    10
    Page Should Not Contain Element    ${take_profit_ticked}
    Page Should Not Contain Element    ${stop_loss_ticked}

Check Multiplier Value x20, x40, x60, x100, x200
    Wait Until Element Is Visible    ${multiplier_value_selection}    10
    Click Element    ${multiplier_value_selection}
    Wait Until Element Is Visible    ${multiplier_x20}    10
    Click Element    ${multiplier_x20}
    Wait Until Element Is Visible    ${multiplier_value_selection}    10
    Click Element    ${multiplier_value_selection}
    Wait Until Element Is Visible    ${multiplier_x40}    10
    Click Element    ${multiplier_x40}
    Wait Until Element Is Visible    ${multiplier_value_selection}    10
    Click Element    ${multiplier_value_selection}
    Wait Until Element Is Visible    ${multiplier_x60}    10
    Click Element    ${multiplier_x60}
    Wait Until Element Is Visible    ${multiplier_value_selection}    10
    Click Element    ${multiplier_value_selection}
    Wait Until Element Is Visible    ${multiplier_x100}    10
    Click Element    ${multiplier_x100}
    Wait Until Element Is Visible    ${multiplier_value_selection}    10
    Click Element    ${multiplier_value_selection}
    Wait Until Element Is Visible    ${multiplier_x200}    10
    Click Element    ${multiplier_x200}
