sketchybar -m --set cpu_percentage label=$(ps -A -o %cpu | awk '{s+=$1} END {print s "%"}')
