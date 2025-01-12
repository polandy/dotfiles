sketchybar -m --set disk_percentage label=$(df -lh | grep /dev/disk3s5 | awk '{ printf ("%02.0f\n", $5) }')%
