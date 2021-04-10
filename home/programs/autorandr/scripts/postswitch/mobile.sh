#!/bin/sh
killall -r .polybar.
polybar internal &
feh --bg-fill $HOME/.config/wallpapers/winter.j
