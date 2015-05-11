
listToFilter <- list("aa", "abc", "bc")
lResult = listToFilter[nchar(listToFilter) == 2]
lResult
lResult = Filter(function(element) {nchar(element) == 2}, listToFilter)

listToFilter <- list(first=c(1, 2, 3), second=c(4, 5, 6), third=c(7, 8, 9))
dfToFilter <- data.frame(listToFilter)
dfToFilter
dtResult <- dfToFilter[dfToFilter$first %% 2 == 1,]
dtResult

column <- dfToFilter[,2]
column
columns <- dfToFilter[,c(1,3)]
columns
columns <- dfToFilter[,c('first','second')]
columns

