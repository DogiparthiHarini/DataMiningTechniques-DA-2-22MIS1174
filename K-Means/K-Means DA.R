library(cluster)

k <- 2
k_means_result <- kmeans(data_without_label, k)

x_range <- range(data_without_label[, 2])
y_range <- range(data_without_label[, 3])

x_padding <- (x_range[2] - x_range[1]) * 0.1
y_padding <- (y_range[2] - y_range[1]) * 0.1

xlim <- c(x_range[1] - x_padding, x_range[2] + x_padding)
ylim <- c(y_range[1] - y_padding, y_range[2] + y_padding)

col_names <- colnames(data_without_label)[2:3]

plot(k_means_result$centers[, 2:3], col = 1:k, pch = 8, cex = 2, main = "K-Means Cluster Centers",
     xlab = col_names[1], ylab = col_names[2], xlim = xlim, ylim = ylim)
points(data_without_label[, 2:3], col = k_means_result$cluster, pch = 19)

legend("topright", legend = paste("Cluster", 1:k), col = 1:k, pch = c(8, 19), cex = 1, bty = "n",
       title = "K-Means Cluster")