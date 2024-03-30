library(fpc)

dbscan_result <- dbscan(data_without_label[, 1:2], eps = 0.1)

plot(data_without_label[, 2:3], col = dbscan_result$cluster + 1, pch = 19, 
     main = "DBSCAN Clustering", xlab = "X", ylab = "Y")

legend("topright", legend = c("Noise", unique(dbscan_result$cluster)), 
       col = c("black", rainbow(length(unique(dbscan_result$cluster)))), pch = 19, cex = 1, bty = "n")
