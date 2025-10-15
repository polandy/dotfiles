sketchybar -m --add item network_up right \
              --set network_up label.font="Hack Nerd Font:Bold:10.0" \
                               icon.font="Hack Nerd Font:Bold:7.0" \
                               icon= \
                               icon.highlight_color=0xff8b0a0d \
                               y_offset=10 \
                               width=0 \
                               update_freq=1 \
                               script="$CONFIG_DIR/plugins/network.sh" \
              --add item network_down right \
              --set network_down label.font="Hack Nerd Font:Bold:10.0" \
                                 icon.font="Hack Nerd Font:Bold:7.0" \
                                 icon= \
                                 icon.highlight_color=0xff10528c \
                                 y_offset=-5 \
                                 update_freq=1
