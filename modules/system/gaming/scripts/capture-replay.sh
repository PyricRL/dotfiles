#!/usr/bin/env bash

PID=$(pgrep -f "/.wrapped/gpu-screen-recorder")

if [ -n "$PID" ]; then
    kill -SIGUSR1 "$PID"
    notify-send "GPU Screen Recorder" "Replay saved!"
else
    notify-send "GPU Screen Recorder" "Replay buffer not running!"
fi
