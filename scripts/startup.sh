#!/bin/bash

unclutter --timeout 2 --ignore-scrolling --hide-on-key-press --jitter 10 &
xinput set-prop "DELL0A77:00 06CB:CE26 Touchpad" "libinput Natural Scrolling Enabled" 1 &
xinput set-prop "DELL0A77:00 06CB:CE26 Touchpad" "libinput Tapping Enabled" 1 &
setxkbmap -option grp:win_space_toggle us,ru
setxkbmap -option ctrl:swapcaps
picom -b &
