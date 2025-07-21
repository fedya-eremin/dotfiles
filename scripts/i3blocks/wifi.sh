#!/bin/bash

# Get WiFi info
wifi_info=$(nmcli -t -f active,ssid dev wifi | grep '^yes')
if [ -n "$wifi_info" ]; then
    ssid=$(echo "$wifi_info" | cut -d':' -f2)
    strength=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d':' -f2)
    ip=$(ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' || echo "no IP")
    
    echo "$ssid ($strength%) $ip"
    echo "$ssid ($strength%) $ip"
else
    echo "disconnected"
    echo "disconnected"
    echo "#707880"
fi

case $BLOCK_BUTTON in
    1) nmtui ;;                     # left click: open nmtui
    2) nm-connection-editor & ;;    # middle click: connection editor
    3) nm-applet & ;;               # right click: open network manager applet
esac
