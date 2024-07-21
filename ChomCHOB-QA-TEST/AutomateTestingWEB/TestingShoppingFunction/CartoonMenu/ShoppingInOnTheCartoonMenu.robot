*** Variables ***
${cartoon-menu}     //*[@id="top"]/main/div[1]/div[2]/div[2]/div[2]/nav/div/ul/li[3]/a
${books-name-element}     //*[@id="top"]/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[${replacestr}]/div/div[2]/a[1]/h5
${books-name-verify-element}       //*[@id="cart"]/div[2]/div[${replacestr}]/div[1]/div/div[2]/p[1]/strong
${addtocart-button}      //html/body/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[${replacestr}]/div/div[3]/div[2]

*** Keywords ***
Go to Cartoon Menu
    Accept the cookie button
    #Go to Menu Cartoon
    Click Element   ${cartoon-menu}

Get books name
    ${BookNames}=    Create List
    FOR  ${i}  IN RANGE   1   6
         ${j}    Convert To String    ${i}
         ${re-books-name-element} =      Replace String       ${books-name-element}    replacestr       ${j}
         #Log to Console    re-books-name-element = ${re-books-name-element}
         ${BookName}    Get Text    ${re-books-name-element}
         Append To List    ${BookNames}    ${BookName}
         #Log To Console  The book number ${i} name = ${BookName}
         #${re-addtocart-button} =      Replace String       ${addtocart-button}    replacestr       ${j}
         #Click Element   ${re-addtocart-button}
         #Sleep  1.5s
    END
    Set Global Variable    ${BookNames}

add a book to cart
    FOR  ${i}  IN RANGE   1   6
         ${j}    Convert To String    ${i}
         ${re-addtocart-button} =      Replace String       ${addtocart-button}    replacestr       ${j}
         Click Element   ${re-addtocart-button}
         Sleep  1.5s
    END

Verify all the books
    ${BookNames-Verify}=    Create List
    FOR  ${i}  IN RANGE   2   7
         ${j}    Convert To String    ${i}
         ${re-books-name-verify-element} =      Replace String       ${books-name-verify-element}    replacestr       ${j}
         ${BookName-Verify}    Get Text    ${re-books-name-verify-element}
         Append To List    ${BookNames-Verify}    ${BookName-Verify}
         #Log To Console  The book number ${j} name -Verify- = ${name-Verify}
         #Log to Console  ${BookNames}[${j-2}] ---- ${BookNames-Verify}[${j-2}]
         Should Be Equal    ${BookNames}[${i-2}]   ${BookNames-Verify}[${i-2}]
    END

