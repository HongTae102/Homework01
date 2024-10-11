*** Settings ***
Library            SeleniumLibrary
Library            OperatingSystem
Library            Collections
Library            String
Library            BuiltIn
Variables          C:/Work/Python/data.yaml

*** Test Cases ***
Open website testing
    Open browser chrome    ${url}    ${browser}
    Input username    ${username.standard.user}
    Input password    ${username.standard.password}
    Click login
    Verify text products


*** Keywords ***
Open browser chrome
    [Arguments]    ${url}    ${browser}
    Open Browser         ${url}    ${browser}

Input username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}

Input password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]     ${password}

Click login
    Click Button    //*[@id="login-button"]

Verify text products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=30s