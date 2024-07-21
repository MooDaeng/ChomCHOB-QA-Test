*** Settings ***
Resource     ../GobalKeywords.robot
Resource     ../TestingShoppingFunction/CartPage/GotoCart.robot
Resource     ../TestingShoppingFunction/CartPage/RemoveItemInTheCart.robot
Resource     ../TestingShoppingFunction/CartoonMenu/ShoppingInOnTheCartoonMenu.robot

*** Test Cases ***
เปิด browser และไปที่ Link https://www.nejavu.com
    Start to open browser 
ตรวจสอบ Banner Pop-up
    Verify Banner Pop-up
Click menu "การ์ตูน"
    Go to Cartoon Menu
Get ชื่อหนังสือทุกเล่มไหนแถวที่หนึ่ง
    Get books name
กดปุ่ม "ใส่ตะกร้า" หนังสือทุกเล่มแถวที่หนึ่ง
    add a book to cart
กดปุ่ม "รถเข็น / ตระกร้า"
    Go to Cart
verify ชื่อหนังสือทุกเล่ม ที่อยู่ในตระกร้า โดยใช้ชื่อที่มาได้มาจากข้อที่แล้ว
    Verify all the books
ลบหนังสือทุกเล่มที่อยู่ในตระกร้า
    Delete all the books
Verify bagde บนรถเข็นว่าเหลือหนังสือ = 0
    Verify empty cart