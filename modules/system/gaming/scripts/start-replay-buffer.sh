#!/usr/bin/env bash

if pgrep -f gpu-screen-recorder >/dev/null; then
  notify-send "GPU Screen Recorder" "Replay buffer already running!"
  exit 0
fi

gpu-screen-recorder \
  -w "DP-3" \
  -f 60 \
  -b 7000 \
  -r 10 \
  -c mp4 \
  -a "default_output" \
  -o "$HOME/Videos/" &

notify-send "GPU Screen Recorder" "Replay buffer started"
