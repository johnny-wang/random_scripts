#!/bin/bash 
#Author: Travis Gibson 
#This script requires an argument for the resolution width 
if [ -z "$1" ]; then
echo "Usage: Res.sh resolution_width";
exit 1;
fi

erg=$(echo $1)

#check=$(xrandr -q | grep DP-2 | cut -d " " -f 3 | cut -d "x" -f 1)
# This only works after the terminal is already up?
check=$(xrandr -q | grep DP-2 | cut -d " " -f 4 | cut -d "x" -f 1)

#check=$(xrandr -q | grep eDP-1 | cut -d " " -f 4 | cut -d "x" -f 1)

if [ "$erg" -eq "$check" ]; then
echo "The screen is already at this resolution" 
exit 1;
fi

resolution=$(xrandr -q | grep DP-2 | cut -d " " -f 3);
#resolution=$(xrandr -q | grep eDP-1 | cut -d " " -f 4);

if [ "$resolution" != "2880x1800+0+0" ]; then
#echo xrandr --output eDP-1 --scale 1x1;
echo xrandr --output DP-2 --scale 1x1;
xrandr --output DP-2 --scale 1x1; 
#xrandr --output eDP-1 --scale 1x1;
#Necessary to work around an issue where re-scaling 
#only works if the scale is set to 1x1 
sleep 3;
fi

scale_w=$(echo "scale=4; $1/2880" | bc; exit );
arg=$(echo "$scale_w""x""$scale_w")
xrandr --output DP-2 --scale $arg 
#xrandr --output eDP-1 --scale $arg
sleep 1;



