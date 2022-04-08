#!/bin/sh

sleep 1
/bin/sh -c 'while true; do kitty --class=org-mode aerc; notify-send "aerc quit!" "Status: "$?; done' &
/bin/sh -c 'while true; do kitty --class=org-mode calcurse; notify-send "calcurse quit!" "Status: "$?; done' &
/bin/sh -c 'while true; do kitty --class=comm-terminal weechat; notify-send "weechat quit!" "Status: "$?; done' &
