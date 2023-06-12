#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bars if 
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if [[ $(polybar -m | grep eDP1) ]]; then
    polybar eDP1 2>&1 | tee -a /tmp/polybar-edp1.log & disown
fi
if [[ $(polybar -m | grep HDMI1) ]]; then
    polybar HDMI1 2>&1 | tee -a /tmp/polybar-hdmi1.log & disown
fi
if [[ $(polybar -m | grep HDMI2) ]]; then
     polybar HDMI2 2>&1 | tee -a /tmp/polybar-hdmi2.log & disown
fi
if [[ $(polybar -m | grep DP1) ]]; then
    polybar DP1 2>&1 | tee -a /tmp/polybar-dpi1.log & disown
fi

