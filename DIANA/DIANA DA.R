# Perform divisive hierarchical clustering
diana_result <- diana(data_without_label[, 2:3])
plot(diana_result, main = "Divisive Hierarchical Clustering")