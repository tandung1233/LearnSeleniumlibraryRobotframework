*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
First Test
    Open browser    https://google.com    chrome
    Sleep    3s
    Close Browser
