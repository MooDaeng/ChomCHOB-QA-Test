*** Variables ***
${Cart-button}      //*[@id="top"]/main/div[1]/div[1]/div/div/div[2]/div/div[4]/ul/li[2]/div

*** Keywords ***
Go to Cart
    Sleep  2s
    Click Element   ${Cart-button}
