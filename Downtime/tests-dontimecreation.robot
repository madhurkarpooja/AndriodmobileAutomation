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
${DIRECTION}    down    # Scroll direction (up, down, left, right)
${MINUTE_SEEK_BAR_XPATH}    xpath=//android.widget.SeekBar[contains(@content-desc, 'minute:')]  # Update to the correct XPath
# Example of getting the element by XPath
${MINUTE_SEEK_BAR}    Get WebElement    ${MINUTE_SEEK_BAR_XPATH}


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
    sleep  1
    Click Element    ${calender}
    Get Current and Target Time
    ${current_date}    ${current_time}    ${target_time}    Get Current And Target Time
    Log    Current Date: ${current_date}
    Log    Current Time: ${current_time}
    Log    Current Time: ${target_time}
    Click button  Next
    Wait Until Page Contains Element    accessibility_id=End_Hour_picker\n:\nEnd_Minute_picker
    # Locate the picker element
    ${element}=    Get Webelement    accessibility_id=End_Hour_picker\n:\nEnd_Minute_picker
    # Scroll the picker (custom swipe action)
    Scroll Vertically    ${element}    start=0.9    end=0.1
    Scroll Hour And Minute Picker    628    1687    645    1295
    sleep  3
    Click button  Done
    Click Element   ${downime}
    Wait Until Element Is Visible   //android.widget.ImageView[contains(@content-desc, "Downtime Created Successfully")]
    Click Element    ${view entries}
    Wait Until Element Is Visible   //android.view.View[contains(@content-desc, "IssueShutoff")]
    sleep  1
    Close Application












