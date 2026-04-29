#!/bin/sh
#
# Example polybar configuration:
#
# [module/zeit]
# type = custom/script
# exec = ~/.config/polybar/scripts/zeit.sh
# interval = 10
# click-left = ~/.config/polybar/scripts/zeit.sh click &
#

set -e

ZEIT_BIN=zeit
DMENU_PROGRAM=dmenu

set -e

as_hms() {
  local nanoseconds=$1

  seconds=$((nanoseconds / 1000000000))

  hours=$((seconds / 3600))

  minutes=$(((seconds % 3600) / 60))

  seconds_r=$((seconds % 60))

  printf "%02d:%02d:%02d" "$hours" "$minutes" "$seconds_r"
}

statusOut=$($ZEIT_BIN --format json)
for key in $(echo "$statusOut" | jq -r 'keys[]'); do
  value=$(echo "$statusOut" | jq -r ".${key}")
  export "$key"="$value"
done

if [[ "$1" == "click" ]]; then
  if [[ "$is_running" == "true" ]]; then
    $ZEIT_BIN end
    notify-send "Zeit" "Stopped tracking $project_sid/$task_sid"
    exit 0
  fi

  selection=$(zeit projects -f json |
    jq -r '.[] | .sid as $parent_sid | .tasks? // [] | .[] | "\($parent_sid)/\(.sid)"' |
    $DMENU_PROGRAM)

  project=$(printf "%s" "$selection" | cut -d '/' -f1)
  task=$(printf "%s" "$selection" | cut -d '/' -f2)

  if [[ "$task" == "" ]] || [[ "$project" == "" ]]; then
    exit 1
  fi

  $ZEIT_BIN start -p "$project" -t "$task"
  notify-send "Zeit" "Started tracking $project/$task"
  exit 0
fi

if [[ "$is_running" == "true" ]]; then
  timer_fmt=$(as_hms "$timer")
  echo "$timer_fmt $project_sid/$task_sid"
else
  echo ""
fi
