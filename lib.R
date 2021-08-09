# Reference
# https://uc-r.github.io/kmeans_clustering
# https://www.datanovia.com/en/blog/cluster-analysis-in-r-simplified-and-enhanced/

library(tidyr)		# data manipulation
library(factoextra)	# clustering algorithms & visualization

read_csv <- function(csv_file){
  cat("\n>>> Reading the data <<<<\n")
  data <- read.csv(csv_file, header=TRUE)

  df <- spread(data, Antibody, Weight)
  row.names(df) <- df$Antigen
  df <- df[,-1]
  print(head(df))
  return(df)
}

# Distance matrix computation and visualization
dist_matrix <- function(df, distmethod="euclidean"){
  cat("\n>>>> Computing distance matrix <<<<\n")
  distance <- get_dist(df, distmethod)
  fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))
}

# K-means clustering
kcluster <- function(df,center=2, nstart=25){
  cat("\n>>>> Computing k-means clustering <<<<\n")
  k2 <- kmeans(df, center, nstart)
  print(k2)
  fviz_cluster(k2, data = df, main="K-means clustering")
}
