# Pulse Finder

An R script that finds a person's pulse given just an image of their thumb over the camera lens.

## Running the Program

Place your thumb over the front or rear camera on your webcam or smartphone and record a 10-second long video. Name this file `input.mp4` and place it in the same directory as the R script file. Running `convert.bat` processes the video into frames, placing them in the `frames/` directory. The batch file requires `ffmpeg` to run, which can be downloaded from [here](https://ffmpeg.org/download.html#build-windows).

Now run `heartrate.R` using RStudio. The program will produce a file called `peaks.jpg`, which is a graph of the red component in the frames over time and identifies the pulse that R is tracking. The program will also output the BPM, which should be reasonably close to the heartrate of the person who took the video.

This process works because of the miniscule change in color of our skin as our heart pumps, which is barely detectable to the naked eye, but can be detected and amplified by a computer. For a visual example of the same principle, watch [this](https://www.youtube.com/watch?v=e9ASH8IBJ2U) video.
