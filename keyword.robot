*** Settings ***
#Library  SeleniumLibrary
Library  Collections
Resource  variable.robot
Library  AppiumLibrary


*** Keywords ***




Open ManufApp Application
    [Documentation]    This keyword opens the already installed ManufApp application.
    Open Application    ${APPIUM_SERVER_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}


Login ManufApp
     Open ManufApp Application
     click element    ${loginbutton}
     wait until element is visible    ${email}  timeout=60
     Click Element    ${email}
     input text  ${email}  pooja_dev@testing.com
     wait until element is visible    ${password}  timeout=30
     Click Element    ${password}
     input password   ${password}  4652049559
     click element  ${right}
     click element  ${continue}
     Wait Until Element Is Visible    //android.widget.ImageView[@content-desc="testingsiteautomation"]  timeout=30


Get Element
    [Arguments]    ${locator}
    ${element}    Find Element    ${locator}
    [Return]    ${element}

