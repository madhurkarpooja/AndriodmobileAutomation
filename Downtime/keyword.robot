*** Settings ***
#Library  SeleniumLibrary
Library  Collections
Resource  ../variable.robot
Library  AppiumLibrary
Resource  variable.robot
Library    String
Library    DateTime
Library    BuiltIn
Library  AppiumLibrary     WITH NAME    A
Library  SeleniumLibrary   WITH NAME    S

*** Variables ***
${START_X}    100   # Starting X coordinate (example)
${START_Y}    200   # Starting Y coordinate (example)
${SWIPE_LENGTH}    500  # The distance that the swipe should cover (you can adjust this based on your UI).

*** Keywords ***

Select Machine
    [Arguments]  ${machinename}
    A.Click Element    //android.view.View[@content-desc="${machinename}"]
    sleep  1



Click button
    [Arguments]  ${buttonname}
    A.Click Element    //android.widget.Button[@content-desc="${buttonname}"]

Scroll Vertically
    [Arguments]    ${element}    ${start}=0.9    ${end}=0.1
    ${bounds_str}=    AppiumLibrary.Get Element Attribute    ${element}    bounds
    ${bounds}=     Evaluate    [list(map(int, coord.split(','))) for coord in "${bounds_str}"[1:-1].split('][')]
    ${x_start}=    Evaluate    (${bounds}[0][0] + ${bounds}[1][0]) / 2
    ${y_start}=    Evaluate    ${bounds}[0][1] + (${start} * (${bounds}[1][1] - ${bounds}[0][1]))
    ${y_end}=      Evaluate    ${bounds}[0][1] + (${end} * (${bounds}[1][1] - ${bounds}[0][1]))
    AppiumLibrary.Swipe    ${x_start}    ${y_start}    ${x_start}    ${y_end}    2000

Scroll Hour And Minute Picker
    [Arguments]    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    Log To Console    Scrolling from (${start_x}, ${start_y}) to (${end_x}, ${end_y})
    AppiumLibrary.Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    2000

Get All Workorders IDs
    [Documentation]    Fetch all workorder IDs and return the latest one.
    ${elements} =    S.Get WebElements    xpath=//div[@data-task-id]
    # Initialize an empty list to store task IDs
    ${task_ids} =    Create List
    # Loop through each element to extract 'data-task-id' attribute
    FOR    ${element}    IN    @{elements}
        ${task_id} =    S.Get Element Attribute    ${element}    data-task-id
        Append To List    ${task_ids}    ${task_id}
    END
    # Check if the list is empty before proceeding
    Run Keyword If    len(${task_ids}) == 0    Log    No work orders found. Workorder might be deleted.
    Run Keyword If    len(${task_ids}) == 0    Return From Keyword
    ${latest_task_id} =    Set Variable    ${task_ids[-1]}
    Log    The latest data-task-id is: ${latest_task_id}
    RETURN    ${latest_task_id}


Get All Times
    [Arguments]    ${times}
    ${start_elements}=    S.Get WebElements    ${times}
    ${start_times}=    Create List
    FOR    ${element}    IN    @{start_elements}
        ${text}=    S.Get Text    ${element}
        ${time}=    Extract Time From Log    ${text}
        Append To List    ${start_times}    ${time}
    END
    Log    Only Times: ${start_times}
    RETURN    ${start_times}

Extract Time From Log
    [Arguments]    ${log_entry}
    ${time}=    Evaluate    '${log_entry}'.split()[-1]
    RETURN    ${time}






