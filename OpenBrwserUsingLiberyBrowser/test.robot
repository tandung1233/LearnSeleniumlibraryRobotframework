*** Settings ***
Library     Browser


*** Variables ***
${BROWSER}      Chromium
${url}          https://the-internet.herokuapp.com/login
${tandung}      https://the-internet.herokuapp.com/secure


*** Test Cases ***
Vald
    New Browser    browser=${BROWSER}    headless=false
    New Page    ${url}
    Type Text    id=username    tomsmith
    Type Text    id=password    SuperSecretPassword!
    Click    css=button >> text=login
    Sleep    4
