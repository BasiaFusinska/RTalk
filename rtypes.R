
myChar <- "a"
myChar
typeof(myChar)

myVector <- c("a", "b", "c")
myVector
typeof(myVector)

myList <- list("a", "b", "c")
myList
typeof(myList)

myChar[1]
myChar[[1]]

myVector[1]
myVector[[1]]

myList[1]
myList[[1]]

myNamedVector <- c(a="a", b="b", c="c")
myNamedVector
typeof(myNamedVector)

myNamedVector[1]
myNamedVector[[1]]
myNamedVector['a']
myNamedVector[['a']]
myNamedVector$a

myNamedList <- list(a="a", b="b", c="c")
myNamedList
typeof(myNamedList)

myNamedList[1]
myNamedList[[1]]
myNamedList['a']
myNamedList[['a']]
myNamedList$a

dataCombined = c(first=c(1, 2, 3), second=c(4, 5, 6))
dataCombined
typeof(dataCombined)
dataCombined$first1

dataTableList = list(first=c(1, 2, 3), second=c(4, 5, 6))
dataTableList
typeof(dataTableList)

dataTableList$first

dataTableList[c("second", "first")]
summary(dataTableList)

dataFrame <- data.frame(dataTableList)
dataFrame
typeof(dataFrame)

summary(dataFrame)

install.packages("data.table")
library(data.table)

dataTable <- data.table(dataTableList)
dataTable
typeof(dataTable)
