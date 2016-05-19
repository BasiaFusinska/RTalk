library("rjson")


readEvents <- function(file, eventName) {
  jsonLines <- readLines(file)
  jsonEvents <- lapply(jsonLines, fromJSON)

  specificEvents <- Filter(function(e){ e$type == eventName}, jsonEvents)
  
  return(specificEvents)
}

readEventsLists <- function(file, eventNames) {
  jsonLines <- readLines(file)
  jsonEvents <- lapply(jsonLines, fromJSON)
  
  specificEvents <- Filter(function(e){ e$type %in% eventNames}, jsonEvents)
  
  return(specificEvents)
}

readPR <- function(file) {
  return(readEvents(file, 'PullRequestEvent'))
}
