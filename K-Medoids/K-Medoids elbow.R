library(cluster)

calculate_avg_silhouette <- function(data, k_values) {
  avg_silhouette <- numeric(length(k_values))
  for (i in 1:length(k_values)) {
    k <- k_values[i]
    pam_result <- pam(data, k)
    avg_silhouette[i] <- pam_result$silinfo$avg.width
  }
  return(avg_silhouette)
}

k_values <- 2:10

avg_silhouette_values <- calculate_avg_silhouette(data_without_label[, 2:3], k_values)

plot(k_values, avg_silhouette_values, type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters (k)", ylab = "Average Silhouette Width",
     main = "Elbow Curve for Optimal k (K-Medoids)")

elbow_point <- k_values[which.max(avg_silhouette_values)]
points(elbow_point, avg_silhouette_values[elbow_point - min(k_values) + 1], col = "red", cex = 2, pch = 19)
text(elbow_point, avg_silhouette_values[elbow_point - min(k_values) + 1], 
     labels = paste("Optimal k =", elbow_point), pos = 4, col = "red")

k <- elbow_point
