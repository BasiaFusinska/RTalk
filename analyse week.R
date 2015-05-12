
dataFolder = "Data/Week"
mondayFolder = paste(dataFolder, "/Monday/2015-01-12-", sep="")
wednesdayFolder = paste(dataFolder, "/Wednesday/2015-01-14-", sep="")
fridayFolder = paste(dataFolder, "/Friday/2015-01-16-", sep="")  

readEventsLineByLine <- function(file, eventNames) {
  eventCount <- 0
  while(length(line <- readLines(file, n = 1, warn = FALSE)) > 0) {
    json <- fromJSON(line)    
    if (json$type %in% eventNames) {
      eventCount <- eventCount + 1
    }
  }
  return(eventCount)  
}

readDayFolder = function(folderName) {
  pushes = integer()
  for(n in 0:23) {
    fileName = paste(folderName, n, ".json", sep="")
    stream <- file(fileName, open="r")
    pushesPerHour = readEventsLineByLine(stream, list("PushEvent"))
    close(stream)
    pushes = c(pushes, pushesPerHour)
  }
  
  return(pushes)
}

week = data.frame(0:23)
week$Monday = readDayFolder(mondayFolder)
week$Wednesday = readDayFolder(wednesdayFolder)
week$Friday = readDayFolder(fridayFolder)

write.csv(week, file="Data/weekData.csv")

weekData <- read.csv(file=weekDataFile, sep=",",head=TRUE)



rm(dataFolder)
rm(mondayFolder)
rm(wednesdayFolder)
rm(fridayFolder)
rm(hours)
rm(week)
