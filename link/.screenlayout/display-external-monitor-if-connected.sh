#!/bin/bash

set -e 

MONITOR_INTERNAL=INTERNAL
MONITOR_HDMI=HDMI
MONITOR_DP=DP

SCREEN_DP=DP-3
SCREEN_HDMI=DP-1
SCREEN_INTERNAL=DP-4
# Default monitor is the internal monitor
MONITOR=$SCREEN_INTERNAL

declare -A monitor_screen
monitor_screen=([$MONITOR_INTERNAL]="DP-4" [$MONITOR_DP]="DP-3" [$MONITOR_HDMI]="DP-1")

declare -A monitor_script
monitor_script=([$MONITOR_INTERNAL]="1xinternalScreen.sh" [$MONITOR_DP]="1x32inch-dp.sh" [$MONITOR_HDMI]="1x32inch-hdmi.sh")

declare -A xresources_files
xresources_files=([$MONITOR_INTERNAL]="Xresources-internal-display" [$MONITOR_DP]="Xresources-external-display" [$MONITOR_HDMI]="Xresources-external-display")

declare -A xrandr_dpis
xrandr_dpis=([$MONITOR_INTERNAL]="180" [$MONITOR_DP]="110" [$MONITOR_HDMI]="110")

declare -A firefox_dpis
firefox_dpis=([$MONITOR_INTERNAL]="2.0" [$MONITOR_DP]="1.3" [$MONITOR_HDMI]="1.3")

function set_dpi_for_firefox {
   # set the 'layout.css.devPixelsPerPx' property in about:config
   # replaces the value in prefs.js
   echo "setting the value layout.css.devPixelsPerPx for Firefox to $1"
   sed -i "/layout.css.devPixelsPerPx/c\user_pref('layout.css.devPixelsPerPx', '$1');" $(find ~/.mozilla/firefox/ -maxdepth 2 -name "prefs.js" )
}

function ActivateExternalMonitor {
    monitor_to_activate=$1
    xrandr_script="$HOME/.screenlayout/${monitor_script[$1]}"
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

#Iterate over all keys [HDMI, DP, INTERNAL]
for monitor in "${!monitor_screen[@]}"; do
  echo "checking configured monitor $monitor (${monitor_screen[$monitor]})"
  if ! is_monitor_active $monitor && is_screen_connected "${monitor_screen[$monitor]}"
  then
    echo "$monitor (${monitor_screen[$monitor]}) is connected"
    ActivateExternalMonitor $monitor
    break
  else
    printf "$monitor (${monitor_screen[$monitor]}) is not connected\n"
  fi
done

# if ! displayport_active && displayport_connected
# then
#   ActivateDisplayPort
#   ~/.dotfiles/util/set-mouse-acceleration.sh
# else
#   DeactivateDisplayPort
# fi
# 
# i3-msg reload
# i3-msg restart

# 
# if displayport_active && ! displayport_connected
# then
#   DeactivateDisplayPort
# fi


# xrdb -merge ~/.Xresources
