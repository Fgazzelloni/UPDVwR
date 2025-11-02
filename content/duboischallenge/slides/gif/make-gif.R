#################################
library(magick)
# Replace "image_paths" with a vector of paths to your images
## list file names and read in
imgs <- data.frame(plate=c("plate1","plate1_2","plate14","plate25","plate6","plate12","plate19"), 
                   url=c("https://raw.githubusercontent.com/Fgazzelloni/TidyTuesday/main/data/2021/w25_du_bois/w25_du_bois.png",
                         "https://raw.githubusercontent.com/Fgazzelloni/TidyTuesday/main/data/2022/w6_airforce/w6_airforce.png",
                         "https://raw.githubusercontent.com/Fgazzelloni/TidyTuesday/main/data/2022/w7_dubois/w7_number6.png",
                         "https://raw.githubusercontent.com/Fgazzelloni/30DayChartChallenge/main/data/Edition_2022/day3_historical/day3_historical.png",
                         "https://raw.githubusercontent.com/Fgazzelloni/DuboisChallenge2024_FG/main/2024/challenge01/challenge01.png",
                         "https://raw.githubusercontent.com/Fgazzelloni/DuboisChallenge2024_FG/main/2024/challenge02/challenge02.png",
                         "https://raw.githubusercontent.com/Fgazzelloni/DuboisChallenge2024_FG/main/2024/challenge03/challenge03.png"))

image_paths <- imgs$url

# Define the target width and height for resizing
target_width <- 800
target_height <- 600

# Resize each image to the target size
resized_images <- lapply(image_paths, function(path) {
  image_read(path) %>%
    image_scale(paste(target_width, "x", target_height, sep = ""))
})

img_joined <- image_join(resized_images)
img_animated <- image_animate(img_joined, fps = 2)
## save to disk
image_write(image = img_animated,
            path = "plates.gif")
