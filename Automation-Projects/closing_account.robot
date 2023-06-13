*** Settings ***
Documentation       single test for login

Resource            ../login.resource
Resource            closing_variables.resource
Library             SeleniumLibrary
Library             XML


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

Check going to Account Settings -> Close your account
    Wait Until Page Contains Element    ${account_settings}    10
    Click Element    ${account_settings}
    Wait Until Page Contains Element    ${closing_account_page}    10
    Click Element    ${closing_account_page}

Check Security Policy Link
    Wait Until Page Contains Element    ${security_policy_link}    10
    Click Element    ${security_policy_link}
    Switch Window    new
    Location Should Be    https://deriv.com/tnc/security-and-privacy.pdf
    Switch Window    main

Check Cancel Button on closing-account 1st page
    Wait Until Page Contains Element    ${cancel_button_1st_page}    10
    Click Element    ${cancel_button_1st_page}
    Location Should Be    https://app.deriv.com/
    Go To    https://app.deriv.com/account
    Wait Until Page Contains Element    ${closing_account_page}    10
    Click Element    ${closing_account_page}

Check Close My Account Button on closing-account 1st page
    Wait Until Page Contains Element    ${close_my_acc_button}    10
    Click Element    ${close_my_acc_button}

Check Back Button on closing-account 2nd page
    Wait Until Page Contains Element    ${back_button_2nd_page}    10
    Click Element    ${back_button_2nd_page}
    Wait Until Page Contains    If you close your account:
    Reload Page
    Wait Until Page Contains Element    ${close_my_acc_button}    10
    Click Element    ${close_my_acc_button}

Check Select/Unselect Checkboxes
    Wait Until Element Is Visible    ${cb_financial}    10
    Click Element    ${cb_financial}
    Click Element    ${cb_financial_active}
    Click Element    ${cb_stop}
    Click Element    ${cb_stop_active}
    Click Element    ${cb_not_int}
    Click Element    ${cb_not_int_active}
    Click Element    ${cb_another}
    Click Element    ${cb_another_active}
    Click Element    ${cb_not_user}
    Click Element    ${cb_not_user_active}
    Click Element    ${cb_difficult}
    Click Element    ${cb_difficult_active}
    Click Element    ${cb_lack}
    Click Element    ${cb_lack_active}
    Click Element    ${cb_unsatisfactory}
    Click Element    ${cb_unsatisfactory_active}
    Click Element    ${cb_other}
    Click Element    ${cb_other_active}

Check Checkboxes limit 3
    Click Element    ${cb_financial}
    Click Element    ${cb_stop}
    Click Element    ${cb_not_int}
    Wait Until Page Contains Element    ${cb_another_disabled}    20
    Page Should Contain Element    ${cb_another_disabled}
    Page Should Contain Element    ${cb_not_user_disabled}
    Page Should Contain Element    ${cb_difficult_disabled}
    Page Should Contain Element    ${cb_lack_disabled}
    Page Should Contain Element    ${cb_unsatisfactory_disabled}
    Page Should Contain Element    ${cb_other_disabled}

Check Continue button is disabled if user havent select at least one checkbox
    Click Element    ${cb_financial_active}
    Click Element    ${cb_stop_active}
    Click Element    ${cb_not_int_active}
    Wait Until Page Contains Element    ${cb_financial}    10
    Wait Until Page Contains Element    ${cb_stop}    10
    Wait Until Page Contains Element    ${cb_not_int}    10
    Wait Until Page Contains Element    ${cb_another}    10
    Wait Until Page Contains Element    ${cb_not_user}    10
    Wait Until Page Contains Element    ${cb_difficult}    10
    Wait Until Page Contains Element    ${cb_lack}    10
    Wait Until Page Contains Element    ${cb_unsatisfactory}    10
    Wait Until Page Contains Element    ${cb_other}    10
    Page Should Contain    Please select at least one reason
    Element Should Be Disabled    ${continue_button_2nd_page}

Check Both Text Field Placeholder
    ${placeholder_1}=    SeleniumLibrary.Get Element Attribute    ${text_field_1}    placeholder
    ${placeholder_2}=    SeleniumLibrary.Get Element Attribute    ${text_field_2}    placeholder
    Should Be Equal As Strings
    ...    ${placeholder_1}
    ...    If you don’t mind sharing, which other trading platforms do you use?
    Should Be Equal As Strings    ${placeholder_2}    What could we do to improve?

Check if user can Input into BOTH Text Field
    Input Text    ${text_field_1}    Hello
    Input Text    ${text_field_2}    World

Check for Invalid Characters (Symbols, etc)
    Click Element    ${cb_financial}
    Input Text    ${text_field_1}    !@#$%^&*
    Input Text    ${text_field_2}    !@#$%^&*
    Page Should Contain    Must be numbers, letters, and special characters . , ' -
    Element Should Be Disabled    ${continue_button_2nd_page}

Check Initial Character Count
    Press Keys    ${text_field_1}    CTRL+a+BACKSPACE
    Press Keys    ${text_field_2}    CTRL+a+BACKSPACE
    Element Should Contain    ${characters_count}    Remaining characters: 110

Check Character Count
    Input Text    ${text_field_1}    12345
    Element Should Contain    ${characters_count}    Remaining characters: 105
    Input Text    ${text_field_2}    12345
    Element Should Contain    ${characters_count}    Remaining characters: 100

Check if User is able to press the Continue button if all requirements are met
    Click Element    ${cb_another}
    Press Keys    ${text_field_1}    CTRL+a+BACKSPACE
    Press Keys    ${text_field_2}    CTRL+a+BACKSPACE
    Input Text    ${text_field_1}    Hello
    Input Text    ${text_field_2}    World
    Click Element    ${continue_button_2nd_page}

Check if Alert Pop-up Appear
    Wait Until Element Is Visible    ${pop_up}    20
    Page Should Contain Element    ${pop_up}

Check Go Back button inside Pop-up
    Wait Until Element Is Visible    ${pop_up_back}    20
    Click Element    ${pop_up_back}
    Page Should Not Contain    ${pop_up}

Check Close Account Button
    Wait Until Element Is Visible    ${continue_button_2nd_page}    20
    Click Element    ${continue_button_2nd_page}
    Wait Until Element Is Visible    ${pop_up_close_account}    20
    Click Element    ${pop_up_close_account}

Check Account Close Countdown Confirmation
    Wait Until Page Contains    We’re sorry to see you leave. Your account is now closed.    20
    Page Should Contain    We’re sorry to see you leave. Your account is now closed.


