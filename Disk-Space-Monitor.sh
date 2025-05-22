#!/bin/bash

THRESHOLD=80
EMAIL="admin@example.com"

USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo " Warning: Disk usage is at ${USAGE}% on root partition!" | mail -s "Disk Space Alert " "$EMAIL"
fi
