pullRequests <- readEvents(file, "PullRequestEvent")

repositoryData <- lapply(pullRequests, function(x) {
    c(id=x$payload$pull_request$base$repo$id, 
      language=x$payload$pull_request$base$repo$language)
   })

repositoryDataFrame <- data.frame(do.call(rbind, repositoryData))
head(repositoryDataFrame)

summary(repositoryDataFrame)

uniqueData <- unique(repositoryData)
repositoryDataFrame <- data.frame(do.call(rbind, uniqueData))

languages <- table(repositoryDataFrame$language)
write.csv(repositoryDataFrame, file="Data/2015-01-01-15_pullRequests.csv")

head(languages)

languagesNames <- names(languages)
ln <- languagesNames[2]
ln
repositoryDataFrame$id[repositoryDataFrame$language == ln]

reducedDataFrame <- repositoryDataFrame[
  as.character(repositoryDataFrame$language) != as.character(repositoryDataFrame$id),]

languages <- table(reducedDataFrame$language)
head(languages)

barplot(languages[languages > 5])
sortedLanguages <- sort(languages[languages > 5], decreasing=TRUE)

barplot(sortedLanguages)
