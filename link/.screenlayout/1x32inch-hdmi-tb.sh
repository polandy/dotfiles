#!/bin/sh
xrandr --output DP-6 --off \
       --output DP-1 --off \
       --output DP-4 --off \
       --output DP-5 --mode 3840x2160 --pos 0x0 --rotate normal --primary \
       --output DP-2 --off \
       --output DP-3 --off \
       --output DP-0 --off
