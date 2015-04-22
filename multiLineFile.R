library("rjson")

fileName <- "Data/2015-01-01-15.json"
stream <- file(fileName, open="r")

readEventsLineByLine <- function(file, eventNames) {
  data <- list()
  
  index <- 1
  while(length(line <- readLines(file, n = 1, warn = FALSE)) > 0) {
    json <- fromJSON(line)
    
    if (json$type %in% eventNames) {
      
      # data <- c(data, json) didn't work <- merged lists
      data[[index]] <- json
      index <- index + 1
    }
  }
  return(data)  
}

multilineEvents <- readEventsLineByLine(stream, list("PullRequestEvent"))
close(stream)
