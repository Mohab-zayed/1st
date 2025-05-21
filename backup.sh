#!/bin/bash

# Script: backup.sh
# Description: Backup a file or directory to a given destination.

SOURCE_PATH="$1"
DEST_PATH="$2"

# Check if both arguments are provided
if [[ -z "$SOURCE_PATH" || -z "$DEST_PATH" ]]; then
    echo "Usage: $0 <source_path> <destination_path>"
    exit 1
fi

# Check if source exists
if [[ ! -e "$SOURCE_PATH" ]]; then
    echo "Error: Source path '$SOURCE_PATH' does not exist."
    exit 2
fi

# Check if destination exists, if not try to create it
if [[ ! -d "$DEST_PATH" ]]; then
    echo "Destination path '$DEST_PATH' does not exist. Creating it..."
    mkdir -p "$DEST_PATH"
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to create destination directory."
        exit 3
    fi
fi

# Perform the backup
cp -a "$SOURCE_PATH" "$DEST_PATH/"
if [[ $? -eq 0 ]]; then
    echo "Backup completed successfully."
else
    echo "Error: Backup failed."
    exit 4
fi
