k <- 2
clara_result <- clara(data_without_label, k, samples = 50)
clara_centers <- clara_result$medoids[, 2:3]
sample_indices_clara <- clara_result$sample
clara_sample_points <- data_without_label[sample_indices_clara, 2:3]

x_range <- range(clara_sample_points[, 1])
y_range <- range(clara_sample_points[, 2])

x_padding <- (x_range[2] - x_range[1]) * 0.1
y_padding <- (y_range[2] - y_range[1]) * 0.1

xlim <- c(x_range[1] - x_padding, x_range[2] + x_padding)
ylim <- c(y_range[1] - y_padding, y_range[2] + y_padding)

col_names <- colnames(data_without_label)[2:3]

plot(clara_centers, col = 1:k, pch = 8, cex = 2, main = "CLARA Cluster Centers",
     xlab = col_names[1], ylab = col_names[2], xlim = xlim, ylim = ylim)
points(clara_sample_points, col = clara_result$clustering[sample_indices_clara], pch = 19)

legend("topright", legend = paste("Cluster", 1:k), col = 1:k, pch = c(8, 19), cex = 1, bty = "n",
       title = "CLARA Cluster")