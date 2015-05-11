
uniqueData <- unique(repositoryData)
repositoryDataFrame <- data.frame(do.call(rbind, uniqueData))
summary(repositoryDataFrame)

languages <- table(repositoryDataFrame$language)
head(languages)
languagesNames <- names(languages)
languagesNames

lang <- languagesNames[2]
lang
repositoryDataFrame$id[repositoryDataFrame$language == lang]

repositoryDataFrame <- repositoryDataFrame[
  as.character(repositoryDataFrame$language) != as.character(repositoryDataFrame$id),]

languages <- table(repositoryDataFrame$language)
head(languages)

languages <- languages[languages > 5]
barplot(languages)

languages <- sort(languages, decreasing=TRUE)
languagesNames <- names(languages)
languagesNames

barplot(languages)

