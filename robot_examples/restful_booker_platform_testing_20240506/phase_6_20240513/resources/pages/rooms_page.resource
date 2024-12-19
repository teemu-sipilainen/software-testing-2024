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
Library      Browser
Variables    locators${/}rooms_page.yaml

*** Keywords ***
Select Room Type
    ${type_options} =    Get Select Options    ${select_type}
    Log    ${type_options}

Add Room
    [Arguments]    ${type}=Single    ${accessible}=false
    Select Options By    ${select_type}    text    ${type}
    Select Options By    ${select_accessible}    text    ${accessible}
    Fill Text    data-testid=roomName    abc
    Fill Text    id=roomPrice    200
    Check Checkbox    id=wifiCheckbox
    Check Checkbox    id=radioCheckbox
    Check Checkbox    id=tvCheckbox
    Click    ${create_room}
