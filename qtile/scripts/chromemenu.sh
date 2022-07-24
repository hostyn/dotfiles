#!/bin/bash

icon="\0icon\x1fgoogle-chrome\n"
hostyn96="Hostyn96"
inothy="Inothy"
r3="R3"
ua="UA"

options="\x20$hostyn96$icon $inothy$icon $r3$icon $ua$icon"

chosen=$(echo -en $options | rofi -dmenu -p "" -l 4 -i)

[[ "$chosen" =~ "$hostyn96" ]] && google-chrome-stable --profile-directory="Default" --force-dark-mode && exit 0
[[ "$chosen" =~ "$inothy" ]] && google-chrome-stable --profile-directory="Profile 3" --force-dark-mode && exit 0
[[ "$chosen" =~ "$r3" ]] && google-chrome-stable --profile-directory="Profile 2" --force-dark-mode && exit 0
[[ "$chosen" =~ "$ua" ]] && google-chrome-stable --profile-directory="Profile 1" --force-dark-mode && exit 0

exit 1

