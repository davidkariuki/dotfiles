#!/usr/bin/env zsh

if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

# Terminate already running bar instances
killall -q polybar

# Launch i3bar
echo "---" | tee -a /tmp/polybar.log

for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybar.log &
	disown
done
