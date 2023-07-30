*** Settings ***
Library           SeleniumLibrary
*** Variables ***
${BROWSER}        chrome
${YOUTUBE_URL}    https://www.youtube.com

*** Test Cases ***
Search and Watch Video
    Open Browser    ${YOUTUBE_URL}    ${BROWSER}
    Input Text      name=search_query    chúng ta không thuộc về nhau
    Submit Form
    Wait Until Page Contains    chúng ta không thuộc về nhau
    Click First Video Link
    Maximize Browser Window
    Sleep   30s
    # Close Browser

*** Keywords ***
Click First Video Link
    ${video_links}    Get WebElements    xpath=//a[@id='video-title']
    Click Element    ${video_links}[1]  # Nhấp vào video đầu tiên (phần tử thứ 1 trong danh sách)