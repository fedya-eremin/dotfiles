#!/bin/bash

IN_SCRATCHPAD=$(i3-msg -t get_tree | jq -e '
                .nodes[].nodes[].nodes[] 
                | select(.name == "__i3_scratch")
                | .floating_nodes[] 
                | select(.nodes[].window_properties.instance == "Telegram")
                | .nodes[]
                | select(.window_properties.instance == "Telegram")
                | .id ')

if [[ $IN_SCRATCHPAD ]] ; then
    i3-msg "[con_id=$IN_SCRATCHPAD] move to workspace current; focus"
else
    i3-msg "[con_id=$(i3-msg -t get_tree | jq -e '
                                        .nodes[].nodes[].nodes[]
                                        | .floating_nodes[] 
                                        | select(.nodes[].window_properties.instance == "Telegram") | .nodes[] | select(.window_properties.instance == "Telegram") | .id')] move scratchpad"
fi

