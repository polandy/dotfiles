#!/bin/bash

# Default monitor is the internal monitor
MONITOR=DP-4

# functions to switch from LVDS1 to VGA and vice versa
function ActivateDisplayPort {
    echo "Switching to DisplayPort"
    /bin/bash ~/.screenlayout/1x32inch.sh
    MONITOR=DISPLAYPORT
}
function DeactivateDisplayPort {
    echo "Switching to internal screen"
    /bin/bash ~/.screenlayout/1xinternalScreen.sh
    MONITOR=INTERNAL
}

# functions to check if VGA is connected and in use
function displayport_active {
    [ $MONITOR == "DISPLAYPORT" ]
}
function displayport_connected {
    ! xrandr | grep "DP-3" | grep disconnected
}

DeactivateDisplayPort
# ActivateDisplayPort


 if ! displayport_active && displayport_connected
 then
   ActivateDisplayPort
 else
   DeactivateDisplayPort
 fi
 
# 
# if displayport_active && ! displayport_connected
# then
#   DeactivateDisplayPort
# fi


# xrdb -merge ~/.Xresources
