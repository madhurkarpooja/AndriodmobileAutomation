*** Settings ***
#Library  SeleniumLibrary
Library  Collections
Resource  ../variable.robot
Library  AppiumLibrary
Resource  ../keyword.robot
Resource  variable.robot
Resource  keyword.robot


*** Keywords ***


*** Test Cases ***
Downtime creation
    Login ManufApp
    Click Element    ${downtime}
    sleep  1
    Click Element At Coordinates    281    165



