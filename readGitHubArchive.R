install.packages("rjson")
library("rjson")


file <- "Data/2015-01-01-15.json"

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
