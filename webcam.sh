#!/bin/bash

# ffplay -window_title Webcam -fast /dev/video0
# ffplay -window_title Webcam -f v4l2 -framedrop -fflags nobuffer -flags low_delay -probesize 32 -analyzeduration 0 /dev/video0
mpv --title="Webcam" --vf=hflip --no-cache --untimed --profile=low-latency --demuxer-lavf-format=v4l2 /dev/video0
