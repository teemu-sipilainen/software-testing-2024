# Ohjelmistotestaus 2024 -koulutus / Software Testing 2024 Training
#
# Robot Framework
# Tuntiesimerkki / Lesson Example
#
# Päivä / Day: 6.5.2024
#
# Projekti / Project: demo_browser
#
# Päivitetty / Updated: 6.12.2024
#
# Teemu Sipiläinen

*** Settings ***
Documentation     A simple test suite for demonstrating the Browser library.
Library           Browser

*** Variables ***
${URL}            https://robotframework-browser.org/

*** Test Cases ***
Open and Check Page
    New Browser    chromium    headless=false
    New Context
    New Page
    Go To    ${URL}
    Get Title    ==    Browser Library
    Take Screenshot
    Close Browser