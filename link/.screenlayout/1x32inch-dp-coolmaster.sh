#!/bin/sh
xrandr \
--output HDMI-0 --off \
--output DP-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal \
--output DP-2-1         --mode 1920x1200 --pos 3840x1465 --rotate normal \
--output DP-1 --off \
--output DP-2 --off \
--output DP-3 --off \
--output DP-4 --off \
--output DP-5 --off \
--output None-2-1 --off \
--output HDMI-1-1 --off \
--output DP-1-1 --off \
--output DP-2-1 --off \

echo $(date "+%Y-%m-%d %H:%M:%S") >> /tmp/display-debug.log

