install.packages("ISLR")
library(ISLR)
library(cluster)
library(ggplot2)
library(scales)
head(USArrests)
summary(USArrests)

set.seed(140) # Randomize for reproducibility

#nstart is the number of choices for initial centers to be used for the clusters
clusters <- kmeans(USArrests[, c("UrbanPop", "Rape")], centers = 2, iter.max = 1000, nstart = 50)

#this shows which state belongs to which cluster, Alabama to cluster 2, Connecticut to cluster 1
clusters

#clusters$cluster

# Cluster visualization (Unscaled)
plot(USArrests[c("UrbanPop", "Rape")], 
     col = clusters$cluster, main = "USArrests K-Means Clustering (UrbanPop & Rape)", 
     xlab = "Urban Population (%)", ylab = "Rape Arrests")

# Show cluster centers
print(clusters$centers)

#This gives the center values for cluster 1 and 2 for each variable
clusters$centers 
clusters$centers[, c("UrbanPop", "Rape")] 

# cex is font size, pch is symbol 
points(clusters$centers[, c("UrbanPop", "Rape")],  
       col = 1:2, pch = 4, cex = 3)


USArrests.scaled <- as.data.frame(apply(USArrests, MARGIN = 2, FUN = scale))
head(USArrests.scaled)
scaledClusters <- kmeans(USArrests.scaled, centers = 2, nstart = 50, iter.max = 5000)
scaledClusters
scaledClusters$cluster
USArrests.scaled[c("UrbanPop", "Rape")]
plot(USArrests.scaled[c("UrbanPop", "Rape")],  
     col = scaledClusters$cluster, main = "USArrests clusters, scaled") 

scaledClusters$centers 
scaledClusters$centers[, c("UrbanPop", "Rape")] 

# cex is font size, each is symbol 
points(scaledClusters$centers[, c("UrbanPop", "Rape")],  
       col = 1:2, pch = 4, cex = 3)

