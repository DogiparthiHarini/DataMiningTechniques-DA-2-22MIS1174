library(cluster)
# Function to calculate total within-cluster sum of squares
calculate_total_withinss <- function(data, k_values) {
total_withinss <- vector()
for (k in k_values) {
kmeans_model <- kmeans(data, centers = k)
total_withinss <- c(total_withinss, kmeans_model$tot.withinss)
}
return(total_withinss)
}

# Define range of k values
k_values <- 2:10
# Calculate total within-cluster sum of squares for each k
total_withinss_values <- calculate_total_withinss(data_without_label, k_values)
# Plot elbow curve
plot(k_values, total_withinss_values, type = "b", pch = 19, frame = FALSE, 
xlab = "Number of clusters (k)", ylab = "Total within-cluster sum of squares",
main = "Elbow Curve for Optimal k")
# Find the elbow point
elbow_point <- k_values[which.min(diff(total_withinss_values))]
points(elbow_point, total_withinss_values[elbow_point - min(k_values) + 1], col = "red", cex = 2, pch = 19)
text(elbow_point, total_withinss_values[elbow_point - min(k_values) + 1], 
labels = paste("Optimal k =", elbow_point), pos = 4, col = "red")
k <- elbow_point