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
Variables    locators${/}rooms_page.yaml

*** Keywords ***
Select Room Type
    ${type_options} =    Get Select Options    ${select_type}
    Log    ${type_options}