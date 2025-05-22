#!/bin/bash

SOURCE="/var/www/html"
DEST="/backup/$(date +%F)"
LOG="/var/log/backup.log"

mkdir -p "$DEST"
tar -czf "$DEST/backup.tar.gz" "$SOURCE" >> "$LOG" 2>&1

if [ $? -eq 0 ]; then
    echo "$(date): Backup successful" >> "$LOG"
else
    echo "$(date): Backup FAILED" >> "$LOG"
fi
