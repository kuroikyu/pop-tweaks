#!/bin/bash

# Function to get the default sink number
get_default_sink() {
  wpctl status | grep -A 4 'Sinks' | grep 'PCM2704 16-bit stereo audio DAC Analog Stereo' | awk '{print $2}' | cut -d'.' -f1 | head -n 1
}

# Get the default sink number
sink_number=$(get_default_sink)

# Set the default sink
if [[ -n "$sink_number" ]]; then
  wpctl set-default "$sink_number"
  echo "Default sink set to $sink_number"
else
  echo "Could not find the 'PCM2704 16-bit stereo audio DAC Analog Stereo' device."
fi