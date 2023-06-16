*** Settings ***
Documentation       single test for login

Resource            ../login.resource
Library             SeleniumLibrary
Library             XML


*** Variables ***
${demo}                             //div[@id="demo"]
${dropdown}                         //div[@id="dropdown-display"]
${account_settings}                 //a[@class="trading-hub-header__setting"]
${API_token}                        //a[@id="dc_api-token_link"]

${read}                             //input[@name="read"]//ancestor::div[@class="composite-checkbox api-token__checkbox"]
${read_active}                      //input[@name="read"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]
${trade}                            //input[@name="trade"]//ancestor::div[@class="composite-checkbox api-token__checkbox"]
${trade_active}                     //input[@name="trade"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]
${payments}                         //input[@name="payments"]//ancestor::div[@class="composite-checkbox api-token__checkbox"]
${payments_active}                  //input[@name="payments"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]
${trading_information}              //input[@name="trading_information"]//ancestor::div[@class="composite-checkbox api-token__checkbox"]
${trading_information_active}       //input[@name="trading_information"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]
${admin}                            //input[@name="admin"]//ancestor::div[@class="composite-checkbox api-token__checkbox"]
${admin_active}                     //input[@name="admin"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]

${token_name}                       //input[@name="token_name"]
${create_button}                    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${create_button_disabled}           //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button" and @disabled]

${token_row}                        //tr[@class="da-api-token__table-cell-row"]
${copy_token}                       //div//*[name()='svg'and@data-testid="dt_copy_token_icon"]
${show_token}                       //div//*[name()='svg'and@data-testid="dt_toggle_visibility_icon"]
${token_visible}                    //p[@class="dc-text"]//parent::div[@class="da-api-token__clipboard-wrapper"]
${delete_token}                     //div//*[name()='svg'and@data-testid="dt_token_delete_icon"]
${confirm_delete_token}             //span[text()="Yes, delete"]//parent::button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]


*** Test Cases ***
Check Login
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ${email}
    Input Password    password    ${password}
    Click Element    //button[@name="login"]

Check changing to Demo Account
    Wait Until Page Contains Element    ${dropdown}    25
    Click Element    ${dropdown}
    Wait Until Element Is Visible    ${demo}    10
    Click Element    ${demo}

Check going to Account Settings -> API Token
    Wait Until Page Contains Element    ${account_settings}    10
    Click Element    ${account_settings}
    Wait Until Page Contains Element    ${API_token}    10
    Click Element    ${API_token}

Check Scope Checkboxes
    Wait Until Page Contains Element    ${read}    10
    Click Element    ${read}
    Wait Until Page Contains Element    ${read_active}    10
    Click Element    ${read_active}
    Wait Until Page Contains Element    ${trade}    10
    Click Element    ${trade}
    Wait Until Page Contains Element    ${trade_active}    10
    Click Element    ${trade_active}
    Wait Until Page Contains Element    ${payments}    10
    Click Element    ${payments}
    Wait Until Page Contains Element    ${payments_active}    10
    Click Element    ${payments_active}
    Wait Until Page Contains Element    ${trading_information}    10
    Click Element    ${trading_information}
    Wait Until Page Contains Element    ${trading_information_active}    10
    Click Element    ${trading_information_active}
    Wait Until Page Contains Element    ${admin}    10
    Click Element    ${admin}
    Wait Until Page Contains Element    ${admin_active}    10
    Click Element    ${admin_active}

Check Create Token Error if Scope are EMPTY
    Wait Until Element Is Visible    ${token_name}    10
    Input Text    ${token_name}    validtoken
    Wait Until Element Is Visible    ${create_button_disabled}    10
    Page Should Contain Element    ${create_button_disabled}

Check Create Token Error if Token Name are EMPTY
    Wait Until Element Is Visible    ${token_name}    10
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Wait Until Element Is Visible    ${create_button_disabled}    10
    Page Should Contain Element    ${create_button_disabled}
    Wait Until Page Contains    Please enter a token name.    10

Check Create Token Error if contain INVALID characters
    Wait Until Element Is Visible    ${token_name}    10
    Input Text    ${token_name}    invalidtoke&^%$#
    Wait Until Element Is Visible    ${create_button_disabled}    10
    Page Should Contain Element    ${create_button_disabled}
    Wait Until Page Contains    Only letters, numbers, and underscores are allowed.
    Page Should Contain    Only letters, numbers, and underscores are allowed.

Check Create Token Error if Token Name < 2 Characters
    Wait Until Element Is Visible    ${token_name}    10
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    a
    Wait Until Element Is Visible    ${create_button_disabled}    10
    Page Should Contain Element    ${create_button_disabled}
    Wait Until Page Contains    Length of token name must be between 2 and 32 characters.
    Page Should Contain    Length of token name must be between 2 and 32 characters.

Check Create Token Error if Token Name > 32 Characters
    Wait Until Element Is Visible    ${token_name}    10
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    Wait Until Element Is Visible    ${create_button_disabled}    10
    Page Should Contain Element    ${create_button_disabled}
    Wait Until Page Contains    Maximum 32 characters.
    Page Should Contain    Maximum 32 characters.

Check Create Token Success if Input Valid
    Wait Until Page Contains Element    ${read}    10
    Click Element    ${read}
    Wait Until Element Is Visible    ${token_name}    10
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    validtokenname
    Wait Until Element Is Visible    ${create_button}    10
    Click Element    ${create_button}

Check Copy Token
    Wait Until Page Contains Element    ${copy_token}    10
    Scroll Element Into View    ${copy_token}
    Click Element    ${copy_token}

Check Show Token
    Wait Until Page Contains Element    ${show_token}    10
    Click Element    ${show_token}
    Wait Until Page Contains Element    ${token_visible}

Check Delete Token
    Wait Until Page Contains Element    ${delete_token}    10
    Click Element    ${delete_token}
    Wait Until Page Contains Element    ${confirm_delete_token}    10
    Click Element    ${confirm_delete_token}
    Sleep    5
    Page Should Not Contain Element    ${token_row}
