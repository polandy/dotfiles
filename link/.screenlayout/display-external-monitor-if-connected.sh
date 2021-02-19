#!/usr/bin/env bash

set -e

if [ "$(hostname)" != "p50" ]; then
  echo "Script not executed on p50. Hostname: '$(hostname)'. Nothing to do."
  exit 0
fi

# This variables are used as keys in the associative arrays below
MONITOR_INTERNAL=INTERNAL
MONITOR_HDMI=HDMI
MONITOR_THUNDERBOLT=TB
MONITOR_DP=DP
# Screen names (use xrandr to get them)
SCREEN_DP=DP-3
SCREEN_HDMI=DP-1
SCREEN_TB=DP-5
SCREEN_INTERNAL=DP-4

# Default monitor is the internal monitor
MONITOR=$SCREEN_INTERNAL

# The configs for the displays are stored in the following associative arrays
declare -A monitor_screens
monitor_screens=([$MONITOR_INTERNAL]=$SCREEN_INTERNAL [$MONITOR_DP]=$SCREEN_DP [$MONITOR_HDMI]=$SCREEN_HDMI [$MONITOR_THUNDERBOLT]=$SCREEN_TB)

declare -A monitor_scripts
monitor_scripts=([$MONITOR_INTERNAL]="1xinternalScreen.sh" [$MONITOR_DP]="1x32inch-dp.sh" [$MONITOR_HDMI]="1x32inch-hdmi.sh" [$MONITOR_THUNDERBOLT]="1x32inch-hdmi-tb.sh")

declare -A xresources_files
xresources_files=([$MONITOR_INTERNAL]="Xresources-internal-display" [$MONITOR_DP]="Xresources-external-display" [$MONITOR_HDMI]="Xresources-external-display" [$MONITOR_THUNDERBOLT]="Xresources-external-display")

declare -A xrandr_dpis
xrandr_dpis=([$MONITOR_INTERNAL]="180" [$MONITOR_DP]="110" [$MONITOR_HDMI]="110" [$MONITOR_THUNDERBOLT]="110")

declare -A firefox_dpis
firefox_dpis=([$MONITOR_INTERNAL]="2.0" [$MONITOR_DP]="1.3" [$MONITOR_HDMI]="1.3" [$MONITOR_THUNDERBOLT]="1.3")

# Functions
function set_dpi_for_firefox {
   # set the 'layout.css.devPixelsPerPx' property in about:config
   # replaces the value in prefs.js
   echo "setting the value layout.css.devPixelsPerPx for Firefox to $1"
   sed -i "/layout.css.devPixelsPerPx/c\user_pref('layout.css.devPixelsPerPx', '$1');" $(find ~/.mozilla/firefox/ -maxdepth 2 -name "prefs.js" )
}

function do_activate_monitor {
    monitor_to_activate=$1
    xrandr_script="$HOME/.screenlayout/${monitor_scripts[$1]}"
    xresources_file="$HOME/.screenlayout/${xresources_files[$1]}"
    xrandr_dpi=${xrandr_dpis[$1]}
    firefox_dpi=${firefox_dpis[$1]}

    echo "Switching to $monitor_to_activate"
    echo "execute $xrandr_script"
    /bin/bash $xrandr_script
    echo "copy $xresources_file to $HOME/.Xresources for the Xft.dpi variable (used for xrvt etc...)"
    cp $xresources_file $HOME/.Xresources
    echo "set xrandr --dpi $xrandr_dpi, used by i3" 
    xrandr --dpi $xrandr_dpi
    echo "set firefox dpi to $firefox_dpi"
    set_dpi_for_firefox $firefox_dpi
    MONITOR=$monitor_to_activate
}

function is_monitor_active {
    [ $MONITOR == "$1" ]
}

function is_screen_connected {
    ! xrandr | grep "$1" | grep disconnected
}

# Iterate over all keys [HDMI, DP, TB INTERNAL]
for monitor in $MONITOR_DP $MONITOR_HDMI $MONITOR_THUNDERBOLT $MONITOR_INTERNAL; do
  echo "checking configured monitor $monitor (${monitor_screens[$monitor]})"
  if ! is_monitor_active $monitor && is_screen_connected "${monitor_screens[$monitor]}"
  then
    echo "$monitor (${monitor_screens[$monitor]}) is connected"
    do_activate_monitor $monitor
#   ~/.dotfiles/util/set-mouse-acceleration.sh
     break
  else
    printf "$monitor (${monitor_screens[$monitor]}) is not connected\n"
  fi
done

i3-msg reload
i3-msg restart

# xrdb -merge ~/.Xresources
