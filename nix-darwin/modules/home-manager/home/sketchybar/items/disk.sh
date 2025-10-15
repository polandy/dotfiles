sketchybar -m --add item disk_label right \
              --set disk_label label.font="Hack Nerd Font:Bold:10.0" \
                               label=DISK \
                               y_offset=10 \
                               width=0 \
              --add item disk_percentage right \
              --set disk_percentage label.font="Hack Nerd Font:Bold:13.0" \
                                    y_offset=-4 \
                                    update_freq=1 \
                                    script="$CONFIG_DIR/plugins/disk.sh"
