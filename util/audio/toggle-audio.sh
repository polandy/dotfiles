#!/bin/bash

# Get a a list of all sinks
sinks=$(pactl list short sinks | cut -f 2)

for sink in $sinks; do
  cmd="pactl set-default-sink $sink; wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  echo "executing: $cmd"
  eval $cmd
done
