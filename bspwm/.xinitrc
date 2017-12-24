synclient PalmDetect=1
synclient TapButton3=3 TapButton2=2

## lightweight battery monitor
#$HOME/src/batmon/batmon &
## fonts (e.g. terminus)
#xset +fp /usr/share/fonts/local
#xset fp rehash
xset -b

#$HOME/src/pomo/pomo.sh start
#$HOME/src/pomo/pomo.sh notify &

#mpd
#mpc stop

setxkbmap -layout gb

xsetroot -cursor_name left_ptr
#dunst &
sxhkd &
urxvtd -q -f -o
exec bspwm
