#!/usr/bin/env sh

# Terminate already running bar instances
killall -q qobbar

# Wait until the processes have been shut down
while pgrep -u $UID -x qobbar >/dev/null; do sleep 1; done

# Launch qobbar
qobbar -r -c $1
