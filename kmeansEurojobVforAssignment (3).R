#This example uses Euro jobs that describes the percent of employment per sector
#agriculture, mining, manufacturing,power supply, construction, services,
#finance, personal services and transportation
install.packages("ISLR")
library(ISLR)
library(cluster)
Eurojobs <- read.csv(
  file = "https://statsandr.com/blog/data/Eurojobs.csv",
  sep = ",", dec = ".", header = TRUE
)
head(Eurojobs) # head() is used to display only the first 6 observations

#remove column1
Eurojobs <- read.csv(
  file = "https://statsandr.com/blog/data/Eurojobs.csv",
  sep = ",", dec = ".", header = TRUE, row.names = 1
)
head(Eurojobs)
summary(Eurojobs)

set.seed(140) # Randomize for reproducibility



Eurojobs.scaled <- as.data.frame(apply(Eurojobs, MARGIN = 2, FUN = scale))
#head(Eurojobss.scaled)
scaledClusters <- kmeans(Eurojobs.scaled, centers = 2, nstart = 50, iter.max = 5000)
scaledClusters
scaledClusters$cluster
Eurojobs.scaled[c("Man", "SPS")]
plot(Eurojobs.scaled[c("Man", "SPS")],  
     col = scaledClusters$cluster, main = "Eurojobs clusters, scaled") 

scaledClusters$centers 
scaledClusters$centers[, c("Man", "SPS")] 

# cex is font size, pch is symbol 
points(scaledClusters$centers[, c("Man", "SPS")],  
       col = 1:2, pch = 4, cex = 3)
library(factoextra)
library(NbClust)
library(cluster)
km_res <- kmeans(Eurojobs, centers = 2, nstart = 20)

fviz_cluster(km_res, Eurojobs, ellipse.type = "norm")

