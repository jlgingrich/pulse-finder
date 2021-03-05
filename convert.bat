@echo off

mkdir frames

ffmpeg -i input.mp4 -r 30 -f image2 "frames/frame%%03d.jpeg"

echo "Done!"