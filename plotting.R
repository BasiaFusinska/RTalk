install.packages("ggplot2")
library("ggplot2")
qplot(daypart, Monday, data=weekData, geom="line", colour="blue")


ggplot(weekData, aes(x=daypart, y=Monday, fill=daypart))+geom_bar()

ggplot(data1, aes(x=agecat, y=Impressions, fill=agecat))+geom_boxplot()
