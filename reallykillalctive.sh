#!/bin/bash

if [[ $(hyprctl activewindow -j | jq -r '.class') =~ (kitty) ]]; then
    kill $(hyprctl activewindow -j | jq '.pid') -s 9
else
    hyprctl dispatch killactive
fi
