library("rjson")

dataFolder = "C:/Personal/Data/Week"
mondayFolder = paste(dataFolder, "/Monday/2015-01-12-", sep="")
wednesdayFolder = paste(dataFolder, "/Wednesday/2015-01-14-", sep="")
fridayFolder = paste(dataFolder, "/Friday/2015-01-16-", sep="")  

readEventsLineByLine <- function(file, eventNames) {
  pushes = 0
  
  while(length(line <- readLines(file, n = 1, warn = FALSE)) > 0) {
    json <- fromJSON(line)
    
    if (json$type %in% eventNames) {
      pushes <- pushes + 1
    }
  }
  return(pushes)  
}

readFolder = function(folderName) {
  pushes = integer()
  for(n in 0:23) {
    fileName = paste(folderName, n, ".json", sep="")
    stream <- file(fileName, open="r")
    pushesPerHour = readEventsLineByLine(stream, list("PullRequestEvent"))
    close(stream)
    pushes = c(pushes, pushesPerHour)
  }
  
  return(pushes)
}

hours = 0:23
week = data.frame(hours)

mondayPushes = readFolder(mondayFolder)
wednesdayPushes = readFolder(wednesdayFolder)
fridayPushes = readFolder(fridayFolder)

week$Monday = mondayPushes
week$Wednesday = wednesdayPushes
week$Friday = fridayPushes
week

write.csv(week, file="Data/weekData.csv")



