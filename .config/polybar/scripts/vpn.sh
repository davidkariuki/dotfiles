#!/bin/sh

status=$(nordvpn status | grep -i status | sed 's/.*:\s*//')

if [[ $status == "Connected" ]]; then
	echo 󰕥
else
	echo 󰦞
fi
