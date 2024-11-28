*** Settings ***
#Library  SeleniumLibrary
Library  Collections
Resource  ../variable.robot
Library  AppiumLibrary
Resource  variable.robot
Library    String
Library    DateTime
Library    BuiltIn

*** Variables ***
${START_X}    100   # Starting X coordinate (example)
${START_Y}    200   # Starting Y coordinate (example)
${SWIPE_LENGTH}    500  # The distance that the swipe should cover (you can adjust this based on your UI).

*** Keywords ***

Select Machine
    [Arguments]  ${machinename}
    Click Element    //android.view.View[@content-desc="${machinename}"]
    sleep  1



Click button
    [Arguments]  ${buttonname}
    Click Element    //android.widget.Button[@content-desc="${buttonname}"]

Scroll Vertically
    [Arguments]    ${element}    ${start}=0.9    ${end}=0.1
    ${bounds_str}=    AppiumLibrary.Get Element Attribute    ${element}    bounds
    ${bounds}=    Evaluate    [list(map(int, coord.split(','))) for coord in "${bounds_str}"[1:-1].split('][')]
    ${x_start}=    Evaluate    (${bounds}[0][0] + ${bounds}[1][0]) / 2
    ${y_start}=    Evaluate    ${bounds}[0][1] + (${start} * (${bounds}[1][1] - ${bounds}[0][1]))
    ${y_end}=      Evaluate    ${bounds}[0][1] + (${end} * (${bounds}[1][1] - ${bounds}[0][1]))
    AppiumLibrary.Swipe    ${x_start}    ${y_start}    ${x_start}    ${y_end}    2000

Scroll Hour And Minute Picker
    [Arguments]    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    Log To Console    Scrolling from (${start_x}, ${start_y}) to (${end_x}, ${end_y})
    AppiumLibrary.Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    2000







