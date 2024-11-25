*** Settings ***
#Library  SeleniumLibrary
Library  Collections
Resource  ../variable.robot
Library  AppiumLibrary
Resource  ../keyword.robot
Resource  variable.robot
Resource  keyword.robot
Library    customekeyword-fetchdateandtime.py
Library    String
Library    DateTime
Library    BuiltIn


*** Variables ***
@{machienname}  Moulding Machine  M1  IssueShutoff


*** Test Cases ***
Downtime creation
    Login ManufApp
    Click Element   ${downtime}
    sleep  1
    Click Element At Coordinates    281    165
    Select Machine  ${machienname}[0]
    Click Element   ${downtimebutton}
    sleep  1
    Select Machine   ${machienname}[1]
    Click Element    ${continuebutton}
    sleep  1
    Wait Until Element Is Visible    //android.view.View[@content-desc="${machienname}[1]"]
    Click Element  ${labeldropdown}
    sleep  1
    Select Machine  ${machienname}[2]
    Click Element    ${calender}
    Get Current and Target Time
    ${current_date}    ${current_time}    ${target_time}    Get Current And Target Time
    Log    Current Date: ${current_date}
    Log    Current Time: ${current_time}
    Log    Target Time (5 mins later): ${target_time}
    ${time_difference} =    Calculate Time Difference    ${current_time}    ${target_time}
    Log    Time Difference: ${time_difference}
    Click button  Next
    ${position} =    Calculate Position    ${target_time}
    Scroll Seekbar By Position    ${position}
    Wait Until Element Is Visible  //android.widget.Button[@content-desc="5min"]
    Click button  Create Downtime










