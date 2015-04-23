library("httr")

# GitHub API repositories
repositoryLanguageAPIInfo <- GET("https://api.github.com/repos/leethomason/tinyxml2/languages")
head(repositoryLanguageAPIInfo)
repositoryLanguageAPIInfo$content

languageContent <- content(repositoryLanguageAPIInfo)
languageContent
names(languageContent)


# GitHub API search
createdRepositories <- GET("https://api.github.com/search/repositories?q=created%3A2015-01-01")
repositoriesContent = content(createdRepositories)
repositoriesContent

repositoriesContent$items[[1]]$language
repositoriesContent$items[[1]]$url
repositoriesContent$items[[1]]$stargazers_count

nextPage <- GET("https://api.github.com/search/repositories?q=created%3A2015-01-01&page=2")
nextPageContent = content(nextPage)

nextPageContent$items[[1]]$language
nextPageContent$items[[1]]$url
nextPageContent$items[[1]]$stargazers_count

nextPageContent$items[[10]]$language
nextPageContent$items[[10]]$url
nextPageContent$items[[10]]$stargazers_count
