# Ohjelmistotestaus 2024 -koulutus / Software Testing 2024 Training
#
# Robot Framework
# Tuntiesimerkki / Lesson Example
#
# Päivä / Day: 7.5.2024
#
# Projekti / Project: restful_booker_platform_testing
#
# Päivitetty / Updated: 7.12.2024
#
# Teemu Sipiläinen

*** Settings ***
Documentation     Testing Restful Booker Platform
Library           Browser
Resource          utils${/}browser_management.resource
Resource          pages${/}header.resource
Resource          pages${/}login_page.resource
Resource          pages${/}rooms_page.resource
Suite Setup       Open Browser And Login
Suite Teardown    Close Browser

*** Variables ***
${URL}              https://automationintesting.online/#/admin
${BRANDING_TEXT}    Shady Meadows B&B

*** Test Cases ***
Update Branding
    header.Navigate To Branding
    Verify Branding

Get Room Types
    header.Navigate To Rooms
    rooms_page.Select Room Type

*** Keywords ***
Open Browser And Login
    browser_management.Setup Browser    url=${URL}    headless=False
    login_page.Fill Login Form And Submit

Verify Branding
    Click    "Branding"
    # Sleep    1s
    ${branding} =    Get Text    id=name
    Should Be Equal    ${branding}    ${BRANDING_TEXT}

Close Browser
    Browser.Close Browser