library(igraph)

# Define a function for ROCK clustering
rock_clustering <- function(data, k) {
  # Create a similarity graph based on data
  similarity_graph <- graph_from_data_frame(data, directed = FALSE)
  
  # Compute the normalized cut clusters using the edge betwenness
  clusters <- cluster_edge_betweenness(similarity_graph)
  
  # Return cluster membership
  return(membership(clusters))
}

# Number of clusters (you need to specify this)
k <- 2

# Perform ROCK clustering
cluster_assignments <- rock_clustering(data_without_label, k)

# Plot the clusters (if your data is 2D)
plot(data_without_label, col = cluster_assignments, pch = 19, main = "ROCK Clustering")