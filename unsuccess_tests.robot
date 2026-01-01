*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      http://localhost:7272/StarterFiles/Registration.html
${BROWSER}  chrome

*** Test Cases ***
Empty First Name
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234

    Click Button    id=registerButton
    Page Should Contain    Please enter your first name!!
    Capture Page Screenshot
    [Teardown]    Close Browser
    Sleep    3s

Empty Last Name
    Open Browser    ${URL}    ${BROWSER}

    Input Text    id=firstname      Somyod

    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234

    Click Button    id=registerButton
    Page Should Contain    Please enter your last name!!
    Capture Page Screenshot
    [Teardown]    Close Browser
    Sleep    3s

Empty First Name and Last Name
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window


    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234
    Input Text    id=organization   CS KKU
    
    Click Button    id=registerButton
    Page Should Contain    Please enter your name!!
    Capture Page Screenshot
    [Teardown]    Close Browser
    Sleep    3s

Empty Email
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU

    Input Text    id=phone          091-001-1234
    Input Text    id=organization   CS KKU

    Click Button    id=registerButton
    Page Should Contain    Please enter your email!!
    Capture Page Screenshot
    [Teardown]    Close Browser
    Sleep    3s

Empty Phone Number
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=organization   CS KKU

    Click Button    id=registerButton
    Wait Until Page Contains    Please enter your phone number!!
    Capture Page Screenshot
    [Teardown]    Close Browser
    Sleep    3s
    
Invalid Phone Number
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=organization   CS KKU
    Input Text    id=phone          1234

    Click Button    id=registerButton
    Page Should Not Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
    Capture Page Screenshot
    [Teardown]    Close Browser
    Sleep    3s