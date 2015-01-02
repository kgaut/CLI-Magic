#!/bin/bash
VIDEOS=./
find "$VIDEOS" -name '*.mp4' -exec sh -c 'ffmpeg -i "$0" -vframes 1 -map 0:v:0 "${0%%.mp4}.png"' {} \;
exit;
