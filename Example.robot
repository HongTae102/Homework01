*** Settings ***
Library            OperatingSystem
Library            Collections
Library            String
Test Template      example test keyword

*** Test Cases ***
Example keyword    standard_user    secret_sauce
    [Tags]    test1
    [Documentation]    ทำการ Login สำเร็จโดยใช้ username แบบธรรมดา

Example keyword1    performance_glitch_user    secret_sauce
    [Tags]    test2
    [Documentation]    ทำการ Login สำเร็จโดยใช้ username แบบโหลดหน้าเพจช้า

*** Keywords ***
example test keyword
    [Arguments]    ${username}    ${password}
    log    ${username}    console=True
    log    ${password}    console=true