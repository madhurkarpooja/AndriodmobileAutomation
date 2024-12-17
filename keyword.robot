*** Settings ***
#Library  SeleniumLibrary
Library  Collections
Resource  variable.robot
Library  AppiumLibrary     WITH NAME    A
Library  SeleniumLibrary   WITH NAME    S
Library  Collections

*** Keywords ***




Open ManufApp Application
    [Documentation]    This keyword opens the already installed ManufApp application.
    A.Open Application    ${APPIUM_SERVER_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}


Login ManufApp
     Open ManufApp Application
     sleep  1
     A.wait until element is visible    ${loginbutton}  timeout=60
     A.click element    ${loginbutton}
     A.wait until element is visible    ${email}  timeout=60
     A.Click Element    ${email}
     A.input text  ${email}  pooja_dev@testing.com
     A.wait until element is visible    ${password}  timeout=30
     A.Click Element    ${password}
     A.input password   ${password}  4652049559
     A.click element  ${right}
     A.click element  ${continue}
     A.Wait Until Element Is Visible    //android.widget.ImageView[@content-desc="testingsiteautomation"]  timeout=30


Get Element
    [Arguments]    ${locator}
    ${element}    Find Element    ${locator}
    RETURN    ${element}

login devsite on website
    S.open browser  ${urlaws}  chrome  #options=add_argument("--headless")
    S.maximize browser window
    sleep  1
    S.Wait Until Element Is Visible   ${emailweb}
    S.Input Text   ${emailweb}  pooja_dev@testing.com
    S.Input Text   ${passwordweb}  4652049559
    S.Click Element  ${signInweb}

Planning and scheduling
    sleep  1
    S.Click Element  //span[text()="Planning & Scheduling"]
    sleep  1
    S.Click Element   //a[@id="scheduling"]
    S.Reload Page
    sleep  2
    S.wait until page contains    Scheduling  timeout=60s
    S.Click Element   //h5[text()="Scheduling"]
    sleep  1

