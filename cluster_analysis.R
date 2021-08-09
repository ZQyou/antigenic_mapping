setwd(dirname(rstudioapi::getSourceEditorContext()$path))
csv_file <- "test.csv"
source("lib.R")
df <- read_csv(csv_file)
dist_matrix(df, distmethod="euclidean")
kcluster(df, center=2, nstart=25)
