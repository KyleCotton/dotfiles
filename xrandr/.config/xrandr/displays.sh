#!/bin/sh


# Home Layout
# Layout with three displays, with the right display in portrait mode.
xrandr --output DP-0 --mode 1920x1080 --pos 4480x0 --rotate right --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-0 --mode 1920x1080 --pos 0x420 --rotate normal --output DP-4 --primary --mode 2560x1440 --pos 1920x240 --rotate normal --output DP-5 --off
