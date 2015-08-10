synclient PalmDetect=1
synclient TapButton3=3 TapButton2=2

## lightweight battery monitor
#$HOME/src/batmon/batmon &
## fonts (e.g. terminus)
#xset +fp /usr/share/fonts/local
#xset fp rehash

#$HOME/src/pomo/pomo.sh start
#$HOME/src/pomo/pomo.sh notify &

#devmon &

#mpd
#mpc stop

setxkbmap -layout gb
xmodmap -e 'remove mod5 = ISO_Level3_Shift'
xmodmap -e 'remove mod1 = Alt_L'
xmodmap -e 'add mod4 = Alt_L'
xmodmap -e 'add mod1 = ISO_Level3_Shift'
xmodmap -e 'add mod1 = Alt_R'

# Note: this leaves ssh-agent (and mpd) running after logout...
eval $(ssh-agent -t 3h)
eval $(gpg-agent --daemon)
xsetroot -cursor_name left_ptr
#feh --bg-scale /usr/share/archlinux/wallpaper/archlinux-firestarter.jpg
dunst &
sxhkd &
urxvtd -q -f -o
exec bspwm
