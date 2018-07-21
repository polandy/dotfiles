#!/bin/sh
xrandr --output DP-6 --off \
       --output DP-5 --off \
       --output DP-4 --mode 3840x2160 --pos 0x1040 --rotate normal \
       --output DP-3 --mode 3840x2160 --pos 3840x0 --rotate normal \
       --output DP-2 --off \
       --output DP-1 --off \
       --output DP-0 --off
