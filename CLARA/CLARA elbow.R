library(cluster)

calculate_avg_silhouette_clara <- function(data, k_values, samples) {
  avg_silhouette <- numeric(length(k_values))
  for (i in 1:length(k_values)) {
    k <- k_values[i]
    clara_result <- clara(data, k, samples = samples)
    avg_silhouette[i] <- clara_result$silinfo$avg.width
  }
  return(avg_silhouette)
}

k_values <- 2:10

samples <- 50

avg_silhouette_values_clara <- calculate_avg_silhouette_clara(data_without_label[, 2:3], k_values, samples)

plot(k_values, avg_silhouette_values_clara, type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters (k)", ylab = "Average Silhouette Width",
     main = "Elbow Curve for Optimal k (CLARA)")

elbow_point_clara <- k_values[which.max(avg_silhouette_values_clara)]
points(elbow_point_clara, avg_silhouette_values_clara[elbow_point_clara - min(k_values) + 1], col = "red", cex = 2, pch = 19)
text(elbow_point_clara, avg_silhouette_values_clara[elbow_point_clara - min(k_values) + 1], 
     labels = paste("Optimal k =", elbow_point_clara), pos = 4, col = "red")

k <- elbow_point_clara
