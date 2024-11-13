*** Settings ***
#Library  SeleniumLibrary
Library  Collections
Resource  variable.robot
Library  AppiumLibrary


*** Keywords ***




Open ManufApp Application
    [Documentation]    This keyword opens the already installed ManufApp application.
    Open Application    ${APPIUM_SERVER_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}