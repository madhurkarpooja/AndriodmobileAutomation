from datetime import datetime, timedelta
from appium import webdriver
from robot.api.deco import keyword
import logging
from selenium.webdriver.common import desired_capabilities


def get_current_and_target_time():
    # Get current time
    now = datetime.now()

    # Format the current date to '27 Nov'
    current_date = now.strftime("%b %d")

    # Get the current time in 'HH:MM' format
    current_time = now.strftime("%H:%M")

    # Calculate the target time (5 minutes ahead) and format it in 'HH:MM'
    target_time = (now + timedelta(minutes=6)).strftime("%H:%M")

    # Log the current date
    logging.info(f"Current Date: {current_date}")

    # Return current date, current time, and target time
    return current_date, current_time, target_time


# Assuming Appium driver has already been initialized elsewhere in your code
@keyword
def scroll_hour_and_minute_picker(start_x, start_y, end_x, end_y):
    # Log to console
    print(f"Scrolling from ({start_x}, {start_y}) to ({end_x}, {end_y})")

    # Perform swipe action
    driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_capabilities)
    driver.swipe(start_x, start_y, end_x, end_y, 2000)