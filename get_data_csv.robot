*** Settings ***
Library        OperatingSystem
Library        Collections
Library        String
Library        CSVLibrary
Library        SeleniumLibrary
Variables      C:/Work/Python/data.yaml

*** Test Cases ***
Get csv testing
    ${CSV_FILE}    Set Variable    C:/Work/Python/Test_robot_csv.csv
    ${DATA_CSV}    Read Csv File To Associative    ${CSV_FILE}
    # Log To Console    ${DATA_CSV[1]}[password]
    FOR  ${row}  IN  @{DATA_CSV}
        Open browser chrome    ${url}    ${browser}
        Input username    ${row}[ï»¿username]
        Input password    ${row}[password]
        Click login
        Verify text products
    END
    
*** Keywords ***
Open browser chrome
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}

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