from datetime import datetime, timedelta

def get_current_and_target_time():
    now = datetime.now()
    current_date = now.strftime("%Y-%m-%d")
    current_time = now.strftime("%H:%M")
    target_time = (now + timedelta(minutes=5)).strftime("%H:%M")
    return current_date, current_time, target_time
