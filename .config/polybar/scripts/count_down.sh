#!/bin/bash

# Set the exam date (in yyyy-mm-dd format)
exam_date="2023-06-15"

# Convert the exam date to Unix timestamp
exam_timestamp=$(date -d "$exam_date" +%s)

# Loop until the exam date is reached
while [[ $(date +%s) -lt $exam_timestamp ]]; do
    # Calculate the remaining time
    remaining=$((exam_timestamp - $(date +%s)))
    
    # Calculate the number of days, hours, minutes, and seconds remaining
    days_remaining=$((remaining / 86400))
    hours_remaining=$((remaining / 3600 % 24))
    minutes_remaining=$((remaining / 60 % 60))
    seconds_remaining=$((remaining % 60))
    
    # Print the remaining time
    printf "Counting down to exam: %d days, %02d:%02d:%02d \r" "$days_remaining" "$hours_remaining" "$minutes_remaining" "$seconds_remaining"
    
    # Wait for one second before updating the countdown
    sleep 1
done

# Print the final message
echo "Exam day has arrived!"

