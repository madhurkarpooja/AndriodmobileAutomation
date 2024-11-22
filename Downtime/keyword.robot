*** Settings ***
#Library  SeleniumLibrary
Library  Collections
Resource  ../variable.robot
Library  AppiumLibrary
Resource  variable.robot
Library    String
Library    DateTime
Library    BuiltIn


*** Keywords ***

Select Machine
    [Arguments]  ${machinename}
    Click Element    //android.view.View[@content-desc="${machinename}"]
    sleep  1



Click button
    [Arguments]  ${buttonname}
    Click Element    //android.widget.Button[@content-desc="${buttonname}"]

Calculate Position
    [Arguments]    ${target_time}
    ${hour}    ${minute} =    Split String    ${target_time}    :
    ${hour} =    Convert To Integer    ${hour}
    ${minute} =    Convert To Integer    ${minute}
    ${position} =    Evaluate    (${hour} * 100 / 24) + (${minute} * 100 / 1440)
    RETURN    ${position}


Scroll Seekbar By Position
    [Arguments]    ${position}
    ${start_x} =    Set Variable    500
    ${start_y} =    Set Variable    1500
    ${end_x} =      Set Variable    500
    ${end_y} =      Evaluate    ${start_y} - (${position} * 10)  # Adjust scaling factor as needed
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}

Calculate Time Difference
    [Arguments]    ${time1}    ${time2}
    ${datetime1} =    Convert Date    ${time1}    %H:%M
    ${datetime2} =    Convert Date    ${time2}    %H:%M
    ${time_delta} =    Subtract Date From Date    ${datetime1}    ${datetime2}
    [Return]    ${time_delta}