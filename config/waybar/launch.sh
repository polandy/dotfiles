#!/usr/bin/env bash

# Terminate already running bar instances
killall -q waybar

# Launch bar1 and bar2
#waybar -c ~/.dotfiles/config/waybar-hypr/config 2>&1 | tee -a /tmp/waybar.log &
waybar  2>&1 | tee -a /tmp/waybar.log &
disown

echo "Bars launched..."
