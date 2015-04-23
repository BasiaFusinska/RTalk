weekDataFile <- "Data/weekData.csv"

weekData <- read.csv(file=weekDataFile, sep=",",head=TRUE)

head(weekData)

weekData$X = NULL
weekData$h <- factor(weekData$hours)

head(weekData)
summary(weekData)

plot(weekData$hours, weekData$Monday, xaxt="n", xlim=c(1,22), ylim=c(0,15000), type="l", col="blue", xlab="h", ylab="nr", main="PushEvents")
axis(1, 0:23)

lines(weekData$hours, weekData$Wednesday, xlim=c(1,23), ylim=c(0,15000), type="l", col="green")
lines(weekData$hours, weekData$Friday, xlim=c(1,23), ylim=c(0,15000), type="l", col="red")

legend(15, 7000, c("Monday","Wednesday","Friday"), col=c("blue","green","red"), lty=c(1,1,1))

matrtixData <- t(matrix(c(weekData$Monday, weekData$Wednesday, weekData$Friday), ncol=3))

barplot(matrtixData, names.arg=weekData$h, col=c("blue", "green", "red"), beside=TRUE, xlab="h", ylab="nr", main="PushEvents")
legend(1, 15000, c("Monday","Wednesday","Friday"), col=c("blue","green","red"), lty=c(1,1,1))

weekData$daypart <-cut(weekData$hours,c(-Inf,2,7,10,13,18,20,23))
head(weekData)

library("doBy")

siterange <- function(x){c(length(x), min(x), mean(x), max(x))}
summaryBy(Monday~daypart, data =weekData, FUN=siterange)
summaryBy(Monday+Wednesday+Friday~daypart, data =weekData)

rm(weekDataFile)
rm(matrtixData)
