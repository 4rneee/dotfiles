#!/bin/bash
#
# This script lets you select a monitor layout with the help of dmenu
# the scripts of the monitor layouts must be in LAYOUT_PATH and end with .sh
#

LAYOUT_PATH=~/.screenlayout

# select layout             remove extention
LAYOUT=$(ls $LAYOUT_PATH | sed 's/\.[^.]*$//' | dmenu)

# set monitor layout and background
$LAYOUT_PATH/$LAYOUT.sh && ~/.fehbg

# restart polybar
# ~/.config/polybar/launch.sh

