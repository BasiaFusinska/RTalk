fileName <- "Data/2015-01-01-15.json"

# Read Pull Requests
pullRequests <- readPR(fileName)

# Select only repository id and language
select <- function(event) {
  id <- event$payload$pull_request$base$repo$id
  language <- event$payload$pull_request$base$repo$language
  
  if (is.null(language))
    c(ID=id, Language='')
  else
    c(ID=id, Language=language)
}

pullRequests <- sapply(pullRequests, select)

# Create data frame
repositoriesLanguages <- data.frame(
  id = pullRequests['ID',],
  language = pullRequests['Language',])

# summary of data
head(repositoriesLanguages)
summary(repositoriesLanguages)

# Only unique repositories
repositoriesLanguages <- unique(repositoriesLanguages)
head(repositoriesLanguages)
summary(repositoriesLanguages)

# Only repositories with language set
repositoriesLanguages <- repositoriesLanguages[repositoriesLanguages$language != '',]
head(repositoriesLanguages)
summary(repositoriesLanguages)

# Language distribution
languages <- table(repositoriesLanguages$language)
head(languages)

# Sort the languages
languages <- sort(languages, decreasing = TRUE)
head(languages)
names(languages)

# Diagram of language distribution
barplot(languages[languages > 5])
