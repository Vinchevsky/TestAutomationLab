*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      http://localhost:7272/StarterFiles/Registration.html
${BROWSER}  chrome

*** Test Cases ***
Open Workshop Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Capture Page Screenshot
    [Teardown]    Close Browser
    Sleep    3s

Register Success
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234

    Click Button    id=registerButton
    Capture Page Screenshot
    [Teardown]    Close Browser
    Sleep    3s

Register Success No Organization Info
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai

    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234

    Click Button    id=registerButton
    Capture Page Screenshot
    [Teardown]    Close Browser
