sketchybar -m --add item ram_label right \
              --set ram_label label.font="Hack Nerd Font:Bold:10.0" \
                               label=RAM \
                               y_offset=10 \
                               padding_right=10 \
                               width=0 \
              --add item ram_percentage right \
              --set ram_percentage label.font="Hack Nerd Font:Bold:13.0" \
                                    y_offset=-4 \
                                    update_freq=1 \
                                    script="$CONFIG_DIR/plugins/ram.sh"
