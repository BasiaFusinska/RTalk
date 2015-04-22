
events <- readEventsLists(file, list("PushEvent", "CreateEvent", "PullRequestEvent"))

repositoryUrls <- lapply(events, function(x) {
  url = x$repo$url
  c("id"=x$repo$id, 
    "url"=substr(url, nchar("https://api.github.com/repos/")+1, nchar(url)))
})

uniqueUrls <- unique(repositoryUrls)
head(uniqueUrls)

urlsDataFrame <- data.frame(do.call(rbind, uniqueUrls))
head(urlsDataFrame)

urlsDataFrame1 = urlsDataFrame

googleDataFile = "Data/Google data.csv"

googleData <- read.csv(file=googleDataFile, sep=",",head=TRUE)

head(googleData)

googleData$url <- NULL
googleData$url <- apply(googleData, 1, function(row){
  url = row[2]
  substr(url, nchar("https://github.com/")+1, nchar(url))
})

head(googleData)

ids = googleData
urlsDataFrame$language <- NULL
urlsDataFrame$language <- apply(urlsDataFrame, 1, function(row){
  language = ids[as.character(ids$url) == as.character(row[2]), ]$repository_language
  
  #because some ids have many hits
  as.character(language[1])
})

head(urlsDataFrame)

languages <- table(urlsDataFrame[as.character(urlsDataFrame$language) != "null",]$language)
sortedLanguages <- sort(languages[languages > 50], decreasing=TRUE)

barplot(sortedLanguages)

