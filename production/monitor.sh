#!/bin/bash

# Define the URL of your application's health check endpoint (e.g., the index page)
APP_URL="http://localhost:5000/"
LOG_FILE="monitor.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Perform a curl request and check the exit code
if curl -s -o /dev/null -w "%{http_code}" "$APP_URL" | grep -q "200"; then
  STATUS="UP"
else
  STATUS="DOWN"
fi

# Log the timestamp and status to the log file
echo "$TIMESTAMP - Application Status: $STATUS" >> "$LOG_FILE"

echo "Current Application Status: $STATUS (logged to $LOG_FILE)"
