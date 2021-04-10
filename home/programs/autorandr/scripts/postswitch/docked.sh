#!/bin/sh
killall -r .polybar.
polybar external &
feh --bg-fill $HOME/.config/wallpapers/winter.jpg
