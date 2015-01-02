#!/bin/bash
VIDEOS=./
find "$VIDEOS" -name '*.mp4' -exec sh -c 'ffmpeg -i "$0" -vframes 1 -map 0:v:0 "${0%%.mp4}.png"' {} \;
find "$VIDEOS" -name '*.mp4' -exec sh -c 'ffmpeg -i "$0" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${0%%.mp4}.webm"' {} \;
find "$VIDEOS" -name '*.mp4' -exec sh -c 'ffmpeg -i "$0" -q 5 -pix_fmt yuv420p -acodec libvorbis -vcodec libtheora "${0%%.mp4}.ogv"' {} \;
exit;
