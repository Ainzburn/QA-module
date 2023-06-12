*** Settings ***
Documentation       single test for login

Library             SeleniumLibrary


*** Variables ***
${email}        haziq+1@besquare.com.my
${password}     iLove3334
${demo}         //div[@id="demo"]
${dropdown}     //div[@id="dropdown-display"]


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
