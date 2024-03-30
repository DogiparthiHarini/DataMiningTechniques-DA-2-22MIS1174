# Load the cluster package
library(cluster)

# Perform agglomerative hierarchical clustering
agnes_result <- agnes(data_without_label[, 2:3])

# Plot dendrogram
plot(agnes_result, main = "Agglomerative Hierarchical Clustering")

