install.packages("ISLR")
library(ISLR)
library(scales)
library(cluster)
library(tidyverse)
library(factoextra)
head(USArrests)
summary(USArrests)
#The summary Clustering vector says to which cluster each data point belongs
#1 indicates it belongs to cluster 1, and 2 indicates that it belongs to cluster 2

set.seed(140) # Randomize for reproducibility
#Scale Data
scaledUSArrests <- scale(USArrests, center = TRUE, scale = TRUE)
dim(scaledUSArrests)
head(scaledUSArrests)
View (scaledUSArrests)
summary(scaledUSArrests)
# K-Means Clustering on Scaled Data
scaledClusters <- kmeans(scaledUSArrests, centers = 2, nstart = 50, iter.max = 5000)
scaledClusters
scaledClusters$cluster
scaledUSArrests[,c("UrbanPop", "Rape")]
plot(scaledUSArrests[,c("UrbanPop", "Rape")],  
     col = scaledClusters$cluster, main = "USArrests clusters, scaled") 

scaledClusters$centers 
scaledClusters$centers[, c("UrbanPop", "Rape")] 

# cex is font size, pch is symbol 
points(scaledClusters$centers[, c("UrbanPop", "Rape")],  
       col = 1:4, pch = 2, cex = 3)

#Visualization
fviz_cluster(scaledClusters, data = scaledUSArrests)
