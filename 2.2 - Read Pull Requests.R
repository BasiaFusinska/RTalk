fileName <- "Data/2015-01-01-15.json"

pullRequests <- readEvents(fileName, "PullRequestEvent")

repositoryData <- lapply(pullRequests, function(x) {
    c(id=x$payload$pull_request$base$repo$id, 
      language=x$payload$pull_request$base$repo$language)
   })

repositoryDataFrame <- data.frame(do.call(rbind, repositoryData))
head(repositoryDataFrame)

summary(repositoryDataFrame)

uniqueData <- unique(repositoryData)
repositoryDataFrame <- data.frame(do.call(rbind, uniqueData))
#write.csv(repositoryDataFrame, file="Data/2015-01-01-15_pullRequests.csv")

summary(repositoryDataFrame)

languages <- table(repositoryDataFrame$language)

head(languages)

languagesNames <- names(languages)
ln <- languagesNames[2]
ln
repositoryDataFrame$id[repositoryDataFrame$language == ln]

repositoryDataFrame <- repositoryDataFrame[
  as.character(repositoryDataFrame$language) != as.character(repositoryDataFrame$id),]

languages <- table(repositoryDataFrame$language)
head(languages)

languages <- languages[languages > 5]
barplot(languages)
languages <- sort(languages[languages > 5], decreasing=TRUE)
languagesNames <- names(languages)
languagesNames

barplot(languages)

rm(uniqueData)
rm(repositoryData)
rm(ln)
