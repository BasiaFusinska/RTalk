
myChar <- "a"
myChar
typeof(myChar)

myVector <- c("a", "b", "c")
myVector[1]

myList <- list("a", "b", "c")
myList[1]
myList[[1]]

myNamedVector <- c(a="a", b="b", c="c")
myNamedVector['a']

myNamedList <- list(a="a", b="b", c="c")
myNamedList['a']
myNamedList[['a']]
myNamedList$a

dataTableList = list(first=c(1, 2, 3), second=c(4, 5, 6))
dataTableList$first
dataTableList[c("second", "first")]

dataFrame <- data.frame(dataTableList)
dataFrame
summary(dataFrame)

