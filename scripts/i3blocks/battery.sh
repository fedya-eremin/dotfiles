#!/bin/bash
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$status" = "Charging" ]; then
    echo "charging $capacity%"
    echo "charging $capacity%"
else
    echo "bat $capacity%"
    echo "bat $capacity%"
fi
