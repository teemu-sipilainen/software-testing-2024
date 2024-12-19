# Ohjelmistotestaus 2024 -koulutus / Software Testing 2024 Training
#
# Robot Framework
# Tuntiesimerkki / Lesson Example
#
# Päivä / Day: 7.5.2024
#
# Projekti / Project: restful_booker_platform_testing
#
# Päivitetty / Updated: 9.12.2024
#
# Teemu Sipiläinen

*** Settings ***
Library      Browser
Variables    locators${/}header.yaml

*** Keywords ***
Navigate To Branding
    Click    "Branding"

Navigate To Rooms
    Click    "Rooms"

Navigate To Report
    Click    "Report"

Navigate To Front Page
    Click    ${frontpage_link}

Navigate To Messages
    Click    ${messages_link}
