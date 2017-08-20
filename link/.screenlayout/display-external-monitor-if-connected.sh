#!/bin/bash

# SCREEN_DP=DP-3
# SCREEN_HDMI=DP-1
# SCREEN_INTERNAL=DP-4
# Default monitor is the internal monitor
MONITOR=DP-4

function set_dpi_for_firefox {
   # set the 'layout.css.devPixelsPerPx' property in about:config
   # replaces the value in prefs.js
   echo "setting the value layout.css.devPixelsPerPx for Firefox to $1"
   sed -i "/layout.css.devPixelsPerPx/c\user_pref('layout.css.devPixelsPerPx', '$1');" $(find ~/.mozilla/firefox/ -maxdepth 2 -name "prefs.js" )
}

function ActivateDisplayPort {
    echo "Switching to DisplayPort"
    /bin/bash ~/.screenlayout/1x32inch-dp.sh
    # set correct .Xresources for the Xft.dpi variable (used for xrvt etc...)
    cp ~/.screenlayout/Xresources-external-display ~/.Xresources
    # set the dpi using xrandr (used by i3)
    xrandr --dpi 110
    set_dpi_for_firefox 1.3
    MONITOR=DISPLAYPORT
}

function DeactivateDisplayPort {
    echo "Switching to internal screen"
    /bin/bash ~/.screenlayout/1xinternalScreen.sh
    # set correct .Xresources for the Xft.dpi variable (used for xrvt etc...)
    rm ~/.Xresources
    cp ~/.screenlayout/Xresources-internal-display ~/.Xresources
    # set the dpi using xrandr (used by i3)
    xrandr --dpi 180
    set_dpi_for_firefox 2.0
    MONITOR=INTERNAL
}

# functions to check if HDMI is connected and in use
function hdmi_active {
    [ $MONITOR == "HDMI" ]
}

function hdmi_connected {
    ! xrandr | grep "DP-1" | grep disconnected
}

# functions to check if DISPLAYPORT is connected and in use
function displayport_active {
    [ $MONITOR == "DISPLAYPORT" ]
}

function displayport_connected {
    ! xrandr | grep "DP-3" | grep disconnected
}


if ! displayport_active && displayport_connected
then
  ActivateDisplayPort
  ~/.dotfiles/util/set-mouse-acceleration.sh
else
  DeactivateDisplayPort
fi

i3-msg reload
i3-msg restart

# 
# if displayport_active && ! displayport_connected
# then
#   DeactivateDisplayPort
# fi


# xrdb -merge ~/.Xresources
