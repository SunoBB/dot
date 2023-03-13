#!/bin/bash

# Set the exam date (in yyyy-mm-dd format)
exam_date="2023-06-25"

# Convert the exam date to Unix timestamp
exam_timestamp=$(date -d "$exam_date" +%s)

# Loop until the exam date is reached
while [[ $(date +%s) -lt $exam_timestamp ]]; do
    # Calculate the remaining time
    remaining=$((exam_timestamp - $(date +%s)))
    
    # Calculate the number of days, hours, minutes, and seconds remaining
    days=$((remaining / 86400))
    hours=$((remaining / 3600 % 24))
    minutes=$((remaining / 60 % 60))
    seconds=$((remaining % 60))
    
    # Print the remaining time
    message="$days days, $hours:$minutes:$seconds"
    icon="file:///home/suno/Downloads/tomato-removebg-preview.png"
    
    dunstify -r 1001 -u normal -i "$icon" "THPT QG" "$message"
    # Wait for one second before updating the countdown
    sleep 1
done

# Print the final message
echo "Exam day has arrived!"

