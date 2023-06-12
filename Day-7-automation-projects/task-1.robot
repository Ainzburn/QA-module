*** Settings ***
Documentation       Day 7 Automation Task 1

Library             SeleniumLibrary
Resource            ../login.resource


*** Variables ***
${account_real}     //span[@class="dc-text dc-dropdown__display-text" and @value="real"]
${account_demo}     //span[@class="dc-text dc-dropdown__display-text" and @value="demo"]
${demo}             //div[@id="demo"]
${dropdown}         //div[@id="dropdown-display"]


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

Check if user land on Real Account
    Wait Until Element Is Visible    ${account_real}    10

Check if user able to change to Demo Account
    Wait Until Page Contains Element    ${dropdown}    10
    Click Element    ${dropdown}
    Wait Until Element Is Visible    ${demo}    10
    Click Element    ${demo}

Check if user Account Type is Demo
    Wait Until Page Contains Element    ${account_demo}    10
