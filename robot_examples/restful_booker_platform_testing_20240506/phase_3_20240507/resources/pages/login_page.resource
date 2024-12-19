# Ohjelmistotestaus 2024 -koulutus / Software Testing 2024 Training
#
# Robot Framework
# Tuntiesimerkki / Lesson Example
#
# Päivä / Day: 7.5.2024
#
# Projekti / Project: restful_booker_platform_testing
#
# Päivitetty / Updated: 8.12.2024
#
# Teemu Sipiläinen

*** Settings ***
Library    Browser
Library    utils${/}env_lib.py

*** Keywords ***
Fill Login Form And Submit
    Click    "Let me hack!"
    Fill Text    data-testid=username    %{RBP_USERNAME}
    Fill Secret    data-testid=password    %RBP_PASSWORD
    Click    data-testid=submit