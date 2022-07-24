#!/usr/bin/env bash

xdotool click 3;
sleep 0.3
xdotool key c;
sleep 0.3
mpv $(xclip -o)
