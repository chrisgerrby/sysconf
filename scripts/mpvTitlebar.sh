#!/usr/bin/env bash

xdotool key alt+tab;
sleep 0.3
xdotool key y;
sleep 0.3
xclip -i;
sleep 0.3
mpv $(xclip -o);
