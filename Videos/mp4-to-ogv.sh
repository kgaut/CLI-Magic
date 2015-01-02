#!/bin/bash
VIDEOS=./
find "$VIDEOS" -name '*.mp4' -exec sh -c 'ffmpeg -i "$0" -q 5 -pix_fmt yuv420p -acodec libvorbis -vcodec libtheora "${0%%.mp4}.ogv"' {} \;
exit;
