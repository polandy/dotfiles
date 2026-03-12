sketchybar -m --set disk_percentage label=$(df -lh / | awk 'NR==2 {print $5}')
