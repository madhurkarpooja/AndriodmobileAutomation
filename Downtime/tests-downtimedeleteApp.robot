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
Library  AppiumLibrary     WITH NAME    A
Library  SeleniumLibrary   WITH NAME    S


*** Variables ***
@{machienname}  Moulding Machine  M1  IssueShutoff
${DIRECTION}    down    # Scroll direction (up, down, left, right)
${MINUTE_SEEK_BAR_XPATH}    xpath=//android.widget.SeekBar[contains(@content-desc, 'minute:')]  # Update to the correct XPath
# Example of getting the element by XPath
${MINUTE_SEEK_BAR}    Get WebElement    ${MINUTE_SEEK_BAR_XPATH}



*** Test Cases ***
Downtime creation on App
    Login ManufApp
    A.Click Element   ${downtime}
    sleep  1
    A.Click Element At Coordinates    141    88
    Select Machine  ${machienname}[0]
    A.Click Element   ${downtimebutton}
    sleep  1
    Select Machine   ${machienname}[1]
    A.Click Element    ${continuebutton}
    sleep  1
    A.Wait Until Element Is Visible    //android.view.View[@content-desc="${machienname}[1]"]
    A.Click Element  ${labeldropdown}
    sleep  1
    Select Machine  ${machienname}[2]
    sleep  2
    A.Click Element    ${calender}
    Get Current and Target Time
    ${current_date}    ${current_time}    ${target_time}    Get Current And Target Time
    Log    Current Date: ${current_date}
    Log    Current Time: ${current_time}
    Log    Current Time: ${target_time}
    Click button  Next
    A.Wait Until Page Contains Element    accessibility_id=End_Hour_picker\n:\nEnd_Minute_picker
    # Locate the picker element
    ${element}=    A.Get Webelement    accessibility_id=End_Hour_picker\n:\nEnd_Minute_picker
    # Scroll the picker (custom swipe action)
    Scroll Vertically    ${element}    start=0.9    end=0.1
    Scroll Hour And Minute Picker    413    1125    411    914
    sleep  3
    Click button  Done
    A.Click Element   ${downime}
    A.Wait Until Element Is Visible   //android.widget.ImageView[contains(@content-desc, "Downtime Created Successfully")]
    A.Click Element    ${view entries}
    A.Wait Until Element Is Visible   //android.view.View[contains(@content-desc, "IssueShutoff")]
    sleep  1
    

    #Login on Website and Validation is Downtime created from App is visible on Website
    sleep  1
    login devsite on website
    sleep  1
    Planning and scheduling
    reload page
    sleep  2
    ${newly_downtime_id}=    Get All Workorders IDs
    sleep  1
    ${today}=    Get Date With Ordinal
    Log    Today's date: ${today}
    ${xpath}=    Set Variable    //div[@role="button" ]//div[text()="${today}"]
    S.Wait Until Element Is Visible    ${xpath}    timeout=10
    S.Click Element    ${xpath}
    S.Click Element  //div[@data-task-id="${newly_downtime_id}"]
    sleep  2
    #fetch the Timings of downtime
    ${starttimeslog}=  get all times  ${starttime}
    Log    All times: ${starttimeslog}
    ${ENDtimeslog}=  get all times  ${endtime}
    Log    All times: ${ENDtimeslog}
    # validations
    Should Contain    ${starttimeslog}    ${current_time}
    #Should Contain    ${ENDtimeslog}    ${target_time}
    Close Browser

#Login through App and delete the Downtime
    sleep  2
    A.Click Element    //android.view.View[starts-with(@content-desc, "01")]
    sleep  1
    A.Click Element    ${deletebutton}
    Select Machine  Delete
    A.Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="Downtime Deleted Successfully It’ll reflect on dashboard in sometime"]    30s
    sleep  1
    A.Click Element    ${view entries}
    sleep  1
    A.Wait Until Page Does Not Contain   //android.view.View[contains(@content-desc, "00 IssueShutoff ${current_date}, ${current_time}")]

























*** Keywords ***
