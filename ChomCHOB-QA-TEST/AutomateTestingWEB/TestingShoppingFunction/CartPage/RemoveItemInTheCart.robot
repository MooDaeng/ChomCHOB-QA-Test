*** Variables ***
${countBooks-Element}   //*[@id="cart"]/div[2]/div
${txtemptycart}  //*[@id="top"]/main/div[1]/div[3]/div[1]/div/div/h2
${delete-button}    //*[@id="cart"]/div[2]/div[2]/div[5]/a
${confirm-delete-button}    //*[@id="top"]/div/div/div[3]/button[1]

*** Keywords ***
Delete all the books
    ${countBooks}   Get Element Count   ${countBooks-Element}
    FOR  ${j}  IN RANGE   2   ${countBooks}+1
         Click Element   ${delete-button}
         Wait Until Element Is Visible  ${confirm-delete-button}
         Click Element  ${confirm-delete-button}
         Sleep  3s
    END

Verify empty cart
    Wait Until Element Is Visible   ${txtemptycart}
    Element Text Should Be   ${txtemptycart}     ยังไม่มีรายการสินค้าในตะกร้า โปรดสั่งซื้อสินค้า