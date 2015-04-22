
library("rjson")


readEvents <- function(file, eventName) {
  lines <- readLines(file)
  jsonEvents <- lapply(lines, fromJSON)

  specificEvents <- Filter(function(e){ e$type == eventName}, jsonEvents)
  
  return(specificEvents)
}

readEventsLists <- function(file, eventNames) {
  lines <- readLines(file)
  jsonEvents <- lapply(lines, fromJSON)
  
  specificEvents <- Filter(function(e){ e$type %in% eventNames}, jsonEvents)
  
  return(specificEvents)
}
