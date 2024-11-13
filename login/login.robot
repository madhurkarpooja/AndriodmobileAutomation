*** Settings ***
Library    AppiumLibrary
Resource  ../variable.robot
Resource  ../keyword.robot
Library  Collections

*** Variables ***


*** Test Cases ***

Login ManufApp
     Open ManufApp Application
     click element    ${loginbutton}
     wait until element is visible    ${email}  timeout=60
     Click Element    ${email}
     input text  ${email}  admin@smart.com
     wait until element is visible    ${password}  timeout=30
     Click Element    ${password}
     input password   ${password}  271828
     click element  ${right}
     click element  ${continue}
     Close Application