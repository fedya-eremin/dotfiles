#!/bin/bash

IN_SCRATCHPAD=$(i3-msg -t get_tree | jq -e --arg instance "$1" '
                  .nodes[].nodes[].nodes[]
                  | select(.output == "__i3")
                  | .floating_nodes[]
                  | select(.nodes[].window_properties.instance == $instance)
                  | .nodes[] 
                  |.id')

if [[ $IN_SCRATCHPAD ]] ; then
    i3-msg "[con_id=$IN_SCRATCHPAD] scratchpad show"
else
    i3-msg "[con_id=$(i3-msg -t get_tree | jq -e --arg instance "$1" '
            .nodes[].nodes[].nodes[]
            | select(.output == "eDP")
            | .floating_nodes[] 
            | select(.nodes[].window_properties.instance == $instance)
            | .nodes[]
            | .id')] move scratchpad"
fi
