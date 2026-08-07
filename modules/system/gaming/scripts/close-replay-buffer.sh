#!/usr/bin/env bash

PID=$(pgrep -f "/.wrapped/gpu-screen-recorder")

if [ -n "$PID" ]; then
    kill -SIGINT "$PID"
    notify-send "GPU Screen Recorder" "Replay buffer stopped!"
fi
