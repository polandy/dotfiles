#!/bin/bash

# Get a a list of all sinks
sinks=$(pactl list short sinks | cut -f 2)

for sink in $sinks; do
  cmd="pactl set-default-sink $sink; wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
  echo "executing: $cmd"
  eval $cmd
done
