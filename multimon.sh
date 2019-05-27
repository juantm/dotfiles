#!/usr/bin/env bash

while read monitor; do
		print "Monitor: %s ", ${monitor}
		xrandr --output ${monitor} --off
done < $(xrandr --query|grep disconnected|awk '{print $1}')

