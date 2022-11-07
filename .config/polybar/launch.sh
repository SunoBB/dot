#!/bin/bash

#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "k10temp: Tctl" ]; then
        export HWMON_PATH="$i"
    fi
done

# for m in $(polybar --list-monitors | cut -d":" -f1); do
#     MONITOR=$m polybar --reload now-playing &
# done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload mainbar &
done

echo "Polybar launched..." &