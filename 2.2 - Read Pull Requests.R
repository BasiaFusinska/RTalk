fileName <- "Data/2015-01-01-15.json"

pullRequestEvents <- readEvents(fileName, "PullRequestEvent")

pullRequests <- lapply(pullRequestEvents, function(x) {
    c(id=x$payload$pull_request$base$repo$id, 
      language=x$payload$pull_request$base$repo$language)
   })

dfPullRequests <- data.frame(do.call(rbind, pullRequests))
head(dfPullRequests)

summary(dfPullRequests)

uniqueData <- unique(pullRequests)
dfPullRequests <- data.frame(do.call(rbind, uniqueData))

summary(dfPullRequests)

languages <- table(dfPullRequests$language)

head(languages)

languagesNames <- names(languages)
languagesNames
ln <- languagesNames[2]
ln
dfPullRequests$id[dfPullRequests$language == ln]

dfPullRequests <- dfPullRequests[
  as.character(dfPullRequests$language) != as.character(dfPullRequests$id),]

languages <- table(dfPullRequests$language)
head(languages)

languages <- languages[languages > 5]
barplot(languages)
languages <- sort(languages[languages > 5], decreasing=TRUE)
languagesNames <- names(languages)
languagesNames

barplot(languages)

rm(uniqueData)
rm(pullRequestEvents)
rm(ln)
rm(languages)
rm(languagesNames)
rm(pullRequests)
rm(dfPullRequests)
