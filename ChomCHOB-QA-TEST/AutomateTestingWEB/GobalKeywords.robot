*** Settings ***
Documentation     every library will be here
Library           SeleniumLibrary   run_on_failure=None
Library           String
Library           Collections
Library           BuiltIn

*** Variables ***
${BROWSER}  chrome  
${URL}  http://www.nejavu.com
${replacestr}    replacestr
${cookie-button}    //*[@id="top"]/main/div[4]/div/small/small/div/div[1]/button
${close-popup-button}   //*[@id="top"]/main/div[2]/div[1]/a

*** Keywords ***
Start to open browser    
    Open Browser   about:blank   ${BROWSER}  #options=add_experimental_option("detach", True)
    Maximize Browser Window
    Go to          ${URL}
    Wait For Condition	return document.readyState == "complete"

Verify Banner Pop-up
    #verify pop-up and Close it
    ${popup-status}     Run Keyword And Return Status   Wait Until Element Is Visible  ${close-popup-button} 
    Run Keyword If    '${popup-status}'=='True'   Click Element   ${close-popup-button} 

Accept the cookie button
    ${cookie-status}     Run Keyword And Return Status   Wait Until Element Is Visible    ${cookie-button}
    Run Keyword If    '${cookie-status}'=='True'     Click Element   ${cookie-button}
    Wait Until Element Is Not Visible   ${cookie-button}
