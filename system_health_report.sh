#!/bin/bash

# System Health Report Script
# Author: Your Name
# Description: Generates a system health report

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

echo "==========================================="
echo "System Health Report - $(hostname)"
echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
echo "==========================================="

echo ""
echo "Uptime:"
uptime -p

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "CPU Load:"
uptime | awk -F'load average:' '{ print $2 }'

echo ""
echo "Disk Usage:"
df -h --total | grep total

echo ""
echo "Logged-in Users:"
who | wc -l

echo ""
echo "Last Reboot:"
who -b

echo ""
echo "Active Services:"
systemctl list-units --type=service --state=running | head -n 10

echo ""
echo "Health check completed."
