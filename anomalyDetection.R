install.packages("devtools")
devtools::install_github("twitter/AnomalyDetection")
library(AnomalyDetection)

data(raw_data)
res = AnomalyDetectionTs(raw_data, max_anoms=0.02, direction='both', plot=TRUE)
res$plot

res

AnomalyDetectionVec(raw_data[,2], max_anoms=0.02, period=1440, direction='both', only_last=FALSE, plot=TRUE)
head(raw_data)

res = AnomalyDetectionTs(raw_data, max_anoms=0.02, direction='both', only_last='day', plot=TRUE)
res$plot

res
