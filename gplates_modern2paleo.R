library(rgplates)
library(xlsx)

reconModel <- "MERDITH2021"

data <- read.xlsx("adu7719_data_s2.xlsx", sheetName="Paleozoic")

coastlines <- reconstruct("coastlines", age=0, model=reconModel)
plot(coastlines$geometry)
points(data$lng, data$lat, col="black", bg="red", pch=21)

N <- nrow(data)
mat <- matrix(nrow=N, ncol=3)
res <- data.frame(mat)
colnames(res) <- c("Age", "paleolong", "paleolat")

for (i in 1:N) {
  lat <- data$lat[i]
  long <- data$lng[i]
  ancient <- data$Estimated.Age..Ma.[i]
  modern <- c(long, lat)
  modernMat <- matrix(modern, ncol=2, byrow=TRUE)
  colnames(modernMat) <- c("long", "lat")
  ans <- reconstruct(modernMat, age=ancient)
  res$Age[i] <- ancient
  res$paleolong[i] <- ans[1]
  res$paleolat[i] <- ans[2]
}
write.xlsx(res, "output.xlsx", sheetName="Results", row.names=TRUE)


