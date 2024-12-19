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
Library    Browser

*** Keywords ***
Submit Message Form
    [Arguments]    ${test_id}
    Fill Text      data-testid=ContactName           Test User
    Fill Text      data-testid=ContactEmail          some_email@email.com
    Fill Text      data-testid=ContactPhone          0123456789123
    Fill Text      data-testid=ContactSubject        ${test_id}
    Fill Text      data-testid=ContactDescription    This is a test message - ID: ${test_id}
    Click          id=submitContact

Navigate To Admin Panel
    # TS 9.12.2024: Tämä toimii Internet-sivulla
    Click    //*[@id="footer"]/div/p/a[4]
    # TS 9.12.2024: Tämä toimii localhostissa
    # Click    //*[@id="footer"]/div/p/a[5]