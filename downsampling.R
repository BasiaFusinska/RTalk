library(LTTB)

plot(timeseries, type='l', col="blue", ylim=c(0,100), ann=FALSE)

bucketSize500 = LTTB(timeseries, n_bins=500)

lines(bucketSize500, type="l", col="green")

bucketSize50 = LTTB(timeseries, n_bins=50)

lines(bucketSize50, type="l", col="red")
