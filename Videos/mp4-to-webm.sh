#!/bin/bash
VIDEOS=./
find "$VIDEOS" -name '*.mp4' -exec sh -c 'ffmpeg -i "$0" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${0%%.mp4}.webm"' {} \;
exit;
