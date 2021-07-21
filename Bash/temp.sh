#!/bin/bash
# Shows you your CPU temp
temp=$(sensors | grep "Tdie" | sed "s/Tdie: *+//;s/Â°C *//")
echo "$temp"
