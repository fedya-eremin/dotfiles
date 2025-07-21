#!/bin/bash
layout=$(setxkbmap -query | awk '/layout/{print $2}')
echo "$layout"
echo "$layout"
echo "#E0C69F"
