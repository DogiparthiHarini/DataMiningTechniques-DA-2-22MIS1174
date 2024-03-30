library(dbscan)

# Perform Chameleon clustering
chameleon_result <- dbscan(data_without_label[, 1:2], eps = 0.1, MinPts = 5)

# Plot clusters
plot(data_without_label[, 1:2], col = chameleon_result$cluster + 1, pch = 19, 
     main = "Chameleon Clustering", xlab = "X", ylab = "Y")

# Add legend
legend("topright", legend = c("Noise", unique(chameleon_result$cluster)), 
       col = c("black", rainbow(length(unique(chameleon_result$cluster)))), pch = 19, cex = 1, bty = "n")