#!/bin/bash

# Set the time for the Pomodoro timer (in minutes)
pomodoro_time=25

# Set the break time (in minutes)
break_time=5

# Calculate the Pomodoro time in seconds
pomodoro_seconds=$((pomodoro_time * 60))

# Calculate the break time in seconds
break_seconds=$((break_time * 60))

# Function to display the time remaining
function display_time() {
    # Calculate the minutes and seconds remaining
    minutes=$((time_remaining / 60))
    seconds=$((time_remaining % 60))

    # Pad the seconds with a leading zero if necessary
    if [ $seconds -lt 10 ]; then
        seconds="0$seconds"
    fi

    # Display the time remaining
    Time="$minutes:$seconds\r"
    icon="file:///home/suno/Downloads/tomato-removebg-preview.png"

    dunstify -r 1001 -u normal -i "$icon" "Pomodoro" "$Time"


}

# Loop through the Pomodoro and break cycles
while true; do
    # Pomodoro cycle
    time_remaining=$pomodoro_seconds
    echo "Pomodoro cycle ($pomodoro_time minutes)"
    while [ $time_remaining -gt 0 ]; do
        display_time
        sleep 1
        time_remaining=$((time_remaining - 1))
    done
    echo -e "\a"
    
    # Break cycle
    time_remaining=$break_seconds
    echo "Break cycle ($break_time minutes)"
    while [ $time_remaining -gt 0 ]; do
        display_time
        sleep 1
        time_remaining=$((time_remaining - 1))
    done
    echo -e "\a"
done

