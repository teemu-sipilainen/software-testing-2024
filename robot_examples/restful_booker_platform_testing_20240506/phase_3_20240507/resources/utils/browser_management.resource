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
Library    Browser

*** Keywords ***
Setup Browser
    [Arguments]    ${browser}=chromium    ${headless}=true    ${slowMo}=0:00:00.5
    ...    ${viewport}={"width": 1366, "height": 768}    ${url}=https://automationintesting.online/#/admin
    New Browser    browser=${browser}    headless=${headless}    slowMo=${slowMo}
    New Context    viewport=${viewport}
    New Page    url=${url}