xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

udiskie -aT &
# exec openbox-session
exec dbus-launch i3 --force-xinerama -V >> ~/.i3/i3log 2>&1

