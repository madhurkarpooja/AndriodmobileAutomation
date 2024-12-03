*** Variables ***
${PLATFORM_NAME}      Android
${DEVICE_NAME}        emulator-5554
${APP_PACKAGE}        com.manufapp.app
${APP_ACTIVITY}       .MainActivity   # Replace with the actual main activity if needed
${AUTOMATION_NAME}    UiAutomator2
${APPIUM_SERVER_URL}  http://127.0.0.1:4723/wd/hub
${loginbutton}  //android.widget.Button
${email}  android=new UiSelector().className("android.widget.EditText").instance(0)
${password}  //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]
${continue}  //android.view.View[@content-desc='Continue']
${right}  //android.widget.ImageView
${urlaws}  https://dev.manuf.app/
${emailweb}  //input[@id="mobileEmail"]
${passwordweb}  //input[@name = "password"]
${forgotPassword}  //button[text() = "Forgot password?"]
${signInweb}  //div[text() = "Sign In"]