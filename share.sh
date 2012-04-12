#!/bin/bash

# Kill all subprocesses when this script is killed "ctrl-c"
trap 'kill $(jobs -p)' EXIT SGINT SIGTERM

# start local vnc
x11vnc -localhost -viewonly -clip xinerama0 -scale 1/2 -forever &

# forward outside port to inside
ssh -N -R 6080:localhost:6080 mexdev3 &

# start websocket proxy (https://github.com/kanaka/noVNC)
novnc 
