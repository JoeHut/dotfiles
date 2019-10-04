#!/usr/bin/env bash

icon="$HOME/.config/i3/icon.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
luxafor-linux.py fade -l 255 -s 64 -b 255 -g 0 -r 0
i3lock -u -i "$tmpbg" --tiling --nofork &
local PID=$!
setpid $PID
sleep 1
wait
luxafor-linux.py fade -l 255 -s 64 -b 0 -g 255 -r 0
