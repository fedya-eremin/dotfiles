#!/usr/bin/env bash


# Get current session name
session=$(tmux display-message -p '#S')

# Get list of windows in reverse order
windows=$(tmux list-windows -F '#{window_index}' | sort -nr)

# First move all windows to temporary higher numbers
for i in $windows; do
    tmux move-window -s "$session:$i" -t "$session:$(($i+100))"
done

# Then move them back in order starting from 1
windows=$(tmux list-windows -F '#{window_index}' | sort -n)
new_index=1
for i in $windows; do
    tmux move-window -s "$session:$i" -t "$session:$new_index"
    ((new_index++))
done
