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
Library      utils${/}env_lib.py
Variables    locators${/}login_page.yaml

*** Keywords ***
Fill Login Form And Submit
    Click          ${close_banner}
    Fill Text      ${username_input}    %{RBP_USERNAME}
    Fill Secret    ${password_input}    %RBP_PASSWORD
    Click          ${login_button}