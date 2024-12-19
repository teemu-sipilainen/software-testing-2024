# Ohjelmistotestaus 2024 -koulutus / Software Testing 2024 Training
#
# Robot Framework
# Tuntiesimerkki / Lesson Example
#
# Päivä / Day: 6.5.2024
#
# Projekti / Project: restful_booker_platform_testing
#
# Päivitetty / Updated: 7.12.2024
#
# Teemu Sipiläinen

*** Settings ***
Documentation     Testing Restful Booker Platform
Library           Browser
Suite Setup       Open Browser And Login
Suite Teardown    Close Browser

*** Variables ***
${URL}              https://automationintesting.online/#/admin
${login}            admin
${password}         password
${BRANDING_TEXT}    Shady Meadows B&B

*** Test Cases ***
Test1
    Verify Branding

*** Keywords ***
Open Browser And Login
    New Browser    chromium    headless=false    slowMo=0:00:01
    New Context
    New Page
    Go To    ${URL}
    Click    "Let me hack!"
    Fill Text    data-testid=username    ${login}
    Fill Secret    data-testid=password    $password
    Click    data-testid=submit

Verify Branding
    Click    "Branding"
    ${branding} =    Get Text    id=name
    Should Be Equal    ${branding}    ${BRANDING_TEXT}

Close Browser
    Browser.Close Browser