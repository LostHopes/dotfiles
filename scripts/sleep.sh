#!/usr/bin/env bash

seconds=$(zenity --title="Sleep" --width=300 --height=300 \
 --text="Enter time until sleep in seconds" --entry)

sleep $seconds && systemctl suspend