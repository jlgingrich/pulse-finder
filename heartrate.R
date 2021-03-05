library(jpeg)
library(tidyverse)
library(pracma)

fileDirectory <- "frames"
n <- length(list.files(fileDirectory, "frame.*")) # Number of frames
r <- 30.0    # frame rate
df <- tibble(x = 1:n, rs = 0)

for (i in 1:n) {
  name <- sprintf(paste(fileDirectory, "/frame%03d.jpeg", sep = ""), i)
  frame <- readJPEG(name)
  rs <- frame[,,1] # Matrix of red values
  df[i,2] <- mean(rs)
}

peaks <- findpeaks(df$rs, minpeakdistance = 16)
df.peaks <- tibble(x = peaks[,2], y = peaks[,1])

c <- count(df.peaks)
deltapeaks <- max(df.peaks[,1]) - min(df.peaks[,1])
BPM <- (c / deltapeaks) * r * 60
print(paste("BPM:", BPM, "beats per minute"))

ggplot() +
  geom_point(data = df, aes(x, rs), color = "red") +
  geom_point(data = df.peaks, aes(x, y), color = "black", shape = 25, fill = "black", size = 4) + 
  labs(
    subtitle = "The black arrows mark heartbeats",
    x = "Frame",
    y = "Red Component"
  )
ggsave("peaks.jpg")