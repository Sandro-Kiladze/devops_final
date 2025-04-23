#!/bin/bash

APP_URL="http://localhost:5000/"
LOG_FILE="monitor.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

if curl -s -o /dev/null -w "%{http_code}" "$APP_URL" | grep -q "200"; then
  STATUS="UP"
else
  STATUS="DOWN"
fi

echo "$TIMESTAMP - Application Status: $STATUS" >> "$LOG_FILE"

echo "Current Application Status: $STATUS (logged to $LOG_FILE)"
