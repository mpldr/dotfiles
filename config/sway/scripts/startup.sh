#!/bin/sh

ydotool key alt+2
sleep 0.1
ydotool key alt+left
sleep 0.1
ydotool key alt+8
sleep 0.2
kitty --class=org-mode aerc &
sleep 0.1
kitty --class=org-mode calcurse &
