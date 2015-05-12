
library("httr")

repositoryLanguageAPIInfo <- GET("https://api.github.com/repos/leethomason/tinyxml2/languages")
repositoryLanguageAPIInfo$content
languageContent <- content(repositoryLanguageAPIInfo)
languageContent
names(languageContent)

nextPage <- GET("https://api.github.com/search/repositories?q=created%3A2015-01-01&page=2")
nextPageContent = content(nextPage)

nextPageContent$items[[5]]$language
nextPageContent$items[[5]]$url
nextPageContent$items[[5]]$stargazers_count

nextPageContent$items[[10]]$language
nextPageContent$items[[10]]$url
nextPageContent$items[[10]]$stargazers_count

