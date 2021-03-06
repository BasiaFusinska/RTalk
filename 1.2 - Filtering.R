vectorToFilter <- c("aa", "abc", "bc")

vResult = vectorToFilter[nchar(vectorToFilter) == 2]
vResult
vResult[2]

listToFilter <- list("aa", "abc", "bc")

lResult = listToFilter[nchar(listToFilter) == 2]
lResult
lResult[2]
lResult[[2]]

nlistToFilter <- list(a="aa", b="abc", c="bc")

nlResult = nlistToFilter[nchar(nlistToFilter) == 2]
nlResult
nlResult[2]
nlResult[[2]]
nlResult$b
nlResult$c

tListToFilter = list(first=c(1, 2, 3), second=c(4, 5), third=c(6, 7, 8))
tlResult = tListToFilter[lapply(tListToFilter, length) == 3]
tlResult
tlResult2 = Filter(function(element) {length(element) == 3}, tListToFilter)
tlResult2


dfToFilter <- data.frame(tListToFilter)
dfToFilter <- data.frame(list(first=c(1, 2, 3), second=c(4, 5, 6), third=c(7, 8, 9)))
dfToFilter

dtResult <- dfToFilter[dfToFilter$first %% 2 == 1,]
dtResult

dtResult2 <- dfToFilter[dfToFilter$first %% 2 == 1 & dfToFilter$second < 5,]
dtResult2

dtRow <- dfToFilter[,2]
dtRow

dtRows <- dfToFilter[,c(1,3)]
dtRows

dtRowsByName <- dfToFilter[,c('first','second')]
dtRowsByName

dtRowsByIndexList <- list(dfToFilter$first, dfToFilter$second)
dtRowsByIndexList

dtRowsByIndex <- matrix(c(dfToFilter$first, dfToFilter$second), nrow=3)
dtRowsByIndex
typeof(dtRowsByIndex)

rm(vectorToFilter)
rm(vResult)
rm(listToFilter)
rm(lResult)
rm(nlistToFilter)
rm(nlResult)
rm(tListToFilter)
rm(tlResult)
rm(tlResult2)
rm(dfToFilter)
rm(dtResult)
rm(dtResult2)
rm(dtRow)
rm(dtRows)
rm(dtRowsByName)
rm(dtRowsByIndexList)
rm(dtRowsByIndex)
