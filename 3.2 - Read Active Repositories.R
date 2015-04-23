
# Read events 
events <- readEventsLists(fileName, list("PushEvent", "CreateEvent", "PullRequestEvent"))
events[[1]]$repo$id

repositoryUrls <- lapply(events, function(x) {
  url = x$repo$url
  c("id"=x$repo$id, 
    "url"=substr(url, nchar("https://api.github.com/repos/")+1, nchar(url)))
})

uniqueUrls <- unique(repositoryUrls)
head(uniqueUrls)

urlsDataFrame <- data.frame(do.call(rbind, uniqueUrls))
head(urlsDataFrame)


# Read languages
googleDataFile = "Data/Google data.csv"

googleData <- read.csv(file=googleDataFile, sep=",",head=TRUE)

head(googleData)

googleData$url <- apply(googleData, 1, function(row){
  url = row[2]
  substr(url, nchar("https://github.com/")+1, nchar(url))
})

head(googleData)


# Combining data
urlsDataFrame$language <- apply(urlsDataFrame, 1, function(row){
  language = googleData[as.character(googleData$url) == as.character(row[2]), ]$repository_language
  
  #because some googleData have many hits
  as.character(language[1])
})

head(urlsDataFrame)

languages <- table(urlsDataFrame$language)
head(languages)
barplot(languages)
languages <- sort(languages, decreasing=TRUE)
barplot(languages)

languages <- table(urlsDataFrame[as.character(urlsDataFrame$language) != "null",]$language)
languages <- sort(languages[languages > 50], decreasing=TRUE)

barplot(languages)

rm(events)
rm(repositoryUrls)
rm(uniqueUrls)
rm(urlsDataFrame)
rm(googleDataFile)
rm(googleData)
rm(languages)
