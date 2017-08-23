#!/bin/bash

# Get a a list of all sinks
sinks=$(pacmd list-sinks | grep index | cut -d':' -f2 | cut -d' ' -f2)

for sink in $sinks; do
  cmd="pactl set-sink-volume $sink -5%"
  echo "executing: $cmd"
  eval $cmd
done
