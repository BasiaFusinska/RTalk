install.packages("httr")
library("httr")
#xxx <- GET("https://api.github.com/repos/leethomason/tinyxml2/languages")
xxx <- GET("https://api.github.com/search/repositories?q=created%3A2015-01-01")
yyy = content(xxx)

yyy$items[[1]]$language

nextPage <- GET("https://api.github.com/search/repositories?q=created%3A2015-01-01&page=4")
nextPageContent = content(nextPage)

nextPageContent$items[[1]]$url
nextPageContent$items[[1]]$stargazers_count

second <- GET("https://api.github.com/search/repositories?q=created%3A2015-01-01&page=2")
secondContent = content(second)

secondContent$items[[1]]$url
secondContent$items[[2]]$url

secondContent$items[[1]]$stargazers_count
