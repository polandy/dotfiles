sketchybar -m --add item cpu_label right \
              --set cpu_label label.font="Hack Nerd Font:Bold:10.0" \
                               label=CPU \
                               y_offset=10 \
                               width=0 \
              --add item cpu_percentage right \
              --set cpu_percentage label.font="Hack Nerd Font:Bold:13.0" \
                                    y_offset=-4 \
                                    update_freq=1 \
                                    script="$CONFIG_DIR/plugins/cpu.sh"
