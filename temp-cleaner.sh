#!/bin/bash

# Temp Cleaner Script
# Author: Your Name
# Description: Cleans temporary files older than a specified number of days

# Default directory and days
TARGET_DIR="/tmp"
DAYS=7

# If user passed arguments, override defaults
if [ -n "$1" ]; then
  TARGET_DIR="$1"
fi

if [ -n "$2" ]; then
  DAYS="$2"
fi

# Check if directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory $TARGET_DIR does not exist."
  exit 1
fi

echo "Cleaning temporary files in $TARGET_DIR older than $DAYS days..."

# Find and delete files older than $DAYS
find "$TARGET_DIR" -type f -mtime +"$DAYS" -print -delete

echo "Cleanup completed."
