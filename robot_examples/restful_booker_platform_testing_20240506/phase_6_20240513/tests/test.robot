# Ohjelmistotestaus 2024 -koulutus / Software Testing 2024 Training
#
# Robot Framework
# Tuntiesimerkki / Lesson Example
#
# Päivä / Day: 13.5.2024
#
# Projekti / Project: restful_booker_platform_testing
#
# Päivitetty / Updated: 10.12.2024
#
# Teemu Sipiläinen

*** Settings ***
Documentation     Testing Restful Booker Platform
Library           Browser
Library           utils${/}generate_id.py
Resource          utils${/}browser_management.resource
Resource          pages${/}login_page.resource
Resource          pages${/}header.resource
# Resource          pages${/}branding_page.resource
Resource          pages${/}rooms_page.resource
Resource          pages${/}frontpage.resource
Suite Setup       Open Browser And Login
Suite Teardown    Close Browser

*** Variables ***
${URL}              https://automationintesting.online/#/admin
${BRANDING_TEXT}    Shady Meadows B&B

*** Test Cases ***
Messages Should Appear In Admin Panel
    [Documentation]    Toteuta testi palvelun etusivulta lähetettyjen viestin näkymiselle admin-paneelissa (lähetä viesti etusivulta ja varmista, että se näkyy admin-paneelissa)
    [Tags]    Message
    ${SUBJECT_ID}    Generate Unique Id
    header.Navigate To Front Page
    frontpage.Submit Message Form    test_id=${SUBJECT_ID}
    frontpage.Navigate To Admin Panel
    header.Navigate To Messages
    ${element} =    Browser.Get Element    text=${SUBJECT_ID}
    Log    ${element}

Removed Room Should Not Be Visible In Admin Panel
    [Documentation]    Toteuta testi huoneen poistamiselle ja varmista, että huone ei näy enää admin-paneelissa.
    [Tags]    Room
    header.Navigate To Rooms
    ${count} =    Get Element Count    .roomDelete
    WHILE    ${count} > 0
        @{rooms_to_delete} =    Get Elements    .roomDelete
        ${index}    Evaluate    ${count} - 1
        Click    ${rooms_to_delete}[${index}]
        Sleep    1s
        ${count} =    Get Element Count    .roomDelete
    END
    Get Element Count    .roomDelete    ==    0

Created Room Should Appear In Admin Panel
    [Documentation]    Toteuta testi uuden huoneen lisäämiselle ja varmista, että huone näkyy admin-paneelissa
    [Tags]    Room
    header.Navigate To Rooms
    rooms_page.Add Room    type=Twin    accessible=true
    Sleep    1s
    Get Element States    .roomDelete    contains    visible

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