#!/bin/sh

# Set resolution -- arandr config
xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-0 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-1 --off --output DP1 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --mode 1920x1080 --pos 0x139 --rotate normal --output VIRTUAL1 --off &

# Disbable blanking
xset s noblank &
xset s off &

# Picom
picom --config $HOME/.config/qtile/config/picom.conf --experimental-backends &

# Background
feh --bg-fill /home/hostyn/Pictures/sunsetretro.jpg &

# systray volume
volumeicon &
udiskie -tna &

# polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &


