# Load necessary libraries
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

# Load dataset (update the file path if needed)
data <- read.csv("C:/Users/draft/Downloads/speedvsdistance.csv", header = TRUE)

# Check column names
colnames(data)

# Rename columns if necessary (Ensure that "speed" and "distance" are the actual column names)
if (!all(c("speed", "distance") %in% colnames(data))) {
  colnames(data) <- c("speed", "distance")  # Adjust column names to match expected variable names
}

# Display summary statistics of the dataset
summary(data)

# Perform linear regression
speed.distance.lm <- lm(distance ~ speed, data)

# Display regression summary
summary(speed.distance.lm)

# Scatter plot of speed vs stopping distance
ggplot(data, aes(x = speed, y = distance)) +
  geom_point() +
  labs(title = "Stopping Distance vs Speed",
       x = "Speed (mph)",
       y = "Stopping Distance (feet)")

# Add regression line to the plot
speed.graph <- ggplot(data, aes(x = speed, y = distance)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Regression Analysis: Speed vs Stopping Distance",
       x = "Speed (mph)",
       y = "Stopping Distance (feet)")

# Display plot
print(speed.graph)

# Add regression equation to the plot
speed.graph <- speed.graph +
  ggpubr::stat_regline_equation(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~~")),
                                label.x = 10, label.y = 150)  # Adjust label position as needed

# Display the final plot with equation
print(speed.graph)

# Apply theme and final formatting
speed.graph <- speed.graph +
  theme_bw() +
  labs(title = "Stopping Distance vs Speed",
       x = "Speed (mph)",
       y = "Stopping Distance (feet)")

# Show the final graph
print(speed.graph)


