# set keyboardlayout
# list all the layouts: localectl list-x11-keymap-layouts
setxkbmap us

# set the dpi for high resolution display
if ! xrandr | grep -q "180"; then
  xrandr --dpi 180
fi
