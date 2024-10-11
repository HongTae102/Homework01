*** Settings ***
Library            SeleniumLibrary
Library            OperatingSystem
Library            Collections
Library            String
Library            BuiltIn
Test Template      Login success

*** Test Cases ***
Example web app data driven success with standard    standard_user    secret_sauce
Example web app data driven success with proble    problem_user    secret_sauce
Example web app data driven success with performance    performance_glitch_user    secret_sauce

*** Keywords ***
Login success
    [Arguments]    ${username}    ${password}
    Open browser    https://www.saucedemo.com/v1/index.html    chrome
    Input Text    id="user-name"    ${username}
    Input Text    @id="password"     ${password}
    Click Element    id=login-button
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=30s
