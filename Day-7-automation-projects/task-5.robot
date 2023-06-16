*** Settings ***
Documentation       single test for login

Resource            ../login.resource
Library             SeleniumLibrary
Library             XML
Library             String


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

${stake_amount}                     //input[@name="amount"]
${cancellation_fee}                 //span[@class="trade-container__price-info-currency"]//parent::div[@class="trade-container__price-info-value"]

${purchase_enable}                  //button[@class="btn-purchase btn-purchase--1 btn-purchase--multiplier"]
${purchase_disable}                 //button[@class="btn-purchase btn-purchase--disabled btn-purchase--1 btn-purchase--multiplier"]

${add_profit}                       //button[@id="dc_take_profit_input_add"]
${sub_profit}                       //button[@id="dc_take_profit_input_sub"]
${take_profit_amount}               //input[@id="dc_take_profit_input"]

${deal_cancellation_dropdown}       //span[@name="cancellation_duration"]
${5m}                               //div[@class="dc-list__item"and@id="5m"]
${10m}                              //div[@class="dc-list__item"and@id="10m"]
${15m}                              //div[@class="dc-list__item"and@id="15m"]
${30m}                              //div[@class="dc-list__item"and@id="30m"]
${60m}                              //div[@cclass="dc-list__item dc-list__item--selected"and@id="60m"]


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

Check Cancellation Fee Higher when Stake Higher
    Wait Until Element Is Visible    ${stake_amount}    10
    Click Element    ${stake_amount}
    Press Keys    ${stake_amount}    CTRL+a+BACKSPACE
    Input Text    ${stake_amount}    10
    Wait Until Element Is Visible    ${cancellation_fee}    20
    ${stake_10}=    Get Text    ${cancellation_fee}
    ${cancel_fee_10}=    Split String    ${stake_10}    ${SPACE}
    Wait Until Element Is Visible    ${stake_amount}    10
    Click Element    ${stake_amount}
    Press Keys    ${stake_amount}    CTRL+a+BACKSPACE
    Input Text    ${stake_amount}    20
    Wait Until Element Is Visible    ${cancellation_fee}    20
    ${stake_20}=    Get Text    ${cancellation_fee}
    ${cancel_fee_20}=    Split String    ${stake_20}    ${SPACE}
    IF    ${cancel_fee_10} > ${cancel_fee_20}    Fail

Check Maximum Stake = 2000
    Wait Until Element Is Visible    ${deal_cancellation_ticked}
    Click Element    ${deal_cancellation_ticked}
    Wait Until Element Is Visible    ${stake_amount}    10
    Click Element    ${stake_amount}
    Press Keys    ${stake_amount}    CTRL+a+BACKSPACE
    Input Text    ${stake_amount}    2000
    Wait Until Page Contains Element    ${purchase_enable}    10
    Wait Until Element Is Visible    ${stake_amount}    10
    Click Element    ${stake_amount}
    Press Keys    ${stake_amount}    CTRL+a+BACKSPACE
    Input Text    ${stake_amount}    2001
    Wait Until Page Contains Element    ${purchase_disable}    10

Check Minimum Stake = 1
    Wait Until Element Is Visible    ${stake_amount}    10
    Click Element    ${stake_amount}
    Press Keys    ${stake_amount}    CTRL+a+BACKSPACE
    Input Text    ${stake_amount}    1
    Wait Until Page Contains Element    ${purchase_enable}    10
    Wait Until Element Is Visible    ${stake_amount}    10
    Click Element    ${stake_amount}
    Press Keys    ${stake_amount}    CTRL+a+BACKSPACE
    Input Text    ${stake_amount}    0
    Wait Until Page Contains Element    ${purchase_disable}    10

Check Take Profit (+) Add Exactly 1
    Wait Until Element Is Visible    ${take_profit}    10
    Click Element    ${take_profit}

    Press Keys    ${take_profit_amount}    CTRL+a+BACKSPACE
    Input Text    ${take_profit_amount}    1
    Wait Until Element Is Visible    ${add_profit}    10
    Click Element    ${add_profit}
    Element Attribute Value Should Be    ${take_profit_amount}    value    2

Check Take Profit (-) Minus Exactly 1
    Wait Until Element Is Visible    ${sub_profit}    10
    Click Element    ${sub_profit}
    Element Attribute Value Should Be    ${take_profit_amount}    value    1

Check Deal Cancellation Drop Down
    Click Element    ${deal_cancellation}
    Wait Until Element Is Visible    ${deal_cancellation_dropdown}    10
    Click Element    ${deal_cancellation_dropdown}
    Wait Until Element Is Visible    ${5m}
    Wait Until Element Is Visible    ${10m}
    Wait Until Element Is Visible    ${15m}
    Wait Until Element Is Visible    ${30m}
    Wait Until Element Is Visible    ${60m}
