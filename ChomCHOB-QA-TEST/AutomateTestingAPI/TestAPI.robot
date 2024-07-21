*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${url}      https://reqres.in

*** Keywords ***
GET - All Users
    create session      mysession   ${url}      
    ${Response}     GET On Session     mysession   /api/users
    ${Status_code}      convert to string   ${Response.status_code}
    Log to Console      \n${Response}
    Should be equal     ${Status_code}   200
    ${alluser}   Get Value From Json    ${Response.json()}      $.data
    Log to Console  \nAll users : ${alluser}

GET - Users info
    create session      mysession   ${url}      
    ${Response}     GET On Session     mysession   /api/users/1
    ${Status_code}      convert to string   ${Response.status_code}
    Log to Console      \n${Response}
    Should be equal     ${Status_code}   200
    ${userinfo}   Get Value From Json    ${Response.json()}      $.data[:1]
    Log to Console  \nUser information : ${userinfo}
    
POST - Create User
    create session      mysession   ${url}      
    ${body}     Create Dictionary     name=Itthikorn    job=Quality Assurance
    ${header}   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${Response}     POST On Session     mysession   /api/users   data=${body}    headers=${header}
    ${Status_code}      convert to string   ${Response.status_code}
    Log to Console      \n${Response}
    Should be equal     ${Status_code}   201
    Log to Console      ${Response.json()}
    ${id}   Get From Dictionary    ${Response.json()}       id
    # Log to Console  id post = ${id}
    Set Global Variable     ${id}

PATCH - Update user
    create session      mysession   ${url}      
    ${body}     Create Dictionary     name=Danny   job=Quality Assurance 
    ${header}   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${Response}     PATCH On Session     mysession   /api/users/${id}   data=${body}    headers=${header}
    ${Status_code}      convert to string   ${Response.status_code}
    Log to Console      \n${Response}
    Should be equal     ${Status_code}   200
    Log to Console      ${Response.json()}
    # Log to Console      id patch = ${id}

DELETE - Delete user
    create session      mysession   ${url}      
    ${body}     Create Dictionary     name=Danny    job=Quality Assurance
    ${header}   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${Response}     Delete On Session     mysession   /api/users/${id}   data=${body}    headers=${header}
    ${Status_code}      convert to string   ${Response.status_code}
    Log to Console      \n${Response}
    Should be equal     ${Status_code}   204
    # Log to Console      id delete = ${id}


*** Test Cases ***
GET - All Users : Stattus 200
    GET - All Users 
GET - Users info : status 200
    GET - Users info 
POST - Create User : status 201
    POST - Create User 
PATCH - Update user : status 200
    PATCH - Update user
DELETE - Delete user : Status 204
    DELETE - Delete user



# GET - All Users : Stattus 200
#     ${Response}    GET    ${url-getallusers}
#     ${Status_code}      convert to string   ${Response.status_code}
#     Should be equal     ${Status_code}   200
#     Log to Console      \n[Status code :${Response.status_code}]
#     @{all-users}=         Get Value From Json     ${Response.json()}      $.data
#     Log to Console      \n@{all-users}
    # Log to Console    ${Response.json()}
    # @{count_id}=         Get Value From Json     ${Response.json()}            $.data[?@.id].id
    # # @{all-users}=         Get Value From Json     ${Response.json()}            $.data
    # # Log to Console  \n\n@{all-users}
    # ${length_id}         Get length          ${count_id}   
    # log to Console              ${length_id}
    # FOR  ${i}   IN RANGE   0   ${length_id}
    #     Log to Console  ${i}
    # END
    