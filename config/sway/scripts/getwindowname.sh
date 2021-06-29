#!/bin/sh

swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused==true) | {app_id, class, name}' | sed -e '1d;$d' -e "s/^ *//" -e "s/: /:\t/" -e "s/\"\([^\"]*\)\"/\1/" | xargs -0 notify-send -t 10000 -i INFO "Window Information"
