
library("rjson")

readEventsLists <- function(file, eventNames) {
  lines <- readLines(file)
  jsonEvents <- lapply(lines, fromJSON)  
  specificEvents <- Filter(function(e){ e$type %in% eventNames}, jsonEvents)
  return(specificEvents)
}

fileName <- "Data/2015-01-01-15.json"

pullRequests <- readEvents(fileName, list("PullRequestEvent"))

repositoryData <- lapply(pullRequests, function(x) {
  c(id=x$payload$pull_request$base$repo$id, 
    language=x$payload$pull_request$base$repo$language)
})

repositoryDataFrame <- data.frame(do.call(rbind, repositoryData))
head(repositoryDataFrame)

summary(repositoryDataFrame)

