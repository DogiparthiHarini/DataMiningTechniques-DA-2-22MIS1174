data = read.csv("C:\\Users\\harin\\Downloads\\clusterdataset.csv")
library(cluster)
print(head(data))
string_cols <- sapply(data, is.character)
for (i in which(string_cols)) {
  data[, i] <- as.numeric(factor(data[, i]))
}
data_without_label <- data[, -1]
hc <- hclust(dist(data_without_label), method = "complete")
plot(hc, main = "Hierarchical Clustering Dendrogram", xlab = "Observations", sub = NULL)