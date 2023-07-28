*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.facebook.com
${BROWSER}    Chrome

*** Test Cases ***
Login to Facebook
    Open Browser    ${URL}    ${BROWSER}
    Input Text    name=email    your_facebook_email@example.com
    Input Text    name=pass     your_facebook_password
    Click Button    name=login
    Close Browser