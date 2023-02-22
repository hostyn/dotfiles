#!/bin/sh

# /etc/sddm.conf.d/monitors.sh

# Add your xrandr configuration here
xrandr --output DVI-D-0 --off --output HDMI-0 --mode 1920x1080 --pos 0x180 --rotate normal --output DP-0 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-1 --off
